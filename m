Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B51C2868B;
	Fri, 10 Oct 2025 00:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760056278; cv=none; b=fmdQPvr0KHh+ejxtdpTS2CY6s4Um4r7g+rrzPvZ//lUcrwJWevKy/Eb0m/BTSix8oIDheWz4VVAsC7TXlVTivBns+3ho9p12B36axfrZ96W/OqvqfFH5Ap3syyuT6g9yWp6atmZWCl6OfMr4sHBZbyRnM7HzQqyB6llaPt4uv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760056278; c=relaxed/simple;
	bh=1vnp0fmRk32oEpPHfRK6vIfjBdcpZL44B6OCwTfN5i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=frhWdab82iuZHXHsOICTQFJT2cWSBLyko20x+RjVofZkfXPhNeRnm9PtQO/YRKYOX23QByG2E6i7ou6DoDL+/pyZmtbjburZ0g5Yy3M6qyW4zLjdR+shP4R7uMwwVubZmDYlfwa4OvmHdEI/IdjsICLcswi3rNlf3tfatvV3gLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr8m2+1+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr8m2+1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760056275; x=1791592275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1vnp0fmRk32oEpPHfRK6vIfjBdcpZL44B6OCwTfN5i4=;
  b=Zr8m2+1+D68SI5Ey0SkT05uzRvcjkN6ugI8QesLcFFlbYpgS5TSTf0jB
   //t+j94Uc3wPD4JUiRdLdGCRIrsA2z5ultkvPJorUMvP8ZvSALC/kw9Wi
   zdPdEN2Z249PVlPOnwOGMK5hCn6Hy6KMDKFXd1f+SGQXBTPRoBNkFa9tG
   CHhwOiOoF4BnE4GdlHfVpSj7CFXUD3SLxgMVhf9GRo9YJsdJbxwK6OEGv
   GLgg7lHQGPSc4AB/gmsuzrMlbkV5dcd7o2nosucth0MyZBX3ck3waDFhv
   2bi0xsXp1kKQxzzsCIwVP+Dnnofh0xZRFG1+dXPP0JcXE04tidm1FpY/H
   w==;
X-CSE-ConnectionGUID: TKETTLjhSuC7mN3h2tCxDA==
X-CSE-MsgGUID: LfvIcPJKRa6FOpexX8jS9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="73621579"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="73621579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 17:31:14 -0700
X-CSE-ConnectionGUID: hI8qPSqIS2OICwNfeww3ZQ==
X-CSE-MsgGUID: G/DQRLtIR4Ww/tFUioN1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="181615725"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Oct 2025 17:31:13 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v712N-0001fP-1a;
	Fri, 10 Oct 2025 00:31:11 +0000
Date: Fri, 10 Oct 2025 08:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath
 12/13] <instantiation>:85:16: error: index must be an integer in range
 [-256, 255].
Message-ID: <202510100852.UPFEcNLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v6.18-rc1-separate-dabt-codepath
head:   472ab81a994df0203a9a26838be93ec226d7070d
commit: 90d506997156d4ab112ab04c1cc410029cf8afc7 [12/13] arm64: Support dynamic kernel stacks
config: arm64-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100852.UPFEcNLC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100852.UPFEcNLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100852.UPFEcNLC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:85:16: error: index must be an integer in range [-256, 255].
    ldr x21, [sp, #S_STACK_DABT_SP]
                  ^
   <instantiation>:2:2: note: while in macro instantiation
    kernel_entry 1, 64, 1
    ^
   arch/arm64/kernel/entry.S:700:2: note: while in macro instantiation
    entry_handler 1, t, 64, 1, sync_stack_dabt
    ^
>> <instantiation>:85:16: error: index must be an integer in range [-256, 255].
    ldr x21, [sp, #S_STACK_DABT_SP]
                  ^
   <instantiation>:2:2: note: while in macro instantiation
    kernel_entry 1, 64, 1
    ^
   arch/arm64/kernel/entry.S:706:2: note: while in macro instantiation
    entry_handler 1, h, 64, 1, sync_stack_dabt
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
