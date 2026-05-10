Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFECE35C1A0;
	Sun, 10 May 2026 06:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778395003; cv=none; b=PDSIjpHahPZSLMZRr/tUE84n0xn5ca7DuaXQyUoD7yPj05oPi2+ozN4b7LLoVuyIo8Kr2xoPgExpCpfnvqhghmvywhKHWSGggT/wbgTZMWyoK6xDmKYkUZ6TbLjlmtyzYMYJKschSc2wlEHmTiBeIJa3k0d2oFpBDsqRwaurer0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778395003; c=relaxed/simple;
	bh=F9Qp8N7CMbD27kM7ke/BcqclJebu2aF6bfTdSszks/0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iyd4dxMecpEK/DEEg05+cl/4gTMEd956SOC1sRM2FEpgU5rQlCKM2BkROuprTsrh0a8uStNSkjdIZstbFnyl4yyxxhd0+4ofzhGxZxqbcrJzq0ul9iGptRCPPBIZARJ49c1h980AfIx8g7DAj8e1/6y+UZJ6xL4aG/dtJ1wavFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HW0FWZx9; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HW0FWZx9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778395001; x=1809931001;
  h=date:from:to:cc:subject:message-id;
  bh=F9Qp8N7CMbD27kM7ke/BcqclJebu2aF6bfTdSszks/0=;
  b=HW0FWZx9Cse1wd38DdJoJC2pbB8iUd8vGVIk0JfRp89SCTcYjoHbUc5S
   tYoy93L4owHEFat75rvRBtAXVqC80vT6CFbZ9CsRYDXy+5cC/htY36B0p
   N7ur3q3aOkBoJmRYZlTzpB1FWV663HIFTbtgRtWYHyxjDCgcpj6KO0wNs
   LRS+8LiZDttVrQxuBRSq5EbUIN+o1Iy3YwN/Oh5vThAcq6w8wamfrvi0L
   GuaZpnjq76CB3J/gh5LmWiOOF+WiiJVvSo6qOyeriKKh5jnhLwgGJFjDS
   1ZOHcUxiWiZfi5728ns5To1MDI+evunpkzXKPY69O4AkHjlBRsHZ9WSwk
   A==;
X-CSE-ConnectionGUID: IGY/CkAcRiqYx6SvApbxXg==
X-CSE-MsgGUID: 0QamVJt7TfG2AzD856kl8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="90695292"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="90695292"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 23:36:40 -0700
X-CSE-ConnectionGUID: uVbW+rACRDmNvU+h7rLAjQ==
X-CSE-MsgGUID: uauKfBYQQjGklH3HO+nzoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="232679270"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 May 2026 23:36:38 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLxmG-000000007fB-1ovH;
	Sun, 10 May 2026 06:36:36 +0000
Date: Sun, 10 May 2026 08:35:42 +0200
From: kernel test robot <lkp@intel.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/ata/libata-pmp.c:595:3: error: invalid argument type
 'struct work_struct' to unary expression
Message-ID: <202605100824.ICLrBkCZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Niklas-Cassel/ata-libata-scsi-do-not-use-the-deferred-QC-feature-on-PMPs-with-CBS/20260510-083938
head:   f7b32ede283da1d05e06942112793f0b352b16b3
commit: f7b32ede283da1d05e06942112793f0b352b16b3 ata: libata-scsi: do not needlessly defer commands when using PMP with FBS
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260510/202605100824.ICLrBkCZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100824.ICLrBkCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100824.ICLrBkCZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ata/libata-pmp.c:595:3: error: invalid argument type 'struct work_struct' to unary expression
     595 |                 WARN_ON(tlink->deferred_qc_work);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:23: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                              ^~~~~~~~~~~~
   1 error generated.


vim +595 drivers/ata/libata-pmp.c

   568	
   569	/**
   570	 *	sata_pmp_detach - detach a SATA PMP device
   571	 *	@dev: SATA PMP device to detach
   572	 *
   573	 *	Detach SATA PMP device @dev.  This function is also
   574	 *	responsible for deconfiguring PMP links.
   575	 *
   576	 *	LOCKING:
   577	 *	Kernel thread context (may sleep).
   578	 */
   579	static void sata_pmp_detach(struct ata_device *dev)
   580	{
   581		struct ata_link *link = dev->link;
   582		struct ata_port *ap = link->ap;
   583		struct ata_link *tlink;
   584		unsigned long flags;
   585	
   586		ata_dev_info(dev, "Port Multiplier detaching\n");
   587	
   588		WARN_ON(!ata_is_host_link(link) || dev->devno ||
   589			link->pmp != SATA_PMP_CTRL_PORT);
   590	
   591		if (ap->ops->pmp_detach)
   592			ap->ops->pmp_detach(ap);
   593	
   594		ata_for_each_link(tlink, ap, EDGE) {
 > 595			WARN_ON(tlink->deferred_qc_work);
   596			cancel_work_sync(&tlink->deferred_qc_work);
   597			ata_eh_detach_dev(tlink->device);
   598		}
   599	
   600		spin_lock_irqsave(ap->lock, flags);
   601		ap->nr_pmp_links = 0;
   602		link->pmp = 0;
   603		spin_unlock_irqrestore(ap->lock, flags);
   604	}
   605	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
