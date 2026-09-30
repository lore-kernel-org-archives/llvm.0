Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB64F3EB1;
	Wed, 30 Sep 2026 13:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774470; cv=none; b=qU3ty0BImVY6bnMvSPcmJjbnYOmoIZem4JHLS6rRuMPUljTdcPCSsJO5PqtofhB5YgoYeIDbQRGuLZ6Bvk0OexNmtjcjXjbYK7qsl+Aa1Aqx/EK/LU5tvkb1sEztdxUrkxHi8KdY0PFI1ly6LMUhSWCbK3OfQhSrwbUfn8Gvm9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774470; c=relaxed/simple;
	bh=05Y3rDlW0GwATYTSZeMsPJQxLlqAMrz0/pMyV/L54js=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jUYTBeTx+vOhd9IvDCZWqz4dESWWnNP5ZHxKtjcev0EQGH8GaW7gP8zpV3as28l59ak9P86X+AcOw1Ac6iEtXegPXv31q+JJOL2LVv+SMdfBUhVor0wVvI+Xj9qWKTinPH2B0IquN4wlaeKbHXPY+ttKYeLiKg5A8ZJUbCFlN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeaFYOex; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeaFYOex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790774462; x=1822310462;
  h=date:from:to:cc:subject:message-id;
  bh=05Y3rDlW0GwATYTSZeMsPJQxLlqAMrz0/pMyV/L54js=;
  b=OeaFYOexjIEkoROTM5UBWf6KhGnHaV3eocSFNQakJ7OvHnnh1u/z2TuD
   W6Eb4a5Tgo8UBJDw9Mdtwn/LuZ05ulmiC5RwmiKXdW4WKWiNqfP8kvNbD
   dwrPP0Mby9Vq1eD3DfsJ+1qQi+f2G5dmW3FpqwqGWFF2FVH2HFOXRddKb
   ohS9pr9UKgNO148PxmbsrRao217HteUyU0c+oqGt5XCDJr5RDCu7EBBwp
   AyJo7Hbg+GdVtV6jLUWvucUBut9T5pUPf7qZLqUupO6wyaFn6+9VCqa+I
   kKdz1gTmLyBv38aZ2FtDeWOgynv13c0xfd70TF6NbeROs86n0MIK/Nfoj
   Q==;
X-CSE-ConnectionGUID: MKKdysMiT5iqLnoXQnpgqA==
X-CSE-MsgGUID: MEHVRtDDQG2oK2ThjrOZmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107896977"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="107896977"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 06:20:34 -0700
X-CSE-ConnectionGUID: /yLngiPDT0+q9FxizVYzpg==
X-CSE-MsgGUID: jkagRzs+R9iYBBDgN4X7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274806163"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 06:20:33 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBuEX-000000001sf-44wk;
	Wed, 30 Sep 2026 13:20:29 +0000
Date: Wed, 30 Sep 2026 15:19:55 +0200
From: kernel test robot <lkp@intel.com>
To: Benjamin Block <bblock@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: arch/s390/pci/pci_bus.c:312:3: warning: calling function
 'zpci_bus_put' requires holding mutex 'pci_rescan_remove_lock' exclusively
