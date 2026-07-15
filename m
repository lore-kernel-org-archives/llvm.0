Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944BB346FAD;
	Wed, 15 Jul 2026 23:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784156513; cv=none; b=eaF7DGMiBoC83J1nvqNgNkeyJAgYdQAZmQBXQeLRlz/po40I6nBQGcPiUxNsCl3DecUl5Udna41xUFaUntEaNSgWkT+uUvLzm/UpnNlszBDEOHsPMiTYaf9sfbaIvRgWZ/rihubnTIJ0Q/R6uzC5Q1j01NtaEycDGvaHdckzYdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784156513; c=relaxed/simple;
	bh=pbpLMZKQ9vVqEQt0Ph3zMyy2nYXjk9R39ObJoqHatAA=;
	h=Date:From:Cc:Subject:Message-ID; b=rVCsZM0s4PQJWnh8cKmSXsjCRDHqD4WMCn3kVNOuFfN/DanAw7IWhu5udGPR+PE27vck3YbtiIfeJF3hjv1eXLD2DZHFhtC5KH0Y8qLKpXMOeV0IjzVxj77KA1iUr3svHz/WgDX8wUwzzxJgkYVdBeQf6VjX5CfiFesyN60Jo/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f15zp4Ii; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f15zp4Ii"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784156512; x=1815692512;
  h=date:from:cc:subject:message-id;
  bh=pbpLMZKQ9vVqEQt0Ph3zMyy2nYXjk9R39ObJoqHatAA=;
  b=f15zp4IicbWvEytEKeo5cAeAD4oEZczR6fc8yH5vTpEz3pc05gm/3G7X
   HpvfpXtMuJXX1ylDXAHoGZ4uwQmE5Cjx5UNbdpzj6fYTsYI7imNRIOyyj
   ++UM5Oi1tkFQuoQbn4EFntwvI5O/uyk1f25d6AytJdtuBfCtMamTdMPEr
   LgBhmU8g6PBsBDVF00FEz5MmUvv/NgPWaolNfrPolp+K5yz1y/OPeVRpC
   crchNJ+/knLZoGcb8OubECVgYSIMSemsLnXRaq0/uKklKeB+hZicH1tuQ
   09KrI0zxstRDMx97tC/Fe9IJrkqfgCww35+rEEr5Bf7zGtOl0fXWvVeH9
   w==;
X-CSE-ConnectionGUID: vlQb80VKSPuTol5sCc7Cqw==
X-CSE-MsgGUID: KgLtefzWQNWr8rjD6zIyQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="83795376"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="83795376"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 16:01:51 -0700
X-CSE-ConnectionGUID: N1ku6JjQTOe4kX8PWQ9V7w==
X-CSE-MsgGUID: +yW4emMORJegm8p/nRXwsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="260133887"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Jul 2026 16:01:50 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk8br-00000000O4Q-2Hbq;
	Wed, 15 Jul 2026 23:01:47 +0000
Date: Thu, 16 Jul 2026 07:00:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [pci:controller/cadence 4/4]
 drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:18: warning:
 conditional expression between different enumeration types ('enum
 cdns_pcie_hpa_ltssm' and 'enum cdns_pcie_lga_ltssm')
Message-ID: <202607160602.7AOJf7Sj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

CC: linux-pci@vger.kernel.org
TO: Hans Zhang <18255117159@163.com>
CC: Manivannan Sadhasivam <mani@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git controller/cadence
head:   d70e964dc099821f6c159d8f40aa7be2c62ecfd2
commit: d70e964dc099821f6c159d8f40aa7be2c62ecfd2 [4/4] PCI: cadence: Add LGA IP debugfs for LTSSM status
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260716/202607160602.7AOJf7Sj-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160602.7AOJf7Sj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160602.7AOJf7Sj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:18: warning: conditional expression between different enumeration types ('enum cdns_pcie_hpa_ltssm' and 'enum cdns_pcie_lga_ltssm') [-Wenum-compare-conditional]
     230 |                    pci->is_hpa ? hpa_ltssm : lga_ltssm);
         |                                ^ ~~~~~~~~~   ~~~~~~~~~
   1 warning generated.


vim +230 drivers/pci/controller/cadence/pcie-cadence-debugfs.c

   209	
   210	static int ltssm_status_show(struct seq_file *s, void *v)
   211	{
   212		struct cdns_pcie *pci = s->private;
   213		enum cdns_pcie_lga_ltssm lga_ltssm;
   214		enum cdns_pcie_hpa_ltssm hpa_ltssm;
   215		const char *str_ltssm;
   216		u32 val;
   217	
   218		if (pci->is_hpa) {
   219			val = cdns_pcie_hpa_readl(pci, REG_BANK_IP_REG,
   220						  CDNS_PCIE_HPA_PHY_DBG_STS_REG0);
   221			hpa_ltssm = FIELD_GET(CDNS_PCIE_HPA_LTSSM_STATUS_MASK, val);
   222			str_ltssm = cdns_pcie_hpa_ltssm_status_string(hpa_ltssm);
   223		} else {
   224			val = cdns_pcie_readl(pci, CDNS_PCIE_LM_BASE);
   225			lga_ltssm = FIELD_GET(CDNS_PCIE_LGA_LTSSM_STATUS_MASK, val);
   226			str_ltssm = cdns_pcie_lga_ltssm_status_string(lga_ltssm);
   227		}
   228	
   229		seq_printf(s, "%s (0x%02x)\n", str_ltssm,
 > 230			   pci->is_hpa ? hpa_ltssm : lga_ltssm);
   231	
   232		return 0;
   233	}
   234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
