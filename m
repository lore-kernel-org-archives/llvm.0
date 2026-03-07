Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8328852B;
	Sat,  7 Mar 2026 06:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772864690; cv=none; b=gkDthOH4UaehiQOSC3zHd3tYxJveD020IyaaTc+r6JIPoJX1VmLN9cagLmyobFxolBtR+FmBklnnYFY7FsVdJacCQTgelpfSSLwhJorxXAx/senzfzkX6pbk8QR7TrzY7WsJb4GwB7ohE9idNIC0pWcN7ZrIbSmSr86mh+mRMFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772864690; c=relaxed/simple;
	bh=F1p8d40hA31dsgxW43gX/RjftpDQ5kE1wlQB1LtBUVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5PXohNadGtxbUtEwQSq+Yo2HsYTObgAZawy8GdFDEMxhmqKYtlA+L4usCSDnoxX3cxSGX6Ih3hP/VoH4FqBgm7QsKNbXdyrggJCiyQ65INxuNfNzCoIP10AG/Aj0RTYwxYdPtaJ6sraFXGrJMyJJPpDcU34S4Hj5me/IXL67bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jj4+fsry; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jj4+fsry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772864689; x=1804400689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F1p8d40hA31dsgxW43gX/RjftpDQ5kE1wlQB1LtBUVk=;
  b=Jj4+fsryRBldT02RqppuiYJqF64VHmsKu1MhOSOv9kE25NFRFPEy67SL
   g+OijG9RzjQmjSbQ18od+zP3NoQnv/NIbj0aCARv5gzBvSNM/LAEhkOoJ
   +wKSJAwTizPS3PBRTovGEa55uwxiwMtwXFLRYtt35IKzNFoVPsaiEPHiM
   UVU2C6r1wRmbrWGCe7Bp7vXaMcamy3Z1qa/ACJndpB7HdJKw8YLduE9PB
   Q0GwpqJaS4fTwmkC8MC8xRZQ4Xbd1SJHwdydCTPDP93p2h9NOz29j3Mg2
   VlfBAVcEOs5EJgeoAvjmWThcqiEBPZs5B2qMdfVVQ/4gJJ4maia+oObZ0
   g==;
X-CSE-ConnectionGUID: qCMJHdbLSf+WX+kMYwId7w==
X-CSE-MsgGUID: fHpnhb8nQjmN3Ga9i8ylWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="91543752"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="91543752"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 22:24:48 -0800
X-CSE-ConnectionGUID: YXjD98BGTLmzOfKlRnE4Vg==
X-CSE-MsgGUID: TfRVbod+Q0us5b9MlmFjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="218378244"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Mar 2026 22:24:46 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyl5f-000000001lR-3lFy;
	Sat, 07 Mar 2026 06:24:43 +0000
Date: Sat, 7 Mar 2026 14:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] PCI: Work around CXL Port PM Init failure when ACS
 SV enabled
Message-ID: <202603071429.J91G5AVd-lkp@intel.com>
References: <20260306195232.388814-1-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306195232.388814-1-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus cxl/next linus/master v7.0-rc2 next-20260305]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/PCI-Work-around-CXL-Port-PM-Init-failure-when-ACS-SV-enabled/20260307-035826
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20260306195232.388814-1-fabio.m.de.francesco%40linux.intel.com
patch subject: [RFC PATCH] PCI: Work around CXL Port PM Init failure when ACS SV enabled
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603071429.J91G5AVd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071429.J91G5AVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071429.J91G5AVd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/pci.c:4883:6: warning: no previous prototype for function 'cxl_sbr_masked' [-Wmissing-prototypes]
    4883 | bool cxl_sbr_masked(struct pci_dev *dev)
         |      ^
   drivers/pci/pci.c:4883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4883 | bool cxl_sbr_masked(struct pci_dev *dev)
         | ^
         | static 
   1 warning generated.


vim +/cxl_sbr_masked +4883 drivers/pci/pci.c

  4882	
> 4883	bool cxl_sbr_masked(struct pci_dev *dev)
  4884	{
  4885		u16 dvsec, reg;
  4886		int rc;
  4887	
  4888		dvsec = cxl_port_dvsec(dev);
  4889		if (!dvsec)
  4890			return false;
  4891	
  4892		rc = pci_read_config_word(dev, dvsec + PCI_DVSEC_CXL_PORT_CTL, &reg);
  4893		if (rc || PCI_POSSIBLE_ERROR(reg))
  4894			return false;
  4895	
  4896		/*
  4897		 * Per CXL spec r3.1, sec 8.1.5.2, when "Unmask SBR" is 0, the SBR
  4898		 * bit in Bridge Control has no effect.  When 1, the Port generates
  4899		 * hot reset when the SBR bit is set to 1.
  4900		 */
  4901		if (reg & PCI_DVSEC_CXL_PORT_CTL_UNMASK_SBR)
  4902			return false;
  4903	
  4904		return true;
  4905	}
  4906	EXPORT_SYMBOL_NS_GPL(cxl_sbr_masked, "CXL");
  4907	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
