Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AB43B9D91;
	Mon, 27 Apr 2026 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294307; cv=none; b=fkRH3ojlBmua/YQYVCqC6BdKVZ3veAAQSLsOCFraT+DGMsn/g3PLP9D/nvYbN2AvEXODq4rtVMLMBTiWCre45lq9OQu59POjFpsAIqrkuAqrbxNf+UvlwyvUX1TRq2TrHUY4y2PZT3QkSEGYqS2WlgGaQWkooMoDJ1oOBOwT7Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294307; c=relaxed/simple;
	bh=96LmLHtEUoZoG+jhgLJ4NaYMMljlupbMm7Uhd2PFO6U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IHKhM6nbWS6cUuO1OdSsAJGOJxINXf4PgpIj8b/yFpwUGrqedGGbi6Q8d0Q9paZyRpPPrz7jIwfR3zL7cMievR5KVFEVzqmY/LOOG3jIaWbqA0V1q36yZzVObVEpaRYJlBwL5ihJngsNn2N5FGs7wvavCKLUI34pc7QaJwLkyk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ktxh+xTH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ktxh+xTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777294306; x=1808830306;
  h=date:from:to:cc:subject:message-id;
  bh=96LmLHtEUoZoG+jhgLJ4NaYMMljlupbMm7Uhd2PFO6U=;
  b=Ktxh+xTH2qvjqCKwFXNw6txisoHsRiVP/vKystrMw8uHFjB+85WZjZlO
   mDbsS2tKyblT5DIGPZZQ2kooFK8eI9glQnS0n4UySjxKsL/HPBRHFlgLk
   I5Y96kskNlFx5fH3f8RRd2n0K/3RTj0CdzygAkwBVUUwfAF6fBeDGUs9X
   nBz42QoOuBNtvQ0VNt+D5/dz6HZRdYVPn8C+KdjqFDj3OkmItPMhQK9BT
   ywfWrXGgtL2d8pUszPES/HqkEKnNQDpRVnGJKLroSJ6qzxQ4U2xsKwOnv
   mNbo3nOVNGpi3SuuodLSlR2/Twu1AErqUzTkRP8wCc+Bs+gFuW9bosLcy
   w==;
X-CSE-ConnectionGUID: 8dcRFUmPQla/EWbHl8CIqg==
X-CSE-MsgGUID: xgmKF69kSYWbD0rEPMTR4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="88777049"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="88777049"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 05:51:46 -0700
X-CSE-ConnectionGUID: TF8FuTX3QmCkGYiGBkogwQ==
X-CSE-MsgGUID: d7gJ8q0kQc+wz/G5GHNDjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="238667202"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Apr 2026 05:51:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHLR7-0000000041l-2T48;
	Mon, 27 Apr 2026 12:51:41 +0000
Date: Mon, 27 Apr 2026 14:51:11 +0200
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 2/16] .clangd: warning: ignored by one of
 the .gitignore files
Message-ID: <202604271435.cx0gr84r-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f67675beb630c7b8a22efafd08aeced178eb32d8
commit: 6c7c22dc2ac7618d62624d119cdffc1666a042aa [2/16] clangd
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260427/202604271435.cx0gr84r-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604271435.cx0gr84r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604271435.cx0gr84r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .clangd: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