Message-ID: <202609301529.u3dcGRKQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Benjamin-Block/PCI-IOV-Make-pci_lock_rescan_remove-reentrant-and-protect-sriov_add_vfs-sriov_del_vfs/20260924-182927
head:   ca5e1336f1cf45fbd7a38048643bceed16b522a9
commit: ca5e1336f1cf45fbd7a38048643bceed16b522a9 s390/pci: Fix circular/recursive deadlocks in PCI-bus and -device release
date:   6 days ago
config: s390-randconfig-2000-20260930 (https://download.01.org/0day-ci/archive/20260930/202609301529.u3dcGRKQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1f84168f595dab2e23aab4181997da0a7f486dc7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301529.u3dcGRKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301529.u3dcGRKQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/pci/pci_bus.c:312:3: warning: calling function 'zpci_bus_put' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
     312 |                 zpci_bus_put(curp);
         |                 ^
   arch/s390/pci/pci_bus.c:445:3: warning: calling function 'zpci_bus_put' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
     445 |                 zpci_bus_put(zbus);
         |                 ^
   arch/s390/pci/pci_bus.c:473:2: warning: calling function 'zpci_bus_put' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
     473 |         zpci_bus_put(zbus);
         |         ^
   arch/s390/pci/pci_bus.c:483:2: warning: calling function 'zpci_bus_put' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
     483 |         zpci_bus_put(zbus);
         |         ^
   4 warnings generated.
--
>> arch/s390/pci/pci.c:638:2: warning: calling function 'zpci_zdev_put' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
     638 |         zpci_zdev_put(zdev);
         |         ^
   arch/s390/pci/pci.c:979:2: warning: calling function 'zpci_zdev_put' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
     979 |         zpci_zdev_put(zdev);
         |         ^
>> arch/s390/pci/pci.c:1000:3: warning: calling function 'zpci_cleanup_bus_resources' requires holding mutex 'pci_rescan_remove_lock' exclusively [-Wthread-safety-analysis]
    1000 |                 zpci_cleanup_bus_resources(zdev);
         |                 ^
   3 warnings generated.


vim +312 arch/s390/pci/pci_bus.c

44510d6fa0c00a Pierre Morel   2020-04-22  276  
4cb92fa763823d Benjamin Block 2025-12-05  277  /**
4cb92fa763823d Benjamin Block 2025-12-05  278   * zpci_bus_get_next - get the next zbus object from given position in the list
4cb92fa763823d Benjamin Block 2025-12-05  279   * @pos:	current position/cursor in the global zbus list
4cb92fa763823d Benjamin Block 2025-12-05  280   *
4cb92fa763823d Benjamin Block 2025-12-05  281   * Acquires and releases references as the cursor iterates (might also free/
4cb92fa763823d Benjamin Block 2025-12-05  282   * release the cursor). Is tolerant of concurrent operations on the list.
4cb92fa763823d Benjamin Block 2025-12-05  283   *
4cb92fa763823d Benjamin Block 2025-12-05  284   * To begin the iteration, set *@pos to %NULL before calling the function.
4cb92fa763823d Benjamin Block 2025-12-05  285   *
4cb92fa763823d Benjamin Block 2025-12-05  286   * *@pos is set to %NULL in cases where either the list is empty, or *@pos is
4cb92fa763823d Benjamin Block 2025-12-05  287   * the last element in the list.
4cb92fa763823d Benjamin Block 2025-12-05  288   *
4cb92fa763823d Benjamin Block 2025-12-05  289   * Context: Process context. May sleep.
4cb92fa763823d Benjamin Block 2025-12-05  290   */
4cb92fa763823d Benjamin Block 2025-12-05  291  void zpci_bus_get_next(struct zpci_bus **pos)
4cb92fa763823d Benjamin Block 2025-12-05  292  {
4cb92fa763823d Benjamin Block 2025-12-05  293  	struct zpci_bus *curp = *pos, *next = NULL;
4cb92fa763823d Benjamin Block 2025-12-05  294  
4cb92fa763823d Benjamin Block 2025-12-05  295  	mutex_lock(&zbus_list_lock);
4cb92fa763823d Benjamin Block 2025-12-05  296  	if (curp)
4cb92fa763823d Benjamin Block 2025-12-05  297  		next = list_next_entry(curp, bus_next);
4cb92fa763823d Benjamin Block 2025-12-05  298  	else
4cb92fa763823d Benjamin Block 2025-12-05  299  		next = list_first_entry(&zbus_list, typeof(*curp), bus_next);
4cb92fa763823d Benjamin Block 2025-12-05  300  
4cb92fa763823d Benjamin Block 2025-12-05  301  	if (list_entry_is_head(next, &zbus_list, bus_next))
4cb92fa763823d Benjamin Block 2025-12-05  302  		next = NULL;
4cb92fa763823d Benjamin Block 2025-12-05  303  
4cb92fa763823d Benjamin Block 2025-12-05  304  	if (next)
4cb92fa763823d Benjamin Block 2025-12-05  305  		__zpci_bus_get(next);
4cb92fa763823d Benjamin Block 2025-12-05  306  
4cb92fa763823d Benjamin Block 2025-12-05  307  	*pos = next;
4cb92fa763823d Benjamin Block 2025-12-05  308  	mutex_unlock(&zbus_list_lock);
4cb92fa763823d Benjamin Block 2025-12-05  309  
4cb92fa763823d Benjamin Block 2025-12-05  310  	/* zpci_bus_put() might drop refcount to 0 and locks zbus_list_lock */
4cb92fa763823d Benjamin Block 2025-12-05  311  	if (curp)
4cb92fa763823d Benjamin Block 2025-12-05 @312  		zpci_bus_put(curp);
4cb92fa763823d Benjamin Block 2025-12-05  313  }
4cb92fa763823d Benjamin Block 2025-12-05  314  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
