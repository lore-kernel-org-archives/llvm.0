Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793316507;
	b=tUguFhE1EcDBcD+mtw0T7vQZWx3aKH1cf/4+lG/WH2mBR/whvu1+/cHODe84M/8MG2lV
	 G8I8EMi44Q01gyhMcK8VGUzwl3U5yLGC5QMvQvJHPFc/xIxTxDZJJpyOjlNizErnb6s0D
	 /W83KG9WZyciJsCBUBhGuh/coIKn2km75A6BQGUAwYwIuyA469NleoO6MC1K0+hbpKKGh
	 RwxppL4nSocNsjH1jvCRIPX5t7FsgNvp/ngcaILJfo2XhEhvQd47wrWRZo/SS3UoIWebm
	 cqdgNwzlDpv1BEbkIalpb8NbpcXodb3Il2Sh/LxxhFHefEn9dLI6lIAIaP0wauKTX1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Gpn7SZjgFeXUYSeU/S/f3bTQwWe945+YKT9VTSfqIvw=;
	b=PtMkazVgNRr9/xkO9MwciSuq9AT1opgbJbqRdo5gtTBaXEqIemsUgTUtW1NCzrRFI3ID
	 5hmnLBOh72naZZczYgUhwE7L/vKiUF1vzLFLM9xyNO+oDc5ywBtthbxmbCAF5JGIteKk7
	 i6T91N9RL8zJ2DIW2RGTQtwwNc8tiMh43tUS99ziCiw1cULQWwCJOyUuOaxcZDuoRWTE7
	 Q7BjhbRmKAKfJgPUebfCRxMuVTHAAFqzwLVIIxy1X4p4TmHNSZYjWKRhMi8ygsRipzxdH
	 bX5ViwIpEAOP6uKTby7t39YvC0ByXcifa1PZ4KN7JHeyLlh9eLkbnKsHEYjJAydGhgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGdV7rtY;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2B8606A326;
	Thu, 29 Oct 2026 23:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B2B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EGdV7rtY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793316507; x=1824852507;
  h=date:from:to:cc:subject:message-id;
  bh=H/6GkqWngU0tBjeCwttQpQ0xwAw18cAjpMIs4G6mTNk=;
  b=EGdV7rtYgVzHEZDb+jVT7fcDdgRaMKJmp1tXyLMqIHovDEow0DfcRQEy
   JBR3HmMwGE0KL0Hlzst9aBpHfmCuRyZmzLzld+of//5tTDkhFO22EtZZA
   pF0ZSQ7c/yYaj973WPgLDlzMKA9v0hkqYuEPl1OWBmbyhpBe2uiaZddPU
   XpqfC/TPZ6rZ76SxHnu3/nvOaJZvIvtwuS2u89N8GgYC/ahyf8kb5RrhC
   FZIv8+82QDkJ4nstBXF7fcGu503rBj31Hw1TSIepUDzGHow1k+dDEXpq7
   E6Mbq6cUVisTY9hWkYCpjQYrjw2Ydd7abyDyLL2x975EbhocDt9GNuG84
   g==;
X-CSE-ConnectionGUID: L8Oc1uEMQZSN0d3KyXx61g==
X-CSE-MsgGUID: PVyFciapTPeTmzlVe+tZbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2079047"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2079047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 16:28:26 -0700
X-CSE-ConnectionGUID: 29qHAZeqT+a9syeOZ3inDw==
X-CSE-MsgGUID: ifLbYDmRSZuyc2IH6uSUvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5636487"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Oct 2026 16:28:25 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMZXi-000000005OZ-3cv7;
	Thu, 29 Oct 2026 23:28:22 +0000
Date: Fri, 30 Oct 2026 00:28:00 +0100
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:100GbE_E825_timecounter 14/15]
 drivers/net/ethernet/intel/ice/ice_ptp.c:2366:25: error: use of undeclared
 identifier 'cached_time'
