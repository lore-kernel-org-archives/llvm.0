Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F5D19CC26;
	Tue,  3 Dec 2024 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212324; cv=none; b=WDu1+HnLoWjuxF5f4YJ6saKBQVdJKxkTBti7j+3IIarBZZ7C/MH25KZFpk84z5UpJuTPuAYrYb0zbQpr5Ajs6OsXTMWy2d2SYWQ56Qje2iKs7IB0VSTrDPgQMjqWs48oqtsefkaIcXLd1dNHa4f5fkSfxy+BQUYcO+l5BXclTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212324; c=relaxed/simple;
	bh=W0Jaz9INALtwh/ErCteAIm7+OyhZb5AaC2v2rjP+znA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fv6MvKP+VagF0qAsR9EIb/CKQ5MZ6TpntMFbqM2/U4qiwhnl5QwfxazHSY/RU0JG6vj8OcQqEFD7lTJQynbWA0NhF7kceVEdunS3TVuow4VoIHYETMyleSvTbQx/8a5BXAr8xy9Oy75H8U9yHYeg0lQkPnIM4Lpq7fu/wJ/d324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lNEj0sHa; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lNEj0sHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733212322; x=1764748322;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W0Jaz9INALtwh/ErCteAIm7+OyhZb5AaC2v2rjP+znA=;
  b=lNEj0sHanxOLKsrxjr9LKYKp790wxFE+sXxFO9FKFFtb350/UyeW/iZI
   RYnnX+2bxyjeMr6BpkXng6/4U2wU1gcTnAy9fQ+QHu8g1vZlFAuWU/GKY
   7G9JK5nuqh3jFfK81rhl2VSZ+rINdkEoUInbw/eE05OIOYEwgz4A9Wulz
   gDfpWGXdv5gtTZY0u1ne48QWd5inGKAAauhlH+5yRdE9hgUPMY+QQq3Rs
   /TBTAgaqV1dAOoYoNetmi+LTdQG2UiXESCZ8DWt5cbBLU40N4nuwTqi3N
   xy1T60JMvSBj2Q3BMqP+XUxnheeHmf799U6BbY3ur3sjYUJhUNSLzdmrb
   Q==;
X-CSE-ConnectionGUID: A5cq4IX8QEGEh5uXa4cSsg==
X-CSE-MsgGUID: kaST2qM+RkSgNOKFfe9Y4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44078332"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44078332"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 23:52:00 -0800
X-CSE-ConnectionGUID: sYZ6+XY+SrSEjEzw9bgPGA==
X-CSE-MsgGUID: QArBVMU1Rn26UCarJpJ3tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="98362206"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2024 23:51:59 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tINhM-0000JH-2B;
	Tue, 03 Dec 2024 07:51:56 +0000
Date: Tue, 3 Dec 2024 15:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 45/50] include/linux/riscv_sse.h:65:10:
 error: use of undeclared identifier 'EOPNOTSUPP'
Message-ID: <202412031551.3L3nXryz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   69e36e8d70c1833ff8d80418017c13c8267e2c74
commit: cd5254a9040cbe3d816613c0bb2ff72add5b78b6 [45/50] riscv: Introduce HEST SSE notification handlers
config: x86_64-buildonly-randconfig-003-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031551.3L3nXryz-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031551.3L3nXryz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031551.3L3nXryz-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
>> include/linux/riscv_sse.h:65:10: error: use of undeclared identifier 'EOPNOTSUPP'
      65 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:73:10: error: use of undeclared identifier 'EOPNOTSUPP'
      73 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:78:10: error: use of undeclared identifier 'EOPNOTSUPP'
      78 |         return -EOPNOTSUPP;
         |                 ^
