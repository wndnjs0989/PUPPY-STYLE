package com.springboot.Pilotproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.Pilotproject.dao.ProductDAO;
import com.springboot.Pilotproject.dto.CartDTO;
import com.springboot.Pilotproject.dto.ProductDTO;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	 @Autowired
	    private ProductDAO productDAO;

	    // 장바구니 담기
	    @RequestMapping("/member/insertCart")
	    public String insertCart(@RequestParam("pnum") long pnum,
	                             @RequestParam(value="cartcount", defaultValue="1") int cartcount,
	                             HttpSession session) {

	        // 세션에서 장바구니 가져오기
	        List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
	        if(cartList == null) {
	            cartList = new ArrayList<>();
	        }

	        // 이미 담긴 상품이면 수량만 증가
	        boolean exists = false;
	        for(CartDTO c : cartList) {
	            if(c.getPnum() == pnum) {
	                c.setCartcount(c.getCartcount() + cartcount);
	                exists = true;
	                break;
	            }
	        }

	        // 새 상품이면 추가
	        if(!exists) {
	            ProductDTO product = productDAO.selectProductByPnum(pnum);
	            CartDTO cart = new CartDTO();
	            cart.setPnum(pnum);
	            cart.setCartcount(cartcount);
	            cart.setPname(product.getPname());
	            cart.setPdecimal(product.getPdecimal());
	            cart.setPimage(product.getPimage());
	            cart.setPsize(product.getPsize());
	            cartList.add(cart);
	        }

	        session.setAttribute("cartList", cartList);
	        return "redirect:/member/cartList";
	    }

	    // 장바구니 목록
	    @RequestMapping("/member/cartList")
	    public String cartList(Model model, HttpSession session) {
	        List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
	        if(cartList == null) {
	            cartList = new ArrayList<>();
	        }

	        long totalPrice = 0;
	        for(CartDTO c : cartList) {
	            totalPrice += c.getPdecimal() * c.getCartcount();
	        }

	        model.addAttribute("cartList", cartList);
	        model.addAttribute("totalPrice", totalPrice);
	        return "member/cartList";
	    }

	    // 수량 수정
	    @RequestMapping("/member/updateCart")
	    public String updateCart(@RequestParam("pnum") long pnum,
	                             @RequestParam("cartcount") int cartcount,
	                             HttpSession session) {
	        List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
	        if(cartList != null) {
	            for(CartDTO c : cartList) {
	                if(c.getPnum() == pnum) {
	                    c.setCartcount(cartcount);
	                    break;
	                }
	            }
	        }
	        session.setAttribute("cartList", cartList);
	        return "redirect:/member/cartList";
	    }

	    // 장바구니 단건 삭제
	    @RequestMapping("/member/deleteCart")
	    public String deleteCart(@RequestParam("pnum") long pnum,
	                             HttpSession session) {
	        List<CartDTO> cartList = (List<CartDTO>) session.getAttribute("cartList");
	        if(cartList != null) {
	            cartList.removeIf(c -> c.getPnum() == pnum);
	        }
	        session.setAttribute("cartList", cartList);
	        return "redirect:/member/cartList";
	    }
}
