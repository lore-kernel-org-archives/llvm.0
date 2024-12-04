Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAF410F9;
	Wed,  4 Dec 2024 04:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733285067; cv=none; b=W2LhUOSL0ElCXFa3sDH1lXxJ4kOvJjJDISC81pS6mZuwGfy8jBZl3vdRkJeKPoxbtIG3pT6eZwicCACXbQ6jiRmoNZTFK+Jk6Ed2DKRH8dHkbY7Mrf0/R/P/WPkLBiCcZjDJWzYDvUyRtHHeDisr8bPJekxyof3Tjrpl2s/Mh0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733285067; c=relaxed/simple;
	bh=I3KUC6DhyzUueoOSoCKdY69ADMouNVeZyPDrodMWgDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EVUIv6KVYjkEuQBz58jnBbSIaqvJSwmivP0um0NOM15jJza0F3+7umUoAhiq5Gu0rS/fpztoNf92V9/ld6pNjfFUVpa3tfRkyb5bSD1UOuf6g7myR6VGYTeHdvhZZlkLHny6syWlOhHFN9/hakcVo6+gCrG26PJivGlllfbBiVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bogcEe9x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bogcEe9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733285066; x=1764821066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3KUC6DhyzUueoOSoCKdY69ADMouNVeZyPDrodMWgDo=;
  b=bogcEe9xaruf3eyDjJgh3SzOs14NsN2VVHRmxiHq3TevvFggzuRbB59o
   Y+eDEMvEi2Ptt6uBoi3pE9vra0QlSJHmKkUPXuhAP2z3/Wvm1+om36VKu
   iKSjYu0Kt/dz6Rcwi/LWRT5f5683PEgvsVtet2Foju11qtFNiyESZ6GKi
   eUV3H7OXRKk0eNEfMkaooooXhkupzURbCQSlIZn78IhsCDdxGvtEOmdkn
   CktrfrOSz2I/7PupvpQH1cWP8nrA+PMkNxpYSd0stw5bjB1aNfIbn7vZF
   sNrtqQffCakXqQb8YMk6AixnSm9gJpF1wwlUmCjTsMLzTXYT0q2EOsp/R
   w==;
X-CSE-ConnectionGUID: /361ZPalSkq75cSBgA76+w==
X-CSE-MsgGUID: pUcu3/4nTCqgqsAeJjSz3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="37471434"
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="37471434"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 20:04:25 -0800
X-CSE-ConnectionGUID: McwEqCqZSrebdkIdTYdiTw==
X-CSE-MsgGUID: xw8DRHluSgekslchTVEYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,206,1728975600"; 
   d="scan'208";a="93304314"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Dec 2024 20:04:24 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIgcf-0002UL-33;
	Wed, 04 Dec 2024 04:04:21 +0000
Date: Wed, 4 Dec 2024 12:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 47/49] ERROR: modpost: "rcutorture_format_gp_seqs"
 [kernel/rcu/rcutorture.ko] undefined!
Message-ID: <202412041204.ys3dSglL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   48ca997e8632db65609dcc6a715207a1b6dded57
commit: 13e3224fa73ec6c7dfeda04b2741c95787196588 [47/49] rcutorture: Include grace-period sequence numbers in failure/close-call
config: arm-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041204.ys3dSglL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041204.ys3dSglL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "rcutorture_gather_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!
>> ERROR: modpost: "rcutorture_format_gp_seqs" [kernel/rcu/rcutorture.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