>> include/linux/riscv_sse.h:83:44: warning: declaration of 'struct ghes' will not be visible outside of this function [-Wvisibility]
      83 | static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
         |                                            ^
   include/linux/riscv_sse.h:86:10: error: use of undeclared identifier 'EOPNOTSUPP'
      86 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sse.h:89:46: warning: declaration of 'struct ghes' will not be visible outside of this function [-Wvisibility]
      89 | static inline int sse_unregister_ghes(struct ghes *ghes)
         |                                              ^
   include/linux/riscv_sse.h:91:10: error: use of undeclared identifier 'EOPNOTSUPP'
      91 |         return -EOPNOTSUPP;
         |                 ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:10:
   In file included from include/linux/cper.h:13:
   In file included from include/linux/trace_seq.h:5:
   In file included from include/linux/seq_buf.h:7:
   In file included from include/linux/seq_file.h:11:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:10:
   In file included from include/linux/cper.h:13:
   In file included from include/linux/trace_seq.h:5:
   In file included from include/linux/seq_buf.h:7:
   In file included from include/linux/seq_file.h:11:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:10:
   In file included from include/linux/cper.h:13:
   In file included from include/linux/trace_seq.h:5:
   In file included from include/linux/seq_buf.h:7:
   In file included from include/linux/seq_file.h:11:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:10:
   In file included from include/linux/cper.h:13:
   In file included from include/linux/trace_seq.h:5:
   In file included from include/linux/seq_buf.h:7:
   In file included from include/linux/seq_file.h:11:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:10:
   In file included from include/linux/cper.h:13:
   In file included from include/linux/trace_seq.h:5:
   In file included from include/linux/seq_buf.h:7:
   In file included from include/linux/seq_file.h:11:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];


vim +/EOPNOTSUPP +65 include/linux/riscv_sse.h

bf7506e7bec204 Clément Léger    2023-06-13  57  
2d29b532eb5886 Himanshu Chauhan 2023-10-26  58  int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
2d29b532eb5886 Himanshu Chauhan 2023-10-26  59  		      sse_event_handler *hi_cb);
2d29b532eb5886 Himanshu Chauhan 2023-10-26  60  int sse_unregister_ghes(struct ghes *ghes);
bf7506e7bec204 Clément Léger    2023-06-13  61  #else
bf7506e7bec204 Clément Léger    2023-06-13  62  static inline int sse_event_register(struct sse_event *evt, u32 priority,
bf7506e7bec204 Clément Léger    2023-06-13  63  				     sse_event_handler *handler, void *arg)
bf7506e7bec204 Clément Léger    2023-06-13  64  {
bf7506e7bec204 Clément Léger    2023-06-13 @65  	return -EOPNOTSUPP;
bf7506e7bec204 Clément Léger    2023-06-13  66  }
bf7506e7bec204 Clément Léger    2023-06-13  67  
bf7506e7bec204 Clément Léger    2023-06-13  68  static inline void sse_event_unregister(struct sse_event *evt) {}
bf7506e7bec204 Clément Léger    2023-06-13  69  
bf7506e7bec204 Clément Léger    2023-06-13  70  static inline int sse_event_set_target_cpu(struct sse_event *sse_evt,
bf7506e7bec204 Clément Léger    2023-06-13  71  					   unsigned int cpu)
bf7506e7bec204 Clément Léger    2023-06-13  72  {
bf7506e7bec204 Clément Léger    2023-06-13  73  	return -EOPNOTSUPP;
bf7506e7bec204 Clément Léger    2023-06-13  74  }
bf7506e7bec204 Clément Léger    2023-06-13  75  
bf7506e7bec204 Clément Léger    2023-06-13  76  static inline int sse_event_enable(struct sse_event *sse_evt)
bf7506e7bec204 Clément Léger    2023-06-13  77  {
bf7506e7bec204 Clément Léger    2023-06-13  78  	return -EOPNOTSUPP;
bf7506e7bec204 Clément Léger    2023-06-13  79  }
bf7506e7bec204 Clément Léger    2023-06-13  80  
bf7506e7bec204 Clément Léger    2023-06-13  81  static inline void sse_event_disable(struct sse_event *sse_evt) {}
bf7506e7bec204 Clément Léger    2023-06-13  82  
2d29b532eb5886 Himanshu Chauhan 2023-10-26 @83  static inline int sse_register_ghes(struct ghes *ghes, sse_event_handler *lo_cb,
2d29b532eb5886 Himanshu Chauhan 2023-10-26  84  				    sse_event_handler *hi_cb)
2d29b532eb5886 Himanshu Chauhan 2023-10-26  85  {
2d29b532eb5886 Himanshu Chauhan 2023-10-26  86  	return -EOPNOTSUPP;
2d29b532eb5886 Himanshu Chauhan 2023-10-26  87  }
2d29b532eb5886 Himanshu Chauhan 2023-10-26  88  

:::::: The code at line 65 was first introduced by commit
:::::: bf7506e7bec204376453e68c7d7c3ab7ff37dcaf riscv: add support for SBI Supervisor Software Events extension

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
