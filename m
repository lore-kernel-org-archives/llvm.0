Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 967D53559E1;
	Mon, 10 Aug 2026 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786347109; cv=none; b=pbqvblF459SMxo06PAfUMW7ZGkaDhtdhduTvf5eecZR8PTwMYkQdkAVSU9lDfIP5TA1QBvh8STZtVr24OC0TRkP03pLRV8bOVGChxm3gI81nNpNIAHkmvhhznuHYrM+S08QA0BlgA4o1j067zNXVU+Ui9eM/+z4aVdgW5QTPq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786347109; c=relaxed/simple;
	bh=bA5HYwlwrA249QSJW7AlWImVd0QwbzJDsh0Yseb8mIk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uPsGcjJMvfcoFUcEtyWNwYn7PZWpFwamsK+spw9pedj+xbqziXfeTY2wWL6BY5axMcEGND2ujBGSewXM9GT5T6DEZdbQ/Y/SAZAlQDqQPMdK3lCSdExKvshWisM/DwIMvRnnj0akf5T9D6vhdZ1bMuu4k+wCWMSaWlm31xgCLmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkXRwbdX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkXRwbdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786347107; x=1817883107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bA5HYwlwrA249QSJW7AlWImVd0QwbzJDsh0Yseb8mIk=;
  b=CkXRwbdX4FWzvDklohBnGIoHAPKgPXfwKqMc+OpfLSzfYfTxnepPbSry
   Oex0t+wOTbTAyJWrB8U05oGkEiaVmI3Tq7MBFCRm8fnFeudWUX0s9/Ulq
   n3amujJJEDNeLWeU1Hgd2jxtXVPYdCB6EZBfeew2vyakbX2H/Zgx8SaJn
   4RkYSJ6fn1iS2z39ngK5A8pvA96JeKpCSL/4DTm6BbRqeF+zul+gqHl+i
   l9MTpmXOxrU7F3ooDhjiz5LumQ+PXuSE4mbcdVXsJD5XMhgq+SDyz4cdH
   7byJDF0lRNXwmoPiPaajyYftq9E8TR5MaKa8n3hkSYWCYzPplWSF9eHcL
   Q==;
X-CSE-ConnectionGUID: BjAq+moAQ0aO8Wk/xjpcow==
X-CSE-MsgGUID: PHe1Xd2yRjC6XzQjfw1/eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97508009"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97508009"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:31:47 -0700
X-CSE-ConnectionGUID: 9Q+/hKCqQ8mAEfyZUloDhA==
X-CSE-MsgGUID: ji/6c9AJR4K8olnYFCReOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="259106456"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Aug 2026 00:31:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtKU3-00000000N0A-0VZt;
	Mon, 10 Aug 2026 07:31:43 +0000
Date: Mon, 10 Aug 2026 15:31:23 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Cain <brian.cain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bcain:bcain/hmx 105/114]
 arch/hexagon/kernel/process.c:76:2: error: call to undeclared function
 'flush_smp_call_function_queue'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202608101436.tjNABtoU-lkp@intel.com>
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
in/hmx
head:   d18cfcbc89df32524d340991739f2a7695263a90
commit: a05fde3938d152d5f90a2f9a249590f592950a23 [105/114] hexagon: flush S=
MP call-function queue before entering idle
config: hexagon-randconfig-001-20260810 (https://download.01.org/0day-ci/ar=
chive/20260810/202608101436.tjNABtoU-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12d=
f34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260810/202608101436.tjNABtoU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608101436.tjNABtoU-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/kernel/process.c:76:2: error: call to undeclared function '=
flush_smp_call_function_queue'; ISO C99 and later do not support implicit f=
unction declarations [-Wimplicit-function-declaration]
      76 |         flush_smp_call_function_queue();
         |         ^
   1 error generated.


vim +/flush_smp_call_function_queue +76 arch/hexagon/kernel/process.c

    55=09
    56	/*
    57	 * Flush pending SMP call-function work before entering __vmwait().
    58	 *
    59	 * On platforms with high IPI delivery latency (e.g. Hexagon hardware
    60	 * threads behind a hypervisor under QEMU TCG emulation), the interr=
upt
    61	 * from __vmintop_post() can take an extremely long time to wake the
    62	 * target thread from __vmwait().  During this time, call_single_dat=
a_t
    63	 * objects sit locked on the call_single_queue.  Since v5.7 (commit
    64	 * 5a18ceca6350), smp_call_function_single_async() returns -EBUSY wh=
en
    65	 * it finds a locked CSD instead of spinning, and callers like the
    66	 * scheduler's NOHZ kick and hrtimer migration silently drop the wor=
k.
    67	 *
    68	 * By draining the queue here =E2=80=94 with IRQs disabled but befor=
e the RCU
    69	 * idle context (ct_cpuidle_enter) =E2=80=94 we unlock CSDs while th=
e CPU is
    70	 * still responsive.  This shrinks the -EBUSY window to just the
    71	 * __vmwait() duration and prevents the cascading stalls that otherw=
ise
    72	 * hang SMP boot on v5.7+ kernels.
    73	 */
    74	void arch_cpu_idle_enter(void)
    75	{
  > 76		flush_smp_call_function_queue();
    77	}
    78=09

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
