Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB264C620;
	Tue,  5 Dec 2023 10:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPgimBiT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701772466; x=1733308466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=yYgLqrXGI2VB45wRL2h58GT+poyNKmcqbZtPV5B9t5g=;
  b=iPgimBiTBKiXnGipSMUj9Zido9bPu5qU/emdruVsJEqqrftemQAFniJh
   mInelTXRElb5n1QmDVoZ0/d6I7464R8a0/u/BI+KkcqsU+AXJF3Wc4v57
   kbs1OMjF7kuw/QToxuR/bNttm11lL+qTy/GFrxx+Q1cyxtAwb8ftYQnaW
   1rYzZ65hqa5o2UcKi+F7iYWCuLtXC99o6tlmReRXVTVK5h44/v0/DfIKO
   Ls5iMCaEX77nYaFmUm8Hwkwub2+K4CMk++ZjZ8yMAyiXaHB/4PcIGXFtq
   S6jKe/+DOmEc7snh72NnPT3q8McgDwlWhDNr3vcyYC8YL3POpznLUvikZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7217880"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7217880"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 02:34:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="799924052"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="799924052"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 05 Dec 2023 02:34:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rASks-0008m4-1T;
	Tue, 05 Dec 2023 10:34:18 +0000
Date: Tue, 5 Dec 2023 18:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <lb@semihalf.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 08/15] dyndbg: move flags field to a new structure
Message-ID: <202312051858.4Q1PZdEQ-lkp@intel.com>
References: <20231130234048.157509-9-lb@semihalf.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231130234048.157509-9-lb@semihalf.com>

Hi Łukasz,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ukasz-Bartosik/dyndbg-add-_DPRINTK_FLAGS_TRACE/20231201-084054
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231130234048.157509-9-lb%40semihalf.com
patch subject: [PATCH v2 08/15] dyndbg: move flags field to a new structure
config: powerpc64-randconfig-001-20231204 (https://download.01.org/0day-ci/archive/20231205/202312051858.4Q1PZdEQ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051858.4Q1PZdEQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051858.4Q1PZdEQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/scsi/hpsa.c:7581:4: error: no member named 'flags' in 'struct _ddebug'
                           dev_dbg(&pdev->dev, "memory BAR = %lx\n",
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/hpsa.c:8739:32: warning: shift count >= width of type [-Wshift-count-overflow]
           rc = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
                                         ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 1 error generated.
--
>> drivers/scsi/wd719x.c:583:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&wd->pdev->dev, "SCB terminated by direct command\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/wd719x.c:598:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&wd->pdev->dev, "selection timeout\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/wd719x.c:601:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&wd->pdev->dev, "bus reset occurred\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/wd719x.c:605:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&wd->pdev->dev, "SCSI bus error\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/wd719x.c:625:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&wd->pdev->dev, "auto request sense\n");
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
--
>> drivers/scsi/myrb.c:1412:2: error: no member named 'flags' in 'struct _ddebug'
           dev_dbg(&scmd->device->sdev_gendev,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/myrb.c:1437:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&shost->shost_gendev, "ldev %u in state %x, skip\n",
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/myrb.c:1637:2: error: no member named 'flags' in 'struct _ddebug'
           dev_dbg(&sdev->sdev_gendev,
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/myrb.c:1685:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&sdev->sdev_gendev,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/scsi/myrb.c:1692:3: error: no member named 'flags' in 'struct _ddebug'
                   dev_dbg(&sdev->sdev_gendev,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:258:2: note: expanded from macro '_dynamic_func_call'
           _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
--
>> drivers/usb/host/fhci-hub.c:53:2: error: no member named 'flags' in 'struct _ddebug'
           fhci_dbg(fhci, "-> %s: %d\n", __func__, status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fhci.h:452:3: note: expanded from macro 'fhci_dbg'
                   dev_dbg(fhci_to_hcd(fhci)->self.controller, fmt, ##args)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/host/fhci-hub.c:74:2: error: no member named 'flags' in 'struct _ddebug'
           fhci_dbg(fhci, "<- %s: %d\n", __func__, status);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fhci.h:452:3: note: expanded from macro 'fhci_dbg'
                   dev_dbg(fhci_to_hcd(fhci)->self.controller, fmt, ##args)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/host/fhci-hub.c:83:2: error: no member named 'flags' in 'struct _ddebug'
           fhci_dbg(fhci, "-> %s\n", __func__);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fhci.h:452:3: note: expanded from macro 'fhci_dbg'
                   dev_dbg(fhci_to_hcd(fhci)->self.controller, fmt, ##args)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/host/fhci-hub.c:104:2: error: no member named 'flags' in 'struct _ddebug'
           fhci_dbg(fhci, "<- %s\n", __func__);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fhci.h:452:3: note: expanded from macro 'fhci_dbg'
                   dev_dbg(fhci_to_hcd(fhci)->self.controller, fmt, ##args)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/dynamic_debug.h:231:6: note: expanded from macro '__dynamic_func_call_cls'
           if (DYNAMIC_DEBUG_BRANCH(id))                           \
               ^                    ~~
   include/linux/dynamic_debug.h:213:22: note: expanded from macro 'DYNAMIC_DEBUG_BRANCH'
           unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
                    ~~~~~~~~~~ ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   drivers/usb/host/fhci-hub.c:113:2: error: no member named 'flags' in 'struct _ddebug'
           fhci_dbg(fhci, "-> %s\n", __func__);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/host/fhci.h:452:3: note: expanded from macro 'fhci_dbg'
                   dev_dbg(fhci_to_hcd(fhci)->self.controller, fmt, ##args)
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:155:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:281:2: note: expanded from macro 'dynamic_dev_dbg'
           _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
..


vim +7581 drivers/scsi/hpsa.c

e5c880d1d5923c Stephen M. Cameron 2010-05-27  7571  
6f039790510fd6 Greg Kroah-Hartman 2012-12-21  7572  static int hpsa_pci_find_memory_BAR(struct pci_dev *pdev,
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7573  				    unsigned long *memory_bar)
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7574  {
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7575  	int i;
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7576  
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7577  	for (i = 0; i < DEVICE_COUNT_RESOURCE; i++)
12d2cd4711b9e3 Stephen M. Cameron 2010-06-16  7578  		if (pci_resource_flags(pdev, i) & IORESOURCE_MEM) {
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7579  			/* addressing mode bits already removed */
12d2cd4711b9e3 Stephen M. Cameron 2010-06-16  7580  			*memory_bar = pci_resource_start(pdev, i);
12d2cd4711b9e3 Stephen M. Cameron 2010-06-16 @7581  			dev_dbg(&pdev->dev, "memory BAR = %lx\n",
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7582  				*memory_bar);
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7583  			return 0;
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7584  		}
12d2cd4711b9e3 Stephen M. Cameron 2010-06-16  7585  	dev_warn(&pdev->dev, "no memory BAR found\n");
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7586  	return -ENODEV;
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7587  }
3a7774ceb89f02 Stephen M. Cameron 2010-05-27  7588  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
