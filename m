Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797796;
	b=LuEPNkItk0xlbVsRFp6Ja0NeAFLThqPNOSmWcSt148imPfMgm4/GhUmxOE7fQDBNYpQT
	 o0vhHYgNWHODpGbpFqdkrL/vxoBe4SjzfJgORLg+yzerOZxZCGr0Qq5orgfG3ITSM7xPB
	 Qnsy00YmVxZw0oQ7LnsN/5ltRHQZDc6ZNzclOuRKo/5IROIN+ue81NCj0NqOeB7QxAu89
	 /JQMj9S0jPnFSV9TpXxmxeffiqTdQwj8ZYjPJoSUcApCmYC0URGEmN6AS1R6d1GNTxDKJ
	 duXR4zI2sPRz6nxQ5iWDvpORasmvH/UQcMG5yRCTRnwV3eqhVGjvTKJJlsocGWP2f5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mCOgjwJKSs2Rv/DfiBRwTMq+z3t/zgr11rpBBh/KKnw=;
	b=Hd0Y6owS/NqOLos0keVlywkZBOYJJCxGmp5cZ6EKXV5HDrFW1Paf6IdRrinP5o2YV/Kv
	 iNRBnQuZ+ej5+rdGB4d8tK/e56K4O4qRdTSaM2qQrZus5e9KykHWov1FFRnATmV5KPfmn
	 YRTCuQJD/0AMHlZDyGXgELQ9coGF04DRG1u7br9f/lJuKrZqZQpEKpZhBEiytorNWFJXf
	 HbBX7KO1+0gZg5uCjdE4lGULKzbzVMZpQDf7J7ltqS9InNgJsKC8pwWci9QU3G3brbgy0
	 ujlz02cj49qyapD2JDli6kqspujDPZhw8nlRmT8XB3P9Zt8Vo+M8Hlp89F9WBnA9E/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="J7iCkH/0";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC770606A323;
	Mon, 16 Nov 2026 02:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC770606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J7iCkH/0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794797796; x=1826333796;
  h=date:from:to:cc:subject:message-id;
  bh=kWNo2spHP8ubkHqe7vCfuhXds3F30K5yzt72lCfjHEM=;
  b=J7iCkH/0wFUyUWPt4+WAQqLrpQ3XvFBIdWAm8RaOALVLsdj2Y4W0CnKH
   Lm/9xGfU57PZkBwE9g0aA7kGW6iuhVXC40UgjqtZ3modIE7cImPCWrTgi
   YONncCbL3VR+ryF/rZLLWvpNB+y1+npgMR8K+5PN/pU9UwWQYjINb4HCk
   Mahd4HMRnARRI+rUHnYerP5svLjpQDts1bZ4VYTc0iviAiGZcorSMYh1P
   EQ8UkScgRE6OuSs5eUb8VZv++MhXvnCLcAKev/uEur9PabENCu+oLFrLI
   hYD1MgY1s6niJQ1Fm2mSAzL2Ece9Z3wcgzVkCW6+T7aXNsrVwM91BrbDS
   A==;
X-CSE-ConnectionGUID: 2L4VxoAyTJar9ddPaUMlKw==
X-CSE-MsgGUID: iTsTehhaQuiP4trmEl05vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3523079"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3523079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:56:35 -0800
X-CSE-ConnectionGUID: eNl3SAULSnic5jIiuK3FxA==
X-CSE-MsgGUID: 6+V0A4JZQOGw2ak4PioGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9686477"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Nov 2026 18:56:33 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSmtT-000000002Zv-1fss;
	Mon, 16 Nov 2026 02:56:31 +0000
Date: Mon, 16 Nov 2026 03:55:59 +0100
From: kernel test robot <lkp@intel.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: error: kernel-address sanitizer is not supported for this
 target
Message-ID: <202611160342.C2Ii8PRu-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

Hi Link,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: 73b741adb264967093ef4eb59905618a7e0d0de0 rust: Add PowerPC support
date:   4 months ago
config: powerpc-randconfig-2001-20261116 (https://download.01.org/0day-ci/archive/20261116/202611160342.C2Ii8PRu-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project cbfac21cd384f6c7c480c2d0026ecedfe2d619e7)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611160342.C2Ii8PRu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 73b741adb264 ("rust: Add PowerPC support")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611160342.C2Ii8PRu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: kernel-address sanitizer is not supported for this target

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
