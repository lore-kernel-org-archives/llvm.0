Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB3215166;
	Wed, 22 Jan 2025 16:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564127; cv=none; b=C+qJk3OIQdfLz6xKWm8jdTD+Ds6hnRFEoLo1CY6Aol2N1+d7CwRlFK7bh3EhiC7jdRSWKXLh7+WDVPXeGQZ/0xZbdUDbUUlowj5NoNEYVQmyIUnZmNNfInnpkEtd0CaEEyJmWl7IfVn8mVCvOUwAR9JzEqEBUVzThVqRt8HHaWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564127; c=relaxed/simple;
	bh=xF8/GJVupEEA76BMeD04LkR3hOICfNRwYAf9cs7qwgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=io9cmvZC7gH3joEaU5RPG9EfRNWov05vLrnq0nxP9V1ZckmunSpSBO6fqxE6k2yGrhHYtO+QkbpGSv47IBlo6LCLLMYtHdIhYneP8f0vP+xpj22kR8GKZFOh92/ZTKJVeE7k0UVAiuyl6reLNpXqZKjPLiGfXUtAkVz6MSHD38Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2TkenKv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2TkenKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737564125; x=1769100125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xF8/GJVupEEA76BMeD04LkR3hOICfNRwYAf9cs7qwgs=;
  b=Y2TkenKvXEb1pedAxQdYtHj2wQN60yJ1tM10VpgzWnbOTl5m1pUkB/SL
   GAWsH5ZbAJI6GqbjVZ7aNygmxuPdAaKq6/ngaKAD7EGswdh/UH6Osxgo9
   Dxwdr9f67uvmh3PHqtj0GqU9PMk7zgzvagth9wh8vDCm781BioOZytU0M
   K0nz9LxuOcbJtrpvTy9CzaRNjpsvo7m7i8DJ4qOz6CcNF8SQoAfkiqrcL
   5Rf1PbBl6ud3F0ONHdoFF6k4/jDPILLlIBmsTTsgnVBSbaY4hRL0aS+jN
   acDJANB7dtc8cvju0ifRIxyekTGaAXNJs2020Gx0b9cty4o8HrtGJrnuc
   A==;
X-CSE-ConnectionGUID: CW2ghzVWQvCcJXiX+IrMRw==
X-CSE-MsgGUID: Qk3U2oC1RDyqsMy6zhHx8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="40852235"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="40852235"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:42:04 -0800
X-CSE-ConnectionGUID: /ExYxHOWRWKc/9XwV9bVKQ==
X-CSE-MsgGUID: +4uipdVyQG+Rm7bdYY48IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="107027994"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jan 2025 08:42:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tadnl-000a7f-1k;
	Wed, 22 Jan 2025 16:42:01 +0000
Date: Thu, 23 Jan 2025 00:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9503/9563] drivers/accel/amdxdna/amdxdna.o:
 warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
Message-ID: <202501230017.yXtLZxQy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   232f121837ad8b1c21cc80f2c8842a4090c5a2a0
commit: 1345636009b22ada16e06a2057a917326814d1af [9503/9563] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
config: x86_64-randconfig-001-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230017.yXtLZxQy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230017.yXtLZxQy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230017.yXtLZxQy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/accel/amdxdna/amdxdna.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8
--
>> drivers/nvme/target/nvmet-pci-epf.o: warning: objtool: .discard.annotate_insn: dodgy linker, sh_entsize != 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
