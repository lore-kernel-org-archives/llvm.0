Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933DA39A7F2;
	Thu, 14 May 2026 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750821; cv=none; b=S1xEP4os6KSYRH4FNI0hUxqAsRizKoY4HcJTdw8UOtCBCSZeTJ4A44VDQMAGVfAznjxoRIQ0JaYJpuCoL4Szh36FdaPJMsJ71jqvtPguppbFDGouJ8lR1Gq/45eA82qnExOdmIvVDfUIYDfCV6RMk5Nw/6tqCq3s6GCStqxR/3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750821; c=relaxed/simple;
	bh=Xk2L1Max7/mQ2EO4417jItnDDAVaXdTmX1+X+xT9hF8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n0uY6FUkE88YPu0jTQMByv1ucIUj88hNfrWN1xc1LA3HJ+vA+mUdNuhs7eq7JOvkWyMC+KmDfm4+FtRgvsoip+H+Lpx/IKgnqJy687G9gG3hPYVqKhJIY+C+JjcGM5C+90xLVnxQEg1gzerR+rF3TjzdNgdq3dIEo3yGaPv1Vvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y0JgIuZz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y0JgIuZz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778750819; x=1810286819;
  h=date:from:to:cc:subject:message-id;
  bh=Xk2L1Max7/mQ2EO4417jItnDDAVaXdTmX1+X+xT9hF8=;
  b=Y0JgIuZzu0T3w4xLxOlQRbyPHPNRHXeyTcQ5oBnjafypjx7aKxEjGYUq
   2DDa4iFT5IGaqrw1xtSeMt4p+eM3K8pfTLeomNuORFjs1TkPbjZDaoI3q
   GzyXDzo7yh2KgSKGn/K2xmVIZXSLWIY14bUnd/xdJte5uQz4MfsR3di02
   cTvFQMfVne49Nys8Ha8uFAWm7IDE7nS21mdnuODA8LOajZUgF9pgeTXZS
   6viPmZCPnTu5o2uQOWWCUwcaXlMrCsoCifoKNhjAhbrQlLq/OEsPVEmI8
   TwOynKvceBmC838BQjQ9ZQDZ41f9nmo+20TwfCxupOYaa5dE+nrLNnCc+
   Q==;
X-CSE-ConnectionGUID: 2Iw+8FXtS/2UnjhwKfYy7Q==
X-CSE-MsgGUID: VakWKtloRkyFXX1b8C0nJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91075298"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91075298"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 02:26:58 -0700
X-CSE-ConnectionGUID: 6MyWtS5bR6emm+8qRcTfdQ==
X-CSE-MsgGUID: k7jfaF8DRUiQb9z3yRWp8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="276419604"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 May 2026 02:26:56 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNSLF-000000008nB-3FEh;
	Thu, 14 May 2026 09:26:53 +0000
Date: Thu, 14 May 2026 11:26:43 +0200
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/pci/liveupdate.h:31:1: error: expected identifier or
 '('
Message-ID: <202605141129.QEeW4TcK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/David-Matlack/PCI-liveupdate-Set-up-FLB-handler-for-the-PCI-core/20260514-111126
head:   b4570b026ee40593fe4f6931f522a15adc6ea247
commit: f88bd26914e11847b921b4d09d4b91be5dec94ba PCI: liveupdate: Freeze preservation status during shutdown
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260514/202605141129.QEeW4TcK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141129.QEeW4TcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141129.QEeW4TcK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/probe.c:27:
>> drivers/pci/liveupdate.h:31:1: error: expected identifier or '('
      31 | {
         | ^
   1 error generated.
--
   In file included from drivers/pci/pci.c:36:
>> drivers/pci/liveupdate.h:31:1: error: expected identifier or '('
      31 | {
         | ^
   drivers/pci/pci.c:427:9: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     427 |         return PCI_FIND_NEXT_CAP(pci_bus_read_config, pos, cap, NULL, bus, devfn);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:161:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     161 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^~~~~~~~~~~~~~~
   drivers/pci/pci.c:427:9: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:161:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     161 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^
   drivers/pci/pci.c:531:9: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     531 |         return PCI_FIND_NEXT_EXT_CAP(pci_bus_read_config, start, cap,
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     532 |                                      NULL, dev->bus, dev->devfn);
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:209:5: note: expanded from macro 'PCI_FIND_NEXT_EXT_CAP'
     209 |                                 *(u16 *)prev_ptr = __prev_pos;          \
         |                                 ^~~~~~~~~~~~~~~~
   drivers/pci/pci.c:531:9: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:209:5: note: expanded from macro 'PCI_FIND_NEXT_EXT_CAP'
     209 |                                 *(u16 *)prev_ptr = __prev_pos;          \
         |                                 ^
   drivers/pci/pci.c:600:8: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     600 |         pos = PCI_FIND_NEXT_CAP(pci_bus_read_config, pos,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     601 |                                 PCI_CAP_ID_HT, NULL, dev->bus, dev->devfn);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:161:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     161 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^~~~~~~~~~~~~~~
   drivers/pci/pci.c:600:8: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:161:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     161 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^
   drivers/pci/pci.c:610:9: warning: indirection of non-volatile null pointer will be deleted, not trap [-Wnull-dereference]
     610 |                 pos = PCI_FIND_NEXT_CAP(pci_bus_read_config,
         |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     611 |                                         pos + PCI_CAP_LIST_NEXT,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~
     612 |                                         PCI_CAP_ID_HT, NULL, dev->bus,
         |                                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     613 |                                         dev->devfn);
         |                                         ~~~~~~~~~~~
   drivers/pci/pci.h:161:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     161 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^~~~~~~~~~~~~~~
   drivers/pci/pci.c:610:9: note: consider using __builtin_trap() or qualifying pointer with 'volatile'
   drivers/pci/pci.h:161:5: note: expanded from macro 'PCI_FIND_NEXT_CAP'
     161 |                                 *(u8 *)prev_ptr = __prev_pos;           \
         |                                 ^
   4 warnings and 1 error generated.


vim +31 drivers/pci/liveupdate.h

    29	
    30	static inline void pci_liveupdate_freeze(struct pci_dev *dev);
  > 31	{
    32	}
    33	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
