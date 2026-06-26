Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD12F8E9F;
	Fri, 26 Jun 2026 20:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782505017; cv=none; b=FQtnDxSv2RIakWAkYcHsGGfJpJuFT7fbZwzIuzKdsam6FsDmCKKUJ5H5ROpCpM+RHUIyJb1SiomeXt1vHYwD1ZTx3bCZ7PX8lS9HP2EGRXP3clCUNsmrNfML9ppoj7hDCfX2ZURl+e47eSje62sy/wwvS0rZ4lMJMb9RKWVV0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782505017; c=relaxed/simple;
	bh=xFbzjjhAt2oPNlciQGA7cPeAxV0EQ3CgspR7a85+914=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNAhPHvi1kyYfMCIfOxtglIEkSg+7OL58NbnHP2iL72enXXX/obwBBHL90RtIa/vEXuDV1JQhVXQB2xQKQX4/0Qkpl1cPlxACe9922GhWAB8FDntWq1cLA4FsdILQENOt++7ssQ+2ZgCgOosv9JiSmGM6t88OQXqrRn4BGZFk3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKo4+AQw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKo4+AQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782505014; x=1814041014;
  h=date:from:to:cc:subject:message-id;
  bh=xFbzjjhAt2oPNlciQGA7cPeAxV0EQ3CgspR7a85+914=;
  b=MKo4+AQwZMk3bmCnpruY3nCva5gbLmfeca769HIpvXHXKFSaRRNZ6+gH
   g6dKFqqgYYCHqAXKU1zLtxC6yWUdCXiHp1gln3sMF4YorjmpLrBrYDHeq
   xoE7Bo5ukMPYdigZfifgWUlGmlFYtuTyTe0YDb3WTxvT7ks69FHfEvxvT
   Q88fNf46GByXZoJDgsITwm4G6guZuKundNfqh06J2F3FdLl9/Gju0HYsA
   mnyI87y5IhA4hImBrjZdGo7oalUZlgh+F7E/IlQw+HD9AUGdjxsIjOuQt
   +xbwD7y/8X0+Po6S4HswVl/8/Cf4hqGkJTprS7wQX1orKIwmOVHRznJSK
   Q==;
X-CSE-ConnectionGUID: t1pC+WXcQMSlPN0n0h30pA==
X-CSE-MsgGUID: vG3Hu5tjQaezNOdRXZyPPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="87145787"
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="87145787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 13:16:54 -0700
X-CSE-ConnectionGUID: rkdWFyn2Rsuab1gvcJn/fQ==
X-CSE-MsgGUID: 1K31jwXeRyaXnLWUYuGT7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,227,1774335600"; 
   d="scan'208";a="256301479"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2026 13:16:52 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdCyo-000000005PT-1DK5;
	Fri, 26 Jun 2026 20:16:50 +0000
Date: Sat, 27 Jun 2026 04:16:26 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <liam@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liam:maple_marks_v7.2 27/31] lib/maple_tree.c:2586:38:
 warning: result of comparison of constant 94416707145727 with expression of
 type 'unsigned long' is always false
Message-ID: <202606270428.Q97lALXU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/liam/linux.git maple_marks_v7.2
head:   be119ad50e9c87a4a975871d84614f7c6aeaf0de
commit: 6660fa9424f74b0ad010d43c448244824351754d [27/31] maple_tree: Remove requirement for NULLs to never be at end of a node
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260627/202606270428.Q97lALXU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606270428.Q97lALXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606270428.Q97lALXU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/maple_tree.c:2586:38: warning: result of comparison of constant 94416707145727 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    2586 |         if (unlikely(total == 29 && cp->max == 0x55df1a4a4fffUL))
         |                                     ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   lib/maple_tree.c:2596:39: warning: result of comparison of constant 94416707145727 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    2596 |                 if (unlikely(total == 29 && cp->max == 0x55df1a4a4fffUL))
         |                                             ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   lib/maple_tree.c:2624:38: warning: result of comparison of constant 94416707145727 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    2624 |         if (unlikely(total == 29 && cp->max == 0x55df1a4a4fffUL))
         |                                     ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   lib/maple_tree.c:2764:41: warning: result of comparison of constant 94416707145727 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    2764 |         if (unlikely(cp->data == 29 && cp->max == 0x55df1a4a4fffUL))
         |                                        ~~~~~~~ ^  ~~~~~~~~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   4 warnings generated.


