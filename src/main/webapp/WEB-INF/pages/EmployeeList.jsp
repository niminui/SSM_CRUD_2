<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Employee List</title>
    <% pageContext.setAttribute("APP_PATH",request.getContextPath()); %>

    <!-- 引入JQuery -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery-3.3.1.min.js"></script>
    <!-- 引入bootstrap样式 -->
    <link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入js文件 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>



</head>
<body>

<!-- 新增Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="Jerry">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_add_input" placeholder="Jerry@sina.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select name="dId" class="form-control">

                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- 修改Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="empName_update_static" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_update_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="Jerry@sina.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-4">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">department</label>
                        <div class="col-sm-4">
                            <select name="dId" class="form-control">

                            </select>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<div class="container">
    <!-- 标题行 -->
    <div class="row">
        <div class="col-md-6">
            <h1>SSM-CRUD <span class="label label-default">DEMO</span></h1>
        </div>
    </div>

    <!-- 按钮行 -->
    <div class="row">
        <div class="col-md-3 col-md-offset-10">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            <button class="btn btn-danger" id="emp_del_modal_btn">删除</button>
        </div>
    </div>

    <!-- 数据表格 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="employees_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6" id="page_info_area"></div>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>

    <div class="col-md-offset-10">
        <%--<button type="button" class="btn btn-success">设置</button>--%>
        <button type="button" class="btn btn-danger" id="exit_btn">退出</button>
    </div>
</div>


