Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF2E1E98EF;
	Sat, 31 Jan 2026 06:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769839433; cv=none; b=mf5x455+HKH0uJiktVWlgw/my4iLRjnJMO0yxK7lFGRkeNNBHMxOh1OP2LxQDM6x0Q4kDekk0OpFBZbgsCf4KDeuIElIkcv0QN3URL/Wniz4udjscVUCOc/TLIb6B16ILWjODOuWMMIVW6Itx/HxUKtyXwPiCTorBNe8Eic23nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769839433; c=relaxed/simple;
	bh=UosttGtbZ2MoYXmc0MprPx+pnbkkqwVxQAGz7Ln8sZ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uG9Zz7bv0jX97QAHFU5pm5ojffPKEfRIZScgaRPbCGvG1t9MGE/HhPAMoZ45C1+m+j0yZFoxsPxahwZWJmUhHqC50pOOn4L3f+DxYhS5arx8ZT5gYJNqbf1vkRtuNlIX2vNz/IyjqsJJiM95J0MQc4dL3E7HPJSEVTjqj47Pt/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fdcy9EtU; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fdcy9EtU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769839431; x=1801375431;
  h=date:from:to:cc:subject:message-id;
  bh=UosttGtbZ2MoYXmc0MprPx+pnbkkqwVxQAGz7Ln8sZ8=;
  b=Fdcy9EtUp0wHj/YvEEtF4dV2g0UJTAlhaQE8dPPZpGuO7z7nOCsb43da
   UpDQlQ/OVB777f721cczby8NQph5q/FSuXO8lRkXQeC9lxaqQS5ycXTg9
   /M0IiI27Ru/Z2mWFkpTQWKb3A0NaibDf0ewLEU/riHL7HMM4XiA5velOq
   mMvTN9Gf85h1K/uDpvPDFfAso2fIqBS7wzOwbnBHvyVB1A1L7S5dDEayT
   GEJ5AUkB06qkS2CxogIvFI2777dM4kRi8EU8A5qrs/PE2YovgXR0u+eg8
   nCZnwOa/5g4O7ykNIv60qxcZ4PyXWpswQOkmNTUkDYkxhjlALEXMxKRA3
   Q==;
X-CSE-ConnectionGUID: qabw9iPkSLC9NxWcp9lNtA==
X-CSE-MsgGUID: kqsZNA1fRV6sIRS8zB1Xcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="58667052"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="58667052"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 22:03:50 -0800
X-CSE-ConnectionGUID: fbme7Ss8SbCx9j7kV/Jt1g==
X-CSE-MsgGUID: 1+OQZCG7QXiPxamZkOoSVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="239739999"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 22:03:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm45B-00000000dhi-4B9H;
	Sat, 31 Jan 2026 06:03:45 +0000
Date: Sat, 31 Jan 2026 14:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommufd_noiommu 5/6]
 drivers/iommu/iommufd/ioas.c:388:45: error: incompatible pointer types
 passing '__u64 *' (aka 'unsigned long long *') to parameter of type
 'phys_addr_t *' (aka 'unsigned int *')
Message-ID: <202601311356.DzWUPM8d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jgunthorpe/linux iommufd_noiommu
head:   7786a2757eb91ada48627ce3c749705507a3cdd3
commit: 302d355a6e327aa415cb85ed0e5bf021cbb1f5b3 [5/6] iommufd: Add an ioctl IOMMU_IOAS_GET_PA to query PA from IOVA
config: i386-buildonly-randconfig-005-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311356.DzWUPM8d-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601311356.DzWUPM8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601311356.DzWUPM8d-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/iommufd/ioas.c:388:45: error: incompatible pointer types passing '__u64 *' (aka 'unsigned long long *') to parameter of type 'phys_addr_t *' (aka 'unsigned int *') [-Werror,-Wincompatible-pointer-types]
     388 |         rc = iopt_get_phys(&ioas->iopt, cmd->iova, &cmd->out_phys,
         |                                                    ^~~~~~~~~~~~~~
   drivers/iommu/iommufd/iommufd_private.h:123:17: note: passing argument to parameter 'paddr' here
     123 |                         phys_addr_t *paddr, u64 *length);
         |                                      ^
   1 error generated.


vim +388 drivers/iommu/iommufd/ioas.c

   377	
   378	int iommufd_ioas_get_pa(struct iommufd_ucmd *ucmd)
   379	{
   380		struct iommu_ioas_get_pa *cmd = ucmd->cmd;
   381		struct iommufd_ioas *ioas;
   382		int rc;
   383	
   384		ioas = iommufd_get_ioas(ucmd->ictx, cmd->ioas_id);
   385		if (IS_ERR(ioas))
   386			return PTR_ERR(ioas);
   387	
 > 388		rc = iopt_get_phys(&ioas->iopt, cmd->iova, &cmd->out_phys,
   389				   &cmd->out_length);
   390		if (rc)
   391			goto out_put;
   392	
   393		rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));
   394	out_put:
   395		iommufd_put_object(ucmd->ictx, &ioas->obj);
   396	
   397		return rc;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
