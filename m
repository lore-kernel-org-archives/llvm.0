Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3013523817E;
	Wed,  2 Sep 2026 00:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788309234; cv=none; b=R8nbyo2fIxenz1YPLfJ8V6MIDyfcwRdb24qV8prukwOpiTFxxyShNAMWjVZa0msBJGu5/EQ87vVqkZmRgCdSnq1EyAK4wC6coCHxA2Lrh0c9j/c7+tRes3po3Sv18CCtGJQY0To6FaazHeDiMBhYKDpxEs0Sl3oJDRqOhOwabbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788309234; c=relaxed/simple;
	bh=CSEo7D1d2yYnSXdG9vhTDHoreLgzWGmNitW5IM9DQSA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ojSe/abFXz1DlCDPuRv2jRrrE04Po92ukjtvQCSM14gsN1CBs16p76P+2Frg/isNMs0JGEo4N4KH2F3LRf/YBYnbJ/svcxiuHFmd2eFIE4m0Pp+kli7XHFBcpg9IjsCJ42fxNP0mAUoZm9ve2tsl0DVcflIvm6IXuVvI2xKZQIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyr31Jcl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyr31Jcl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788309231; x=1819845231;
  h=date:from:to:cc:subject:message-id;
  bh=CSEo7D1d2yYnSXdG9vhTDHoreLgzWGmNitW5IM9DQSA=;
  b=fyr31JclPW8+JJuQNFpgyqcYJw8IExJDGBXaCu3+n2AMpejQAd/MUyxu
   WxGnj8XNZfrxKEPKJJv+8fDeIsa5aZo+n1IqMoA6aiquOhGum+6GqK1qX
   vUFlNG4TBXrv3aSTo3FnOxJx/1fStBp0F4EUnTLLx8Dz8AX+pToXFZ8+U
   iea3WKXOYYPkc8JCbwQ+tSq1x4S6+TpqCxYqM6ZwpISg3NYQC60SAUE82
   FRTPRnRj7pB4in8ty8UYSLm7UUBMrTfckPz1jQrEidxPLTIMx+Z2FnXRp
   r1F8syfkj4V7224lPcnR7NAdc/OMkMO2zzxZwkZQc4cviaxEt3G4RTr42
   A==;
X-CSE-ConnectionGUID: /Qi16eghTAKzwdP1besyWw==
X-CSE-MsgGUID: arRfxGR8Svq3AGFAPPSsHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="100109598"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="100109598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 17:33:50 -0700
X-CSE-ConnectionGUID: GXvqsOcyS62r7rXp4y5sbg==
X-CSE-MsgGUID: zNpAudV9RSaRBtVgX59D5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="268713907"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Sep 2026 17:33:49 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1YvC-000000001go-3Ae8;
	Wed, 02 Sep 2026 00:33:46 +0000
Date: Wed, 02 Sep 2026 08:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/250-aop 30/79] error[E0433]: cannot find
 module or crate `std` in this scope
Message-ID: <202609020805.FNeYiuCM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/250-aop
head:   e793b14f66e33b70363166d84886d82d462f1987
commit: 1dd83f8f25741b6844488bf0aec201b88d453c3b [30/79] rust: alloc: vec: Import .drain() / Drain from rust library
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260902/202609020805.FNeYiuCM-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609020805.FNeYiuCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609020805.FNeYiuCM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: cannot find module or crate `std` in this scope
   --> rust/doctests_kernel_generated.rs:1019:11
   |
   1019 | let iter: std::vec::Drain<'_, _> = v.drain(..);
   |           ^^^ use of unresolved module or unlinked crate `std`
   |
   = help: you might be missing a crate named `std`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
