Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8979543FD1F;
	Thu, 13 Aug 2026 08:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609753; cv=none; b=eANMupBzCHJqHelIrvvQYHNlAB53gl/6hVG6v41baWmPXed6CW3IZagi3ypiALkGHBzQIus8WpV9viHasKxPPG0VH9bvx2uzdFQK2Eu4JXJCPEOg8IkCuAhtodhh6pqh7yLAploSwqr1DxvFgWbTKkem64svzZZcR7zrUj+fgHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609753; c=relaxed/simple;
	bh=GrIWk/uP+0dXSV2xCQcXD0tfnAup4vKbaIIxGd2+rFo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i9jxCYL3Gko5b0nLIfmY27NNv9+FGwSPQHwMcsDbwgqHYoqmNuEXjdetwR++0b6JwgEpiUCwypiFvNJxWm8VVohx0uE+WbiOAyAUQNU4RnWf2F59t7WerpnjHVDeL2jHbcWF3zT7VeN3B7p11wH9PwAINHWxDI8gP4ATd/Ybhx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWk4TqL+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWk4TqL+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786609752; x=1818145752;
  h=date:from:to:cc:subject:message-id;
  bh=GrIWk/uP+0dXSV2xCQcXD0tfnAup4vKbaIIxGd2+rFo=;
  b=aWk4TqL+tI+D6sP0NyWN7Gn9/TJbB0A8xn4wIKdNSrjJT6dUjhp+hvya
   3oDBgFIxn3YexNeif2UERN0nh4q/8KX2xhJ0l3sLAIoIuYUjMQVpZVqzJ
   H925kN+IlVNJHumOuZ46Zm95oYB/hzAomhLVezSqLsRAft5fPXPpBvBZb
   2LfCw3dzR/4REn6XbWfsltMRM44J78PZeqvz7hz6APXtOYrXoRJQw2ahg
   00OhRhir9Ivi5y0Z+51xV2OjguSPubA5v0Xd8vGN3qYqeFFuI+CBiWVHt
   SodvtF8AApe4x4b3Mm50kvWtmA58X0aO6yVY0LsCwuBySoe49Wmhsdzeo
   A==;
X-CSE-ConnectionGUID: vXlB+teVRFOPdFEQOpT+tQ==
X-CSE-MsgGUID: Intl8wNERauYMaxs9XrQ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87394861"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87394861"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 01:29:12 -0700
X-CSE-ConnectionGUID: Xs8GeBdUQNqomQWfGPh1/w==
X-CSE-MsgGUID: rruDGsmQRj2NUWpBjw+wJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="267394351"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Aug 2026 01:29:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuQoF-00000000TOK-0ira;
	Thu, 13 Aug 2026 08:29:07 +0000
Date: Thu, 13 Aug 2026 16:28:17 +0800
From: kernel test robot <lkp@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>
Subject: vmlinux.o: error: objtool:
 _RNvMs_NtNtCs6PUMngfe6Jo_9nova_core3gsp4bootNtB6_3Gsp4boot+0xd90: can't find
 jump dest instruction at
 .text._RNvMs_NtNtCs6PUMngfe6Jo_9nova_core3gsp4bootNtB6_3Gsp4boot+0x1df6
Message-ID: <202608131616.Go6giy15-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d6d817622b0a9721e3cc404df3469171582be13
commit: f66287cf155e47b604118ee1e7731ff634d8dbe9 gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap
date:   2 months ago
config: x86_64-randconfig-011-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131616.Go6giy15-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131616.Go6giy15-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f66287cf155e ("gpu: nova-core: Hopper/Blackwell: larger WPR2 (GSP) heap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131616.Go6giy15-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: _RNvMs_NtNtCs6PUMngfe6Jo_9nova_core3gsp4bootNtB6_3Gsp4boot+0xd90: can't find jump dest instruction at .text._RNvMs_NtNtCs6PUMngfe6Jo_9nova_core3gsp4bootNtB6_3Gsp4boot+0x1df6

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
