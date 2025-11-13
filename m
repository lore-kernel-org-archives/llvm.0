Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA6D304BC5;
	Thu, 13 Nov 2025 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009608; cv=none; b=LwQBnIccT9W/BiOQ4kIKjIJTeVlJ/ZySGZENYkjFQ38WfpIRa5e2LjviypDxYC4n1zpTIK7f2C87r+/UrhXvGjRsnVLex1SwgebhBGjB1BUENUzIPYaNcp+M/JI31gRvyWdgS1Qi/wV83wYt+Ua3QpWmnacNi/y+zqQ+4upnmUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009608; c=relaxed/simple;
	bh=MDTy5l7zBehoe+SZ4+HdMgrSU8NN3NUhiMGEUnkraTU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pmUZ6oUizM1GRQb8uROGA8kflGvDCDHlDqZ8AxBnR8GTTMcA35PoHHsk5rFncF91Vu065IOjpvVLVDFqNJXGJywX8DYAd8oGiwaub/2HMbfwk69D3E3s1LUOXUwhYI2t/lSYNfdYP0LiFLvSUaTMlVAP3yxI0JHEs8GyDKfem0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTF8Mmkh; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTF8Mmkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009607; x=1794545607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MDTy5l7zBehoe+SZ4+HdMgrSU8NN3NUhiMGEUnkraTU=;
  b=hTF8Mmkhno7kDQ3uCmFV9KXdfZcNmaOesh1fjJeqiUt3j/jmGovIhIFp
   GCjs1S1TNEvNQFv+eaY38yJjFnG6jS43jHdgL9b6fxzej5B2lBkZZTbRE
   PUd0c+cQ3Kcvck4tXdB6Ou3qbSIvUi3HgC8FmxI2e5VXNhTXDU1tlgeOY
   nsP2aTwZxmm0gq6YuZ2DGVAa15S6O8e/esDhKvI9DrzwtkHZis1pwafBw
   PtQvuzGYkDilAL1YleKQGQ7Gzsbs6VeJmpc4LoJb1toQhjcyD+q3+fSJV
   DhRiEmBUO8bivMZQN9hN52v9iWJUxZEi/lb/OV1K+05n8T8d5S9w7I/By
   Q==;
X-CSE-ConnectionGUID: BmkKByBYTxeaCKVUFh/Nxg==
X-CSE-MsgGUID: z6vobuONT0ebU0AuSb4vug==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82480078"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="82480078"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:24 -0800
X-CSE-ConnectionGUID: rijXJvZUSse0BSAmNvPBpQ==
X-CSE-MsgGUID: tODqS8BESkOR7W5dEGWH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="189415463"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Nov 2025 20:53:21 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004uO-1s;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>
Subject: [pci:for-linus 6/6] drivers/pci/quirks.c:2528:56: error: use of
 undeclared identifier 'quirk_disable_aspm_l0s_l1_cap'; did you mean
 'quirk_disable_aspm_l0s_l1'?
Message-ID: <202511131032.6htiMYJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
head:   c478e1774359af6039f586f0a49280cfe180a21b
commit: c478e1774359af6039f586f0a49280cfe180a21b [6/6] PCI/ASPM: Avoid L0s and L1 on Hi1105 [19e5:1105] Wi-Fi
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131032.6htiMYJT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131032.6htiMYJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131032.6htiMYJT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/quirks.c:2528:56: error: use of undeclared identifier 'quirk_disable_aspm_l0s_l1_cap'; did you mean 'quirk_disable_aspm_l0s_l1'?
    2528 | DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HUAWEI, 0x1105, quirk_disable_aspm_l0s_l1_cap);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                        quirk_disable_aspm_l0s_l1
   include/linux/pci.h:2362:40: note: expanded from macro 'DECLARE_PCI_FIXUP_HEADER'
    2362 |                 hook, vendor, device, PCI_ANY_ID, 0, hook)
         |                                                      ^~~~
   include/linux/pci.h:2321:43: note: expanded from macro 'DECLARE_PCI_FIXUP_SECTION'
    2321 |                 = { vendor, device, class, class_shift, hook };
         |                                                         ^~~~
   drivers/pci/quirks.c:2514:13: note: 'quirk_disable_aspm_l0s_l1' declared here
    2514 | static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
         |             ^
   1 error generated.


vim +2528 drivers/pci/quirks.c

  2519	
  2520	/*
  2521	 * ASM1083/1085 PCIe-PCI bridge devices cause AER timeout errors on the
  2522	 * upstream PCIe root port when ASPM is enabled. At least L0s mode is affected;
  2523	 * disable both L0s and L1 for now to be safe.
  2524	 */
  2525	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
  2526	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
  2527	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_PASEMI, 0xa002, quirk_disable_aspm_l0s_l1);
> 2528	DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_HUAWEI, 0x1105, quirk_disable_aspm_l0s_l1_cap);
  2529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
