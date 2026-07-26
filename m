Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2233917BCA;
	Sun, 26 Jul 2026 05:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785042842; cv=none; b=oCZUjfaE/GRh7YS4LuPZKKZ2oaWt2CbVS62CZDES+Ie964fPbTzxYUzuzst3ETOmb9tpnbIEEUKfJGaBR9yuUk8qOUtPyoW/gX+DrXcSmV28ygue1Qfrl9+0DTQbx+DlPe+lzNF8y+xF+uY7h6UZQLrjquPucCVvQe2gxWmqhKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785042842; c=relaxed/simple;
	bh=OcepMezlfJ5aTL5FnnED0XWx/TSvs+oMd/4NFFs3b7c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s1QJfnCEfExYVYm0KQcfFwjJETz93I5p0Xcs0Pkg6TrsHVW0UVFDVSMDt9vTXqJUa/dlLKO/n71gt0zRcUrf9+HWIMgkosYuzTsv3OOfOi8bjTK6TEXKe+hwFo2qwQa5PorMRQAhg61xg7cjgHVFpKQnm0CXE6dm81+WpJAyYXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UF9x1+72; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UF9x1+72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785042840; x=1816578840;
  h=date:from:to:cc:subject:message-id;
  bh=OcepMezlfJ5aTL5FnnED0XWx/TSvs+oMd/4NFFs3b7c=;
  b=UF9x1+72uRJewCwZbvIb/FIAEiebpUB3oXph2sxlG1w/veWfymLw1Qn+
   K7naGpLp5i9JmqbJpeF6lRUqtPZdiN40MZk2d4gQzp2NFQIiUzCaHqGfD
   NR/gjBHnM17P3p69Uf65i7B3auj7REpPLEkZJYmX3k7rY7Hz1s9VmH7ob
   BNz4x6JKq+JMDCETBbuFRdXDQHp2S2ZzmsHinHsy2KcBZDzloIobziO0y
   ZZxbDPO7D/BWAzvJ7ly0T2LHI1icIRHThEVIitDsko1s6PFpn7skhsFGG
   wcIc0knjt112QU+e773lAmYNHMMYoR0Y9KYv/tmsgXTcB4PacKl1fhpfS
   w==;
X-CSE-ConnectionGUID: Ata/BX4xQPSlF7cbOXFyww==
X-CSE-MsgGUID: wOzyRtYwQtqDqGkapBkv5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85836260"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="85836260"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 22:13:59 -0700
X-CSE-ConnectionGUID: RNj/addMSDmcEi8d/vW9jw==
X-CSE-MsgGUID: N6IOGZZ/QBCSFTsa4V56tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="256435799"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Jul 2026 22:13:57 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnrBT-00000000cIF-24Md;
	Sun, 26 Jul 2026 05:13:55 +0000
Date: Sun, 26 Jul 2026 13:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rng 5/5] WARNING: modpost: vmlinux: section
 mismatch in reference: drbg_selftest_once+0x14 (section: .text) ->
 drbg_healthcheck_sanity (section: .init.text)
Message-ID: <202607261222.QNFUNGyd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rng
head:   b3d559623a0829567d9f40d2d71da0e63ba7f549
commit: b3d559623a0829567d9f40d2d71da0e63ba7f549 [5/5] crypto: rng - Remove crypto_rng
config: hexagon-randconfig-001-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261222.QNFUNGyd-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261222.QNFUNGyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261222.QNFUNGyd-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest_once+0x14 (section: .text) -> drbg_healthcheck_sanity (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest_once+0x18 (section: .text) -> drbg_healthcheck_sanity (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest_once+0x1c (section: .text) -> drbg_selftest_one_vec (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: drbg_selftest_once+0x20 (section: .text) -> drbg_selftest_one_vec (section: .init.text)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
