package com.map;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;

class RestaurantDaoTest {
	RestaurantDao rdao = new RestaurantDao();
	@Test
	void testProcRestList() {
		List<Map<String,Object>> rList = rdao.procRestList();
		assertSame(rList,rdao.procRestList());
	}

}
