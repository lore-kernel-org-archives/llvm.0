Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBF23315A;
	Fri, 28 Feb 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745040; cv=none; b=pFzI6XoEgiunVfn+wkcXDBW7DmDddIoi92GojfXR9p1S7o6pxCeJ3K+JUYcK1+yPqXrhRkVdYkly3Tp8F6gn/J/O8DCEqmyb78SuFUUD2hy0p+XuQx/TcEgR72QquB/QMa+DVi1e857WoLn25D6yjCGZnam9gyriIsqu7yWmsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745040; c=relaxed/simple;
	bh=zzK47IiYIfeHUzu3F81reHUI2Wcm5zQFl5JTsnOkAxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijkhzOO2/V++CzG6k+0qKmRihwY22T86Uces1nIfy0BsbzgZ1PefVhpBJy4toeYF4xnJLbbyC9MDngEzqcwMqezSZLCo+vuonbEvxRE8PaJx+FSfMbCXgs6JOGPZnKRtHDBOUQbqBDqLVn94/XcjCxj+MCNzxM/dF3rFdWz1Ieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYraIDoa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYraIDoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740745038; x=1772281038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zzK47IiYIfeHUzu3F81reHUI2Wcm5zQFl5JTsnOkAxg=;
  b=AYraIDoar1bjXXEqU84p0vEhNxvbaBUSSqznj/kGx7bksrCKaTqudW8H
   qCgEXlwKvOR4goAyNWFpIAHzTwi7ge+hfq68YHX0EMXaKdobZTYjUUvR+
   5VEv8SRSDIdrsC/ENGNnSRd00B8iruLCRTl3u0lcr/yguh3+fWyl0Zwmr
   EFoqF6o2zSL9sjXKyqHJM6dO3FzMiGeBtFOfWvxAaLihCDSrRcz+kXpY3
   sbYbLvP6DVren+6er+B4H/UBqnlzECh7X8PWVGqlkM+qhLeW/1xjxJyKd
   E0b175zY5IiXntP4YRbIhf1ED7oJ8Nls0+rWoZJu8kFWxsBMNTBO44Csf
   A==;
X-CSE-ConnectionGUID: 6R9/4zkySymOVQUyVUhBRg==
X-CSE-MsgGUID: hiZnZjvuSMWXZ+pxz//O+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="53059753"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="53059753"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 04:17:16 -0800
X-CSE-ConnectionGUID: UFHQDTKxSsGzkcfGl7CVrQ==
X-CSE-MsgGUID: yU7cVurVS3S89Yq1v+Owlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118244153"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 28 Feb 2025 04:17:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnzIn-000EqU-19;
	Fri, 28 Feb 2025 12:17:13 +0000
Date: Fri, 28 Feb 2025 20:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:fixdep 1/1] /bin/sh: 3: tools/bpf/resolve_btfids/fixdep.o:
 Permission denied
Message-ID: <202502282009.G0FviXvz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git fixdep
head:   5014e22336289a518e5bb2ecd2d28e61addb6184
commit: 5014e22336289a518e5bb2ecd2d28e61addb6184 [1/1] tools build: Fix fixdep dependencies
config: arm-randconfig-001-20250228 (https://download.01.org/0day-ci/archive/20250228/202502282009.G0FviXvz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 14170b16028c087ca154878f5ed93d3089a965c6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502282009.G0FviXvz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282009.G0FviXvz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 3: tools/bpf/resolve_btfids/fixdep.o: Permission denied
   make[5]: *** [Makefile:48: tools/bpf/resolve_btfids/fixdep-in.o] Error 126 shuffle=429577626
   make[5]: Target 'tools/bpf/resolve_btfids/fixdep' not remade because of errors.
   make[4]: *** [tools/build/Makefile.include:15: fixdep] Error 2 shuffle=429577626
>> /bin/sh: 3: tools/bpf/resolve_btfids/libbpf/staticobjs/fixdep.o: Permission denied
   make[6]: *** [Makefile:48: tools/bpf/resolve_btfids/libbpf/staticobjs/fixdep-in.o] Error 126 shuffle=429577626
   make[6]: Target 'tools/bpf/resolve_btfids/libbpf/staticobjs/fixdep' not remade because of errors.
   make[5]: *** [Makefile:151: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2 shuffle=429577626
   make[5]: Target 'tools/bpf/resolve_btfids/libbpf/libbpf.a' not remade because of errors.
   make[4]: *** [Makefile:61: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2 shuffle=429577626
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:76: bpf/resolve_btfids] Error 2 shuffle=429577626
   make[2]: *** [Makefile:1433: tools/bpf/resolve_btfids] Error 2 shuffle=429577626
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=429577626
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=429577626
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
