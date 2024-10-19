Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F9C190688;
	Sat, 19 Oct 2024 11:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729337253; cv=none; b=DFAhYqG9UBODboFomjiLJPctSj1JwAmel6nTBBQemjWWWaVM5Ya8bUetb5pV6Fqi9BY8BegvUmkyW1kexJVyblCZrqTy5tFRCKTfoa2BdKqhORhgOSQ5PzAwwbzpKhTDyQNZCXz8ARNvw5I8lnB6/6YB0GuYXCdKJLA+qZ2akCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729337253; c=relaxed/simple;
	bh=pijQNZSBTeZTeE0FiP4YiVUtT/+A1Dr/Rvv/n3DysKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hq86CTXrsqz0d7Yvp3Yr2050X/2eRSMwMdDk5DugPraETnsIuhiCza0mpSuUPw9Z7M3Wp/cn7ECYm7JJ2upYujpe/dByDhPVoJTOgiulV8lbJmGfW14MNqB0zGLAgAHwzW3pUIcqPw9o0LSn3Z2eSF5fo33c6sEMEw9ewzBtgao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ov706yF6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov706yF6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729337251; x=1760873251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pijQNZSBTeZTeE0FiP4YiVUtT/+A1Dr/Rvv/n3DysKc=;
  b=Ov706yF6XyIRseH5elRo8kyrxgipHtFIRbL7YNgNe6zqWollFIW05EmN
   Ahe/L+ppUX76MICRa4Vbwi7q/acbnlWPoCJigY5z7G+3iLE/qvJ4ad+DE
   hkGZHqusvF/w0YNbb5I4/5W6LAg4RjnaWKsGeM9KvFp5gyyh+Vf6leBhU
   PnLzC7bZOxZirN7BMeibeLT18tlJxOoKE0eZZWb29JKj1iJytFK+ItTx9
   07HEAkCEEkjLek999WBr37u0CV8lA+30cUR3ZPIOxXokEemjgF5vX7lrK
   oGyfBlD5KIbxf8JuUeDeURD5D+TZK6vMqkPXrucb52zEvluEutoFJCaSz
   A==;
X-CSE-ConnectionGUID: j6D3raZkQQqzEHgn8Ikh+g==
X-CSE-MsgGUID: gztP17uRRaWR4ZArY3UgBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="31729969"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="31729969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 04:27:31 -0700
X-CSE-ConnectionGUID: me8hvPDrQPyaIzdK4Q3S1A==
X-CSE-MsgGUID: xukNM0uBQ9KZDew/YACVvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="83724503"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Oct 2024 04:27:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t27cG-000Ovz-07;
	Sat, 19 Oct 2024 11:27:28 +0000
Date: Sat, 19 Oct 2024 19:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:smmuv3_nesting 16/17] drivers/iommu/intel/svm.c:614:10:
 error: incompatible integer to pointer conversion returning 'int' from a
 function with result type 'struct iommu_domain *'
Message-ID: <202410191934.kB3gdW2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   fa1528253d221071f2c743b194d5aebad4b55a93
commit: 5675560a272cf55e51613638426723221922c75a [16/17] iommu/vt-d: Check if SVA is supported when attaching the SVA domain
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241019/202410191934.kB3gdW2G-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191934.kB3gdW2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191934.kB3gdW2G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/svm.c:614:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct iommu_domain *' [-Wint-conversion]
     614 |                 return ret;
         |                        ^~~
   1 error generated.


vim +614 drivers/iommu/intel/svm.c

   605	
   606	struct iommu_domain *intel_svm_domain_alloc(struct device *dev,
   607						    struct mm_struct *mm)
   608	{
   609		struct dmar_domain *domain;
   610		int ret;
   611	
   612		ret = intel_iommu_sva_supported(dev);
   613		if (ret)
 > 614			return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
