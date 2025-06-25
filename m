Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE011C69D;
	Wed, 25 Jun 2025 00:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750812808; cv=none; b=hN2P9Fk2604t/wTd4LingzW9OFbN+gITAUjgizoCl6NlCKTUguHt0xfvAh8lkCimi384WPTtl/ZwRsADnJIyRJhf2y7AiZ6JlnIJHsL7ZR0BeCcgDuGGpEj97P/5EfgwWv3JU10nfMGDX13XvYCdNKFMCAPOZwsI/LfwAGzwOOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750812808; c=relaxed/simple;
	bh=6UjiUIMwuhuLlQuGi506wxp+dRK/c8MR0rbNOcUMVvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rRJyAtGA5of691SBasTxjZtkF6sidh5miVPo8AfztqfUjxD/YMa22LXPbYVLQxN5+wkE9gSqNnW4Hy60osQvjT6ZzFzcSlabyAGsgSG+QZmXYeZ2jdzLET4164OSsxmbqG1WoX9j/fN54vO2XjFHkhWi5No/44ki3AckwDkEF1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFPIpAhj; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFPIpAhj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750812808; x=1782348808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6UjiUIMwuhuLlQuGi506wxp+dRK/c8MR0rbNOcUMVvQ=;
  b=nFPIpAhjws6R8HoJro5v084lzWjFn490BwzjilVcYfZln0+qCchwjxpa
   qeq41XYDm6NPv4gihg0AMK4Hsqv4wNCflF8zNUm/6WHIq/+R88aQ10UNl
   UEJcYWp3lG/lajG41Xd9+a+ivqRgqWqXhjXogk1KGjYgzpphlO8BTxVML
   pHd2Q51BC/W/vGHO1OSEaJRF88FjbQ8dTmyiuOZKoClIWhy9Ych0Q3C/R
   v/zafRGhBHPPCRhcMEKuWuQAzL/taqmeVetJas5JrpzNG+U5mytryrYBg
   wm0eKQzWeLoZIkZ2QEk0ynDpmxxhArSDLCIX/GF/Dkerx8riZx8wcPFxl
   A==;
X-CSE-ConnectionGUID: l34mlqWWSqmuLvxD3ipzQQ==
X-CSE-MsgGUID: JoFqei1+S/+YsESUU8dwnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70498328"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="70498328"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 17:53:27 -0700
X-CSE-ConnectionGUID: N/7rRLknRWyajmUa7nJf0A==
X-CSE-MsgGUID: unYm8mmORw2BzHFN5eZJ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="157832517"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jun 2025 17:53:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUEOB-000Sdm-1P;
	Wed, 25 Jun 2025 00:53:23 +0000
Date: Wed, 25 Jun 2025 08:53:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 43/65] error: no rules expected the token
 `ARCH_STATIC_BRANCH_ASM`
Message-ID: <202506250848.uW9fXtgx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   725de0d647d7481d2906efc3acb44c8afd5e4244
commit: b928a7bd0ac3d38d2aa464038bad4f972f01fade [43/65] x86/jump_label: Define ELF section entry size for jump labels
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250625/202506250848.uW9fXtgx-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250848.uW9fXtgx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506250848.uW9fXtgx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> rust/kernel/generated_arch_static_branch_asm.rs.S:7:89: error: too few arguments provided to function-like macro invocation
   7 | ::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM("{symb} + {off} + {branch}", "{l_yes}"))
   |                                                                                         ^
   arch/x86/include/asm/jump_label.h:25:9: note: macro 'ARCH_STATIC_BRANCH_ASM' defined here
   25 | #define ARCH_STATIC_BRANCH_ASM(key, label, size)              |         ^
   1 error generated.
>> error: no rules expected the token `ARCH_STATIC_BRANCH_ASM`
   --> rust/kernel/generated_arch_static_branch_asm.rs:1:28
   |
   1   | ::kernel::concat_literals!(ARCH_STATIC_BRANCH_ASM)
   |                            ^^^^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
   |
   ::: rust/kernel/lib.rs:246:1
   |
   246 | macro_rules! concat_literals {
   | ---------------------------- when calling this macro
   |
   = note: while trying to match sequence start

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
