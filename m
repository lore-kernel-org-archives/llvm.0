Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046E238BF7F;
	Wed, 21 Jan 2026 19:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022361; cv=none; b=fSU3C7knavvM6CmM5qAWrIcYHCX1j5PUgYBwJPwfaFAAbywkLl7pQaAkcA88FmXZms6Frgf8CUvwolYXaZIDTQkhz9qtDzwn43s/SGuq5e5u/Ewp70ZJcGmuZsgPX+zuOZCHGwosPy3V1eklzEALFE6ipqbw5EwwSc+3pToJvto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022361; c=relaxed/simple;
	bh=iLvxAtV0GyIug7+c8KSqivC30ssJqc2M42v3cI+ZvIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQvO3yefV164AAweG+fdbPdajkJ2BJNO/QS5llgkPnXflexKKQhomLig4yhl6W51Gqpj1TNoEmdtQ6UnBJLq/g6uiBNXlsK2YfmEPNvXDp2I+81K8fqTQ1DvBgJXVf1R3dFzHrcchlq5qf6aDlsFTLGWPnnfsLBPBVc1LRsTDGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtSb3KU4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtSb3KU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769022360; x=1800558360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iLvxAtV0GyIug7+c8KSqivC30ssJqc2M42v3cI+ZvIo=;
  b=JtSb3KU4DUgiJS0nMzlXrgz89Y0elTMWFgkqxfSChQAm8GyAScyNAVsh
   qF9vkHSqXbaY/VvgPPeYOTqk3H3vgfz0zCvRpnDAVtlO2xphJ6cL49nXJ
   6A4GO8T+CeOELpBz5Mx3XAB7o944SqJcjpC9gjizCMPwzrCyzHg2FJs2w
   LTLUsfCu5RDgZN7jotc0caQX/JeE5l6uwjgw8jxKcQUdJm0CTGLGSAbvX
   QV/6V5Au6WOagGUcNor7Mv2Ovt3k5ROaoglRUGkZW3bF0Q7g46ZHVYz/e
   TH5tqg1zzCjaBvQbOGCZQGFff5wcvn3h4Qv+rSmdtu6Q83objQ5I6+9I4
   A==;
X-CSE-ConnectionGUID: Wp5oPsiPSWS1oLCQ+G1XPw==
X-CSE-MsgGUID: iMszv5AkR6GZDvcYMXUAzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70228296"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="70228296"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 11:05:59 -0800
X-CSE-ConnectionGUID: cHeFCAckTty046zVKOXTXQ==
X-CSE-MsgGUID: uIrlLqLSTASDvhwQ18CjQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="210685079"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2026 11:05:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vidWd-00000000Rdx-09fk;
	Wed, 21 Jan 2026 19:05:55 +0000
Date: Thu, 22 Jan 2026 03:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <202601220225.L3boOv5a-lkp@intel.com>
References: <20260121060857.237777-1-acelan.kao@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121060857.237777-1-acelan.kao@canonical.com>

