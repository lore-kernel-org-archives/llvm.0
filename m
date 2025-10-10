Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C811A2545;
	Fri, 10 Oct 2025 18:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760119812; cv=none; b=B1MlCRn8pFRSGyhontze+9sWw+VmsbdperXkR4UwZJK1NkDvgoLBramPK+b6fVCtO+0WXbKC1qqBp6IFac628m8thTeXtdErbLVSU65Q6G6LUBYO/0X/c9aXFrJ4LMkMWfH3c8Og12UTQCSRqAC+c3221liJBkpPHRgSs8Fxhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760119812; c=relaxed/simple;
	bh=JlcCr0PF7cGWvN2qa7WndLacCdewJ05dCfz0cvdHq40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHXU3w7iSOfIjnuNKZzL5XBVpLq58uFuA1rDoq8ncj0slw6lXC+F/1C4qrkr2dDzJdXKjUV+yOMDCwTv06sVgBCN8aODs0xVCqkM7ollXORGSlO7mGiMgWwVW3OFTAiiJXICArPPwR6PAj7j1ACM9paCFWxXVu2S6/j5lOGqzhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BT5V+Fcj; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BT5V+Fcj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760119811; x=1791655811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JlcCr0PF7cGWvN2qa7WndLacCdewJ05dCfz0cvdHq40=;
  b=BT5V+Fcjh/t2iJJHUqhVhx9vNdDWzFp+5rAB8nfK07MXoK88KdxwU/v4
   U9ftxjdap+YwhfcYMRNTiMoRFHzGaJnZc0byZ8fbRcTU8iN58ykoJUmyn
   BKtdtDj4OXD5RUxUxUwlTym0NUvd8Gli3ZeGZ2+bACh3vg9hTF0rGmjFm
   EHZKSPVpIh2l5MiCA5EuI9TcxoI4fM+XyMt6HYqhesaOF4oMghcVEitAJ
   NeKQzXfFviANLLiH+sOC2d42/T9nr2dsH2+lEOsmDD9JekMl2b0g5KMuB
   LZe/o3qt/nGyQLjY9NjvDiuSCsFCQNtF8kVQJIkTYoLRSgcscYp+VxJUL
   g==;
X-CSE-ConnectionGUID: Fp1ZvKnzSE6vtA3+WyPazA==
X-CSE-MsgGUID: jGRcQCrYSdShA6yDdOiLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62286757"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62286757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 11:10:10 -0700
X-CSE-ConnectionGUID: g5pmrMPeQTWW4DFux2haeA==
X-CSE-MsgGUID: LTfuxCgyQO2aFwX9N88+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="180283163"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Oct 2025 11:10:09 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7HZ9-00032z-0m;
	Fri, 10 Oct 2025 18:10:07 +0000
Date: Sat, 11 Oct 2025 02:09:19 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rv-reactor-signal 1/9]
 /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this
 target
Message-ID: <202510110213.qhlbcrwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rv-reactor-signal
head:   5f1e83d0ead9b8fc09102bea3ac5c9c87daeb8a9
commit: 677a5fe53cf89d36773e93ebbbb1473fb66592d7 [1/9] test
config: riscv-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251011/202510110213.qhlbcrwQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510110213.qhlbcrwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510110213.qhlbcrwQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/rtapp/tests/pthread_test.c:1:
   In file included from kernel/trace/rv/monitors/rtapp/tests/../../../../../../tools/testing/selftests/kselftest.h:54:
   In file included from /usr/include/stdlib.h:56:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
