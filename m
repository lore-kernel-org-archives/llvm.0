Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20910256C61;
	Tue, 14 Apr 2026 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179526; cv=none; b=JI1XElPzImwVSAl106u0S1ErjDtVOl6B0FKH9RzbJhHg0eZZ05bmlWnpvhSs2hFu/I/USAtYQ84T/VexMuz+3DStb4+Zw34AZkz6Bk1JCCef78dNPScBuZjepwgw3Y2OMshq8kN3s0CB/hig2B/FieHho3Bc9s788YBM59wLALo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179526; c=relaxed/simple;
	bh=HZzDhjQOIRRjhFJQowpZG1/lo5T0xXGw2TwFK160utE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n7sLYNapE4vC973uNovS2Xk7EvQGnZrTsIhezxNFBeGYrGihGw7nAHiQi7tgnF+LbglmmnM5xtB5qCcYAFd4d7Ur8XIMEaR/FebGRfykG5ImcfMnKcD/vMSiL27u4rzR+134Jo3B20QRtP1wsqywpgxFMT6AeXZSrHCNxTlws+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqiJ//hr; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqiJ//hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776179524; x=1807715524;
  h=date:from:to:cc:subject:message-id;
  bh=HZzDhjQOIRRjhFJQowpZG1/lo5T0xXGw2TwFK160utE=;
  b=bqiJ//hrLQ1EMp89SU2+8Q/gMM+UXMVrkXXpi49Pst4vTCNjV+oihFBL
   osJ1M2vooe2j7HR07VMkTg97hzuRBpWNe41OhfPiYosS7n7DVoT7JNDDc
   Q+YqTdT2SqI1PpiOCTcRqXciBF8JJk5zmpdf2dksGHZKyZhrEptAGduJ5
   XU4m7R3M2VvfUJV5bUa4i3bmF3+tDti+Bg7bJgwl/kCVZfpRX5nar4piw
   OBWbUzh7pvnxQVmkohWumIsAZCdYOfRLiw8PxcqUy0cc58RJnA/ILJVwm
   CrP/LN2fdlwc0NDMT+kLXX6uAc+XG9iGhqnEY/s9e6KdxIMTj2SoTzV+z
   w==;
X-CSE-ConnectionGUID: v3tnYhcXQ92PYk1Wf0zhaw==
X-CSE-MsgGUID: Fo6uHa25T568aDhZ1eyCPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="79725491"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="79725491"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:12:03 -0700
X-CSE-ConnectionGUID: WhA7jp1oRy2OznmcZxbmLQ==
X-CSE-MsgGUID: 3Kmz1+niQ1iNS0Hu8q/kwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="225407222"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2026 08:12:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCfQm-000000000Qn-2XDv;
	Tue, 14 Apr 2026 15:12:00 +0000
Date: Tue, 14 Apr 2026 17:11:30 +0200
From: kernel test robot <lkp@intel.com>
To: Qiliang Yuan <realwujing@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: kernel/time/tick-sched.c:1292:6: error: use of undeclared
 identifier 'tick_nohz_full_running'
Message-ID: <202604141742.3OvA8YUH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Qiliang-Yuan/sched-isolation-Separate-housekeeping-types-in-enum-hk_type/20260414-163427
head:   94092df65446492ae8451145df6310099cf5a855
commit: 6ecf79d1870657fc1272b088edd46948a19eb69a tick/nohz: Transition to dynamic full dynticks state management
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604141742.3OvA8YUH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141742.3OvA8YUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141742.3OvA8YUH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1292:6: error: use of undeclared identifier 'tick_nohz_full_running'
    1292 |         if (tick_nohz_full_running) {
         |             ^
   1 error generated.


vim +/tick_nohz_full_running +1292 kernel/time/tick-sched.c

  1278	
  1279	static bool can_stop_idle_tick(int cpu, struct tick_sched *ts)
  1280	{
  1281		WARN_ON_ONCE(cpu_is_offline(cpu));
  1282	
  1283		if (unlikely(!tick_sched_flag_test(ts, TS_FLAG_NOHZ)))
  1284			return false;
  1285	
  1286		if (need_resched())
  1287			return false;
  1288	
  1289		if (unlikely(report_idle_softirq()))
  1290			return false;
  1291	
> 1292		if (tick_nohz_full_running) {
  1293			int tick_cpu = READ_ONCE(tick_do_timer_cpu);
  1294	
  1295			/*
  1296			 * Keep the tick alive to guarantee timekeeping progression
  1297			 * if there are full dynticks CPUs around
  1298			 */
  1299			if (tick_cpu == cpu)
  1300				return false;
  1301	
  1302			/* Should not happen for nohz-full */
  1303			if (WARN_ON_ONCE(tick_cpu == TICK_DO_TIMER_NONE))
  1304				return false;
  1305		}
  1306	
  1307		return true;
  1308	}
  1309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
