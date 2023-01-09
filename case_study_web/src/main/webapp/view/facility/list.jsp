<%--
  Created by IntelliJ IDEA.
  User: LE VU
  Date: 1/2/2023
  Time: 8:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer</title>

    <link rel="stylesheet" href="../../bootstrap-5.3.0-alpha1-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../datatables/css/dataTables.bootstrap5.min.css">
    <script src="../../jquery/jquery-3.5.1.min.js"></script>
    <script src="../../datatables/js/jquery.dataTables.min.js"></script>
    <script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
    <script src="../../bootstrap-5.3.0-alpha1-dist/js/bootstrap.bundle.js"></script>
</head>
<body class=" vh-100">
<div class="row container-fluid">
    <img src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png" alt="abc">
    <p class="id2 text-lg-end my-5"><span class="badge bg-success">Lê Xuân Vũ</span></p>
</div>
<div class="row">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid ">
            <div class="col-md-2 ms-3">
                <a class="navbar-brand" href="/index.jsp">HOME</a>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse col-md-8 justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Employee
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Customer
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/customer">List Customer</a></li>
                            <li><a class="dropdown-item" href="/customer?action=create">Create Customer</a></li>

                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="/facility" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Service
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/facility">List facility</a></li>
                            <li><a class="dropdown-item" href="/facility?action=create">Create facility</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown ms-5">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            Contract
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="#">Something else here</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="d-flex mx-3" role="search" method="get">
                    <input class="form-control me-2" type="search" name="name" placeholder="Search" aria-label="Search">
                    <label class="form-label">Loại dịch vụ</label>
                    <select class="form-select" aria-label="Default select example" name="facilityTypeId1">
                        <c:forEach var="facilityType" items="${facilityTypeList}">
                            <option value="${facilityType.getFacilityTypeId()}">${facilityType.getFacilityTypeName()}</option>
                        </c:forEach>
                    </select>
                    <select class="form-select" aria-label="Default select example" name="rentTypeId1">
                        <c:forEach var="rentType" items="${rentTypeList}">
                            <option value="${rentType.getRentTypeId()}">${rentType.getRentTypeName()}</option>
                        </c:forEach>
                    </select>
                    <button class="btn btn-outline-success" type="submit" name="action" value="search">Search</button>
                </form>
            </div>
        </div>
    </nav>
</div>
<h1 class="text-center my-3">LIST FACILITY </h1>
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addfacility"
        data-bs-whatever="@mdo">ADD NEW FACILITY
</button>
<table class="table table-striped table-bordered text-center" style="width:100%" id="tableFacility">
    <thead>
    <tr>
        <th scope="col">Number</th>
        <th scope="col">Name</th>
        <th scope="col">Area(m2)</th>
        <th scope="col">Cost</th>
        <th scope="col">Max_People</th>
        <th scope="col">Rent_Type</th>
        <th scope="col">Facility_Type</th>
        <th scope="col">Standard_Room</th>
        <th scope="col">description_Other_Convenience</th>
        <th scope="col">Pool_Area(m2)</th>
        <th scope="col">FloorNumber</th>
        <th scope="col">Facility_Free</th>
        <th scope="col">Edit</th>
        <th scope="col">Delete</th>
    </tr>
    </thead>
    <tbody class="table-group-divider">
    <c:forEach var="facility" items="${facilityList}" varStatus="status">
        <tr>
            <td>${facility.getFacilityId()}</td>
            <td>${facility.getFacilityName()}</td>
            <td>${facility.getArea()}</td>
            <td>${facility.getCost()}</td>
            <td>${facility.getMaxPeople()}</td>
            <c:forEach var="rentType" items="${rentTypeList}">

                <c:if test="${rentType.getRentTypeId() == facility.getRentTypeId()}">
                    <td>
                            ${rentType.getRentTypeName()}
                    </td>
                </c:if>
            </c:forEach>
            <c:forEach var="facilityType" items="${facilityTypeList}">

                <c:if test="${facilityType.getFacilityTypeId() == facility.getFacilityTypeId()}">
                    <td>
                            ${facilityType.getFacilityTypeName()}
                    </td>
                </c:if>
            </c:forEach>
            <td>${facility.getStandardRoom()}</td>
            <td>${facility.getDescriptionOtherConvenience()}</td>
            <c:if test="${facility.getPoolArea()==null}"><td>0</td>
            </c:if>
            <c:if test="${facility.getPoolArea()!=null}"><td>${facility.getPoolArea()}</td>
            </c:if>
            <c:if test="${facility.getNumberOfFloors()==null}"><td>0</td>m
            </c:if>
            <c:if test="${facility.getNumberOfFloors()!=null}"><td>${facility.getNumberOfFloors()}</td>
            </c:if>
            <c:if test="${facility.getFacilityFree()==null}"><td>-</td>
            </c:if>
            <c:if test="${facility.getFacilityFree()!=null}"><td>${facility.getFacilityFree()}</td>
            </c:if>
            <td>
                <a href="/facility?action=edit&id=${facility.getFacilityId()}">
                    <button type="button" class="btn btn-primary">EDIT</button>
                </a>
            </td>
            <td>
                <!-- Button trigger modal -->

                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"
                        onclick="deleteFacility('${facility.getFacilityId()}','${facility.getFacilityName()}')">
                    DELETE
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form method="post" action="/facility?action=delete">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">DELETE FACILITY</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="idDelete" hidden id="idDelete">
                    <strong>Facility: </strong>
                    <span id="nameDelete" class="text-danger"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">CANCEL</button>
                    <button type="submit"  class="btn btn-primary">OK</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%---------------------------------------------------------Modal add new facility-------------------------------%>
