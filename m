Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D0A634;
	Mon,  4 Aug 2025 21:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754341454; cv=none; b=UWowtS6SO3GnTp/DXuVbZGOjwJZZYPoJ9GXcNvPyphyMbt8tc1qV4PtNhPiwgDmsZmI11nlnbdTv31XB4kadjxR9Ww9TrdHGjhygNdbz0JgG3Y8ni2tIC5meEaOpdE5G+76vL6hLFOTbU2DToCilBrWX5xqTT/VvD01KfSWh2iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754341454; c=relaxed/simple;
	bh=0P6IWCsko9I2epURL89OWzeIgbdro1HHUtug6tiEbk8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P21hCtFFY+FvckPnpxWBAddcODks3X3Vn123R9BmiNXFWmCxgDccdaT9dZ4qeOVZRDRfU7YGDpG4KxUhWXBjhaeb+LOKxROeSFdNLT49r0gceVkTA1OUoamOIxpBX2HYQUoQSb+88b4Lts3BChGZJbnt655zArQSWkTbycBn4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGIZkrFo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGIZkrFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754341449; x=1785877449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0P6IWCsko9I2epURL89OWzeIgbdro1HHUtug6tiEbk8=;
  b=HGIZkrFovx9yNsNPZtWkoSGVbgdAH4b+r7CnfL3OKSsZB2NuuuPlOfpH
   3B3MXJx/Nd4ntRP4K04HByOVtMnLgizooAUh0N8HbLCA1Q4zqr0VkLCGi
   9ZvRaKQrc2xND1CZB5PVpd8OK0J/wYO9mqQGOWgNSRzPXcm+WsOW2ctvO
   ofIXitIY3cXwLlftxm7C099MX8hreIWi8ENJxZulmvbaK2FqqfCd2rCRk
   7Mj75XOPQBQCQjI5YwYjtDtQbb3m57c0Az1T8I6JCwfQk0dv+7hCk834Y
   XApZloSwNScpSk00OYz8zDZ6Vf1G9YAOUrB7XVG7W99moiyhHP4st8haI
   A==;
X-CSE-ConnectionGUID: SPgk0bN6Re2xZ9pwNdF3XA==
X-CSE-MsgGUID: mQkcA3jhQuegin84fNnF3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56334299"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="56334299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 14:04:09 -0700
X-CSE-ConnectionGUID: M2TuCg9NR/qruJ/V1YSjvg==
X-CSE-MsgGUID: CxfsX0BDQq6Bn5ViHql1gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163531056"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 04 Aug 2025 14:04:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj2Lk-0000G7-1P;
	Mon, 04 Aug 2025 21:04:04 +0000
Date: Tue, 5 Aug 2025 05:03:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [tip:x86/urgent 2/2] include/linux/msi.h:528:19: error: field has
 incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
