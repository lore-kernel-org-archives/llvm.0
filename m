Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBCF319617;
	Mon, 20 Oct 2025 13:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760967450; cv=none; b=uq8dwMgTl6hEPTA2LaFp5IVxNRubhtXqg2t/sYkPoidYE/E3E5i8LdNyLUrHcA0K6BucS9ro+2i9SnQU7gpVzyVAHYyAMA7BAj29UBWqIfJRUJQendh37h39Gifxtxe0vIofF0Qd8xiCds4AeQcCU/83UGQQFSxq8rQFp38vvmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760967450; c=relaxed/simple;
	bh=xsAfj9llmggCRKfnH42YIDk0JLCTPPYfPL8JnF5tM/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBBXLq9mcDwFl159UwAPCp9kyUaRGA/OeUp8zFBi5HggaJYaTS6vsXKOtYf0xHPYyESKmiwJc/GvORgGLni02MxlwfOl4GSZYKLAnwWEFGSb0ITStLvbUvqLcnNqSyd1W7JIiYhs810lqQwTIcfILq5KiMEch6W7jxro6FMh72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FH0eMje7; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FH0eMje7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760967448; x=1792503448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xsAfj9llmggCRKfnH42YIDk0JLCTPPYfPL8JnF5tM/M=;
  b=FH0eMje7yklReDEA4ofGkCHsw6my6+U+HMQwTi2V34RoHrCJzxvSwfUb
   BYJh3tHJJyz+uBb9iK8xlmvrD6HGGOMRAjFoZO9MIUbYjb4aRszuZ41WV
   kiNSWIUsPlxWSEgeKau5Xxzb8pLExvYUglYnJRm8oKI8K3k/9b7BDG+cT
   DMOlaQ6SIrujly3ivKEP5S2uSk6QYjZBZHYifZ/nMauFc3KUfjWQgQtRu
   CNeykHnKJ6+5wegHc7OS39m+qDJagwFYag6+3JLMLz/RbMjjzYzQEiPEk
   E4eFhidpismsmQCf9oeCOWPzvYjRBUfss5CInHZttTDmH+WpawUtoEdPF
   g==;
X-CSE-ConnectionGUID: RlPpVY8lQLaTQK/+Zx3CHw==
X-CSE-MsgGUID: 5ooTUcVFRheldZmwx4fc4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="73372315"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="73372315"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 06:37:27 -0700
X-CSE-ConnectionGUID: G/xbjihIQ+mo7dpU6jtt4Q==
X-CSE-MsgGUID: LOwZLrbQRMiPR4RA7744sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="183347077"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Oct 2025 06:37:25 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAq4h-0009rl-12;
	Mon, 20 Oct 2025 13:37:23 +0000
Date: Mon, 20 Oct 2025 21:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>
Subject: [andi-shyti:i2c/i2c-host-next 5/5] ERROR: modpost:
 "devm_clk_register" [drivers/i2c/busses/i2c-k1.ko] undefined!
Message-ID: <202510202150.2qXd8e7Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   743aa55942a532a848a584437d2b8b4c9ffe8934
commit: 743aa55942a532a848a584437d2b8b4c9ffe8934 [5/5] i2c: spacemit: configure ILCR for accurate SCL frequency
config: hexagon-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510202150.2qXd8e7Y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510202150.2qXd8e7Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_clk_register" [drivers/i2c/busses/i2c-k1.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=y] && COMMON_CLK [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
