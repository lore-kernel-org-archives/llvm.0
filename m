Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FA3DC4CB;
	Wed, 27 May 2026 13:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890105; cv=none; b=Dp+iyP8HhYZCCsBs8Fnyka4NusP5V9I4LnSKuFkweYXZR/7KqMPEvknzXVg7SiaZHbmsYJm7Oq27bJ8EljSgL1ovYNcAVqPQADaBV1N6TA13/W5hY2pn9pPA1bKdnlPsSh1lg6EmbORgEYelVK2BtaE9+kDjs2/q0UJ0NJmXmDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890105; c=relaxed/simple;
	bh=PAQny02UQuphsRSJ0GCA5rxjLiP0Wa2G119yYk9uVFU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oN+sw1wsTIsxf1RWeIStPQSVorF2bywaMCuO/8Z575txsqvdct4LnATT8UJJ4sDGzYm7sBCicaiYrnKqPz76sD6MVqStBpa0bGhI5UNXji7C4wcdF94iyNhDegpE6OjkC1exUa0QpzPN8FVxyil7OtRwl2JiO3v9fkOe32/sdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1Lsuo6G; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1Lsuo6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779890103; x=1811426103;
  h=date:from:to:cc:subject:message-id;
  bh=PAQny02UQuphsRSJ0GCA5rxjLiP0Wa2G119yYk9uVFU=;
  b=e1Lsuo6GwbDGvhiXPigfzB0azwup67SuwzHGk8zqzd1EZVqEMAgY18cE
   VjURC5Cix0yQhQXQG5AZu03NCVf1Ev7xWD08h6cpAsQBHL4Zk1ULsgzG6
   Lt/lr5GlIWRXB0RVoslk3+gIWRl7Jv4neu/aKgDuwVzQPm9mB+DcZ05Bh
   EVKTZW50DCtxFQA66Vl2J0UpxqI4r7NYOiCAInx8zUKZDiqQFigEfZLI2
   bRiUYPdPEBzogB1u+vdcNmzIYAioIRXfQSS04AW+m5g6L/FirI/8BwZJb
   2ZwGKCfLwbLUU5QuzaHWTJGrmN0ILegPtOPzzqagly4tu7Hnr3hBgttCI
   Q==;
X-CSE-ConnectionGUID: yzjvBUxLSVWSgcuBFaVrfw==
X-CSE-MsgGUID: CB+h8oMCTxymeMPAfHLiVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91408575"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="91408575"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 06:55:03 -0700
X-CSE-ConnectionGUID: eoUlQ4TBTAuIu37UKT3uQw==
X-CSE-MsgGUID: WZQzm/4MRDidDjvQKKfVuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; 
   d="scan'208";a="238077146"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 May 2026 06:55:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSEio-0000000040Y-2VIJ;
	Wed, 27 May 2026 13:54:58 +0000
Date: Wed, 27 May 2026 21:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 7957/8013] WARNING: modpost: vmlinux:
 section mismatch in reference: tdx_module_run_update+0x240 (section: .text)
 -> get_tdx_sys_info_version (section: .init.text)
Message-ID: <202605272110.QiNGdptX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e7e28506af98ce4e1059e5ec59334b335c00a246
commit: f2deea5559644fe8296d034da97bb5d07e1d7299 [7957/8013] Merge branch 'next' of https://github.com/kvm-x86/linux.git
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260527/202605272110.QiNGdptX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260527/202605272110.QiNGdptX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605272110.QiNGdptX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tdx_module_run_update+0x240 (section: .text) -> get_tdx_sys_info_version (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
