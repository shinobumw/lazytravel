package com.lazytravel.order.service;

import java.sql.Timestamp;
import java.util.List;

import com.lazytravel.order.dao.OrdersHibernateDAO;
import com.lazytravel.order.dao.OrdersHibernateDAOImpl;
import com.lazytravel.order.entity.Orders;

public class OrdersService {
	private final OrdersHibernateDAO dao;
	
	public OrdersService() {
		dao = new OrdersHibernateDAOImpl();
	}
	
	public void addOrder(Orders order) {
		dao.add(order);
	}
	
	public void updateOrder(Orders order) {
		dao.update(order);
	}
	
	

	
	public Orders getOneOrder(Integer orderId) {
		return dao.getOrdersByOrdersId(orderId);
	}
	
	public Orders getOrderByOrderNo(Integer orderNo) {
		return dao.getOrdersByOrdersNo(orderNo);
	}
	
	
	
	public List<Orders> getAll(){
		return dao.getAll();
	}
	
	
//	public Orders addOrder(Integer orderNo, Integer customerId, Integer groupId, Integer tourist, Integer customerPoint, Integer couponId, Integer totalAmt, String orderStatus) {
//	Orders order = new Orders();
//	order.setOrderNo(orderNo);
//	order.setCustomerId(customerId);
//	order.setGroupId(groupId);
//	order.setTourist(tourist);
//	order.setCustomerPoint(customerPoint);
//	order.setCouponId(couponId);
//	order.setTotalAmt(totalAmt);
//	order.setOrderStatus(orderStatus);
//	
//	dao.add(order);
//	
//	return order;
//}
//
//public Orders updateOrder(Integer orderId, Integer orderNo, Integer customerId, Integer groupId, Integer tourist, Integer customerPoint, Integer couponId, Integer totalAmt, String orderStatus) {
//	Orders order = new Orders();
//	order.setOrderId(orderId);
//	order.setOrderNo(orderNo);
//	order.setCustomerId(customerId);
//	order.setGroupId(groupId);
//	order.setTourist(tourist);
//	order.setCustomerPoint(customerPoint);
//	order.setCouponId(couponId);
//	order.setTotalAmt(totalAmt);
//	order.setOrderStatus(orderStatus);
//
//	
//	dao.update(order);
//	return order;
//
//}
	
	
}