<div class="modal fade" id="addfacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" >Thêm Mới Dịch Vụ</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form class="w-100 border border-2 border-success p-3  rounded" action="/facility?action=create" method="post">
                    <input type="text" name="facilityTypeId" id="facilityTypeId" hidden>
                    <button type="button" class="btn btn-warning" onclick='addVilla()'>+Add Villa
                    </button>
                    <button type="button" class="btn btn-danger" onclick="addHouse()">+Add House
                    </button>
                    <button type="button" class="btn btn-outline-danger" onclick="addRoom()">+Add Room
                    </button>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Tên Dịch Vụ:</label>
                        <input type="text" class="form-control" name="facilityName" id="recipient-name" >
                    </div>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Diện tích</label>
                        <input type="number" class="form-control" name="area">
                    </div>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Giá Tiền</label>
                        <input type="number" class="form-control" name="cost">
                    </div>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">Số lượng người tối đa</label>
                        <input type="number" class="form-control" name="maxPeople">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Kiểu Thuê</label>
                        <select class="form-select" aria-label="Default select example" name="rentTypeId">
                            <c:forEach var="rentType" items="${rentTypeList}">
                                <option value="${rentType.getRentTypeId()}">${rentType.getRentTypeName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3" id="standardRoom">
                        <label for="recipient-name" class="col-form-label">Tiêu Chuẩn Phòng</label>
                        <input type="text" class="form-control" name="standardRoom">
                    </div>
                    <div class="mb-3" id="descriptionOtherConvenience">
                        <label for="recipient-name" class="col-form-label">Mô tả tiện nghi</label>
                        <input type="text" class="form-control" name="descriptionOtherConvenience">
                    </div>
                    <div class="mb-3" id="poolArea">
                        <label for="recipient-name" class="col-form-label">Diện tích hồ bơi</label>
                        <input type="number" class="form-control" name="poolArea">
                    </div>
                    <div class="mb-3" id="numberOfFloors">
                        <label for="recipient-name" class="col-form-label">Số tầng</label>
                        <input type="number" class="form-control" name="numberOfFloors">
                    </div>
                    <div class="mb-3" id="facilityFree">
                        <label for="recipient-name" class="col-form-label">Dich vụ miễn phí</label>
                        <input type="text" class="form-control" name="facilityFree">
                    </div>
                    <div class="mb-3" >
                        <label for="recipient-name" class="col-form-label">Save</label>
                        <input type="submit" >
                    </div>
            </form>
            </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy Bỏ</button>
                <button type="button" class="btn btn-primary">Tạo Dịch Vụ</button>
            </div>
        </div>
    </div>
</div>
<script>
    function deleteFacility(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerText = name;
    }
</script>
<script>
    function addVilla(){
        document.getElementById("facilityTypeId").value = 1;
        var standardRoom = document.getElementById('standardRoom');
        var descriptionOtherConvenience = document.getElementById('descriptionOtherConvenience');
        var poolArea = document.getElementById('poolArea');
        var numberOfFloors = document.getElementById('numberOfFloors');
        var facilityFree = document.getElementById('facilityFree');
        standardRoom.style.display = 'block';
        descriptionOtherConvenience.style.display = 'block';
        poolArea.style.display = 'block';
        numberOfFloors.style.display = 'block';
        facilityFree.style.display = 'none';
    }
    function addRoom(){
        document.getElementById("facilityTypeId").value = 3;
        var standardRoom = document.getElementById('standardRoom');
        var descriptionOtherConvenience = document.getElementById('descriptionOtherConvenience');
        var poolArea = document.getElementById('poolArea');
        var numberOfFloors = document.getElementById('numberOfFloors');
        var facilityFree = document.getElementById('facilityFree');
        standardRoom.style.display = 'none';
        descriptionOtherConvenience.style.display = 'none';
        poolArea.style.display = 'none';
        numberOfFloors.style.display = 'none';
        facilityFree.style.display = 'block';
    }
    function addHouse(){
        document.getElementById("facilityTypeId").value = 2;
        var standardRoom = document.getElementById('standardRoom');
        var descriptionOtherConvenience = document.getElementById('descriptionOtherConvenience');
        var poolArea = document.getElementById('poolArea');
        var numberOfFloors = document.getElementById('numberOfFloors');
        var facilityFree = document.getElementById('facilityFree');
        standardRoom.style.display = 'block';
        descriptionOtherConvenience.style.display = 'none';
        poolArea.style.display = 'none';
        numberOfFloors.style.display = 'block';
        facilityFree.style.display = 'block';
    }
</script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
</body>
</html>
