Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A921D366078;
	Thu,  5 Mar 2026 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734849; cv=none; b=RYSo7qJo0/5dZBk7zvkduKH5ydKQj3TB0CrHMFIKRsFdmG5xX5sfoVW68mxU1Tkw7UhFZAu6CnXMxCr/KxLY09+uG6rdXB+v3BqheWB/P5TY+gPVeCskj7opMSC21mS2A80olLsyPHbRvsqffH7lTs9/IXEPR2NJbiLV09OSwas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734849; c=relaxed/simple;
	bh=5IsJnnOPP8qafQiPo4SNjm5Mbm6v5EqGwo0hjoSn/xY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MRtrAiZOGY4muxpBRAJauLSaYgsxz1dYcPIk7SiKfgINHBWadzh8Jac9sosNRgVbcOAr4e5y25bySN8u2c2TgCzISkQrVC1aQTVJkm08UdpldzgWpO61GRqc0WAtdehCEFDRdCZazux8B0pkkETiiWSIjp3Fbtzm6n8Njs6iShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/2Dyj3L; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/2Dyj3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772734847; x=1804270847;
  h=date:from:to:cc:subject:message-id;
  bh=5IsJnnOPP8qafQiPo4SNjm5Mbm6v5EqGwo0hjoSn/xY=;
  b=C/2Dyj3LaAaVECi6lRjbA+jkD0KxFrPaPxtr6PAySjO+r5Rpb+5qXtw0
   Fdbkn0wlTCFogwdn41Gx7FGmZ7OwNjUjulN2nLOr1axalv4G1esWMzIGt
   VljF5NBnxvaGJaLs0vAOcDLX2aMdax8tBfWVbn4NAhOkbXPco8cFjevg4
   Oh/Z1v6OIcrQ+dyMh8rklGb54Goru+18mVFIbKjwWXu9XZRZFQJnq5ejl
   udyrclfnxoC96xMSarPMuMkzzcf+kTUM9npldQac1Ov5n4BmW22jibKoi
   UqbYmC13ZYybHfWxIh2mw/nQXr/2Vrvz+EKA9xmseM2fg/NJGeFVR126n
   w==;
X-CSE-ConnectionGUID: E3mibUENQsiEIZhm4sdXgg==
X-CSE-MsgGUID: 1ZmbEHa3RzedjfDZAL7L+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73534169"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73534169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 10:20:46 -0800
X-CSE-ConnectionGUID: JXfDmOCtQEO//MaWHlRISg==
X-CSE-MsgGUID: eEOPrhOZSaCBZs7qqRjQzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="218894243"
Received: from lkp-server01.sh.intel.com (HELO cadc4577a874) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Mar 2026 10:20:45 -0800
Received: from kbuild by cadc4577a874 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyDJR-0000000014Y-3d3O;
	Thu, 05 Mar 2026 18:20:41 +0000
Date: Fri, 06 Mar 2026 02:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 147/467]
 drivers/gpu/drm/xe/xe_debugfs.c:332:9: error: incompatible pointer to integer
 conversion returning 'size_t (const void *)' (aka 'unsigned int (const void
 *)') from a function with result type 'ssize_t' (aka 'int')
