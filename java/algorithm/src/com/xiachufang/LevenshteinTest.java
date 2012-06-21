package com.xiachufang;

import static org.junit.Assert.*;

import org.junit.Test;

import com.xiachufang.Levenshtein;

public class LevenshteinTest {

	@Test
	public void testDitstanceEqual() {
		int value;
		value = Levenshtein.ditstance("qq.com", "qq.com");
		assertEquals(0, value);
		value = Levenshtein.ditstance(".sina.com", ".sina.com");
		assertEquals(0, value);
	}

	@Test
	public void testDitstanceValue() {
		int value;
		
		value = Levenshtein.ditstance("qq.com", ".qq.com");
		assertEquals(1, value);
		value = Levenshtein.ditstance("qq.com", "qq.cn");
		assertEquals(2, value);
		value = Levenshtein.ditstance("qq.com", "qq.con");
		assertEquals(1, value);
		value = Levenshtein.ditstance("gmail.com", ".gmail.com");
		assertEquals(1, value);
		value = Levenshtein.ditstance("gmail.com.", "gmail.com");
		assertEquals(1, value);
		value = Levenshtein.ditstance("139.com", "19.com");
		assertEquals(1, value);
		value = Levenshtein.ditstance("", "gmail.com");
		assertEquals(9, value);
		value = Levenshtein.ditstance("gmail.com", "");
		assertEquals(9, value);
	}
}
