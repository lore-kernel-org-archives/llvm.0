Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25A31845;
	Sat, 14 Oct 2023 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="er7HCBbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697321038; x=1728857038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ytSVWjNd7o89JByzxJyEd0UtKsTotrtjUCoi+jF2p4=;
  b=er7HCBbEnV91UQHyWdPZSAYw3zO3WFnNuU7Awiz6UF7BsbLinKLbStB9
   p7G5g59vfa4i8jPqEPU7Irqrmu0xiTrhMPIeMHzv3fHmjF6LI4EnYcnH8
   QW37l/3opfUcnCrltQ4oUVXtqh+AO7PLoxa96+cgx3V6ufr+toOLn5rES
   5T6g9xvGdjph0kbGfOVIeuepwoMiTupzYgUsvl8i1zNYJ/Y1YzY6C+bsq
   JsFflXRPzYm1e2nRSNGuyTAI7aSBROVs2vRI1R0MgeP1AwtS53aq4co2d
   CMmOM66SAEx1e9EYDafnteuIL+vecZO6+n1l8x/GlmmCMj2uOvUS4qnsk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384221753"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384221753"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 15:03:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="878927393"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="878927393"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Oct 2023 15:03:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrmjN-0006jA-2n;
	Sat, 14 Oct 2023 22:03:33 +0000
Date: Sun, 15 Oct 2023 06:03:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/insn/rework 19/38] arch/arm64/lib/test_insn.c:1547:6:
 warning: no previous prototype for function 'test_insn_ldp_pre'
