Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AD28F3;
	Thu, 22 May 2025 06:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894402; cv=none; b=BluAc3PZa1ftQieINWDWXY7PlTxcyPs/YeeFjmAbdiVfbB8oGkP57t/y2YDcFjKOyfcoUVSIhcLIlVCsG04uDIn/mZ32cqwYR/yY74lgZJ0bErWv/lNHUu/lCVuMoUS5yTGpMOLzB6l58v5SS+XmQq6Loa1e4F9KObFjZheolRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894402; c=relaxed/simple;
	bh=xkLAEH4TADFkZbN/y+1n7swo7j0opWH7lGatDdr271M=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JbyHdlCzYYzUkqaK+C9a9e3aTg9Qkv4sGwAerhwkXaI2rpHfIXw2/06CTjYTlCPFsc1jf3oT6blCH+4MhJ2HyUYU5104xQQCr90iLHWbBUDTDDuYD6EYg5hnIKbJ4RJ3fskBsyJvEk3cwPDZ39zqtS/HONUi/LUvz1RrfeZFsps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KewqO7ki; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KewqO7ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747894400; x=1779430400;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xkLAEH4TADFkZbN/y+1n7swo7j0opWH7lGatDdr271M=;
  b=KewqO7kisIKm2q/xx5umRVigs0CHMrCEA5+Al/bdtYbOedkQDZowPZTE
   T4BkpHgwNkCoLxlbWuSFsA0fPWfn3gp93v3r7b3m0F/Z+dUDdFpbC5hs4
   EG+KVToEn1ckJHqvLmT0idQhBwfvpoX1WGMYKa8M6SSvodOIR7An+2bN3
   4dQKLWFdrAVPkxyK5eASPJAZKgAKhjKLLdeg2DRw2pzHlfaMB6l/yQp+6
   N9yVZu7nWYGli/Wul2QD74fcZMU6PgBpO3+c1Wh/KE4cC7qztbdZysAvC
   b4BjL1NxZwCjq/YRgsPf2R33kRHgr0xXdPbgoRJHJCxBrvGeNbX+/fRd4
   w==;
X-CSE-ConnectionGUID: EDoQfXGkQz+5bYSgIJGuVg==
X-CSE-MsgGUID: eUgKj/ScTi2Rc0gKeZ9Hjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49019057"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="49019057"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:13:18 -0700
X-CSE-ConnectionGUID: ti86ad2/T7G+tzCJI8uXgQ==
X-CSE-MsgGUID: BrFURCPYRyClqnTqvg/dHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140293928"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2025 23:13:17 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzB5-0001Ef-0n;
	Thu, 22 May 2025 06:13:15 +0000
Date: Thu, 22 May 2025 14:13:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: call to __read_overflow marked "dontcall-error":
 detected read beyond size of object (1st parameter)
Message-ID: <202505221438.mh8V0cul-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d608703fcdd9e9538f6c7a0fcf98bf79b1375b60
commit: 6ee149f61bcce39692f0335a01e99355d4cec8da kunit/fortify: Replace "volatile" with OPTIMIZER_HIDE_VAR()
date:   2 months ago
config: x86_64-buildonly-randconfig-2002-20250516 (https://download.01.org/0day-ci/archive/20250522/202505221438.mh8V0cul-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221438.mh8V0cul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221438.mh8V0cul-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __read_overflow marked "dontcall-error": detected read beyond size of object (1st parameter)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
