Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3F12D1F1;
	Mon, 25 May 2026 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779688901; cv=none; b=hnoIbwXUeJSTZsxqF9VHebDnAoX8FjFVTdPT1Plna1H7r3fPubXXmpg9my3++wHf58cIScj81ReH3yxKNmXoOk+Pch4nmVNiM4+CPfui3ZU6dxcRPi9RQXts24oU0Ii34w6Beuzs3PNtwRouuiyvu6zOpH6ywbZKCS9rWTmNFoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779688901; c=relaxed/simple;
	bh=ueAXdLC12PO2nrwyw4PMTBuqk2pYYa8FYswBqjQJg4Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u10gYQXwBSM2eEPFQHDC7nhTbkZSz5uZMi+6Ja/uS9mD/Sn6XCRBHpFmEX1bNEh6FWtbXkG32tCy2NpcPthasd8XWx5o3Ilc8uixhQdD5FJCzYLIMItGTYWs0tqQs5BpdL59BcDs5RnC9uXmNksfP53mx2XeN2WEA7Yn2dyVSW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNumBlws; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNumBlws"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779688900; x=1811224900;
  h=date:from:to:cc:subject:message-id;
  bh=ueAXdLC12PO2nrwyw4PMTBuqk2pYYa8FYswBqjQJg4Y=;
  b=UNumBlwsMCsgsJKrQJ3gbDzM1gHY/oicc46x+ZirQha8cX6pJeeOSTp5
   0HWHykhaf0tpbtLRP6GZuc3TxlkFCXqtTvdFEmX05WVQ2V41LCmQ2kQFH
   zly2p9HC1+b0+WeHGrNsZQLST3q+IMEV58dRP9DmVjZd285ObmbzIhODv
   fIJjZqnc8UnpMykMpWvAcld5KnrQLSFcixAtDIh0GzeXwpoxGlGdQ3T6P
   dzDgrHuKwNJDgsal4urPUBgws8291Lgq21lzqz6HP7mPzYQ3MEIwFIUOp
   5nXiuXIFANCj7josVLeiydqJW4Bdbd0/2xnUlvHn6mBBlw/N6ABlawGgU
   Q==;
X-CSE-ConnectionGUID: RPbmbnckQzyKX8peXprf2g==
X-CSE-MsgGUID: D67KYnutTdOkeruDNIFH6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="97933568"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="97933568"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 23:01:40 -0700
X-CSE-ConnectionGUID: kRa8AsHCTCqfjsPNvgTBDA==
X-CSE-MsgGUID: kNTXZOvcThmUcpnXFKST7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="243340269"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 May 2026 23:01:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRONb-0000000018u-2B1t;
	Mon, 25 May 2026 06:01:35 +0000
Date: Mon, 25 May 2026 14:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/ptp/timekeeping 25/25]
 drivers/ptp/ptp_ocp.c:1495:8: error: no member named 'post_ts' in 'struct
 ptp_system_timestamp'; did you mean 'post_sts'?
Message-ID: <202605251318.5r5jrjsx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/ptp/timekeeping
head:   d9d5595e7f34acb2b685e7a24823be9e8ee2f771
commit: b6cd536db6489b8027324ebbf6a5c8377bda36ed [25/25] ptp: Switch to ktime_get_snapshot_id() for pre/post timestamps
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260525/202605251318.5r5jrjsx-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251318.5r5jrjsx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251318.5r5jrjsx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_ocp.c:1495:8: error: no member named 'post_ts' in 'struct ptp_system_timestamp'; did you mean 'post_sts'?
                   sts->post_ts.sys -= bp->ts_window_adjust;
                        ^~~~~~~
                        post_sts
   include/linux/ptp_clock_kernel.h:55:30: note: 'post_sts' declared here
           struct system_time_snapshot post_sts;
                                       ^
   1 error generated.


vim +1495 drivers/ptp/ptp_ocp.c

  1474	
  1475	static int
  1476	__ptp_ocp_gettime_locked(struct ptp_ocp *bp, struct timespec64 *ts,
  1477				 struct ptp_system_timestamp *sts)
  1478	{
  1479		u32 ctrl, time_sec, time_ns;
  1480		int i;
  1481	
  1482		ptp_read_system_prets(sts);
  1483	
  1484		ctrl = OCP_CTRL_READ_TIME_REQ | OCP_CTRL_ENABLE;
  1485		iowrite32(ctrl, &bp->reg->ctrl);
  1486	
  1487		for (i = 0; i < 100; i++) {
  1488			ctrl = ioread32(&bp->reg->ctrl);
  1489			if (ctrl & OCP_CTRL_READ_TIME_DONE)
  1490				break;
  1491		}
  1492		ptp_read_system_postts(sts);
  1493	
  1494		if (sts && bp->ts_window_adjust)
> 1495			sts->post_ts.sys -= bp->ts_window_adjust;
  1496	
  1497		time_ns = ioread32(&bp->reg->time_ns);
  1498		time_sec = ioread32(&bp->reg->time_sec);
  1499	
  1500		ts->tv_sec = time_sec;
  1501		ts->tv_nsec = time_ns;
  1502	
  1503		return ctrl & OCP_CTRL_READ_TIME_DONE ? 0 : -ETIMEDOUT;
  1504	}
  1505	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