vim +2586 lib/maple_tree.c

  2556	
  2557	/*
  2558	 * dst_setup() - Set up one or more destinations for the new data.
  2559	 * @cp: The maple copy node
  2560	 * @mas: The maple state
  2561	 * @mt: The source node type
  2562	 */
  2563	static inline
  2564	void dst_setup(struct maple_copy *cp, struct ma_state *mas, enum maple_type mt)
  2565	{
  2566		int capacity = mt_slots[mt];
  2567		int total;
  2568		int min_count;
  2569		int left_count;
  2570		int left_low;
  2571		int left_high;
  2572		int shift;
  2573	
  2574		/* Data is 1 indexed, every src has +1 added.  */
  2575	
  2576		if (cp->data <= capacity) {
  2577			cp->split = cp->data - 1;
  2578			cp->d_count = 1;
  2579			goto node_setup;
  2580		}
  2581	
  2582		total = cp->data;
  2583		if (total > capacity * 2)
  2584			goto split_3way;
  2585	
> 2586		if (unlikely(total == 29 && cp->max == 0x55df1a4a4fffUL))
  2587			pr_err("dst_setup pre mas=%lx-%lx data=%d write_off=%u\n",
  2588			       mas->index, mas->last, total, cp->write_off);
  2589	
  2590		cp->split = (total - 1) / 2;
  2591		cp->d_count = 2;
  2592		if (!ma_is_leaf(mt))
  2593			goto node_setup;
  2594	
  2595		if (cp->write_off < cp->split || cp->write_off > cp->split + 1) {
  2596			if (unlikely(total == 29 && cp->max == 0x55df1a4a4fffUL))
  2597				pr_err("dst_setup fast split=%u\n", cp->split);
  2598			goto node_setup;
  2599		}
  2600	
  2601		min_count = mt_min_slots[mt] + 1;
  2602		left_count = cp->split + 1;
  2603	
  2604		left_low = min_count;
  2605		if (total - capacity > left_low)
  2606			left_low = total - capacity;
  2607	
  2608		left_high = capacity;
  2609		if (total - min_count < left_high)
  2610			left_high = total - min_count;
  2611	
  2612		if (left_count < left_low)
  2613			left_count = left_low;
  2614		else if (left_count > left_high)
  2615			left_count = left_high;
  2616	
  2617		shift = left_count - left_low;
  2618		if (shift > 2)
  2619			shift = 2;
  2620	
  2621		if (shift > 0)
  2622			left_count -= shift;
  2623	
  2624		if (unlikely(total == 29 && cp->max == 0x55df1a4a4fffUL))
  2625			pr_err("dst_setup edge split=%d left_low=%d left_high=%d shift=%d\n",
  2626			       left_count - 1, left_low, left_high, shift);
  2627	
  2628		if ((left_count < min_count) || (left_count > capacity) ||
  2629		    (total - left_count < min_count) || (total - left_count > capacity))
  2630			goto split_3way;
  2631	
  2632		cp->split = left_count - 1;
  2633	
  2634		goto node_setup;
  2635	
  2636	split_3way:
  2637		/* No other choice but to 3-way split the data */
  2638		cp->split = (cp->data + 2) / 3;
  2639		cp->d_count = 3;
  2640	
  2641	node_setup:
  2642		for (int i = 0; i < cp->d_count; i++) {
  2643			cp->dst[i].mt = mt;
  2644			cp->dst[i].node = ma_mnode_ptr(mas_pop_node(mas));
  2645		}
  2646	}
  2647	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
