Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DD73176;
	Tue,  4 Mar 2025 02:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741054639; cv=none; b=Z77cCI6X3kgCcN3k7XwwS3Kz7s/1lFGWhTDOQ+NvfBrABfHgzBGV1R5nQ8dV4ZzfHTGVwperlyKrFEXE6egtcfw//0s0GCr2hT8FP3X9GDtv2s58QSQpu+VFYPPyx20GyP2YtLhd1yYbRH7tqBGo+/9Ix4D+6vXS4uBouSsImuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741054639; c=relaxed/simple;
	bh=I9DdPUP9w2rvLAlF4I/Reo4ZRWNfEgRGDPU14XEbfd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lhHyZfDpuBg9tG/thFrSTqVrvW+/5yMcF/Xd3QNUcAg/Sqb0Vv9GAN52+CzlILA8i3D1DjTdtz+f9DeQHzD1MNUJhDRgSBaBp4bM2CTkU0UmG7EXreagaq46AMS3Dj3jLjk2WsNUGb4RXCwV2DwhpBkJpZvrGRbC9Sg5o6Zfv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4lRncnC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4lRncnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741054638; x=1772590638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I9DdPUP9w2rvLAlF4I/Reo4ZRWNfEgRGDPU14XEbfd8=;
  b=M4lRncnCp+zC/amab1ZNZPOKNHtsh9MGHSin5pd1KA3lr1RSbAtn98Sl
   6dvJOWa4RF1ACCEcHhZOG81/OPRGUVIn3WrLgEcsRaho4HzdpsDZn5SFi
   gpDCPiCp6aywtMrtuahmAJnI589AuTQvzW5IiKCjR/LvgKpBj4l6665V0
   bYtEcFLHl2/Ps4oeDM9xfUFzKPozKBfbF5zHZOoiwgjjIwLkHTzkffhO8
   ABOKY0DSO4AjPrLjf9fTGSkGnkapEDpDfZLehHwDTe5Fb3IFGs9aYkmmK
   oRqPrtD8VEDx5BehDeslDrCRwjK0cu8PoAqU/TImYgcKvTb/LH5m71v4z
   Q==;
X-CSE-ConnectionGUID: qPaDC7YRQdSQr2qyAKZnXg==
X-CSE-MsgGUID: zdJ6pmvjStqDaeEehVZ1Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="42144791"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="42144791"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 18:17:18 -0800
X-CSE-ConnectionGUID: 687PLr8vQhGM8sPfKMRkkw==
X-CSE-MsgGUID: 93i2xmHZTUyGYBK1jbQx+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122357763"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 03 Mar 2025 18:17:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpHqM-000JAD-0N;
	Tue, 04 Mar 2025 02:17:14 +0000
Date: Tue, 4 Mar 2025 10:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	David Hildenbrand <david@redhat.com>
Subject: [davidhildenbrand:s390x-file-thp2 1/2] uv.c:undefined reference to
 `kvm_s390_wiggle_split_folio'
Message-ID: <202503041047.MflHMx9e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux s390x-file-thp2
head:   f7fadc3a879ff0aaf01d8e3321025e7caf1b8e10
commit: 22ccf53bc790c31e260d5ce94fbe8f355afe7dc3 [1/2] KVM: s390: pv: fix race when making a page secure
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20250304/202503041047.MflHMx9e-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041047.MflHMx9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503041047.MflHMx9e-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: arch/s390/kernel/uv.o: in function `make_hva_secure':
>> uv.c:(.text+0x68a): undefined reference to `kvm_s390_wiggle_split_folio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
