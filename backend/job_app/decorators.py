from django.http.response import JsonResponse

def admin_only(view_func):
    def wrapper_function(request, *args, **kwargs):
        if request.user.groups.exists():
            group = request.user.groups.all()[0].name
            if group == 'user':
                return JsonResponse("you are not allowed to view", safe = False)
            if group == 'admin':
                return view_func(request, *args, **kwargs)
        else:
            return JsonResponse("the role not specified", safe = False)
    return wrapper_function