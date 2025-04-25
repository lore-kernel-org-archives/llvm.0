Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED56223F439;
	Fri, 25 Apr 2025 10:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745578146; cv=none; b=P4j3zT0ucb442rlJjXO2wCwIB59fTzBEy79ntd911ZnLdWhFZVRNpAPTkkISrTg7mL6loixvUjJ8hUUTLjpcjFWxBW9Xl71LkzUd6fQu8S+lOhRP3UnBaBtN9029vi3gq4MCmv6hMeZzP2CyUgDa9dTfzo4Z3NhGk613cK4lePs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745578146; c=relaxed/simple;
	bh=idvIRo39l0q/Yj1JRHmwkpli2NHUOiGMY7HXl+6k1uA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcKGO+9yWjmZ6itXl9hLHvGkItgj4vI9uIJXnVpbHhMKFuW7U3AbgKiq7Z7IBnsuR5mpyqwJDr95e2+whFq+WHwilvFtGDioSx0c+s/WGzZtgQ8SxTuKXumIhTTC8S7EGkO1BGzxaNQAXOWoqf7Y9Q92FfXwTtUn1yWFljSumcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXrJ6WNY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXrJ6WNY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745578145; x=1777114145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=idvIRo39l0q/Yj1JRHmwkpli2NHUOiGMY7HXl+6k1uA=;
  b=lXrJ6WNYZvvmqU3xTzUg2bUzbKzDhdhljx8c6RRlT5AMjUtXWIUkvV5L
   liA3p2tFaBTKyI2NW5KKh0N0I+8n1Yj4xi68mQug1l5eY43duXChTTglJ
   XPf2OQ72W+fzacjU34wB23cTEukRii+FKAZxk8s4XNQe1GagPrAw9pCPd
   snNN09Dvjg9f/EUTGHoSqGdxvJmmgdHn9ebT2YmVyCmH5+bqCZeG5Jicp
   NlmgOgEUVagyJnfGJwMvNgCBnvM1aOtlF4HdjvuQajj6pEGWdIv47C0U7
   bMPkIeylRCrWQWmNfKTY+YHwlM5Ckote0T5y5Lw9EQdw+wdM+e+aXlQjD
   Q==;
X-CSE-ConnectionGUID: HT4ROuYpTZ+3U3Z5tYqVgw==
X-CSE-MsgGUID: KF5lOAg6R5icBaIbX2IQXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47364162"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="47364162"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 03:49:04 -0700
X-CSE-ConnectionGUID: /+nztXfVRFO9RqMiOBpZrA==
X-CSE-MsgGUID: E7F0Av3+QfKRd4uYrEsZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163941300"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Apr 2025 03:49:02 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Gc8-000557-2b;
	Fri, 25 Apr 2025 10:49:00 +0000
Date: Fri, 25 Apr 2025 18:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ingo Molnar <mingo@kernel.org>
Subject: [mingo-tip:WIP.x86/cpu 17/17] make[4]: *** No rule to make target
 'arch/x86/um/../lib/cmpxchg8b_emu.o', needed by 'arch/x86/um/built-in.a'.
Message-ID: <202504251840.deJRQYhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/cpu
head:   d110d59bdea172326dc4f88ee93ebde525cdeed2
commit: d110d59bdea172326dc4f88ee93ebde525cdeed2 [17/17] x86/atomics: Remove !CONFIG_X86_CX8 methods
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20250425/202504251840.deJRQYhQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251840.deJRQYhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251840.deJRQYhQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/x86/um/../lib/cmpxchg8b_emu.o', needed by 'arch/x86/um/built-in.a'.
>> make[4]: *** No rule to make target 'arch/x86/um/../lib/atomic64_386_32.o', needed by 'arch/x86/um/built-in.a'.
   make[4]: Target 'arch/x86/um/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
