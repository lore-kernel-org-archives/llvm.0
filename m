Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C994BEE54;
	Sat, 12 Sep 2026 09:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789206033; cv=none; b=Lfp5mvShhXVtxkxjn0Qmr2TW5eIiBq4hBYiLS+4ODlmYXvUnco7wluW4gsbtEdzNd+A801+hOuBGVwpvGcX/WHBdt3ZZQwgxcfV1BjnUbug8nzdeAsPI/ogIk0x+bTCukQNULpx40DrtR0tp99OvGgbxJ32mrL4+X/Puuo94G4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789206033; c=relaxed/simple;
	bh=DereGst38L4X0y5rbTpXMm7D80X1DjjJJkXtTsGkFZA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ivg86qgpDQozBeapYEnGehbDgWNW0p6aO8pHPFO4H5dy/F01ZGSj+RVhoZVirAHZZ2fNOvnYflfp+ww9Dk+xo/Of40BVf32amJJrvS0Cg87WYnLkh6SNKGAF6fYra9z87eIcsySFRKab4oseNNo+kcZoFn2kuLIT/3ibOKACpYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsNxE3sU; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsNxE3sU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789206032; x=1820742032;
  h=date:from:to:cc:subject:message-id;
  bh=DereGst38L4X0y5rbTpXMm7D80X1DjjJJkXtTsGkFZA=;
  b=IsNxE3sUC9REVE3WweWkJqN6Up1/QS25Lj2gR91/BTlp4qmPXK3TrDjp
   Z9U83zQLdJu25RcyHT+pDusSbvPGEhsTSMXk3E6xW1pxQ4ES10f8QAlbQ
   p6bzhjT3DIRUqDmENbo3o1WqttPmkCziKt6npTkH+ls2LBModCcbcCrQX
   KMIEb37QFQHhIF+5TG6wS9NNkXc03oknBo8b8WgTi7ZjNnig5VSC/lAE9
   rZDt/Ru+whGOs/rBFxrt59UzKkHxKgj5+lJ/+nS3Nb0TDLiUh1FOR6ymh
   5BkezUGuZowm+bgXhMFX0lzruWj4mcz45g+eh4TY+2SRDQPmiZhGiHPbd
   Q==;
X-CSE-ConnectionGUID: CMB8qbqDSyyABEmfrEQ5Bg==
X-CSE-MsgGUID: ifRRDbmETgagrk1YtpYtUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="162824"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="162824"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 02:40:31 -0700
X-CSE-ConnectionGUID: WZRj34ouTcSfCEKDo05PzA==
X-CSE-MsgGUID: 0giQH9VLS5GOrcdSRnwq/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275681717"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Sep 2026 02:40:29 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5KDj-000000002p5-1ZG2;
	Sat, 12 Sep 2026 09:40:27 +0000
Date: Sat, 12 Sep 2026 17:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 33/66] error[E0425]: cannot find function
 `regulator_enable` in crate `bindings`
Message-ID: <202609121759.ulrbax7l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   ac7b6280e922fd6f4053c6350fd5cd77ca1c73ef
commit: 44b8c36a829c619a9c7bff439ca250b289c06ee6 [33/66] regulator: core: Add "enable and wait" functions
config: s390-randconfig-002-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121759.ulrbax7l-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121759.ulrbax7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121759.ulrbax7l-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `regulator_enable` in crate `bindings`
   --> rust/kernel/regulator.rs:288:38
   |
   288 |         to_result(unsafe { bindings::regulator_enable(self.inner) })
   |                                      ^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:117342:5
   |
   117342 |     pub fn regulator_disable(regulator: *mut regulator) -> ffi::c_int;
   |     ------------------------------------------------------------------ similarly named function `regulator_disable` defined here
   |
   help: a function with a similar name exists
   |
   288 -         to_result(unsafe { bindings::regulator_enable(self.inner) })
   288 +         to_result(unsafe { bindings::regulator_disable(self.inner) })
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
