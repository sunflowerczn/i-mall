<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%@ include file="../../header.jsp" %>
<body>


<div class="layui-tab layui-tab-brief mall-tab">
    <ul class="layui-tab-title">
        <li class="layui-this">订单信息</li>
        <li>订单商品</li>
        <li>支付信息</li>
        <li>物流信息</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <table class="layui-table">
                <tr>
                    <td>订单编号</td>
                    <td>${order.orderNumber}</td>
                    <td>订单状态</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.orderStatus == 0}">
                                待支付
                            </c:when>
                            <c:when test="${order.orderStatus == 1}">
                                待发货
                            </c:when>
                            <c:when test="${order.orderStatus == 2}">
                                待收货
                            </c:when>
                            <c:when test="${order.orderStatus == 3}">
                                待评价
                            </c:when>
                            <c:when test="${order.orderStatus == 4}">
                                已完成
                            </c:when>
                            <c:when test="${order.orderStatus == 5}">
                                交易关闭
                            </c:when>
                        </c:choose>
                    </td>
                </tr>

                <tr>
                    <td>下单用户</td>
                    <td>
                        <c:if test="${not empty member.realName}">
                            ${member.realName}
                        </c:if>

                        <c:if test="${empty member.realName}">
                            ${member.username}
                        </c:if>
                    </td>
                    <td>下单电话</td>
                    <td>${member.mobile}</td>
                </tr>

                <tr>
                    <td>应付金额</td>
                    <td>${order.paymentAmount}</td>
                    <td>运费</td>
                    <td>${order.freight}</td>
                </tr>
                <tr>
                    <td>创建时间</td>
                    <td>
                        <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>付款时间</td>
                    <td>
                        <fmt:formatDate value="${order.paymentTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                </tr>

                <tr>
                    <td>发货时间</td>
                    <td>
                        <fmt:formatDate value="${order.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>完成时间</td>
                    <td>
                        <fmt:formatDate value="${order.finishTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                </tr>

                <tr>
                    <td>收货信息</td>
                    <td colspan="3">
                        姓名：${address.receiver}
                        <hr>
                        电话：${address.mobile}
                        <hr>
                        邮编：${address.zipCode}
                        <hr>
                        地址：${address.address}
                    </td>
                </tr>
            </table>

            <c:if test="${order.orderStatus == 0}">
                <button class="layui-btn" lay-submit lay-filter="add" type="button">配送</button>
            </c:if>
        </div>
        <div class="layui-tab-item">
            <table class="layui-table" lay-skin="line">
                <thead>
                <tr>
                    <th>商品图片</th>
                    <th>商品名称</th>
                    <th>商品价格</th>
                    <th>商品数量</th>
                    <th>商品总价</th>
                </tr>
                </thead>
                <tbody>

                <c:set value="0" var="total_count"/>
                <c:set value="0.00" var="total_price"/>
                <c:forEach items="${itemList}" var="detail">
                    <c:set value="${total_count + detail.quantity}" var="total_count"/>
                    <c:set value="${total_price + detail.goodsPrice*detail.quantity}" var="total_price"/>
                    <tr>
                        <td>
                            <img src="${detail.goodsImg}">
                        </td>
                        <td>${detail.goodsName}</td>
                        <td>${detail.goodsPrice}</td>
                        <td>${detail.quantity}</td>
                        <td>${detail.goodsPrice*detail.quantity}</td>
                    </tr>
                </c:forEach>
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: right">合计</td>
                    <td>${total_count}</td>
                    <td>${total_price}</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="layui-tab-item">
            <table class="layui-table" style="width: 50%">

                <tr>
                    <td>交易流水号</td>
                    <td>${payment.paymentNumber}</td>
                </tr>
                <tr>
                    <td>付款状态</td>
                    <td>
                        <c:choose>
                            <c:when test="${payment.paymentStatus == 0}">
                                待支付
                            </c:when>
                            <c:when test="${payment.paymentStatus == 1}">
                                已支付
                            </c:when>
                            <c:when test="${payment.paymentStatus == 2}">
                                待退款
                            </c:when>
                            <c:when test="${payment.paymentStatus == 3}">
                                已退款
                            </c:when>
                            <c:when test="${payment.paymentStatus == 4}">
                                交易关闭
                            </c:when>
                        </c:choose>
                    </td>
                </tr>

                <tr>
                    <td>付款金额</td>
                    <td>${payment.paymentAmount}</td>
                </tr>
                <tr>
                    <td>付款方式</td>
                    <td>
                        <c:choose>
                            <c:when test="${payment.paymentType == 1}">
                                支付宝
                            </c:when>
                            <c:when test="${payment.paymentType == 2}">
                                微信
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </table>
        </div>
        <div class="layui-tab-item">
        </div>
    </div>
</div>
<%@ include file="../../footer.jsp" %>
</body>
</html>
