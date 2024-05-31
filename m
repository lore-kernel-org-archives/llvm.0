Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B321C2E63B;
	Fri, 31 May 2024 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717178651; cv=none; b=aEdMbVYz2WpPJxZ8xmKop3ONKCyZeX+djo9uk3V7FpTduPr0tnJvxlzgxibSgcgEPykz5A2dKHGPmEugKQndEAbY5GAUPyrAID/rWIRJ7p7xVLXKRdxIT7QWXRwceHj7jGkjIatZZgcChughatDmwH/pTsj6gaUsOmMAxGlrF7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717178651; c=relaxed/simple;
	bh=iS76SNMt1Fn7/jcbstjD94UpQCTIO5QFNpZLI44q/UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1JDXG/yesFT8YgLC4D6fLFBgQu/WwW63n8bs6uMijNGsfndxP14zz4Qg8eEkMYoHg8eLO714XJUkH2daLOXgahIcdpoXbuy2YWCFGZTsF1E2gsmFviS+6diylmWCihewJlsMecq9EIsBuV4lXbT/QTQZcoQ2mhVkSqDiLU6ecg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOm+axFB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOm+axFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717178650; x=1748714650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iS76SNMt1Fn7/jcbstjD94UpQCTIO5QFNpZLI44q/UQ=;
  b=MOm+axFBichMvA1euLUVg/7vdd6l2yDMXszwc8n4S6/3t3paScVZuvc8
   SOU5eiiub3ml4e6nBVuCrnsNbqnoqe257R420ev0MES+ucg1dLMwTMGYa
   wB7JSCOjPzJwTCJl+2ccy53yYBasRp2bI7MvQghJxGybjUS6G1pF51ZbL
   kdtwG41Z7KnpZu34SnwUTunbZL9vDKRIOd2C08kVDRi6B1aoJOBMYXZww
   pEAyGmIkcDYFiUYHfkSuhiQULfiTfTfN52ma56Ies/G8ESvcp6ZYhwy51
   9ffIsHVV2o95s/9hFsLlKRqILdRsMmTJ849BPcSroH5CWO6jOrB98AC2r
   w==;
X-CSE-ConnectionGUID: DBrPFEZVTrmwLu7FFXVptQ==
X-CSE-MsgGUID: CWIi6x5oS/+CNQ6kmDStnQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="31264183"
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="31264183"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 11:04:09 -0700
X-CSE-ConnectionGUID: w9X68g+lR1yOtA3KLsdjlg==
X-CSE-MsgGUID: gEz0guTVSLSeNLEPjymT4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,205,1712646000"; 
   d="scan'208";a="36159799"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 31 May 2024 11:04:07 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sD6bl-000Hcz-29;
	Fri, 31 May 2024 18:04:05 +0000
Date: Sat, 1 Jun 2024 02:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: [intel-tdx:tdx_kvm_dev-2024-05-30 59/115]
 arch/x86/kvm/vmx/main.c:224:10: error: call to undeclared function
 'tdx_gmem_private_max_mapping_level'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202406010133.Yu2O9Air-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git tdx_kvm_dev-2024-05-30
head:   538d25a4d08a3dc487fc9be78bef09105ef54e27
commit: a3c36efd448bd3b25ee0cf2672f177ff603a6be6 [59/115] KVM: TDX: TDP MMU TDX support
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240601/202406010133.Yu2O9Air-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240601/202406010133.Yu2O9Air-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406010133.Yu2O9Air-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/main.c:224:10: error: call to undeclared function 'tdx_gmem_private_max_mapping_level'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     224 |                 return tdx_gmem_private_max_mapping_level(kvm, pfn);
         |                        ^
   arch/x86/kvm/vmx/main.c:224:10: note: did you mean 'vt_gmem_private_max_mapping_level'?
   arch/x86/kvm/vmx/main.c:221:12: note: 'vt_gmem_private_max_mapping_level' declared here
     221 | static int vt_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
         |            ^
     222 | {
     223 |         if (is_td(kvm))
     224 |                 return tdx_gmem_private_max_mapping_level(kvm, pfn);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        vt_gmem_private_max_mapping_level
   1 error generated.


vim +/tdx_gmem_private_max_mapping_level +224 arch/x86/kvm/vmx/main.c

   220	
   221	static int vt_gmem_private_max_mapping_level(struct kvm *kvm, kvm_pfn_t pfn)
   222	{
   223		if (is_td(kvm))
 > 224			return tdx_gmem_private_max_mapping_level(kvm, pfn);
   225	
   226		return 0;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
