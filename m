Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E0933120A;
	Sat, 11 Apr 2026 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775892319; cv=none; b=Ho8CqsrzqCT6rX3GEGs7t2Ec/fBa4BhDiofw8/BhwrVdP5SwIb5lOm4nliuXGVho4jvlI40fuNh4fZNUc5s4HQC3fjFkcIIS/dAsvBDK41kopgIvPl9pcV5TzCY6+jS420RlR1UJ0smcZELYyUz7KFDc/MnZf/9nzQUlvbHEhh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775892319; c=relaxed/simple;
	bh=bA8lFVRXNAj8gXregUWG8LmE7bLdLpsU9ajJldy6Ebc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FbYZ6WT5SDTly+AUXr0ROEI8TZME0+3HFc9xR8OrKRO1xpmreSpu4HevXyAOLH6F4Ljsmq1mqC8WTpZEka6IYc551l2nCopxcMaJ+aCFBJhvYYnok+N1jniVeW8EQdi+Jhn2oc4CiIBFIs3Nyf/vLOkTbZyPEkIh7fQIJ+t7zs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCK6d6Fe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCK6d6Fe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775892316; x=1807428316;
  h=date:from:to:cc:subject:message-id;
  bh=bA8lFVRXNAj8gXregUWG8LmE7bLdLpsU9ajJldy6Ebc=;
  b=LCK6d6FeSc7EvmO6R9RVqJXtzCl98KfYcQfMgekN9XW7HCWQk4TcnN01
   Qvfz/Mb3OaelTeDzouFKdci+6oxawzt8S+GyfMxcGlnJK7YFFs5AXbqoH
   lWe+IMxYn43BUAUeD9fl6Hpiv838loZm8GMFmqCYY0hTC71ciEfnfr/hQ
   YchiHHmxsLC5vTkpNEWt9/2seAKuP7ubeUJlEDoNmFoOBkHtj/QvnPLMi
   t54Uo1RPNe+Lf0n3d+1K6mxMekQIVyPW0pWFrUp3LohCKLYsx+ralDptZ
   VmSxZNmnic+aSJgJjF3bI8cqLdP5cdK6f6ucZEtyJwoiPKFG3ugN/nUOD
   A==;
X-CSE-ConnectionGUID: fGJZD2onTROYsXTWxF5XVw==
X-CSE-MsgGUID: CtNi1k6QQUiMlpjLg/NdAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="88292473"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="88292473"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 00:25:13 -0700
X-CSE-ConnectionGUID: SOPrGFqUQoabGqeohejjmg==
X-CSE-MsgGUID: fg6NU0U9QfOfRm9Rawsw/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229214861"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2026 00:25:12 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBSiL-000000000wx-2ysE;
	Sat, 11 Apr 2026 07:25:09 +0000
Date: Sat, 11 Apr 2026 15:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/vfio_kvm_file_refcount 1/1]
 drivers/s390/crypto/vfio_ap_ops.c:2061:43: error: incompatible pointer types
 passing 'struct file *' to parameter of type 'struct kvm *'
Message-ID: <202604111536.kYn2u1Pz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/vfio_kvm_file_refcount
head:   3088b9660354afa55c95eeec0bba6d939123ce06
commit: 3088b9660354afa55c95eeec0bba6d939123ce06 [1/1] tmp
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260411/202604111536.kYn2u1Pz-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111536.kYn2u1Pz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111536.kYn2u1Pz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/crypto/vfio_ap_ops.c:2061:43: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct kvm *' [-Wincompatible-pointer-types]
    2061 |         return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
         |                                                  ^~~~~~~~~
   drivers/s390/crypto/vfio_ap_ops.c:1822:17: note: passing argument to parameter 'kvm' here
    1822 |                                 struct kvm *kvm)
         |                                             ^
   1 error generated.
--
>> drivers/vfio/pci/vfio_pci_zdev.c:155:43: error: incompatible pointer types passing 'struct file *' to parameter of type 'struct kvm *' [-Wincompatible-pointer-types]
     155 |                 return zpci_kvm_hook.kvm_register(zdev, vdev->vdev.kvm);
         |                                                         ^~~~~~~~~~~~~~
   1 error generated.


vim +2061 drivers/s390/crypto/vfio_ap_ops.c

46a7263d4746a2 Tony Krowiak    2018-09-25  2052  
eb0feefd4c025b Jason Gunthorpe 2021-08-23  2053  static int vfio_ap_mdev_open_device(struct vfio_device *vdev)
258287c994de8f Tony Krowiak    2018-09-25  2054  {
eb0feefd4c025b Jason Gunthorpe 2021-08-23  2055  	struct ap_matrix_mdev *matrix_mdev =
eb0feefd4c025b Jason Gunthorpe 2021-08-23  2056  		container_of(vdev, struct ap_matrix_mdev, vdev);
258287c994de8f Tony Krowiak    2018-09-25  2057  
421cfe6596f6cb Matthew Rosato  2022-05-19  2058  	if (!vdev->kvm)
421cfe6596f6cb Matthew Rosato  2022-05-19  2059  		return -EINVAL;
258287c994de8f Tony Krowiak    2018-09-25  2060  
ce4b4657ff1892 Jason Gunthorpe 2022-07-19 @2061  	return vfio_ap_mdev_set_kvm(matrix_mdev, vdev->kvm);
258287c994de8f Tony Krowiak    2018-09-25  2062  }
258287c994de8f Tony Krowiak    2018-09-25  2063  

:::::: The code at line 2061 was first introduced by commit
:::::: ce4b4657ff18925c315855aa290e93c5fa652d96 vfio: Replace the DMA unmapping notifier with a callback

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