Hi Chia-Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.19-rc6 next-20260120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chia-Lin-Kao-AceLan/thunderbolt-Fix-PCIe-device-enumeration-with-delayed-rescan/20260121-141206
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20260121060857.237777-1-acelan.kao%40canonical.com
patch subject: [PATCH v2] thunderbolt: Fix PCIe device enumeration with delayed rescan
config: i386-buildonly-randconfig-001-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220225.L3boOv5a-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220225.L3boOv5a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220225.L3boOv5a-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thunderbolt/tb.c:119:6: warning: variable 'dev' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     119 |         if (!sw) {
         |             ^~~
   drivers/thunderbolt/tb.c:128:19: note: uninitialized use occurs here
     128 |         for_each_pci_dev(dev)
         |                          ^~~
   include/linux/pci.h:594:80: note: expanded from macro 'for_each_pci_dev'
     594 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   drivers/thunderbolt/tb.c:119:2: note: remove the 'if' if its condition is always true
     119 |         if (!sw) {
         |         ^~~~~~~~
   drivers/thunderbolt/tb.c:112:21: note: initialize the variable 'dev' to silence this warning
     112 |         struct pci_dev *dev;
         |                            ^
         |                             = NULL
>> drivers/thunderbolt/tb.c:2384:6: warning: variable 'dev' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2384 |         if (tb->nhi && tb->nhi->pdev && tb->nhi->pdev->bus) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/tb.c:2392:20: note: uninitialized use occurs here
    2392 |                 for_each_pci_dev(dev)
         |                                  ^~~
   include/linux/pci.h:594:80: note: expanded from macro 'for_each_pci_dev'
     594 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   drivers/thunderbolt/tb.c:2384:2: note: remove the 'if' if its condition is always false
    2384 |         if (tb->nhi && tb->nhi->pdev && tb->nhi->pdev->bus) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2385 |                 struct pci_bus *bus = tb->nhi->pdev->bus;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2386 |                 struct pci_bus *scan_bus = bus->parent ? bus->parent : bus;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2387 |                 struct tb_pci_rescan_work *rescan_work;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2388 |                 struct pci_dev *dev;
         |                 ~~~~~~~~~~~~~~~~~~~~
    2389 |                 int devices_before = 0;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~
    2390 | 
    2391 |                 pci_lock_rescan_remove();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
    2392 |                 for_each_pci_dev(dev)
         |                 ~~~~~~~~~~~~~~~~~~~~~
    2393 |                         devices_before++;
         |                         ~~~~~~~~~~~~~~~~~
    2394 |                 pci_unlock_rescan_remove();
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2395 | 
    2396 |                 rescan_work = kmalloc(sizeof(*rescan_work), GFP_KERNEL);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2397 |                 if (!rescan_work)
         |                 ~~~~~~~~~~~~~~~~~
    2398 |                         return 0;
         |                         ~~~~~~~~~
    2399 | 
   drivers/thunderbolt/tb.c:2388:22: note: initialize the variable 'dev' to silence this warning
    2388 |                 struct pci_dev *dev;
         |                                    ^
         |                                     = NULL
   2 warnings generated.


vim +119 drivers/thunderbolt/tb.c

    97	
    98	static void tb_scan_port(struct tb_port *port);
    99	static void tb_handle_hotplug(struct work_struct *work);
   100	static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port,
   101					       const char *reason);
   102	static void tb_queue_dp_bandwidth_request(struct tb *tb, u64 route, u8 port,
   103						  int retry, unsigned long delay);
   104	
   105	static void tb_pci_rescan_work_fn(struct work_struct *work)
   106	{
   107		struct tb_pci_rescan_work *rescan_work =
   108			container_of(work, typeof(*rescan_work), work.work);
   109		struct tb *tb = rescan_work->tb;
   110		struct pci_bus *bus = rescan_work->bus;
   111		int devices_after = 0;
   112		struct pci_dev *dev;
   113		struct tb_switch *sw;
   114		struct tb_port *port;
   115	
   116		mutex_lock(&tb->lock);
   117	
   118		sw = tb_switch_find_by_route(tb, rescan_work->route);
 > 119		if (!sw) {
   120			tb_dbg(tb, "Switch at route %llx disappeared, skipping rescan\n",
   121			       rescan_work->route);
   122			goto out_unlock;
   123		}
   124	
   125		port = &sw->ports[rescan_work->port];
   126	
   127		pci_lock_rescan_remove();
   128		for_each_pci_dev(dev)
   129			devices_after++;
   130		pci_unlock_rescan_remove();
   131	
   132		if (devices_after > rescan_work->devices_before) {
   133			tb_port_dbg(port, "pciehp enumerated %d new device(s)\n",
   134				    devices_after - rescan_work->devices_before);
   135		} else {
   136			tb_port_info(port, "pciehp failed to enumerate devices, triggering rescan\n");
   137	
   138			pci_lock_rescan_remove();
   139			pci_rescan_bus(bus);
   140	
   141			devices_after = 0;
   142			for_each_pci_dev(dev)
   143				devices_after++;
   144			pci_unlock_rescan_remove();
   145	
   146			if (devices_after > rescan_work->devices_before)
   147				tb_port_info(port, "rescan found %d new device(s)\n",
   148					     devices_after - rescan_work->devices_before);
   149			else
   150				tb_port_warn(port, "no devices found even after rescan\n");
   151		}
   152	
   153		tb_switch_put(sw);
   154	out_unlock:
   155		mutex_unlock(&tb->lock);
   156		kfree(rescan_work);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
