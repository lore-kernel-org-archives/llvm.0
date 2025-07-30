Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B256B4A32;
	Wed, 30 Jul 2025 04:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753850412; cv=none; b=SMbWBC7L29Ag+T4DGMhQtsrAUHCSN0SOj1IRqSxlLZMTOTO4HPM0Q68ihOHbrushRJJxN37EOOFRyIrTDw33NwcXCpkQVQkhrR6XlSdoQgn1UkrnpUh/cw0Zwx46SSi2U8/NpUSHP8oTMcJt07YHw6blnNYXoLU8ov7/yrh7BCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753850412; c=relaxed/simple;
	bh=hkMWIKMTPKKRQ6pNfnK9C0upvC4hCgTq62S8A7hC+ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kD+x0YieBTvMBLy06ahR/UB/QNQE4COrG2NO5tqfc1ZO4gOe74nye5VaIzUu62CZrU+gaLrIcyhXJefhhHNntFGvl3d9WQqaB59ZR6QUvEpte5Rx79bsvcL59ih6oBI5iI7P/fdlGegOZHdDHX6L2EKmh/lTfmy1Rz5+EvfVyNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dp28NGZW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dp28NGZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753850411; x=1785386411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hkMWIKMTPKKRQ6pNfnK9C0upvC4hCgTq62S8A7hC+ok=;
  b=dp28NGZWjH+Bmz+B0N+Q9wgje7eFlcDzr1gtXR8NQeODZw/XTrSRVjY4
   +cpGt+cUA7iQhlxzqEClpv3O7eVCjn9H4jdyVVZCdBqn54IHOoRei5O9Z
   cjvmo1FZRLsN6gVn8PQE5hygTith/gnUrRDibeHL7PiyB52sj2zj52gB1
   bOwysi5P/c9627aqUxRdnamprFgIsBycvgBfaMM3lSM6TdfBJiCT2PE3l
   xAqcioG1ead68stc758+KfokUIssv6+kciTOEdIiILx3eYosALPzco75o
   WirM6xwjzYfkvhz81EVx80MNioavqD89nDw78TFNW3MGhQauhe6GtBkLo
   Q==;
X-CSE-ConnectionGUID: M8TmkauxSY6HTG8Nzpjyog==
X-CSE-MsgGUID: AF06BZK0SUuZyltKEcrxoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="56227111"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="56227111"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 21:40:10 -0700
X-CSE-ConnectionGUID: x/fCiR0uQOK97PWWFrfugg==
X-CSE-MsgGUID: mthQqjgMRamxiNGMd7+YKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="163227890"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Jul 2025 21:40:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugybl-000222-12;
	Wed, 30 Jul 2025 04:40:05 +0000
Date: Wed, 30 Jul 2025 12:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Kiran K <kiran.k@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Paul Menzel <pmenzel@molgen.mpg.de>
Subject: [linux-next:master 12104/12680]
 drivers/bluetooth/btintel_pcie.c:2674:29: error: use of undeclared
 identifier 'btintel_pcie_pm_ops'; did you mean 'btintel_pcie_in_op'?
Message-ID: <202507301232.1I9zKeml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   54efec8782214652b331c50646013f8526570e8d
commit: d1b3de23042b0aac0145fdf071d6ac81ec3727b4 [12104/12680] Bluetooth: btintel_pcie: Add support for _suspend() / _resume()
config: loongarch-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507301232.1I9zKeml-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project bcd0d972247154336dd1321f1fded818e46671d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507301232.1I9zKeml-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301232.1I9zKeml-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bluetooth/btintel_pcie.c:2674:29: error: use of undeclared identifier 'btintel_pcie_pm_ops'; did you mean 'btintel_pcie_in_op'?
    2674 |         .driver.pm = pm_sleep_ptr(&btintel_pcie_pm_ops),
         |                                    ^~~~~~~~~~~~~~~~~~~
         |                                    btintel_pcie_in_op
   include/linux/pm.h:472:65: note: expanded from macro 'pm_sleep_ptr'
     472 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                                                                 ^~~~
   include/linux/util_macros.h:136:38: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                            ^~~
   drivers/bluetooth/btintel_pcie.c:864:20: note: 'btintel_pcie_in_op' declared here
     864 | static inline bool btintel_pcie_in_op(struct btintel_pcie_data *data)
         |                    ^
>> drivers/bluetooth/btintel_pcie.c:2674:15: error: incompatible pointer types initializing 'const struct dev_pm_ops *' with an expression of type 'bool (*)(struct btintel_pcie_data *)' (aka '_Bool (*)(struct btintel_pcie_data *)') [-Werror,-Wincompatible-pointer-types]
    2674 |         .driver.pm = pm_sleep_ptr(&btintel_pcie_pm_ops),
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pm.h:472:28: note: expanded from macro 'pm_sleep_ptr'
     472 | #define pm_sleep_ptr(_ptr) PTR_IF(IS_ENABLED(CONFIG_PM_SLEEP), (_ptr))
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/util_macros.h:136:27: note: expanded from macro 'PTR_IF'
     136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +2674 drivers/bluetooth/btintel_pcie.c

  2668	
  2669	static struct pci_driver btintel_pcie_driver = {
  2670		.name = KBUILD_MODNAME,
  2671		.id_table = btintel_pcie_table,
  2672		.probe = btintel_pcie_probe,
  2673		.remove = btintel_pcie_remove,
> 2674		.driver.pm = pm_sleep_ptr(&btintel_pcie_pm_ops),
  2675	#ifdef CONFIG_DEV_COREDUMP
  2676		.driver.coredump = btintel_pcie_coredump
  2677	#endif
  2678	};
  2679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
