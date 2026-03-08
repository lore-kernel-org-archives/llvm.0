Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7341E32CF;
	Sun,  8 Mar 2026 14:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772980661; cv=none; b=hck24V5ApKps+s9g7bywGjP4MEA4ywUqncItm5lkADb/9Isx9ZM7ugbDE4Sbuv0WVNk+XVrOujmeJB9N/KJlz/L8fJ+nv0yg/FbjI2bmpSiYmXwW4uR9mJW/zCvti0LNmS91En6yUQdVnNhVu+lFVag8ff+hMMmWdNsYHRFCWOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772980661; c=relaxed/simple;
	bh=8pAKNUQYK/ROvM8zpRYpEYdR6UvTf/gNUO00wUv5uXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgGfb6wrfgPd0BAdbG8bbPSBy+NDXwHyz1EJq23i4Cnr+jvt6lEJe6Xo46IsDfDwtkBaXcx3YwYgRpDATSy/JyFnBOTNwzCnPYs/yjtJRjISgoWZoui0DLSXdpgAXlgUbByKD3EI0qDh2ZesUe4LegDh67AsK6S7RJc2ubp8J5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPtLWlZB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPtLWlZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772980659; x=1804516659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8pAKNUQYK/ROvM8zpRYpEYdR6UvTf/gNUO00wUv5uXs=;
  b=UPtLWlZBeY95JNN0Y0qDAVzoaJdDRhdTWTifZG9PHSWpYdpJzmyy6Iut
   UAxShmvkI2Q9yI5Kh191ClfrIlreARYhUw88DvyG/frGt6Lr3JNp8BqJE
   ohxlALNTYqll2mcmoYUEUKRQ7tL+ki+bGrWo6zOTLamKJDzRjG4AiWeSE
   /tE/ft3ycPe8M2a2KQrDqKvw9No8vrl7YFt2+ZZ/eGzbXIbdk9o3P7Z+m
   lpRqrOXMNHXZr3ZBIRpKquJTaiZFftmCBr3aseV344uf4Taaym/hBEh8C
   B5+mEc9s2b9pA00tBaQwBK3nOwaDFOu5NohW31v76LNayPHauy0LBBOZ+
   w==;
X-CSE-ConnectionGUID: 9EFrhEknR524fVJgEOcWSw==
X-CSE-MsgGUID: ykQ/+TbiRGK/tssH78tc2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91403546"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="91403546"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 07:37:38 -0700
X-CSE-ConnectionGUID: uSUwOci4Sq2bYmfpPPGXGg==
X-CSE-MsgGUID: cpBkPnE4R0iGsN2QEe81Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="224443214"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2026 07:37:37 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzFGA-000000003Ao-1Ecd;
	Sun, 08 Mar 2026 14:37:34 +0000
Date: Sun, 8 Mar 2026 22:37:33 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v5 2/4] clk: test: introduce test suite for sibling
 rate changes on a divider
Message-ID: <202603082228.3RYA8l9q-lkp@intel.com>
References: <20260306-clk-scaling-v5-2-d21b84ee6f27@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-clk-scaling-v5-2-d21b84ee6f27@redhat.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk-test-introduce-clk_dummy_div-for-a-mock-divider/20260307-074328
base:   fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
patch link:    https://lore.kernel.org/r/20260306-clk-scaling-v5-2-d21b84ee6f27%40redhat.com
patch subject: [PATCH RFC v5 2/4] clk: test: introduce test suite for sibling rate changes on a divider
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260308/202603082228.3RYA8l9q-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603082228.3RYA8l9q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603082228.3RYA8l9q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk_test.c:686:26: error: use of undeclared identifier 'HZ_PER_MHZ'
     686 |         ctx->parent.rate = 24 * HZ_PER_MHZ;
         |                                 ^
   drivers/clk/clk_test.c:709:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     709 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:709:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:710:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     710 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:710:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:711:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     711 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:711:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:735:42: error: use of undeclared identifier 'HZ_PER_MHZ'
     735 |         ret = clk_set_rate(ctx->child1_clk, 6 * HZ_PER_MHZ);
         |                                                 ^
   drivers/clk/clk_test.c:738:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     738 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:738:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:739:59: error: use of undeclared identifier 'HZ_PER_MHZ'
     739 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 6 * HZ_PER_MHZ);
         |                                                                  ^
   drivers/clk/clk_test.c:739:59: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:741:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     741 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:741:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:756:43: error: use of undeclared identifier 'HZ_PER_MHZ'
     756 |         ret = clk_set_rate(ctx->child1_clk, 48 * HZ_PER_MHZ);
         |                                                  ^
   drivers/clk/clk_test.c:759:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     759 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 48 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:759:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   drivers/clk/clk_test.c:760:60: error: use of undeclared identifier 'HZ_PER_MHZ'
     760 |         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 48 * HZ_PER_MHZ);
         |                                                                   ^
   drivers/clk/clk_test.c:760:60: error: use of undeclared identifier 'HZ_PER_MHZ'
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/HZ_PER_MHZ +686 drivers/clk/clk_test.c

   670	
   671	KUNIT_ARRAY_PARAM_DESC(clk_rate_change_sibling_div_div_test_regular_ops,
   672			       clk_rate_change_sibling_div_div_test_regular_ops_params, desc)
   673	
   674	static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
   675	{
   676		const struct clk_rate_change_sibling_div_div_test_param *param = test->param_value;
   677		struct clk_rate_change_sibling_div_div_context *ctx;
   678		int ret;
   679	
   680		ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
   681		if (!ctx)
   682			return -ENOMEM;
   683		test->priv = ctx;
   684	
   685		ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
 > 686		ctx->parent.rate = 24 * HZ_PER_MHZ;
   687		ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
   688		if (ret)
   689			return ret;
   690	
   691		ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw,
   692						     param->ops, CLK_SET_RATE_PARENT);
   693		ctx->child1.div = 1;
   694		ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
   695		if (ret)
   696			return ret;
   697	
   698		ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw,
   699						     param->ops, CLK_SET_RATE_PARENT);
   700		ctx->child2.div = 1;
   701		ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
   702		if (ret)
   703			return ret;
   704	
   705		ctx->parent_clk = clk_hw_get_clk(&ctx->parent.hw, NULL);
   706		ctx->child1_clk = clk_hw_get_clk(&ctx->child1.hw, NULL);
   707		ctx->child2_clk = clk_hw_get_clk(&ctx->child2.hw, NULL);
   708	
   709		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
   710		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
   711		KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
   712	
   713		return 0;
   714	}
   715	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
