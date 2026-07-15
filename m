Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126623BB105;
	Wed, 15 Jul 2026 20:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784147741; cv=none; b=BCk5jzIMYdMGumaopnr/WBagTq5IHB1YSz3oyeTRnmAZ+6HL+jXuO+S+kIcwrFYk1u/Rtp0DrEsoQCnxXWfXW1QavHjCyrOHL6E7+0PRVBD4wQMkr+1sKNNaoLBypMEhUxdJbpV/sHQ+fP7RR9Mas//jI9qS/Vm9KanpkfpfZ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784147741; c=relaxed/simple;
	bh=jyj5oY7/bNCuAy4dJe/HGUwcNUOBqHGwmGVx2gunTOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VeaoByOwbd50lmK705Zs54GXeKsL0vi9IsXZyyMrXroL5/hI0qcnPR29WunVANCTOuO9dP/2T2yliEmHsGD5fZIMaQ1mKt3wT8Xr5ULnb4eqPqTylkVx7wKyVwaW9k2ajYkad8CojCaRVOv9ASV5UB3ZMtNTCE6DnQENsdhnGuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXziWs6D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXziWs6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784147738; x=1815683738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jyj5oY7/bNCuAy4dJe/HGUwcNUOBqHGwmGVx2gunTOc=;
  b=QXziWs6DmwBnPfSO2Ys1udGng0cNp01VqUbjxkdhQVXazry6aHiBKn0f
   Xc3nxEdI6P2weHTmhHIn6a3BPcPpHPGPrgrbInpXW5XMQS8rW1P2ANulL
   dDI/vacO8pT29l8q0go8iaKf0bARm7zaudzpHTwWwq62aVPEeseYSIx/o
   dc4tvdDmGnwYeiWYK2STYW6IPsoNH7KZ9NB5Lk3vaUWCGIcDEp5vuZdhL
   ALfcNd3a7TY0H+Rc8AkDCFGY530xykh417JDvLxakRGuiOE4m3a+FT1BZ
   9d8rWVXKZcg2QQ9TJpnLNIM0LhWSMkwbsJ/B2RB4lGnB8c4qIz1wjiMAN
   w==;
X-CSE-ConnectionGUID: ZA3MD8cQQdOPAqsPmUjSag==
X-CSE-MsgGUID: kiF5yWQgTSqT9Dd7qBUGrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="107599514"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="107599514"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 13:35:38 -0700
X-CSE-ConnectionGUID: wJfcEv0KTmm88wrB0uRYMQ==
X-CSE-MsgGUID: LDQ87g9bSOWzf9C30XtfKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="294517999"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Jul 2026 13:35:37 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wk6KM-000000004Kj-0xJx;
	Wed, 15 Jul 2026 20:35:34 +0000
Date: Wed, 15 Jul 2026 22:35:01 +0200
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 79/96] ld.lld:
 error: undefined symbol: HRTIMER_BASE_AUX0
Message-ID: <202607152237.g7x3SYqB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   aae9c6fcfe1b60e4a63da0fe64f8ffe470b0fa29
commit: 69bfefa1c9bf52492df144e6ad0daf86f82a3727 [79/96] DELETEME
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260715/202607152237.g7x3SYqB-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260715/202607152237.g7x3SYqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607152237.g7x3SYqB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: HRTIMER_BASE_AUX0
   >>> referenced by hrtimer.c:2247 (kernel/time/hrtimer.c:2247)
   >>>               vmlinux.o:(hrtimers_disable_clock)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
