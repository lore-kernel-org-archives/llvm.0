Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF171873;
	Tue,  9 Jan 2024 00:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jeZYs0wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704760762; x=1736296762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZmN8coU66H1BEdXHWW87cPKMegsesMyTmjSUTImXv08=;
  b=jeZYs0wgjAbgmDPd+riCRQ6Jrem6gTwNR2e9Iow0z2nZfkIx1WzD5MAy
   mIvTBNjz5K7sJaGUPC8Xj5JNTaJqyWYVVlSL8tsv8AAKbJ/kM4Elmh31l
   2xzpbp8vdrWV342+fw0k5gYK1I/qJLWzdfGndSTT45vFGKorIoklrjZgi
   VcJ9n8u0UUXhgBFku6Z+l4alk+jL9Dtac6Y02nxwqIm1Ov6IT+GS85EvN
   xNrauLZTupXnK4gJ6HenCq/dF3Z4UXvRXeJqeLBe9ReXiiDn3S2UEDiID
   xvBiP9GCSRodPTuWKbaUuelK2gUMynV+i7oiRh3mb+PT3M0F2by6hclQL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4822717"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="4822717"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 16:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="781597604"
X-IronPort-AV: E=Sophos;i="6.04,181,1695711600"; 
   d="scan'208";a="781597604"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Jan 2024 16:39:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rN09F-0005GQ-2a;
	Tue, 09 Jan 2024 00:39:17 +0000
Date: Tue, 9 Jan 2024 08:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ambarus:gs101-peric0-usi-uart-i2c-v3 15/23]
 arch/x86/include/asm/irq.h:39:56: warning: declaration of 'struct pt_regs'
 will not be visible outside of this function
Message-ID: <202401090827.6Qt43Hqk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day gs101-peric0-usi-uart-i2c-v3
head:   a88abf89a889072bee04c2661c3e48a5db574fc6
commit: e92862fb09390e4aae4e76ef2e5528c0340e31d0 [15/23] tty: serial: samsung: sort headers alphabetically
config: i386-buildonly-randconfig-004-20240109 (https://download.01.org/0day-ci/archive/20240109/202401090827.6Qt43Hqk-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240109/202401090827.6Qt43Hqk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401090827.6Qt43Hqk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/serial/samsung_tty.c:24:
>> arch/x86/include/asm/irq.h:39:56: warning: declaration of 'struct pt_regs' will not be visible outside of this function [-Wvisibility]
      39 | extern void __handle_irq(struct irq_desc *desc, struct pt_regs *regs);
         |                                                        ^
>> arch/x86/include/asm/irq.h:44:50: warning: declaration of 'struct cpumask' will not be visible outside of this function [-Wvisibility]
      44 | void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
         |                                                  ^
   2 warnings generated.


vim +39 arch/x86/include/asm/irq.h

a782a7e46bb508 arch/x86/include/asm/irq.h Thomas Gleixner   2015-08-02  38  
7c2a57364cae0f arch/x86/include/asm/irq.h Thomas Gleixner   2020-05-21 @39  extern void __handle_irq(struct irq_desc *desc, struct pt_regs *regs);
22067d4501bfb4 include/asm-x86/irq.h      Thomas Gleixner   2008-05-02  40  
d9112f43021554 arch/x86/include/asm/irq.h Thomas Gleixner   2009-08-20  41  extern void init_ISA_irqs(void);
d9112f43021554 arch/x86/include/asm/irq.h Thomas Gleixner   2009-08-20  42  
b52e0a7c4e4100 arch/x86/include/asm/irq.h Michel Lespinasse 2013-06-06  43  #ifdef CONFIG_X86_LOCAL_APIC
9a01c3ed5cdb35 arch/x86/include/asm/irq.h Chris Metcalf     2016-10-07 @44  void arch_trigger_cpumask_backtrace(const struct cpumask *mask,
8d539b84f1e347 arch/x86/include/asm/irq.h Douglas Anderson  2023-08-04  45  				    int exclude_cpu);
89f579ce99f7e0 arch/x86/include/asm/irq.h Yi Wang           2018-11-22  46  

:::::: The code at line 39 was first introduced by commit
:::::: 7c2a57364cae0f2e070a27d728f1df6844ffff56 x86/irq: Rework handle_irq() for 64-bit

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
