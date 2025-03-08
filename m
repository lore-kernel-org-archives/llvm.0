Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C97F13B7A3;
	Sat,  8 Mar 2025 01:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741398856; cv=none; b=QtN7v2OJ14gXsDZBUx5l3nPSnqZCOE39YmHD/xTsXxmIo2fLqgGgbFGEnmfviG/uwgNIr/n4M89UEqHkIU+wY3jZp7aPeZk4UmUoap9IdcDR0UGKuJ1J66QWFTlw1Ivt2Jl5Z/2lQAjz85dykik4q2c4Zo7/0uKATN2lJ7QKGmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741398856; c=relaxed/simple;
	bh=fZu8llA9P1XjspsJVXkVUyO/JGv+jVF8RjMU7tBj6To=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Bn+esQUo6GHX1kAEPoqgaHikQ5anZyv/SERSBvZDWY9ClRC6YV3vNbV+ZS5VSvdz52KLX73ALzdtCmGdyFvsnK6pcpRp2C14vocpVByiptOhQ+5EP81woZKzY6AWJDucd0vFQ4mNoy0x3xOL60T+HHqx4KR994Srvual5bPMrb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GTaoHg0s; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTaoHg0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741398854; x=1772934854;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fZu8llA9P1XjspsJVXkVUyO/JGv+jVF8RjMU7tBj6To=;
  b=GTaoHg0sOZw+1A5+ZSXyto+ChYTs3kHufDJlEpen0Cs11JmrFYSM2GDu
   xf6EQ4mnivBihIPd0U+sbtMBUG6V5LkN5CHL9/Uu9ES0dbb76iz+N6VTx
   r8aZ3ZfBA0rjB+u53VFwVToyfYFEFb1yE3zQgBaBr7GyyidpTbj5TAd2e
   jwSCRteMulvs9tR6yLoAvN/aZzD8k8LnX21TdfOxe8stGDiheJmE8OggO
   DSC8utD+NHGOYFPT7NOfMDe7t17NwAAsWfE7JdhlauSYTqCBBHhJYcTM8
   xnzGUYcN4SMHUr0TVj7nO7s9SyUAJIVpgkQnU91FslRVf1Y/FoZMIjQnr
   g==;
X-CSE-ConnectionGUID: KFLbPBxzQIG0zOxbq11V3g==
X-CSE-MsgGUID: o78tvZQYTdKQfjXdHRn9fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="59867337"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="59867337"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 17:54:13 -0800
X-CSE-ConnectionGUID: ByRX0l9XQ3GF9xqjVELU2A==
X-CSE-MsgGUID: wzRWFM8qS2GKp9quMifyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; 
   d="scan'208";a="119655933"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2025 17:54:12 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqjOE-0001L2-00;
	Sat, 08 Mar 2025 01:54:10 +0000
Date: Sat, 8 Mar 2025 09:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irq/msi 9/11] drivers/pci/tph.c:307:38: error: use of
 undeclared identifier 'msix_idx'
Message-ID: <202503080952.nzeYvx81-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/msi
head:   3c18507c3399a1cedf7a102a03c28ffab3e785aa
commit: defb1c68db9bbe478ff9e59d0dcd70a9d0d1376f [9/11] PCI/TPH: Replace the broken MSI-X control word update
config: i386-buildonly-randconfig-005-20250308 (https://download.01.org/0day-ci/archive/20250308/202503080952.nzeYvx81-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080952.nzeYvx81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080952.nzeYvx81-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/tph.c:307:38: error: use of undeclared identifier 'msix_idx'
     307 |                 err = pci_msix_write_tph_tag(pdev, msix_idx, tag);
         |                                                    ^
   1 error generated.


vim +/msix_idx +307 drivers/pci/tph.c

   267	
   268	/**
   269	 * pcie_tph_set_st_entry() - Set Steering Tag in the ST table entry
   270	 * @pdev: PCI device
   271	 * @index: ST table entry index
   272	 * @tag: Steering Tag to be written
   273	 *
   274	 * Figure out the proper location of ST table, either in the MSI-X table or
   275	 * in the TPH Extended Capability space, and write the Steering Tag into
   276	 * the ST entry pointed by index.
   277	 *
   278	 * Return: 0 if success, otherwise negative value (-errno)
   279	 */
   280	int pcie_tph_set_st_entry(struct pci_dev *pdev, unsigned int index, u16 tag)
   281	{
   282		u32 loc;
   283		int err = 0;
   284	
   285		if (!pdev->tph_cap)
   286			return -EINVAL;
   287	
   288		if (!pdev->tph_enabled)
   289			return -EINVAL;
   290	
   291		/* No need to write tag if device is in "No ST Mode" */
   292		if (pdev->tph_mode == PCI_TPH_ST_NS_MODE)
   293			return 0;
   294	
   295		/*
   296		 * Disable TPH before updating ST to avoid potential instability as
   297		 * cautioned in PCIe r6.2, sec 6.17.3, "ST Modes of Operation"
   298		 */
   299		set_ctrl_reg_req_en(pdev, PCI_TPH_REQ_DISABLE);
   300	
   301		loc = get_st_table_loc(pdev);
   302		/* Convert loc to match with PCI_TPH_LOC_* */
   303		loc = FIELD_PREP(PCI_TPH_CAP_LOC_MASK, loc);
   304	
   305		switch (loc) {
   306		case PCI_TPH_LOC_MSIX:
 > 307			err = pci_msix_write_tph_tag(pdev, msix_idx, tag);
   308			break;
   309		case PCI_TPH_LOC_CAP:
   310			err = write_tag_to_st_table(pdev, index, tag);
   311			break;
   312		default:
   313			err = -EINVAL;
   314		}
   315	
   316		if (err) {
   317			pcie_disable_tph(pdev);
   318			return err;
   319		}
   320	
   321		set_ctrl_reg_req_en(pdev, pdev->tph_req_type);
   322	
   323		pci_dbg(pdev, "set steering tag: %s table, index=%d, tag=%#04x\n",
   324			(loc == PCI_TPH_LOC_MSIX) ? "MSI-X" : "ST", index, tag);
   325	
   326		return 0;
   327	}
   328	EXPORT_SYMBOL(pcie_tph_set_st_entry);
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
