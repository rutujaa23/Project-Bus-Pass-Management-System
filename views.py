from django.shortcuts import render, redirect, HttpResponse
from app.EmailBackEnd import EmailBackEnd
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth import logout, login
from app.models import CustomUser, Category, Passes, Page
from django.contrib.auth import get_user_model
import random
from django.core.paginator import Paginator

from django.db.models import Count
from django.utils import timezone
from datetime import timedelta

User = get_user_model()


def BASE(request):
    return render(request, 'base.html')


def LOGIN(request):
    return render(request, 'login.html')


def doLogin(request):
    if request.method == 'POST':
        user = EmailBackEnd.authenticate(request,
                                         username=request.POST.get('email'),
                                         password=request.POST.get('password')
                                         )
        if user != None:
            login(request, user)
            return redirect('dashboard')

        else:
            messages.error(request, 'Email or Password is not valid')
            return redirect('login')
    else:
        messages.error(request, 'Email or Password is not valid')
        return redirect('login')


def doLogout(request):
    logout(request)
    return redirect('login')


def LANDINGPAGE(request):
    page = Page.objects.all()
    context = {'page': page,

               }

    return render(request, 'landingpage.html', context)


@login_required(login_url='/')
def DASHBOARD(request):
    end_date = timezone.now()
    start_date = end_date - timedelta(days=7)
    today = end_date.date()
    yesterday = today - timedelta(days=1)
    cat_count = Category.objects.all().count()
    pass_count = Passes.objects.all().count()

    data_count_last_seven_days = Passes.objects.filter(passcreated_at__date__range=(start_date, end_date.date())).count()
    data_count_today = Passes.objects.filter(passcreated_at__date=today).count()
    data_count_yesterday = Passes.objects.filter(passcreated_at__date=yesterday).count()

    return render(request, 'dashboard.html', {
        'data_count_last_seven_days': data_count_last_seven_days,
        'data_count_today': data_count_today,
        'data_count_yesterday': data_count_yesterday,
        'cat_count': cat_count,
        'pass_count': pass_count,
    })


login_required(login_url='/')


def PROFILE(request):
    user = CustomUser.objects.get(id=request.user.id)
    context = {
        "user": user,
    }
    return render(request, 'profile.html', context)


@login_required(login_url='/')
def PROFILE_UPDATE(request):
    if request.method == "POST":
        profile_pic = request.FILES.get('profile_pic')
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        username = request.POST.get('username')

        try:
            customuser = CustomUser.objects.get(id=request.user.id)
            customuser.first_name = first_name
            customuser.last_name = last_name

            customuser.save()
            messages.success(request, "Your profile has been updated successfully")
            return redirect('profile')

        except:
            messages.error(request, "Your profile updation has been failed")
    return render(request, 'profile.html')


def CHANGE_PASSWORD(request):
    context = {}
    ch = User.objects.filter(id=request.user.id)
    if len(ch) > 0:
        data = User.objects.get(id=request.user.id)
        context["data"]: data
    if request.method == "POST":
        current = request.POST["cpwd"]
        new_pas = request.POST['npwd']
        user = User.objects.get(id=request.user.id)
        un = user.username
        check = user.check_password(current)
        if check == True:
            user.set_password(new_pas)
            user.save()
            messages.success(request, 'Password Change  Succeesfully!!!')
            user = User.objects.get(username=un)
            login(request, user)
        else:
            messages.success(request, 'Current Password wrong!!!')
            return redirect("change_password")
    return render(request, 'change-password.html')


@login_required(login_url='/')
def ADD_CATEGORY(request):
    if request.method == "POST":
        category_name = request.POST.get('categoryname')
        category = Category(
            categoryname=category_name,
        )
        category.save()
        messages.success(request, 'Category Added Succeesfully!!!')
        return redirect("add_category")

    return render(request, 'add_category.html')


@login_required(login_url='/')
def MANAGE_CATEGORY(request):
    category = Category.objects.all()
    context = {'category': category,

               }
    return render(request, 'manage_category.html', context)


def DELETE_Category(request, id):
    category = Category.objects.get(id=id)
    category.delete()
    messages.success(request, 'Record Delete Succeesfully!!!')

    return redirect('manage_category')


login_required(login_url='/')


def UPDATE_Category(request, id):
    category = Category.objects.get(id=id)

    context = {
        'category': category,
    }

    return render(request, 'update-category.html', context)


