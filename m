Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433738;
	b=OS101TMFpjf5fDMEjHGtwsEk904GneNzi0hHLsdl8c+sk7nhtd93DKpJr/kFMBWpCg4A
	 /JVKHoVrnszXQjzBnufEOMQCcPZzaNlVA7Yb6XzV9Li427kn8lPfEnPYMiBBdtgn2wKF2
	 ET4Wlv5PPrFliBRuXSyJSnmnblhu0YuX+mKAQlUjxexytOgYsHBPAlW5hwTN1M87Hes2/
	 h6iz5MwsTXpihcCJ12sD4gbWiJyUBE1cy3HIl1yMT7+ju2fqT1YJBlCV5Sgibjy/qleHg
	 Zvt2Cjx1YFC0ExYdHT83zcv/rkhkm2nNnsWrbwFFhffBqvbT9PrLW8x1Xrlar6GAWvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433738;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=nt2LL9iNs+LRx1tp2zepH0wuNxWdy8/XmRxlT4e+uCM=;
	b=Vt8PY6wMFLOR9f9eHbqFJg8nwD+ZC05lcZ8JHAJWKDXwtU7c2CfaDq4P7lzPW80wgvxN
	 XvY6r/aHgw5rlM6cQvndcOu+y8bQpK/iKK+ORQfnLSEFK3Cko1jD5BFlQRxa6776rC+2H
	 vW9r5u5e7xsKQnxU+byVovVFCVxuegR3sYQIRzvW+PcNeoWM1qh1sjlj1SpZdmsFAmCPz
	 DK39ju8x5Bs9rFrbcT0nQ2O70SJkRixGwV06dB/FeLpObsyTq1GiycjmnlvQIGWXxsOUV
	 FkTPKEq7I8LXU76CfUJOKz8dkr6WmgUouf4rToRtY8rkHjh7z2oQXj+/+IOJLtlgKDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TPyHE5P8;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28678606A31A;
	Mon, 19 Oct 2026 18:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28678606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TPyHE5P8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792433736; x=1823969736;
  h=date:from:to:cc:subject:message-id;
  bh=mo5/Y5tVyN5jGDU09JXX4sT3WA3U+qL4ZBYcaG7InU4=;
  b=TPyHE5P8rM+h00F6t9pqfvSdkf5QUKUNy/GREDYqNycKpsEXQipglG2R
   aP7Exvyt7w7t2qdEwzrEw7CUeoMjYUBrAvmH91NC/vtrKHOGjQah2u2Iy
   bhIR9e+DhkfMKOpqlNrjJTkAx/rSdjAx5VH2RxQtUbmKxswDhSfaWGca2
   Tt1tHAdiuGgCR4z/m1EQOybR+wwe53SZ/E/48S0VaagOyUmB9gVT6rgl5
   S1JKVR7IF5JzrYpO/upbvbrP71QL0kjL3yAMRTUzgFq8G0DLTdWYJxQ/W
   TXQGarvJliKahnVDXOWabKFTPrrcJMwwTAn9ptfQY1qG6x0iqon2QINEC
   Q==;
X-CSE-ConnectionGUID: 33G9Dz0PRy2bkxY7hmzfzA==
X-CSE-MsgGUID: WMaVAE/nQfm7iJpJ5ySu6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1227307"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1227307"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 11:15:36 -0700
X-CSE-ConnectionGUID: C+t4RnS+S8GBJaXBA/7NHg==
X-CSE-MsgGUID: b+3pWkDtSX6vcqDcopfABQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2705337"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Oct 2026 11:15:34 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIrtT-000000005ol-4Ab2;
	Mon, 19 Oct 2026 18:15:31 +0000
Date: Mon, 19 Oct 2026 20:14:40 +0200
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 1/49]
 include/linux/stop_machine.h:182:47: error: too few arguments to function
 call, expected 4, have 3
Message-ID: <202610192042.JQFnS2hD-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   8ff5f866a7c2825213c6aa525a88840cbccf1211
commit: c7da79bd2c65b3817e4a2ce25fbdcc3bb8c9262f [1/49] stop_machine: Add post function to execute while other CPUs can exit
config: arm-randconfig-2001-20261019 (https://download.01.org/0day-ci/archive/20261019/202610192042.JQFnS2hD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610192042.JQFnS2hD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610192042.JQFnS2hD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   In file included from kernel/sched/sched.h:63:
>> include/linux/stop_machine.h:182:47: error: too few arguments to function call, expected 4, have 3
     182 |         return stop_machine_cpuslocked(fn, data, cpus);
         |                ~~~~~~~~~~~~~~~~~~~~~~~               ^
   include/linux/stop_machine.h:166:28: note: 'stop_machine_cpuslocked' declared here
     166 | static __always_inline int stop_machine_cpuslocked(cpu_stop_fn_t fn, cpu_stop_fn_t postfn,
         |                            ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     167 |                                                    void *data, const struct cpumask *cpus)
         |                                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:185: kernel/sched/rq-offsets.s] Error 1 shuffle=706584788
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=706584788
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=706584788
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=706584788
   make: Target 'prepare' not remade because of errors.


vim +182 include/linux/stop_machine.h

9ea09af3bd3090e Heiko Carstens            2008-12-22  178  
cbf78d85079cee6 Arnd Bergmann             2021-03-12  179  static __always_inline int
cbf78d85079cee6 Arnd Bergmann             2021-03-12  180  stop_machine(cpu_stop_fn_t fn, void *data, const struct cpumask *cpus)
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24  181  {
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24 @182  	return stop_machine_cpuslocked(fn, data, cpus);
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24  183  }
fe5595c074005bd Sebastian Andrzej Siewior 2017-05-24  184  

:::::: The code at line 182 was first introduced by commit
:::::: fe5595c074005bd94f0c7d1644175941149f6768 stop_machine: Provide stop_machine_cpuslocked()

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