<script type="text/javascript">
    var totalRecord,currentPage;
    $(function () {
        to_page(1);
    });

    function to_page(pn) {
        $.ajax({
            url:"${APP_PATH}/employees",
            data:"pn=" + pn,
            type:"GET",
            success:function (result) {
                //alert(result);
                //1、解析并展示员工数据
                build_employees_table(result);
                //2、解析并展示分页信息
                build_page_info(result);
                //3、解析显示分页条数据
                build_page_nav(result);
            }
        });
    }

    //解析并展示员工数据
    function build_employees_table(result) {
        $("#employees_table tbody").empty();
        var employees = result.extend.pageInfo.list;
        $.each(employees,function (index,item) {
            var checkBoxTd = $("<td><input type='checkbox' class='check_item''/></td>")
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender == "M" ? "男" : "女");
            var emailTd = $("<td></td>").append(item.email);
            var deptNameTd = $("<td></td>").append(item.department.deptName);
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil"))
                .append("编辑");
            editBtn.attr("edit-id",item.empId);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash"))
                .append("删除");
            delBtn.attr("del-id",item.empId);

            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(btnTd)
                .appendTo("#employees_table tbody");
        });
    }

    //解析并展示分页信息
    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页，总"+
            result.extend.pageInfo.pages+"页，总"+
            result.extend.pageInfo.total+"条记录");
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum
    }

    //解析显示分页条数据
    function build_page_nav(result) {
        $("#page_nav_area").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }

        ul.append(firstPageLi).append(prePageLi);

        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);
            });
            ul.append(numLi);
        });

        ul.append(nextPageLi).append(lastPageLi);

        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area")
    }

    //清空表单样式及内容
    function reset_form(ele) {
        $(ele)[0].reset();
        //情况表单样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }

    //打开模态框
    $("#emp_add_modal_btn").click(function () {
        reset_form("#empAddModal form");
        getDepartments("#empAddModal select");
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });

    //查出所有部门信息并显示在下拉列表中
    function getDepartments(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/departments",
            type:"GET",
            success:function (result) {
                //console.log(result);
                //显示部门信息在下拉列表中
                $.each(result.extend.departments,function () {
                    var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);
                });
            }
        });
    }

    //JQuery前端校验用户输入是否合法
    function validate_add_form() {

        if($("#emp_save_btn").attr("ajax_va") == "error") {
            show_validate_msg("#empName_add_input","error","用户名已存在");
            return false;
        }

        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,4})/;
        //检验用户名是否复合规则(是否可用)
        if(!regName.test(empName)) {
            //alert("用户名必须是2-5位中文，或者6-16位英文和数组的组合");
            show_validate_msg("#empName_add_input","error","用户名必须是6-16位英文和数组的组合，或者2-5位中文");
            return false;
        } else {
            show_validate_msg("#empName_add_input","success","");
        }

        //检验邮箱是否复合规则
        var email = $("#email_add_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        //检验用户名是否复合规则(是否可用)
        if(!regEmail.test(email)) {
            //alert("邮箱格式不正确！");
            show_validate_msg("#email_add_input","error","邮箱格式不正确");
            return false;
        } else {
            show_validate_msg("#email_add_input","success","");
        }
        return true;
    }

    //显示校验结果的提示信息
    function show_validate_msg(ele, status, msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if(status == "success") {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if (status == "error") {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }

    //发送ajax请求检验用户名是否可用(数据库中查询是否有重复)
    $("#empName_add_input").change(function () {
        var empName = this.value;
        $.ajax({
            url:"${APP_PATH}/checkUser",
            data:"empName=" + empName,
            type:"POST",
            success:function (result) {
                if(result.code == 10) {
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emp_save_btn").attr("ajax_va","success");
                } else {
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emp_save_btn").attr("ajax_va","error");
                }
            }
        });
    });

    //新增 -- 保存的单击事件
    $("#emp_save_btn").click(function () {
        if(!validate_add_form()) {
            return false;
        }

        if($(this).attr("ajax_va") == "error") {
            return false;
        }

        $.ajax({
            url:"${APP_PATH}/saveEmployee",
            type:"POST",
            data:$("#empAddModal form").serialize(),
            success:function (result) {
                if(result.code == 10) {
                    $("#empAddModal").modal("hide");
                    to_page(totalRecord);
                } else{
                    if(undefined != result.extend.errorFields.email) {
                        //显示员工的邮箱错误信息
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(undefined != result.extend.errorFields.empName) {
                        //显示员工名字的错误信息
                        show_validate_msg("#empName","error",result.extend.errorFields.empName);
                    }
                }
            }
        });
    });

    //修改模态框
    $(document).on("click",".edit_btn",function () {
        //alert("edit");
        getDepartments("#empUpdateModal select")
        getEmp($(this).attr("edit-id"));
        $("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });

    //修改时 打开模态框发送ajax请求查询数据
    function getEmp(id) {
        $.ajax({
            url:"${APP_PATH}/emp/" + id,
            type:"GET",
            success:function (result) {
                var emp = result.extend.emp;
                $("#empName_update_static").text(emp.empName);
                $("#email_update_input").val(emp.email);
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val([emp.dId]);
            }
        });
    }

    //修改 -- 保存的单击事件
    $("#emp_update_btn").click(function () {
        var email = $("#email_update_input").val();
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)) {
            show_validate_msg("#email_update_input","error","邮箱格式不正确");
            return false;
        } else{
            show_validate_msg("#email_update_input","success","");
        }

        $.ajax({
            url:"${APP_PATH}/updateEmployee/" + $(this).attr("edit-id"),
            type:"PUT",
            data:$("#empUpdateModal form").serialize(),
            success:function () {
                $("#empUpdateModal").modal("hide");
                to_page(currentPage);
            }
        });
    });

    //单个删除
    $(document).on("click",".delete_btn",function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        var empId = $(this).attr("del-id");
        if(confirm("真的要删除 [" + empName + "] 员工吗?")) {
            $.ajax({
                url:"${APP_PATH}/deleteEmp/" + empId,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);

                }
            });
        }
    });

    //全选/全不选
    $("#check_all").click(function () {
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //当前页面所有行被选中时，全选按钮也要被选
    $(document).on("click",".check_item",function () {
        var flag =$(".check_item:checked").length == $(".check_item").length;
        $("#check_all").prop("checked",flag);
    });

    //批量删除
    $("#emp_del_modal_btn").click(function () {
        var empNames = "";
        var delIds = "";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+"，";
            delIds += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        empNames = empNames.substring(0,empNames.length - 1);
        delIds = delIds.substring(0,delIds.length - 1);
        if(confirm("真的要删除 [" + empNames + "] 员工吗？")) {
            $.ajax({
                url:"${APP_PATH}/deleteEmp/" + delIds,
                type:"DELETE",
                success:function (result) {
                    alert(result.msg);
                    to_page(currentPage);
                }
            });
        }
    });

    $("#exit_btn").click(function () {
        window.location.href="${APP_PATH}/exit";
    });

</script>

</body>
</html>
