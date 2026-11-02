Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656081;
	b=c8xxmendMei1RPChXLem699TSFCxYaYppv17X38QZV1DJyl8jr5AifctKFUfmNtFFrIG
	 6/b+zDfMHS/gK1lQwlGmSR17ZJHhRECGdz3On3lGKrwi4tdtyAKZyO8zn2T4vvRjYdwBh
	 5RGRnTTjm3tQFjhggfaLhsiOMdxwpBAHXSCSq9DpJT1kXRW7tyQujFhGPS27owetyDhTk
	 2P0/1oMFkJgj7nxgp5zHdo+r35632cFIRflv0XdVE59hey934rmJMXCCnOELBGl+twEW1
	 Y+itKRcZ5eLPBEue8RijndkWN4o2GwEec9OwEtuCQ2GaxI3AW4+/UiZmecjXmnFYH2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656081;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Ecjrezbkx2gTMoUuT1bcQl4GYo4kQcGWUul21B9Xg94=;
	b=mvrLdmRYt4ld1VbhXaqKB1gFpCtP9lg+Nw87cl3QZE0oALEu065k644bNdZpn+po7lW0
	 +vFPC3+DfJR2t1GOPW6VMCKNAiq29CetLt+Ld9Abnl7ntLHsNGDPHr0X3pAfSdcjkBEUa
	 s9hzJk5WvYObPsRvyoq5RnYHO5jbD0eeYL/x0sgl3dzEgJEDV7dnrbTjgXizA1R9FoTEQ
	 o8d0SCwutEjHoUg7T5wrPIxZ3hjsSZItWfJJA411U/qTydhnZaGsC88UIm4K3S1E9uba3
	 jWk4DcS6DsiTof1qurFFkCELjLkf/+zp7ddvYIMyGntb1tL1vC0LjNEQj+XXfjOIp4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cybIE21L;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D78E606A334;
	Mon,  2 Nov 2026 21:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D78E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cybIE21L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793656079; x=1825192079;
  h=date:from:to:cc:subject:message-id;
  bh=o8NtNmpEkzUgx72kGOTosC4boGIc4J4wMruvggU2jHY=;
  b=cybIE21LdQBoaZVmPx1wwhzgVRT546sOo+7FcGaB0H1Gf7D8UEz67Ps1
   u57tS5APOyLBnDSwemZD1fhRE55V31tBQtEHNLB0eC2bi3rp9xjbXe+Hi
   XXjLyce1MQMidgk4uKdlVPErr9O2nUPYKOrW7PdgaIYHHB9lUAh/hr06N
   2cEBD4H4WoEQEEHccPhZGcBmPMCWwOJVcq/dqk1k8MaBaqd4XhKO73qYe
   +4kO5TzrulzfvahxV3FWol2qYucLswcupcfuSmH1hoN2CVl2oiShqq1Kb
   /09bThlPV9dWgS7eGTjPw6+gY4i/qpyhLJ6zMtcYHGXGD7Z3MwJbL3gIy
   g==;
X-CSE-ConnectionGUID: Nf9s5mJjR5udFcaZEF6eTQ==
X-CSE-MsgGUID: xpqQ09gESkWlC3h3VB90+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2373260"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2373260"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 13:47:59 -0800
X-CSE-ConnectionGUID: 7NTgG3MxQHaDQ6dQRrpCXw==
X-CSE-MsgGUID: 8lenz+oOTfG6SnlMdGGZIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="8069523"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 02 Nov 2026 13:47:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNzsg-00000000htR-15Pe;
	Mon, 02 Nov 2026 21:47:54 +0000
Date: Tue, 03 Nov 2026 05:47:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [tnguy-net-queue:100GbE_E825_timecounter 14/15]
 drivers/net/ethernet/intel/ice/ice_ptp.c:2366:25: error: use of undeclared
 identifier 'cached_time'
Message-ID: <202611030534.V72bnxj4-lkp@intel.com>
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
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261103/202611030534.V72bnxj4-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 65303e81f481bbfe386b8596423f94c43198ba94)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030534.V72bnxj4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030534.V72bnxj4-lkp@intel.com/

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