Message-ID: <202310150555.YnLHG98O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/insn/rework
head:   37bd99f160dd83ccdfd3f50c685259ae62a81e68
commit: 909f039a4feffda7d3d77c5be2017bc3fc3ba920 [19/38] arm64: insn: rework LDP / STP
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231015/202310150555.YnLHG98O-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150555.YnLHG98O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150555.YnLHG98O-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/lib/test_insn.c:1547:6: warning: no previous prototype for function 'test_insn_ldp_pre' [-Wmissing-prototypes]
    1547 | void test_insn_ldp_pre(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1547:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1547 | void test_insn_ldp_pre(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:1616:6: warning: no previous prototype for function 'test_insn_stp_pre' [-Wmissing-prototypes]
    1616 | void test_insn_stp_pre(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1616:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1616 | void test_insn_stp_pre(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:1717:6: warning: no previous prototype for function 'test_insn_ldp_post' [-Wmissing-prototypes]
    1717 | void test_insn_ldp_post(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1717:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1717 | void test_insn_ldp_post(struct kunit *test)
         | ^
         | static 
>> arch/arm64/lib/test_insn.c:1780:6: warning: no previous prototype for function 'test_insn_stp_post' [-Wmissing-prototypes]
    1780 | void test_insn_stp_post(struct kunit *test)
         |      ^
   arch/arm64/lib/test_insn.c:1780:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1780 | void test_insn_stp_post(struct kunit *test)
         | ^
         | static 
   4 warnings generated.


vim +/test_insn_ldp_pre +1547 arch/arm64/lib/test_insn.c

  1546	
> 1547	void test_insn_ldp_pre(struct kunit *test)
  1548	{
  1549		TEST_LDST_PRE_CASE(test,
  1550				   ldp, x0, x1, x2, 0,
  1551				   AARCH64_INSN_VARIANT_64BIT,
  1552				   AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX);
  1553	
  1554		TEST_LDST_PRE_CASE(test,
  1555				   ldp, x5, x19, x28, 48,
  1556				   AARCH64_INSN_VARIANT_64BIT,
  1557				   AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX);
  1558	
  1559		TEST_LDST_PRE_CASE(test,
  1560				   ldp, x2, x7, x13, -56,
  1561				   AARCH64_INSN_VARIANT_64BIT,
  1562				   AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX);
  1563	
  1564		TEST_LDST_PRE_CASE(test,
  1565				   ldp, w0, w1, x2, 0,
  1566				   AARCH64_INSN_VARIANT_32BIT,
  1567				   AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX);
  1568	
  1569		TEST_LDST_PRE_CASE(test,
  1570				   ldp, w5, w19, x28, 12,
  1571				   AARCH64_INSN_VARIANT_32BIT,
  1572				   AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX);
  1573	
  1574		TEST_LDST_PRE_CASE(test,
  1575				   ldp, w2, w7, x13, -52,
  1576				   AARCH64_INSN_VARIANT_32BIT,
  1577				   AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX);
  1578	
  1579		/*
  1580		 * Out-of-range immediates
  1581		 */
  1582		KUNIT_EXPECT_EQ(test,
  1583				AARCH64_BREAK_FAULT,
  1584				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1585								 AARCH64_INSN_REG_1,
  1586								 AARCH64_INSN_REG_2,
  1587								 -520,
  1588								 AARCH64_INSN_VARIANT_64BIT,
  1589								 AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX));
  1590		KUNIT_EXPECT_EQ(test,
  1591				AARCH64_BREAK_FAULT,
  1592				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1593								 AARCH64_INSN_REG_1,
  1594								 AARCH64_INSN_REG_2,
  1595								 512,
  1596								 AARCH64_INSN_VARIANT_64BIT,
  1597								 AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX));
  1598		KUNIT_EXPECT_EQ(test,
  1599				AARCH64_BREAK_FAULT,
  1600				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1601								 AARCH64_INSN_REG_1,
  1602								 AARCH64_INSN_REG_2,
  1603								 -260,
  1604								 AARCH64_INSN_VARIANT_32BIT,
  1605								 AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX));
  1606		KUNIT_EXPECT_EQ(test,
  1607				AARCH64_BREAK_FAULT,
  1608				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1609								 AARCH64_INSN_REG_1,
  1610								 AARCH64_INSN_REG_2,
  1611								 256,
  1612								 AARCH64_INSN_VARIANT_32BIT,
  1613								 AARCH64_INSN_LDST_LOAD_PAIR_PRE_INDEX));
  1614	}
  1615	
> 1616	void test_insn_stp_pre(struct kunit *test)
  1617	{
  1618		TEST_LDST_PRE_CASE(test,
  1619				   stp, x0, x1, x2, 0,
  1620				   AARCH64_INSN_VARIANT_64BIT,
  1621				   AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX);
  1622	
  1623		TEST_LDST_PRE_CASE(test,
  1624				   stp, x5, x19, x28, 48,
  1625				   AARCH64_INSN_VARIANT_64BIT,
  1626				   AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX);
  1627	
  1628		TEST_LDST_PRE_CASE(test,
  1629				   stp, x2, x7, x13, -56,
  1630				   AARCH64_INSN_VARIANT_64BIT,
  1631				   AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX);
  1632	
  1633		TEST_LDST_PRE_CASE(test,
  1634				   stp, w0, w1, x2, 0,
  1635				   AARCH64_INSN_VARIANT_32BIT,
  1636				   AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX);
  1637	
  1638		TEST_LDST_PRE_CASE(test,
  1639				   stp, w5, w19, x28, 12,
  1640				   AARCH64_INSN_VARIANT_32BIT,
  1641				   AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX);
  1642	
  1643		TEST_LDST_PRE_CASE(test,
  1644				   stp, w2, w7, x13, -52,
  1645				   AARCH64_INSN_VARIANT_32BIT,
  1646				   AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX);
  1647	
  1648		/*
  1649		 * Out-of-range immediates
  1650		 */
  1651		KUNIT_EXPECT_EQ(test,
  1652				AARCH64_BREAK_FAULT,
  1653				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1654								 AARCH64_INSN_REG_1,
  1655								 AARCH64_INSN_REG_2,
  1656								 -520,
  1657								 AARCH64_INSN_VARIANT_64BIT,
  1658								 AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX));
  1659		KUNIT_EXPECT_EQ(test,
  1660				AARCH64_BREAK_FAULT,
  1661				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1662								 AARCH64_INSN_REG_1,
  1663								 AARCH64_INSN_REG_2,
  1664								 512,
  1665								 AARCH64_INSN_VARIANT_64BIT,
  1666								 AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX));
  1667		KUNIT_EXPECT_EQ(test,
  1668				AARCH64_BREAK_FAULT,
  1669				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1670								 AARCH64_INSN_REG_1,
  1671								 AARCH64_INSN_REG_2,
  1672								 -260,
  1673								 AARCH64_INSN_VARIANT_32BIT,
  1674								 AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX));
  1675		KUNIT_EXPECT_EQ(test,
  1676				AARCH64_BREAK_FAULT,
  1677				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1678								 AARCH64_INSN_REG_1,
  1679								 AARCH64_INSN_REG_2,
  1680								 256,
  1681								 AARCH64_INSN_VARIANT_32BIT,
  1682								 AARCH64_INSN_LDST_STORE_PAIR_PRE_INDEX));
  1683	}
  1684	
  1685	#define TEST_LDST_POST_CASE(test, arg_insn, arg_rt, arg_rt2, arg_rn, arg_offset,		\
  1686				   arg_variant, arg_type)						\
  1687	do {												\
  1688		enum aarch64_insn_register rt = REG_IDX(arg_rt);					\
  1689		enum aarch64_insn_register rt2 = REG_IDX(arg_rt2);					\
  1690		enum aarch64_insn_register rn = REG_IDX(arg_rn);					\
  1691		s64 offset = (arg_offset);								\
  1692		enum aarch64_insn_variant variant = (arg_variant);					\
  1693		enum aarch64_insn_ldst_type type = (arg_type);						\
  1694		int scale = (variant == AARCH64_INSN_VARIANT_64BIT) ? 8 : 4;				\
  1695													\
  1696		u32 obj_insn = ASM_U32(#arg_insn " " #arg_rt ", " #arg_rt2 ", [" #arg_rn "], %0",	\
  1697				       "i" (offset));							\
  1698		u32 gen_insn = aarch64_insn_gen_load_store_pair(rt, rt2, rn, offset, variant, type);	\
  1699													\
  1700		KUNIT_EXPECT_EQ(test, obj_insn, gen_insn);						\
  1701		INSN_EXPECT_IS(test, arg_insn##_post, obj_insn);					\
  1702		INSN_EXPECT_IS(test, arg_insn##_post, gen_insn);					\
  1703													\
  1704		INSN_EXPECT_REG_EQ(test, obj_insn, rt, rt);						\
  1705		INSN_EXPECT_REG_EQ(test, gen_insn, rt, rt);						\
  1706													\
  1707		INSN_EXPECT_REG_EQ(test, obj_insn, rt2, rt2);						\
  1708		INSN_EXPECT_REG_EQ(test, gen_insn, rt2, rt2);						\
  1709													\
  1710		INSN_EXPECT_REG_EQ(test, obj_insn, rn, rn);						\
  1711		INSN_EXPECT_REG_EQ(test, gen_insn, rn, rn);						\
  1712													\
  1713		INSN_EXPECT_IMM_EQ(test, obj_insn, signed_imm7_15, offset, scale);			\
  1714		INSN_EXPECT_IMM_EQ(test, gen_insn, signed_imm7_15, offset, scale);			\
  1715	} while (0)
  1716	
> 1717	void test_insn_ldp_post(struct kunit *test)
  1718	{
  1719		TEST_LDST_POST_CASE(test, ldp, x0, x1, x2, 0,
  1720				  AARCH64_INSN_VARIANT_64BIT,
  1721				  AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX);
  1722	
  1723		TEST_LDST_POST_CASE(test, ldp, x5, x19, x28, 48,
  1724				  AARCH64_INSN_VARIANT_64BIT,
  1725				  AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX);
  1726	
  1727		TEST_LDST_POST_CASE(test, ldp, x2, x7, x13, -56,
  1728				  AARCH64_INSN_VARIANT_64BIT,
  1729				  AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX);
  1730	
  1731		TEST_LDST_POST_CASE(test, ldp, w0, w1, x2, 0,
  1732				  AARCH64_INSN_VARIANT_32BIT,
  1733				  AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX);
  1734	
  1735		TEST_LDST_POST_CASE(test, ldp, w5, w19, x28, 12,
  1736				  AARCH64_INSN_VARIANT_32BIT,
  1737				  AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX);
  1738	
  1739		TEST_LDST_POST_CASE(test, ldp, w2, w7, x13, -52,
  1740				  AARCH64_INSN_VARIANT_32BIT,
  1741				  AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX);
  1742	
  1743		/*
  1744		 * Out-of-range immediates
  1745		 */
  1746		KUNIT_EXPECT_EQ(test,
  1747				AARCH64_BREAK_FAULT,
  1748				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1749								 AARCH64_INSN_REG_1,
  1750								 AARCH64_INSN_REG_2,
  1751								 -520,
  1752								 AARCH64_INSN_VARIANT_64BIT,
  1753								 AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX));
  1754		KUNIT_EXPECT_EQ(test,
  1755				AARCH64_BREAK_FAULT,
  1756				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1757								 AARCH64_INSN_REG_1,
  1758								 AARCH64_INSN_REG_2,
  1759								 512,
  1760								 AARCH64_INSN_VARIANT_64BIT,
  1761								 AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX));
  1762		KUNIT_EXPECT_EQ(test,
  1763				AARCH64_BREAK_FAULT,
  1764				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1765								 AARCH64_INSN_REG_1,
  1766								 AARCH64_INSN_REG_2,
  1767								 -260,
  1768								 AARCH64_INSN_VARIANT_32BIT,
  1769								 AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX));
  1770		KUNIT_EXPECT_EQ(test,
  1771				AARCH64_BREAK_FAULT,
  1772				aarch64_insn_gen_load_store_pair(AARCH64_INSN_REG_0,
  1773								 AARCH64_INSN_REG_1,
  1774								 AARCH64_INSN_REG_2,
  1775								 256,
  1776								 AARCH64_INSN_VARIANT_32BIT,
  1777								 AARCH64_INSN_LDST_LOAD_PAIR_POST_INDEX));
  1778	}
  1779	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
