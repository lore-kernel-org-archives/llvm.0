Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1BB390233;
	Tue,  5 May 2026 11:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777981073; cv=none; b=iDunQF5UhWOTsHmviwIHAuGckwqDESUnQSMvq4awD1PAeBvQJveuvxImza11P3bd5tgyyEmefoHvphJP4lnaIVU0OZ5DABUKePHIYz6hK5vYeY2nBNnNPlXmB0aRDNHj2axxPxcLY4HdS8td4CF1tIcJkJjy+StufkLfWvCcdUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777981073; c=relaxed/simple;
	bh=2Mjv+BICWQwv29Q5kMRWqd29IhT5UFcBjsGRvUZ+13w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Onyu9QwynyQnepXDtYlNL9+ugYDmKURbQWxSNo8hlZ4DLLZvLYpL5VUkcgCKK6OwbccTYe1gGU2jW5sYXLLVHd1wsy4Gub1AR/R52wmL7IKAQZNXRIieXYRDtZ6E9Q9HRPxSnNPtSpyUtGP7KK1T/KDqqCqriceDDJ0TLcv4xac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R99aMOs4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R99aMOs4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777981072; x=1809517072;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2Mjv+BICWQwv29Q5kMRWqd29IhT5UFcBjsGRvUZ+13w=;
  b=R99aMOs4a/aqiiwmBScrid2qqirJYSGWM3MCVaeDRiDI1hDl2aAR6Ktf
   vLsHdDJ3Bnh4851OTIC0advBFNzMeWY3rBxYFuuR7eUDLpmYLAK6s0XyD
   R2fS0gW9yVOAUdIhilBbG5TwAV2+TYxA4Y6rO0RMalmYwdGaoLEj6rtIm
   Tyjf1lx1xjvhBFILHMTCIEiKPXfUXETklDAMNtTQ1yH+OdY8+1941yegZ
   ovZ5F28+StdJ4sIZ5zlqHvj32RabWmYO4i41O/dxKboUwQUdivYeg2wk0
   FYOnIUhFnQ4EA1l/xzM04kaeUBLN1SLFuNxrxWyw13bl3qnI3vSV6O030
   g==;
X-CSE-ConnectionGUID: 56R+66k/RHaQv5vDLRx4tg==
X-CSE-MsgGUID: XlaJM1FrSyKqYWMIRQTO1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82716259"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="82716259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 04:37:50 -0700
X-CSE-ConnectionGUID: 7lWnwyA4QWu3/akHlapfGg==
X-CSE-MsgGUID: DNhmX/gsTYOcNR8Heeacpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="234921066"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 May 2026 04:37:48 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKE5x-0000000006p-3ZCY;
	Tue, 05 May 2026 11:37:45 +0000
Date: Tue, 05 May 2026 19:36:53 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/glink 46/71]
 arch/hexagon/kernel/process.c:72:2: error: call to undeclared function
 'flush_smp_call_function_queue'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202605051923.IzqCBvfX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bca=
in/glink
head:   f5a983a09d006ee1c9fe4c66beca5f1f927caa04
commit: 0d2f3aa6da801431e0498989f03e5c498c538b82 [46/71] hexagon: flush SMP=
 call-function queue before entering idle
config: hexagon-randconfig-001-20260505 (https://download.01.org/0day-ci/ar=
chive/20260505/202605051923.IzqCBvfX-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260505/202605051923.IzqCBvfX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605051923.IzqCBvfX-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/kernel/process.c:72:2: error: call to undeclared function '=
flush_smp_call_function_queue'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
      72 |         flush_smp_call_function_queue();
         |         ^
   1 error generated.


vim +/flush_smp_call_function_queue +72 arch/hexagon/kernel/process.c

    51=09
    52	/*
    53	 * Flush pending SMP call-function work before entering __vmwait().
    54	 *
    55	 * On platforms with high IPI delivery latency (e.g. Hexagon hardware
    56	 * threads behind a hypervisor under QEMU TCG emulation), the interr=
upt
    57	 * from __vmintop_post() can take an extremely long time to wake the
    58	 * target thread from __vmwait().  During this time, call_single_dat=
a_t
    59	 * objects sit locked on the call_single_queue.  Since v5.7 (commit
    60	 * 5a18ceca6350), smp_call_function_single_async() returns -EBUSY wh=
en
    61	 * it finds a locked CSD instead of spinning, and callers like the
    62	 * scheduler's NOHZ kick and hrtimer migration silently drop the wor=
k.
    63	 *
    64	 * By draining the queue here =E2=80=94 with IRQs disabled but befor=
e the RCU
    65	 * idle context (ct_cpuidle_enter) =E2=80=94 we unlock CSDs while th=
e CPU is
    66	 * still responsive.  This shrinks the -EBUSY window to just the
    67	 * __vmwait() duration and prevents the cascading stalls that otherw=
ise
    68	 * hang SMP boot on v5.7+ kernels.
    69	 */
    70	void arch_cpu_idle_enter(void)
    71	{
  > 72		flush_smp_call_function_queue();
    73	}
    74=09

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