Message-ID: <202508050424.a3t4xpkO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/urgent
head:   e3079ac6cf4213dd46a7a292150b2ba7e6e85bac
commit: e3079ac6cf4213dd46a7a292150b2ba7e6e85bac [2/2] x86/irq: Plug vector setup race
config: i386-buildonly-randconfig-001-20250805 (https://download.01.org/0day-ci/archive/20250805/202508050424.a3t4xpkO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050424.a3t4xpkO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050424.a3t4xpkO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/tsc.c:20:
   In file included from arch/x86/include/asm/hpet.h:5:
>> include/linux/msi.h:528:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     528 |         msi_alloc_info_t        alloc_info;
         |                                 ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
   In file included from arch/x86/include/asm/nmi.h:5:
   In file included from include/linux/irq_work.h:6:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/kernel/tsc.c:26:
--
   In file included from arch/x86/kernel/quirks.c:9:
   In file included from arch/x86/include/asm/hpet.h:5:
>> include/linux/msi.h:528:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     528 |         msi_alloc_info_t        alloc_info;
         |                                 ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   1 error generated.
--
   In file included from arch/x86/kernel/x86_init.c:24:
   In file included from arch/x86/include/asm/hpet.h:5:
>> include/linux/msi.h:528:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     528 |         msi_alloc_info_t        alloc_info;
         |                                 ^
   arch/x86/include/asm/io_apic.h:90:8: note: forward declaration of 'struct irq_alloc_info'
      90 | struct irq_alloc_info;
         |        ^
   1 error generated.
--
   In file included from drivers/base/platform-msi.c:12:
>> include/linux/msi.h:528:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     528 |         msi_alloc_info_t        alloc_info;
         |                                 ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
>> drivers/base/platform-msi.c:28:5: error: incomplete definition of type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
      28 |         arg->desc = desc;
         |         ~~~^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   drivers/base/platform-msi.c:29:5: error: incomplete definition of type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
      29 |         arg->hwirq = desc->msi_index;
         |         ~~~^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   3 errors generated.
--
   In file included from kernel/irq/msi.c:14:
>> include/linux/msi.h:528:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     528 |         msi_alloc_info_t        alloc_info;
         |                                 ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
--
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:163:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     163 | _SIG_SET_BINOP(sigandnsets, _sig_andn)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:141:3: note: expanded from macro '_SIG_SET_BINOP'
     141 |                 r->sig[2] = op(a2, b2);                                 \
         |                 ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:27: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:10: note: expanded from macro '_SIG_SET_OP'
     174 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:20: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:186:24: note: expanded from macro '_sig_not'
     186 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from kernel/irq/msi.c:16:
   In file included from include/linux/pci.h:2148:
   In file included from arch/x86/include/asm/pci.h:5:
   In file included from include/linux/mm.h:36:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:187:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     187 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:175:3: note: expanded from macro '_SIG_SET_OP'
     175 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   kernel/irq/msi.c:789:12: error: incomplete definition of type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     789 |         return arg->hwirq;
         |                ~~~^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   kernel/irq/msi.c:795:23: error: invalid application of 'sizeof' to an incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     795 |         memset(arg, 0, sizeof(*arg));
         |                              ^~~~~~
   include/linux/fortify-string.h:512:52: note: expanded from macro 'memset'
     512 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                                                    ^
   include/linux/fortify-string.h:502:35: note: expanded from macro '__fortify_memset_chk'
     502 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   kernel/irq/msi.c:806:5: error: incomplete definition of type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
     806 |         arg->desc = desc;
         |         ~~~^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
>> kernel/irq/msi.c:1288:7: error: incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info') is not assignable
    1288 |         *arg = *info->alloc_data;
         |         ~~~~ ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   kernel/irq/msi.c:1299:19: error: variable has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
    1299 |         msi_alloc_info_t arg = { };
         |                          ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   28 warnings and 6 errors generated.


vim +528 include/linux/msi.h

f3cf8bb0d6c3c1 Jiang Liu       2014-11-12  514  
ebca4396ee1852 Thomas Gleixner 2022-11-25  515  /**
ebca4396ee1852 Thomas Gleixner 2022-11-25  516   * struct msi_domain_template - Template for MSI device domains
ebca4396ee1852 Thomas Gleixner 2022-11-25  517   * @name:	Storage for the resulting name. Filled in by the core.
ebca4396ee1852 Thomas Gleixner 2022-11-25  518   * @chip:	Interrupt chip for this domain
ebca4396ee1852 Thomas Gleixner 2022-11-25  519   * @ops:	MSI domain ops
ebca4396ee1852 Thomas Gleixner 2022-11-25  520   * @info:	MSI domain info data
1396e89e09f00d Marc Zyngier    2025-05-13  521   * @alloc_info:	MSI domain allocation data (architecture specific)
ebca4396ee1852 Thomas Gleixner 2022-11-25  522   */
ebca4396ee1852 Thomas Gleixner 2022-11-25  523  struct msi_domain_template {
ebca4396ee1852 Thomas Gleixner 2022-11-25  524  	char			name[48];
ebca4396ee1852 Thomas Gleixner 2022-11-25  525  	struct irq_chip		chip;
ebca4396ee1852 Thomas Gleixner 2022-11-25  526  	struct msi_domain_ops	ops;
ebca4396ee1852 Thomas Gleixner 2022-11-25  527  	struct msi_domain_info	info;
1396e89e09f00d Marc Zyngier    2025-05-13 @528  	msi_alloc_info_t	alloc_info;
ebca4396ee1852 Thomas Gleixner 2022-11-25  529  };
ebca4396ee1852 Thomas Gleixner 2022-11-25  530  

:::::: The code at line 528 was first introduced by commit
:::::: 1396e89e09f00deb816e5f4a176d71d554922292 genirq/msi: Move prepare() call to per-device allocation

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
