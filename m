Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943F3557EB;
	Tue, 28 Oct 2025 22:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761689338; cv=none; b=VMRNmQ3O1HL8s5HMpA+wmCa3CnL7/P0Vq6f+DoQEHzbNGwa+pYsjlo6c5ELLPMKJHTXek++D5llU9SMu6UO2EEw81HP/8k3hzHbzlq0UkE8tClFZEcaPgre90lMwTdc8MrHxPHlSWuzzAuzjTUJDgPBjT36BK/6Lovd4d8CMHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761689338; c=relaxed/simple;
	bh=Zvvf8LDCF0p52fuFWt0OkqSUWt6jV/apJd00ZKVtzfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qTzqlyuwO7BFXN80Jsw63kAqtYtsS2y0agMtxe07MX/+56QwgH3h6XN/Ud+72kiqWejtvk1a9g0qCGCFEyIH6MLYL/DW9DM4q3k+m+jx7IrxXQa1bWX9BRX2RmWAkCua0DNvfe/j8gfYnJTEZj562Fy7V8dh3PLOAWHvC9rH8WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ng2+Pxjf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ng2+Pxjf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761689337; x=1793225337;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Zvvf8LDCF0p52fuFWt0OkqSUWt6jV/apJd00ZKVtzfk=;
  b=ng2+Pxjfxn6gA9BmBXpPJssxhfm8I/px/bAOYmWMQ7Q4pMOu1RiNTyTq
   fVTP10ykDEnq8359iEoswTL49S2MbAQ8pCd9W3H2R050u6OrFTr4Bseob
   0FmZEuPPGyA1YVz8CVtySCjPSEdYc5+iI9tw/qJGoXJCOsLuVYUbWzHa5
   3o7Z9E++L1v6jsKeC9fwjmTjtgXEzB8qIArjK2SwsF6o7qL2XW0Hzm61G
   +e6Y3BZ0pUFIgkdW4OwD21DKho8JDoLuAwHVts4sXeK1HwOVlQqJradqv
   ovD4Z6yiQXbXwbfJPK0mGrCMPejl4OZVBDyr3Sg1H5lPQ1Qs6xfjTP7GK
   w==;
X-CSE-ConnectionGUID: cW3YU4//SfmczOL+7ZQYvw==
X-CSE-MsgGUID: +LLGELsHQr+m0oUk64Ef0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="81433542"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="81433542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 15:08:56 -0700
X-CSE-ConnectionGUID: ZH4KIsc3RJi6Ikfni6z/9A==
X-CSE-MsgGUID: 0IyYs0EUQpCVHB2dR25qUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185396434"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 28 Oct 2025 15:08:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDrs3-000JoH-1U;
	Tue, 28 Oct 2025 22:08:51 +0000
Date: Wed, 29 Oct 2025 06:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 41/57]
 include/linux/riscv_sbi_sse.h:44:9: error: call to undeclared function
 'ERR_PTR'; ISO C99 and later do not support implicit function declarations
Message-ID: <202510290653.xI93nXdj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   3f71314c58520f6fada72d7f0364429fc3e8bf50
commit: 9b88b132cc8aab2bb34e7e8dad4187c526e60d1e [41/57] riscv: Introduce HEST SSE notification handlers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251029/202510290653.xI93nXdj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290653.xI93nXdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290653.xI93nXdj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/acpi/apei/ghes.c:20:
>> include/linux/riscv_sbi_sse.h:44:9: error: call to undeclared function 'ERR_PTR'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^
>> include/linux/riscv_sbi_sse.h:44:18: error: use of undeclared identifier 'EOPNOTSUPP'
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                         ^
   include/linux/riscv_sbi_sse.h:52:10: error: use of undeclared identifier 'EOPNOTSUPP'
      52 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sbi_sse.h:58:10: error: use of undeclared identifier 'EOPNOTSUPP'
      58 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sbi_sse.h:63:10: error: use of undeclared identifier 'EOPNOTSUPP'
      63 |         return -EOPNOTSUPP;
         |                 ^
   include/linux/riscv_sbi_sse.h:68:10: error: use of undeclared identifier 'EOPNOTSUPP'
      68 |         return -EOPNOTSUPP;
         |                 ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:9:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:11:
   In file included from include/linux/cleanup.h:6:
   include/linux/err.h:39:35: error: static declaration of 'ERR_PTR' follows non-static declaration
      39 | static inline void * __must_check ERR_PTR(long error)
         |                                   ^
   include/linux/riscv_sbi_sse.h:44:9: note: previous implicit declaration is here
      44 |         return ERR_PTR(-EOPNOTSUPP);
         |                ^
   In file included from drivers/acpi/apei/ghes.c:21:
   In file included from include/linux/arm_sdei.h:8:
   In file included from include/acpi/ghes.h:5:
   In file included from include/acpi/apei.h:10:
   In file included from include/linux/cper.h:13:
   In file included from include/linux/trace_seq.h:5:
   In file included from include/linux/seq_buf.h:7:
   In file included from include/linux/seq_file.h:11:
   In file included from include/linux/fs.h:34:
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
   In file included from include/linux/fs.h:34:
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
   In file included from include/linux/fs.h:34:
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
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;


vim +/ERR_PTR +44 include/linux/riscv_sbi_sse.h

3e89594245fa2c Clément Léger 2025-09-08  38  
3e89594245fa2c Clément Léger 2025-09-08  39  #else
3e89594245fa2c Clément Léger 2025-09-08  40  static inline struct sse_event *sse_event_register(u32 event_num, u32 priority,
3e89594245fa2c Clément Léger 2025-09-08  41  						   sse_event_handler_fn *handler,
3e89594245fa2c Clément Léger 2025-09-08  42  						   void *arg)
3e89594245fa2c Clément Léger 2025-09-08  43  {
3e89594245fa2c Clément Léger 2025-09-08 @44  	return ERR_PTR(-EOPNOTSUPP);
3e89594245fa2c Clément Léger 2025-09-08  45  }
3e89594245fa2c Clément Léger 2025-09-08  46  

:::::: The code at line 44 was first introduced by commit
:::::: 3e89594245fa2cf4bd298955d807fcd625294f22 drivers: firmware: add riscv SSE support

:::::: TO: Clément Léger <cleger@rivosinc.com>
:::::: CC: Anup Patel <anup@brainfault.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
