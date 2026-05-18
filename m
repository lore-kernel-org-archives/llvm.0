Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E51BBBFC;
	Mon, 18 May 2026 00:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779065292; cv=none; b=OegvZoCihDuiJN4ick+AkUxyhnnIKtMINEVIBQyGbkY2uyosLFr2z+1cfmm2VSKH35zhfo4AeUHj8rxALTb+igglThSyj0fypiXfB7GLvG2D0Y81hBczFMWqd1OLrVeiZc6rWzUzAnW/kglZbO0G/6sLK9Gxpph6Et5LZjCdNc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779065292; c=relaxed/simple;
	bh=Y1nf7j3Y9FI2KmGuI0gScfB29izwAUSoBpPX0IKY77U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ns0JMYJcYrbp23oQEyfWArg6TTzk+r332ZQppNq5LHNtU/g03jPPQiskWVMfQ7jRR9SSvwfS6kVGEtaf7hJLziHKF0WibDlv4rq03+7JiIMeaYvoo/y2oOXz84zt2zFQcZ38NDZPwIG6q1CFNJCsoieJ5fdqCwW0SvyhUOPu+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoKRDkoW; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoKRDkoW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779065291; x=1810601291;
  h=date:from:to:cc:subject:message-id;
  bh=Y1nf7j3Y9FI2KmGuI0gScfB29izwAUSoBpPX0IKY77U=;
  b=HoKRDkoWQsE5CZY5wq2x7EnoOQJBkqzUGcAUTkbgSKj8jAz2YgqxmaW4
   6UKaFZp6uteDP5ttzfcUrQpdJ+ZEWN5P5bRJFm6r0+/VJtTO9jD7mPJ4F
   QPU9JZZEJ/qRuyxSiZfRUFdX11r9036lj7DIkyCmLC//oXQDZkef/b2Tb
   PBJogspBrJmPsaPKfRssbRpFc4dbXqK2We/y1bkhOEYhmrl+T4bBYB3xM
   LKB+aoLhr9yVMnZO00GXSnjzRL6cM34X0NFgxcPmhhpNUH1TsOrx3gmAX
   fvvhVoioPxJ2u0geSiYxPjiSUUofYX12rA0+kfbRFfZfXXyVQSuwWDegu
   w==;
X-CSE-ConnectionGUID: B0yh/ibgRE+1fqcPmQpwdQ==
X-CSE-MsgGUID: lmDdps3MSM6KwmbuwLlHaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="97347175"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="97347175"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 17:48:08 -0700
X-CSE-ConnectionGUID: 1vRWk5yxSjuuPG1CfkwWkQ==
X-CSE-MsgGUID: ck/gcUxfTIO2CWLDW9uoTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; 
   d="scan'208";a="238392306"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 May 2026 17:48:05 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOm9L-00000000292-1Kbk;
	Mon, 18 May 2026 00:48:03 +0000
Date: Mon, 18 May 2026 08:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Tejun Heo <tj@kernel.org>
Subject: [tj-sched-ext:arena-direct-v2 57/63] ld.lld: error:
 undefined symbol: bpf_arena_handle_page_fault
Message-ID: <202605180813.fd9yQ9I5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git arena-direct-v2
head:   9a6ad465caf4abb564d5fefa575436b68e0d7d4c
commit: cc0ed57bf54a18ce6607f9a60f86bf7e264c3a4b [57/63] bpf: Recover arena kernel faults with scratch page
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260518/202605180813.fd9yQ9I5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260518/202605180813.fd9yQ9I5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605180813.fd9yQ9I5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: bpf_arena_handle_page_fault
   >>> referenced by fault.c
   >>>               arch/x86/mm/fault.o:(page_fault_oops) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
