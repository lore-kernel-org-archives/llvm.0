Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E4B33342F;
	Tue, 21 Oct 2025 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052035; cv=none; b=O9ZKSciMq2cyQS/hL8qXtko2+ZWMGm6p+zjywE5wYxMabtCTkQkuQVbhl4tyusRjiOuBoV/TIAKFVsscykFkrdXTIlQK6z2TWTkqeEw3EoRrO7vpVD7AKdPVc+rcrr4/XTZ3vlrVr6KcJiGnosgfyVfeBHZFkE39aBvmJBwmIHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052035; c=relaxed/simple;
	bh=neCFhDuyii3EJ4mxExwTbEK/o7YsikVd4gNz057tONs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWQ3KHd8J+9+GVjAcG7u29bZ2L+zWHGshomf+NklSKJk7PPPi7OpVoCE7Nx+7uD0IqE1CzBZ8/PHzi7X6qXwPW68jXn+yFGkyKfHB8TtGmbRUiqfFcgylgkEaMPCXnOrZUfeiHk+Ks1v+0J9SIIoXgyQp0DhgHL4CQLu5X6GXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7DS/b2p; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7DS/b2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761052034; x=1792588034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=neCFhDuyii3EJ4mxExwTbEK/o7YsikVd4gNz057tONs=;
  b=W7DS/b2pnKQTcvKe2w8iDMxUYfUvCvP13ITurVTeiN4i6dhRYL+bD/mQ
   2HjO1ZRZhDslKvvOSStrS5EStYy2UgbqD13I2S051X5DCuh0GLaMNAxAW
   EwLqQVWO6mOgvbeLIU3y3549Gq9neKsHd4IOUwxG9sY7v7iyU/IUGy0nc
   SNXmLXcGTcWvn+VmXmesmaCR4awAIaVpzQzZZUoA3NTeYxRJri1Kmcos6
   JDVlXw5f+WRy4OOHwJ2LlfzRBB8qXLnPNjwmfKqWwTqQtuUTasfMylhfh
   zWxJ+dwL42YoTZUVgVJ8ZCMidBvpgzUb74jTgVQ5Ig+b0kwhRYnjEZ3Ul
   Q==;
X-CSE-ConnectionGUID: a45PtuBCS+y5dXBtHdyrXw==
X-CSE-MsgGUID: xDJrfIQ7RQWGEsZS62aSfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62876324"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="62876324"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 06:07:10 -0700
X-CSE-ConnectionGUID: fMNWy4LlQ+GNJfE6sHtY0A==
X-CSE-MsgGUID: tbtr755hTQKwQYVvje0jDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="187623513"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 21 Oct 2025 06:07:09 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBC4w-000AqJ-35;
	Tue, 21 Oct 2025 13:07:06 +0000
Date: Tue, 21 Oct 2025 21:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
Message-ID: <202510212001.Uc9u8GAh-lkp@intel.com>
References: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-proc_status-v1-1-59d2c8ccd4f0@rivosinc.com>

Hi Deepak,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepak-Gupta/arch-riscv-add-proc-status-proc-pid-status/20251021-022001
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251020-proc_status-v1-1-59d2c8ccd4f0%40rivosinc.com
patch subject: [PATCH RFC] arch/riscv: add proc status (proc/<pid>/status)
config: riscv-randconfig-002-20251021 (https://download.01.org/0day-ci/archive/20251021/202510212001.Uc9u8GAh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510212001.Uc9u8GAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510212001.Uc9u8GAh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpu/proc.c:8:10: fatal error: 'asm/usercfi.h' file not found
       8 | #include <asm/usercfi.h>
         |          ^~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - DRM_PIXPAPER [=y] && HAS_IOMEM [=y] && DRM [=y] && SPI [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +8 arch/riscv/kernel/cpu/proc.c

   > 8	#include <asm/usercfi.h>
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