Message-ID: <202603060207.oBBmHUuq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 2fa2856b312ca24d5289991ad16b1f036ab7c31d [147/467] drm: xe: convert to read/write iterators
config: i386-buildonly-randconfig-001-20260305 (https://download.01.org/0day-ci/archive/20260306/202603060207.oBBmHUuq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060207.oBBmHUuq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060207.oBBmHUuq-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_debugfs.c:332:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     332 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:520:8: note: 'ksize' declared here
     520 | size_t ksize(const void *objp);
         |        ^
>> drivers/gpu/drm/xe/xe_debugfs.c:332:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned int (const void *)') from a function with result type 'ssize_t' (aka 'int') [-Wint-conversion]
     332 |         return size;
         |                ^~~~
   drivers/gpu/drm/xe/xe_debugfs.c:363:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     363 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:520:8: note: 'ksize' declared here
     520 | size_t ksize(const void *objp);
         |        ^
   drivers/gpu/drm/xe/xe_debugfs.c:363:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned int (const void *)') from a function with result type 'ssize_t' (aka 'int') [-Wint-conversion]
     363 |         return size;
         |                ^~~~
   drivers/gpu/drm/xe/xe_debugfs.c:395:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     395 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:520:8: note: 'ksize' declared here
     520 | size_t ksize(const void *objp);
         |        ^
   drivers/gpu/drm/xe/xe_debugfs.c:395:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned int (const void *)') from a function with result type 'ssize_t' (aka 'int') [-Wint-conversion]
     395 |         return size;
         |                ^~~~
   drivers/gpu/drm/xe/xe_debugfs.c:427:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     427 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:520:8: note: 'ksize' declared here
     520 | size_t ksize(const void *objp);
         |        ^
   drivers/gpu/drm/xe/xe_debugfs.c:427:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned int (const void *)') from a function with result type 'ssize_t' (aka 'int') [-Wint-conversion]
     427 |         return size;
         |                ^~~~
   drivers/gpu/drm/xe/xe_debugfs.c:459:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     459 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:520:8: note: 'ksize' declared here
     520 | size_t ksize(const void *objp);
         |        ^
   drivers/gpu/drm/xe/xe_debugfs.c:459:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned int (const void *)') from a function with result type 'ssize_t' (aka 'int') [-Wint-conversion]
     459 |         return size;
         |                ^~~~
   drivers/gpu/drm/xe/xe_debugfs.c:492:9: error: use of undeclared identifier 'size'; did you mean 'ksize'?
     492 |         return size;
         |                ^~~~
         |                ksize
   include/linux/slab.h:520:8: note: 'ksize' declared here
     520 | size_t ksize(const void *objp);
         |        ^
   drivers/gpu/drm/xe/xe_debugfs.c:492:9: error: incompatible pointer to integer conversion returning 'size_t (const void *)' (aka 'unsigned int (const void *)') from a function with result type 'ssize_t' (aka 'int') [-Wint-conversion]
     492 |         return size;
         |                ^~~~
   12 errors generated.


vim +332 drivers/gpu/drm/xe/xe_debugfs.c

0f13dead4e03858 Lukasz Laguna 2026-01-07  309  
2fa2856b312ca24 Jens Axboe    2024-08-02  310  static ssize_t wedged_mode_set(struct kiocb *iocb, struct iov_iter *from)
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  311  {
2fa2856b312ca24 Jens Axboe    2024-08-02  312  	struct xe_device *xe = file_inode(iocb->ki_filp)->i_private;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  313  	u32 wedged_mode;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  314  	ssize_t ret;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  315  
2fa2856b312ca24 Jens Axboe    2024-08-02  316  	ret = kstrtouint_from_iter(from, iov_iter_count(from), 0, &wedged_mode);
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  317  	if (ret)
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  318  		return ret;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  319  
17d3c3365ba9e52 Lukasz Laguna 2026-01-07  320  	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
17d3c3365ba9e52 Lukasz Laguna 2026-01-07  321  	if (ret)
17d3c3365ba9e52 Lukasz Laguna 2026-01-07  322  		return ret;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  323  
0f13dead4e03858 Lukasz Laguna 2026-01-07  324  	if (wedged_mode_needs_policy_update(xe, wedged_mode)) {
0f13dead4e03858 Lukasz Laguna 2026-01-07  325  		ret = wedged_mode_set_reset_policy(xe, wedged_mode);
0f13dead4e03858 Lukasz Laguna 2026-01-07  326  		if (ret)
0f13dead4e03858 Lukasz Laguna 2026-01-07  327  			return ret;
0f13dead4e03858 Lukasz Laguna 2026-01-07  328  	}
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  329  
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  330  	xe->wedged.mode = wedged_mode;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  331  
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23 @332  	return size;
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  333  }
6b8ef44cc0a9525 Rodrigo Vivi  2024-04-23  334  

:::::: The code at line 332 was first introduced by commit
:::::: 6b8ef44cc0a952549a6773a0233cee853f807a79 drm/xe: Introduce the wedged_mode debugfs

:::::: TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
