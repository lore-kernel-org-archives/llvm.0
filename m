Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F4623D29A;
	Sun, 21 Sep 2025 20:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758484975; cv=none; b=bHY4kaRzbAu23aFqr1NhRom7H+0RM8V1lV79SyXcnlhC0Ucb/LI7LBnEBlx62NiZGUY6LsMTLCxU6u8nw8mSZ7yRFhgei6U5WPlpKW2zKyzADEnf4aRalaDA1tuDID7wdN6zPIIstIcn6f6z3zgKa1v5efo4MyBAc6WHGYT8Mws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758484975; c=relaxed/simple;
	bh=Tiv2ueF2Di/JU8nSaUAShGM4ZNe1Iw5Va5qVHjo2sGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=flAhlFMI6+HVEvWLCTawujmISuG2TEtnVAy25IAqRpo3uhA7//fCi4znFPnSkSn7WkLMUA7nmpJXqPbRWKzr2mbqBlvn6cdoAi2UiM4kwydBDvMQ+lZLlNqeEG74eahLLIMEPEjXQVeL4KeoiTuFBGIPiSAoduBS61zozjpwsPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ub8jijPL; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ub8jijPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758484973; x=1790020973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tiv2ueF2Di/JU8nSaUAShGM4ZNe1Iw5Va5qVHjo2sGo=;
  b=Ub8jijPLggq2hfgYtUi1xz107zFO6YGrKd6E6PRcvs3RRWD84Yo7t51l
   3UvvJ5AZ3BQa92awsrz5u+uBCjB0DfgK8UlenaEGq80k/hvO5nGQBt8i7
   7OTfnNIVILOCBG3JxrxSZ2QTJA8REBBl3iffhwRtHypxE2ZLooaFvaf5O
   y2kHuDNe1kmxTaLdRdAdc+l01lMreHre+z6XwbkTyt2Zjmdds9u2ZDlwY
   j9Pg1K9sPBRY11GHTM/Hmi1E3R1OEk3yu92S5IVpIVTqDWadN3ZhVFjuq
   LwmZ0SR+qvqUxt0WtfTy/Kt15nX5qALDY6E2yTOdiikXHlrKt/qwNg9J9
   w==;
X-CSE-ConnectionGUID: PuBYpABMT6SYIMboZpEyDQ==
X-CSE-MsgGUID: 1fNeF8eDTxG7rk6t6FwZcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71431398"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71431398"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 13:02:51 -0700
X-CSE-ConnectionGUID: uOpZtWyYTOSmjsqzHeqCIQ==
X-CSE-MsgGUID: CVMrwYMORjaKEptQf9yVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="176137407"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Sep 2025 13:02:50 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0QGl-0000ym-2s;
	Sun, 21 Sep 2025 20:02:47 +0000
Date: Mon, 22 Sep 2025 04:02:29 +0800
From: kernel test robot <lkp@intel.com>
To: LiangCheng Wang <zaq14760@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [linux-next:master 5600/11136] ld.lld: error: undefined symbol:
 drm_gem_shmem_prime_import_no_map
Message-ID: <202509220320.gfFZjmyg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   846bd2225ec3cfa8be046655e02b9457ed41973e
commit: c9e70639f5915f2d084a0126e62fe53a52c29cea [5600/11136] drm: tiny: Add support for Mayqueen Pixpaper e-ink panel
config: arm-randconfig-003-20250922 (https://download.01.org/0day-ci/archive/20250922/202509220320.gfFZjmyg-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220320.gfFZjmyg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509220320.gfFZjmyg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_gem_shmem_prime_import_no_map
   >>> referenced by pixpaper.c
   >>>               drivers/gpu/drm/tiny/pixpaper.o:(pixpaper_drm_driver) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_gem_shmem_dumb_create
   >>> referenced by pixpaper.c
   >>>               drivers/gpu/drm/tiny/pixpaper.o:(pixpaper_drm_driver) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