Message-ID: <202610300044.0bHmTu2J-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/net-queue.git 100GbE_E825_timecounter
head:   3f3ca43bb77f800814e88fc923238ad0a122d79f
commit: a1bbd79fcdadf25fd90973f46fe35f9461d04a8c [14/15] ice: store cached PHC time in ice_adapter
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261030/202610300044.0bHmTu2J-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300044.0bHmTu2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300044.0bHmTu2J-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ice/ice_ptp.c:2366:25: error: use of undeclared identifier 'cached_time'
    2366 |         ice_trace(rx_hwtstamp, cached_time, ts_high, ts_ns);
         |                                ^~~~~~~~~~~
   1 error generated.


vim +/cached_time +2366 drivers/net/ethernet/intel/ice/ice_ptp.c

77a781155a6590 Jacob Keller     2021-06-09  2340  
77a781155a6590 Jacob Keller     2021-06-09  2341  /**
3310aad20defb9 Larysa Zaremba   2023-12-05  2342   * ice_ptp_get_rx_hwts - Get packet Rx timestamp in ns
77a781155a6590 Jacob Keller     2021-06-09  2343   * @rx_desc: Receive descriptor
9031d5f491b957 Larysa Zaremba   2023-12-05  2344   * @pkt_ctx: Packet context to get the cached time
77a781155a6590 Jacob Keller     2021-06-09  2345   *
77a781155a6590 Jacob Keller     2021-06-09  2346   * The driver receives a notification in the receive descriptor with timestamp.
77a781155a6590 Jacob Keller     2021-06-09  2347   */
3310aad20defb9 Larysa Zaremba   2023-12-05  2348  u64 ice_ptp_get_rx_hwts(const union ice_32b_rx_flex_desc *rx_desc,
9031d5f491b957 Larysa Zaremba   2023-12-05  2349  			const struct ice_pkt_ctx *pkt_ctx)
77a781155a6590 Jacob Keller     2021-06-09  2350  {
77a781155a6590 Jacob Keller     2021-06-09  2351  	u32 ts_high;
a1bbd79fcdadf2 Jacob Keller     2026-10-21  2352  	u64 ts_ns;
77a781155a6590 Jacob Keller     2021-06-09  2353  
b1a582e64bf222 Jacob Keller     2022-07-27  2354  	if (!(rx_desc->wb.time_stamp_low & ICE_PTP_TS_VALID))
3310aad20defb9 Larysa Zaremba   2023-12-05  2355  		return 0;
b1a582e64bf222 Jacob Keller     2022-07-27  2356  
b1a582e64bf222 Jacob Keller     2022-07-27  2357  	/* Use ice_ptp_extend_32b_ts directly, using the ring-specific cached
b1a582e64bf222 Jacob Keller     2022-07-27  2358  	 * PHC value, rather than accessing the PF. This also allows us to
b1a582e64bf222 Jacob Keller     2022-07-27  2359  	 * simply pass the upper 32bits of nanoseconds directly. Calling
b1a582e64bf222 Jacob Keller     2022-07-27  2360  	 * ice_ptp_extend_40b_ts is unnecessary as it would just discard these
b1a582e64bf222 Jacob Keller     2022-07-27  2361  	 * bits itself.
77a781155a6590 Jacob Keller     2021-06-09  2362  	 */
77a781155a6590 Jacob Keller     2021-06-09  2363  	ts_high = le32_to_cpu(rx_desc->wb.flex_ts.ts_high);
a1bbd79fcdadf2 Jacob Keller     2026-10-21  2364  	ts_ns = ice_ptp_extend_32b_ts(pkt_ctx->phc, ts_high);
77a781155a6590 Jacob Keller     2021-06-09  2365  
5443362bae71a7 Przemyslaw Korba 2026-05-11 @2366  	ice_trace(rx_hwtstamp, cached_time, ts_high, ts_ns);
5443362bae71a7 Przemyslaw Korba 2026-05-11  2367  
3310aad20defb9 Larysa Zaremba   2023-12-05  2368  	return ts_ns;
77a781155a6590 Jacob Keller     2021-06-09  2369  }
77a781155a6590 Jacob Keller     2021-06-09  2370  

:::::: The code at line 2366 was first introduced by commit
:::::: 5443362bae71a77a7bf37467cef3be608ce32783 ice: add rx timestamp tracepoint for debugging

:::::: TO: Przemyslaw Korba <przemyslaw.korba@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
