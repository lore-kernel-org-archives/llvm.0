Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347863ED5A7;
	Fri,  6 Mar 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772816919; cv=none; b=XxdNXzSZUn+e3tYuPGoOiN1rFNgtLRCmGq6Jry4e9k2AzXrLxwM7wfObpdiTy1qU42oZmQLAmMy4O4lleXULagDdf0cWu2ctWNA3PfKX63e8aCiNEO1mwy94aZQasc2eLlJTM8PLlQVpfqUbnTZAov+Z61A5eyFKtQLbMfVyCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772816919; c=relaxed/simple;
	bh=d2JhdR+/PuwZOGIwsOOUh7FvEBfk6yer+2p3DeF77P0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qvo5sK2FUm9fCdCJAvpQu6vuQowFPJcUHfiRXXkEXtOs0dmUKeBJnt1Opq8pCNUYPHpU3ZM4/VKFgFG7bu9FosBM63fD2aTaI+K29KmuyXYX2EmoFSwnno6M1YPim6VhvWx95o54SXz7+nW4BFRW89iL9eLTDTM9e5M53cEB3m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VIg6uK5K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VIg6uK5K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772816918; x=1804352918;
  h=date:from:to:cc:subject:message-id;
  bh=d2JhdR+/PuwZOGIwsOOUh7FvEBfk6yer+2p3DeF77P0=;
  b=VIg6uK5KI+Zm0+0EXCOeBSNY7Lug0dQSHFESn2NQqxcR/ncCx+oppzXV
   +Uj0pd43RN2MLZ9fjARWupto0Z50Kj8FAY5uwIeYTUqX23ErDMqkLKB3J
   HqkEoMw62p9CuGXxN3wztX5GUv69LTCuv1AoUc6dUHPR+rl/80Fd/iJ35
   LC0zBN/8eaOdqUNNLMarFX+vvWUUyQjhmbgz5nMVy2Bg+EUhx3NxjZl1S
   iah4q+MUffAF4EM+DU8XMBOHqsXLVOArLtC+/v0tfDvq3ZDCZHzUJE8wh
   0PsoV5qzv0YH06Ts0+6NJ7BId44gRBRIavXGZ6HBzgKNxwONU4I6rZ4Qv
   w==;
X-CSE-ConnectionGUID: rlTeIvqlQ9uWdUWLiSZfMw==
X-CSE-MsgGUID: a1fTrCC3QYS8hfGJmEkLMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="91316926"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="91316926"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 09:08:25 -0800
X-CSE-ConnectionGUID: yhizVZWgS/SiF1lrNEqOJw==
X-CSE-MsgGUID: k8L4PQt1SXKlRYZNgwMp5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="217263701"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2026 09:08:23 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyYey-0000000017Z-1SQs;
	Fri, 06 Mar 2026 17:08:20 +0000
Date: Sat, 07 Mar 2026 01:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Masney <bmasney@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [masneyb:b4/clk-scaling 7/7] drivers/clk/clk_test.c:204:10:
 error: passing 'const char *const[3]' to parameter of type 'void *' discards
 qualifiers
Message-ID: <202603070151.dRSgtYxi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/masneyb/linux b4/clk-scaling
head:   35ae2ca226ff0b0f5ca4e9f3ce658d1ba7874e91
commit: 35ae2ca226ff0b0f5ca4e9f3ce658d1ba7874e91 [7/7] clk: test: add kunit test for coordinated rate change
config: um-randconfig-001-20260306 (https://download.01.org/0day-ci/archive/20260307/202603070151.dRSgtYxi-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070151.dRSgtYxi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070151.dRSgtYxi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/clk/clk_test.c:202:10: warning: cast from 'bool (*)(struct clk_hw *, const char **)' (aka '_Bool (*)(struct clk_hw *, const char **)') to 'bool (*)(struct clk_hw *, void *)' (aka '_Bool (*)(struct clk_hw *, void *)') converts to incompatible function type [-Wcast-function-type-strict]
     202 |                                             (bool (*)(struct clk_hw *, void *))
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     203 |                                                 clk_hw_sibling_name_filter,
         |                                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/clk/clk_test.c:204:10: error: passing 'const char *const[3]' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     204 |                                             critical_clk_names,
         |                                             ^~~~~~~~~~~~~~~~~~
   include/linux/clk-provider.h:1481:13: note: passing argument to parameter 'filter_data' here
    1481 |                                   void *filter_data,
         |                                         ^
   1 warning and 1 error generated.


vim +204 drivers/clk/clk_test.c

   184	
   185	/*
   186	 * Coordinating divider determine_rate that preserves sibling rates.
   187	 * Uses the generic helpers to collect sibling rates and add coordinated
   188	 * rate changes for the parent and all filtered siblings.
   189	 */
   190	static int clk_dummy_div_coordinating_determine_rate(struct clk_hw *hw,
   191							     struct clk_rate_request *req)
   192	{
   193		static const char * const critical_clk_names[] = { "child1", "child2", NULL };
   194		struct clk_sibling_rate_info critical_clks[ARRAY_SIZE(critical_clk_names) - 1];
   195		struct clk_hw *parent_hw = clk_hw_get_parent(hw);
   196		unsigned int num_critical_clks = 0;
   197		unsigned long lcm_rate = 0;
   198		unsigned int i;
   199		int ret;
   200	
   201		ret = clk_hw_collect_sibling_rates(parent_hw, hw, req->rate,
 > 202						    (bool (*)(struct clk_hw *, void *))
   203							clk_hw_sibling_name_filter,
 > 204						    critical_clk_names,
   205						    critical_clks, ARRAY_SIZE(critical_clks),
   206						    &num_critical_clks);
   207		if (ret)
   208			return ret;
   209	
   210		for (i = 0; i < num_critical_clks; i++) {
   211			if (critical_clks[i].target_rate == 0)
   212				continue;
   213			if (lcm_rate == 0)
   214				lcm_rate = critical_clks[i].target_rate;
   215			else
   216				lcm_rate = lcm(lcm_rate, critical_clks[i].target_rate);
   217		}
   218	
   219		ret = clk_hw_add_coordinated_rate_changes(req, parent_hw,
   220							   clk_hw_get_rate(parent_hw),
   221							   lcm_rate, critical_clks,
   222							   num_critical_clks);
   223		if (ret)
   224			return ret;
   225	
   226		req->best_parent_rate = lcm_rate;
   227		req->best_parent_hw = parent_hw;
   228		req->rate = req->rate;
   229	
   230		return 0;
   231	}
   232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
