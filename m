Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69CE343890;
	Sun, 24 May 2026 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779598108; cv=none; b=Bo4KigfBYHfnjRGd8325fUiaUgrS7q2BewoOqkuwLAil4LHgLKiwSqs2hhXcd2LtMMxs583UUQaj9sdpKmYlmh9jzXoZto5awcn4wgj0EaUycUtB0/fW3v9O9op4sGvif5x9TPwPJQwk5+n4diAYnzx5o4IFHyZQZsOF9W5Wygg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779598108; c=relaxed/simple;
	bh=FUQei4R6zcUXwnQePiuwe+1jD/SJkDZqbMwR0h8nAHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CCxrotGZpQEXWGHYF8zmWbJO8+X/dy/Z1TeP3gn/I+0Ll1RjV0jBd3K9/c9ia1i1PECMxgUo7oC+cvjh3Juot0rMswcRVmPjJaYe/Baa2RS507UHncosWFrrKt/QHRW9QQydxXIlcT6711DboOZJqfjNz3+74Ua2xZGVsMXRk2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaX3dwRc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaX3dwRc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779598107; x=1811134107;
  h=date:from:to:cc:subject:message-id;
  bh=FUQei4R6zcUXwnQePiuwe+1jD/SJkDZqbMwR0h8nAHc=;
  b=kaX3dwRcCqUWVskHAObuiSZLdhhzmoyhoylFPrQ5bOy+1uDRhFI6CHJQ
   CjB0rUqh6cVDOGu1RTi+ER3pgghu69wNPPFJHGXHrQM3b/Wy75F2vUXUl
   /KTn8WBvONypbFEjJ5n5c74RQpHSOOcjOnaHZAnGZFoXpkPrIODh7gDzN
   6I5pjb62i7Bdp9ZWuLKQbSENKkKdonRl3h9T32fm1UQl6u5zm+kF8fosP
   pl7d3XN4V1lgBSGciLzp90qtq8P4JlGypxDwFunuZnnTGpz7I0+PK8UsA
   JAQOFMjBq41EPQEa0/Xz7Ip/ds9bJ0egfVwHuPFIjq5oV4T+cpN02LEjZ
   A==;
X-CSE-ConnectionGUID: Nnfv/iDISGqn/Fwus+t0gA==
X-CSE-MsgGUID: ezGssICsTOGsBLoPLvvIJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="79496546"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="79496546"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 21:48:26 -0700
X-CSE-ConnectionGUID: i9JRxzMQR/mjuPuV/FE57g==
X-CSE-MsgGUID: lEzPb4j4T86SHZEvUSjrCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="243097222"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 May 2026 21:48:24 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR0lB-000000000in-2y1u;
	Sun, 24 May 2026 04:48:21 +0000
Date: Sun, 24 May 2026 12:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/boot_qemu 29/40]
 arch/hexagon/platform/common/sirc.c:27:10: fatal error:
 'asm/platform/comet/comet_iomap.h' file not found
Message-ID: <202605241217.SEi2vbfQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   35eb04372bf7b3ef31afcde7c3336a0ff690d16c
commit: 19863140e01bd91a463b20a11401809a38e8d9cf [29/40] hexagon: add platform infrastructure and common code
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20260524/202605241217.SEi2vbfQ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241217.SEi2vbfQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241217.SEi2vbfQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/hexagon/platform/common/sirc.c:27:10: fatal error: 'asm/platform/comet/comet_iomap.h' file not found
      27 | #include <asm/platform/comet/comet_iomap.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +27 arch/hexagon/platform/common/sirc.c

  > 27	#include <asm/platform/comet/comet_iomap.h>
    28	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
