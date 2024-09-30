Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A19613D52E;
	Mon, 30 Sep 2024 11:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727694251; cv=none; b=aOn8ZZjCaJMlPYIXnuiVfzr+haY12Rz92Nwmz7P+NTT4wUXBAln6AjtWDMxOAuzk/iMKGsbh4JLmSVYPjGK4dM1RHVfXWNRI79bMbUNbQJGA5wEZ5g0rBDH0UxV20kWUMpJiSISsUi4dtefTTBRL2XmGo0+NDhBuYB1QWUPW0Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727694251; c=relaxed/simple;
	bh=qaLCciUNPkfntdc9u1uWiCu//ZKlHkVNchnOhEeXjCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iH2czYYX2DCx3CgLLcl+Q/Vl9uj5Rtfmx8XSJ/MdK6CE8BhWr6Vb4fy/nDofHS6a8und5SNNUd1TZFKWNqRJvrRFcF6JHuxpG5KGX6pl1R/YTRSL7Hd4+sqjSx0hggkL1wNn6P4iwD9D+rXg+sXyEBDNGUrDMcGTh1uoNO6xs3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kw1IL03K; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kw1IL03K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727694249; x=1759230249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qaLCciUNPkfntdc9u1uWiCu//ZKlHkVNchnOhEeXjCg=;
  b=kw1IL03Kil08UrYFK1Rn1cF3wf+6OX0r3ljUpNzzaS1g3JLTAIrS/bi1
   lhBB9wFb+tKbu3H6SruV3RUH8LHQSxI7hw1lc1ztCNIff47a060OcUz5M
   XZhsOUtSTh9X1m/5dc6GyvH+x/XjQsNEV3d4bpbwRzXt+iwsVPzxkd7Dm
   vESQTuudebGO6daMywOpfBJrviBhwBRqdrqf5QUY9emZrId+bG+OsjWZK
   PaOumrq+QennxZ4QSFi7nik4FYO58FhAXmqIQHSdPFCiXKleYC5od8DvE
   01wT3LAzuMXbvJzcmMVpBbT74wEupJSzlbwC8I3Nr0lGZyDf1t3J5xwrC
   g==;
X-CSE-ConnectionGUID: yXER3E9GR7WU1JjIhsoFwg==
X-CSE-MsgGUID: LoV/KInUSpiDaMaYG3tJXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38160502"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="38160502"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 04:04:09 -0700
X-CSE-ConnectionGUID: zzYljkD0Sbi0T9O5tLMxAg==
X-CSE-MsgGUID: 4j3G7xd2T0elZ15Ne+mXyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="73304995"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Sep 2024 04:04:07 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svECD-000PMn-18;
	Mon, 30 Sep 2024 11:04:05 +0000
Date: Mon, 30 Sep 2024 19:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [broonie-ci:arm64-gcs 27/40] arch/arm64/kernel/ptrace.c:1472:1:
 warning: non-void function does not return a value in all control paths
Message-ID: <202409301807.bMALFYf7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   da6c19766d3399121d0f97a5dcf38de9e315ec9b
commit: ef0e2d1b9c3ffcc89d29b948024b0803cc59b53a [27/40] arm64/ptrace: Expose GCS via ptrace and core files
config: arm64-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409301807.bMALFYf7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409301807.bMALFYf7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409301807.bMALFYf7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/ptrace.c:11:
   In file included from include/linux/audit.h:13:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kernel/ptrace.c:1472:1: warning: non-void function does not return a value in all control paths [-Wreturn-type]
    1472 | }
         | ^
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +1472 arch/arm64/kernel/ptrace.c

  1455	
  1456	static int poe_set(struct task_struct *target, const struct
  1457			   user_regset *regset, unsigned int pos,
  1458			   unsigned int count, const void *kbuf, const
  1459			   void __user *ubuf)
  1460	{
  1461		int ret;
  1462		long ctrl;
  1463	
  1464		if (!system_supports_poe())
  1465			return -EINVAL;
  1466	
  1467		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &ctrl, 0, -1);
  1468		if (ret)
  1469			return ret;
  1470	
  1471		target->thread.por_el0 = ctrl;
> 1472	}
  1473	#endif
  1474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
