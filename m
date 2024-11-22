Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D95112E4A;
	Fri, 22 Nov 2024 22:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732313129; cv=none; b=moyC1sWvYFBZlfwgOS4NWuvn0uJuHhTChspG2mzxeEUDNESuDhgC1/quEoJr93ugD4dfGIzLUO38v+c40ZOAwbm8cYBXLy9rAhieKsa1MmrUZtIwaFRzt/MMkKmkAk698lAW0Fop1j5o1CKChrfNnlaIhgHiDQIeP8nzyRIgeOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732313129; c=relaxed/simple;
	bh=brOCAa/NneoYK3Rp5CIaQwneSjTtsQhVDMEetAXyiXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcvjNdlQwPzNaXyCGPY+cetTuRA+ra4jLI/9GRR0KV+XdHjMzJK6nTWte3J7JgitsHCnb91li9NmAxlQZ8pJ7VjxWIWjFFVlWfcgEcF3ApnqBOZQHYRgRz3AsUsxE5ErqHfl6ppYYjWc7rno0AYiJF1p1qta4HuCtRJLug0mIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F817Nvk5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F817Nvk5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732313128; x=1763849128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brOCAa/NneoYK3Rp5CIaQwneSjTtsQhVDMEetAXyiXc=;
  b=F817Nvk5LiQaU/z0157Z0rJvtOcVCgFxL6v1fth9NeF7EXm+qZnGznBO
   xO1K7rN/XmZToWPilgP2dqMvTobCG6cgUjRt0pDcz8HLoWh8nIuCgcAkR
   Mq0wauGv+9KbrXafDx0QlvZfcMvjzdBhA5Xf/7gqvMyjtKdxurTx88bMr
   hsfoKjP+TvBNFsCePCm314Y52Q1Bha3Z3iQ5+nOVUYG1wCA8qzIiLZ4eL
   l6ymykRV80k33+kq//AIIwHQHGQI2UyNLyc+0ZHkbmHgTGAkBh3G9ka7l
   DgyQSKKitE+bjVNRW2+ZpyrSEvJuenn1eRia4pM9DGzEqFqw4FlNQyH0y
   Q==;
X-CSE-ConnectionGUID: fZy3MEpnQguNmuJPoBblqQ==
X-CSE-MsgGUID: iDn5UnNPTeu4rPH6s1/9xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32347556"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32347556"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 14:05:26 -0800
X-CSE-ConnectionGUID: XipMvZ3iTQuX+L8Sq3fsdQ==
X-CSE-MsgGUID: pothvH9TQ56R50lqiAgAag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="90825098"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2024 14:05:24 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEbmE-0004FD-0K;
	Fri, 22 Nov 2024 22:05:22 +0000
Date: Sat, 23 Nov 2024 06:04:58 +0800
From: kernel test robot <lkp@intel.com>
To: Ding Xiang Fei <dingxiangfei2009@protonmail.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1130 2/3] error[E0405]: cannot find trait `Unsize` in this
 scope
Message-ID: <202411230517.g7Dbe7Ge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1130
head:   22607a75f562e7ffa92b8b44ac1574bcb214134d
commit: 36e9396cf5591aa42b19eacba22ee3f7e96bf792 [2/3] gating behind version 1.83.0
config: um-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411230517.g7Dbe7Ge-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230517.g7Dbe7Ge-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230517.g7Dbe7Ge-lkp@intel.com/

Note: the rust/pr/1130 HEAD 22607a75f562e7ffa92b8b44ac1574bcb214134d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> error[E0405]: cannot find trait `Unsize` in this scope
   --> rust/kernel/list/arc.rs:450:26
   |
   450 |     T: ListArcSafe<ID> + Unsize<U> + ?Sized,
   |                          ^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use core::marker::Unsize;
   |
--
>> error[E0405]: cannot find trait `Unsize` in this scope
   --> rust/kernel/list/arc.rs:460:26
   |
   460 |     T: ListArcSafe<ID> + Unsize<U> + ?Sized,
   |                          ^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   7   + use core::marker::Unsize;
   |

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
