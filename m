Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA5346AC2;
	Sun, 26 Jul 2026 04:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785038862; cv=none; b=Lf38f4B+uaq3Azg9XP3Te1xM57SqZvvuLCRDvHkOWlCRsIc+hVVcKqL5Ew1Y807uLa2YZiGQmnqkzP1TwmVz18OnrWcA5xUmB3J8L7rq8OEa6GjQWBUvwMET/N0jJmPMyevNpuvO08F/8P1edbIz0aKSjQWprnn0iFt9BPsDYRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785038862; c=relaxed/simple;
	bh=BeXoudEPG1objKDZiGqzWPZ6glGNr9NqIPMLDOVMZnM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CLyFXLCpRLwc9an75ix6XjdQ0nIoDiY3RAvxy/WNPgOS71s79e0cCfZDpf7RM6lEFzmnkkj3A67t76KqDGa3SqdT+iom5+iVNyEh6fE/dfUW+IdPwUB+fQemJNRgcQ7NiVPsQjFxVE8GsOFCsiCh5D58AazNMpSZNWCNQ+AQkgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dM1K2/mi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dM1K2/mi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785038860; x=1816574860;
  h=date:from:to:cc:subject:message-id;
  bh=BeXoudEPG1objKDZiGqzWPZ6glGNr9NqIPMLDOVMZnM=;
  b=dM1K2/mi4SQEKnmePEPjLXZE0mOdREO6jpyF4rrjPQoy/0UUm0Qnu343
   /xyuOz1AVqbmNHJfkM1dz4R1/aRIQbdkxr9eFS7TFFFYCDtqwWY9jusif
   +n4XvfOxwMbFtAT5/LycG+ZOjhtqqJNiN1ey+aSFdijyV2arTwjq60z5t
   ms9+G17WpWUkKai+sj7dmJYcGCrM6w4vHimKcYfSaAvN1K+G8agJrx3YD
   lsKzxzTQFgJOQPyTgZGLdNTZNkOuWNJQyRFxk1z1Dyfn6tqewq6PyNohN
   00vUz6OCDXYvm2pilonWBB+xmDwiDAKKeOHJnVWBViI6CmS8DsdyFbSYc
   g==;
X-CSE-ConnectionGUID: JyAPTPCXTda1VcoigL/FJw==
X-CSE-MsgGUID: 6CM1idioTr25P4e4DctorA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96239470"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="96239470"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 21:07:39 -0700
X-CSE-ConnectionGUID: Lps9+BfXS7Kx+a3tztmLDA==
X-CSE-MsgGUID: b+f4GdOHSKWsiS1qpbAQgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="259722512"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Jul 2026 21:07:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnq9H-00000000cGZ-2DNU;
	Sun, 26 Jul 2026 04:07:35 +0000
Date: Sun, 26 Jul 2026 12:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rng 5/5] ld.lld: error: undefined symbol:
 crypto_del_default_rng
Message-ID: <202607261241.g3M2VLoB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rng
head:   b3d559623a0829567d9f40d2d71da0e63ba7f549
commit: b3d559623a0829567d9f40d2d71da0e63ba7f549 [5/5] crypto: rng - Remove crypto_rng
config: s390-randconfig-001-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261241.g3M2VLoB-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261241.g3M2VLoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261241.g3M2VLoB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crypto_del_default_rng
   >>> referenced by crypto_user.c:367 (crypto/crypto_user.c:367)
   >>>               crypto/crypto_user.o:(crypto_del_rng) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
