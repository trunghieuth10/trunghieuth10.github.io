<%@ page contentType="text/html;charset=UTF-8" language="java" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="compress" uri="http://htmlcompressor.googlecode.com/taglib/compressor" %>

<compress:html removeIntertagSpaces="true">
    <!DOCTYPE HTML>
    <html lang="ru">
    <head>
            <%-- HEAD --%>
        <jsp:include page="/WEB-INF/views/admin/template/head.jsp"/>
        <meta name="title" content="Редактирование продукта ${product.title} || Alex Coffee">
        <title>Редактирование продукта ${product.title} || Alex Coffee</title>
    </head>
    <body>
        <%-- NAVBAR --%>
    <jsp:include page="/WEB-INF/views/admin/template/admin_navbar.jsp"/>
        <%-- Edit product --%>
    <div class="container-fluid width">
        <section id="product">
            <div class="row admin-page">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1">
                    <div class="row section-name text-shadow">
                        <b>
                            <span class="color-brown">Редактирование товара </span>
                            <span class="color-green">"${product.title}"</span>
                        </b>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-10 col-sm-offset-1 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1 col-xl-10 col-xl-offset-1 full-cart">
                    <form action="<c:url value="/admin/product/update"/>" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="${product.id}">
                        <table class="table">
                            <tr>
                                <th>Название:</th>
                                <td>
                                    <input class="input-order" type="text" name="title" value="${product.title}"
                                           placeholder="Введите название товара" minlength="5" maxlength="100" required>
                                </td>
                            </tr>
                            <tr>
                                <th>URL:</th>
                                <td>
                                    <input class="input-order" type="text" name="url" pattern="[a-z0-9_]{5,50}"
                                           placeholder=" Введите URL, формат (a-z, 0-9, _)" value="${product.url}"
                                           minlength="5" maxlength="50" required>
                                </td>
                            </tr>
                            <tr>
                                <th>Категория:</th>
                                <td>
                                    <select class="input-order" name="category" title="Категория товара">
                                        <option value="${product.category.id}">${product.category.title}</option>
                                        <c:forEach items="${categories}" var="category">
                                            <c:if test="${category.id ne product.category.id}">
                                                <option value="${category.id}">${category.title}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>Параметры:</th>
                                <td>
                                <textarea class="input-order textarea" placeholder="Введите параметры товара"
                                          name="parameters" maxlength="500" required>${product.parameters}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>Описание:</th>
                                <td>
                                <textarea class="input-order textarea" placeholder="Введите описание товара"
                                          name="description" maxlength="500">${product.description}</textarea>
                                </td>
                            </tr>
                            <tr>
                                <th>Изображение:</th>
                                <td>
                                    <input type="hidden" name="photo_id" value="${product.photo.id}">
                                    <input class="input-order" type="text" name="photo_title"
                                           placeholder="Введите название фото" value="${product.photo.title}"
                                           minlength="5" maxlength="100">
                                    <br>Малое: <input type="file" name="small_photo" accept="image/*">
                                    <br>Большое: <input type="file" name="big_photo" accept="image/*">
                                </td>
                            </tr>
                            <tr>
                                <th>Цена:</th>
                                <td>
                                    <input class="input-order" type="text" name="price" min="0" max="99999" step="0.01"
                                           placeholder="Введите цену товара" value="${product.price}" required>
                                </td>
                            </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <button class="btn btn-success" type="submit" title="Обновить информацию о товаре">
                                        Сохранить
                                    </button>
                                    <button class="btn btn-info" type="reset" title="Сбросить введенные даные">
                                        Сброс
                                    </button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </section>
    </div>
    </body>
    </html>
</compress:html>

<%-- Yurii Salimov (yurii.alex.salimov@gmail.com) --%>