def UPDATE_CATEGORY_DETAILS(request):
    if request.method == 'POST':
        cat_id = request.POST.get('cat_id')
        categoryname = request.POST['categoryname']
        category = Category.objects.get(id=cat_id)
        category.categoryname = categoryname
        category.save()
        messages.success(request, "Your category detail has been updated successfully")
        return redirect('manage_category')
    return render(request, 'update-category.html')


@login_required(login_url='/')
def ADD_PASSSES(request):
    if request.method == "POST":
        fullname = request.POST.get('fullname')
        pass_number = random.randint(100000000, 999999999)
        gender = request.POST.get('gender')
        profile_pic1 = request.FILES.get('profile_pic1')
        cnumber = request.POST.get('cnumber')
        email = request.POST.get('email')
        identitytype = request.POST.get('identitytype')
        icnum = request.POST.get('icnum')

        category_id = request.POST.get('category_id')
        source = request.POST.get('source')
        destination = request.POST.get('destination')
        fromdate = request.POST.get('fromdate')
        todate = request.POST.get('todate')
        cost = request.POST.get('cost')

        categoryid = Category.objects.get(id=category_id)
        userpassdetail = Passes(fullname=fullname,
                                passnumber=pass_number,
                                gender=gender,
                                profile_pic1=profile_pic1,
                                mobilenumber=cnumber,

                                email=email,
                                identitytype=identitytype,
                                identitycardnumber=icnum,
                                category_id=categoryid,
                                source=source,
                                destinations=destination,
                                fromdate=fromdate,
                                todate=todate,
                                cost=cost
                                )

        userpassdetail.save()

        messages.success(request, "User pass details has been saved")
        return redirect('add_passes')
    category = Category.objects.all()
    context = {
        'category': category,
    }
    return render(request, 'add-passes.html', context)


@login_required(login_url='/')
def MANAGE_PASSES(request):
    userpasses = Passes.objects.all()
    paginator = Paginator(userpasses, 10)
    page = request.GET.get('page')
    userpasses = paginator.get_page(page)
    return render(request, 'manage_passes.html', {'userpasses': userpasses})


@login_required(login_url='/')
def my_view(request):
    items_list = Passes.objects.all()
    paginator = Paginator(items_list, 10)
    page = request.GET.get('page')
    items = paginator.get_page(page)
    return render(request, 'myview.html', {'items': items})


@login_required(login_url='/')
def WEBSITE_UPDATE(request):
    page = Page.objects.all()
    context = {"page": page,

               }
    return render(request, 'website.html', context)


@login_required(login_url='/')
def UPDATE_WEBSITE_DETAILS(request):
    if request.method == 'POST':
        web_id = request.POST.get('web_id')
        pagetitle = request.POST['pagetitle']
        address = request.POST['address']
        aboutus = request.POST['aboutus']
        email = request.POST['email']
        mobilenumber = request.POST['mobilenumber']
        page = Page.objects.get(id=web_id)
        page.pagetitle = pagetitle
        page.address = address
        page.aboutus = aboutus
        page.email = email
        page.mobilenumber = mobilenumber
        page.save()
        messages.success(request, "Your website detail has been updated successfully")
        return redirect('website_update')
    return render(request, 'website.html')


def DELETE_PASSES(request, id):
    passes = Passes.objects.get(id=id)
    passes.delete()
    messages.success(request, 'Record Delete Succeesfully!!!')
    return redirect('manage_passes')


login_required(login_url='/')


def UPDATE_PASSES(request, id):
    passes = Passes.objects.get(id=id)
    context = {
        "passes": passes,
    }
    return render(request, 'update-passes.html', context)


login_required(login_url='/')


def VIEW_PASSES(request, id):
    passes = Passes.objects.get(id=id)

    context = {
        'passes': passes,
    }

    return render(request, 'view-passes.html', context)


def Search_Passes(request):
    if request.method == "GET":
        query = request.GET.get('query', '')
        if query:
            userpasses = Passes.objects.filter(passnumber__icontains=query)
            messages.success(request, "Search against " + query)
            return render(request, 'search-passes.html', {'userpasses': userpasses})
        else:

            print("No Record Found")
            return render(request, 'search-passes.html', {})


def data_between_dates(request):
    start_date = request.GET.get('start_date')
    end_date = request.GET.get('end_date')

    if start_date and end_date:
        userpasses = Passes.objects.filter(passcreated_at__range=(start_date, end_date))
    else:
        userpasses = []

    return render(request, 'data_between_dates.html', {'userpasses': userpasses})
