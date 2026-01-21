Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC70634A3D3;
	Wed, 21 Jan 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768963224; cv=none; b=A0dEIHqibb8ajBwbDqI9nVjyKye5UZ+PoUYzXumT1AS82GlaFdcN/2+0oQYF9axqNvqDWh0QU+oDqxD8HdwEbuIZwWEUkURxNO7cDuNpwVtTjJiN1PCypHzBO7j1jdTLsmsw1/LsmtYDMmGsVEdkdc7bAobEtM5cX7/3IyNHJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768963224; c=relaxed/simple;
	bh=to1D5L4CPSF0QLNrF1ecec5+y03MLtN8/Na1J2yP+oU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JLYeWraOdQ6geXjMVgMocziVEmfyrEjVTNnEOJjUrQGnnjQt6h8pogLUVryZVKNW20r6MceEQNBqEvEEZ3nRHLM/M4b1BkdgEyVId3tX9PC9aKME9AmdoaDO84W2Gyz9NnS9MODy8LwIg4dzP/a2yhun7PUb3AP05f1W5xFSc/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMgneyN9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMgneyN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768963223; x=1800499223;
  h=date:from:to:cc:subject:message-id;
  bh=to1D5L4CPSF0QLNrF1ecec5+y03MLtN8/Na1J2yP+oU=;
  b=GMgneyN9Sx9KpWcG1nOUMm4AYs4saRKOJ+FKcD5V7R2+eA6UiYJeaJ/F
   8bU60TJaxPUACituaypGI+rDWGpZ+Sz5E8YE1gJE87u9P+4i38+DCGo6Y
   6fSG78yuXaCBHrsVRtchdqwPMWhbtTTuojFM4i7bt/UpxpI3AyChu093r
   F+tzWwnNQWPOGySY7Cz9zSHLA3MgQxTjEr5Ct66ebEv8zEpGSI19fC1bz
   D11ODCcB3lDUhLE1KSMLiwM2PZk5qsnfnZcxIWFREOsdRTUQnx9gNygha
   kPIihrwzI4Rcsifd/Oor2Yx6eB8IZEETM9N5mowVxEk2cUI8VlXBeIGgA
   g==;
X-CSE-ConnectionGUID: GIuK64QjRh64+cwMSNGvRw==
X-CSE-MsgGUID: wUWOVZuvSveE9Dx76HQffg==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70095068"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70095068"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 18:40:22 -0800
X-CSE-ConnectionGUID: vn9sFDj+QBKTMb19uBehPw==
X-CSE-MsgGUID: poruvKSGRdO7AKOkZ/UoTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210795942"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2026 18:40:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viO8n-00000000PsH-47za;
	Wed, 21 Jan 2026 02:40:17 +0000
Date: Wed, 21 Jan 2026 10:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mikulas Patocka <mpatocka@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>
Subject: [linux-next:master 7328/8302] WARNING: modpost:
 drivers/md/dm-verity: section mismatch in reference: init_module+0x44
 (section: .init.text) -> dm_verity_verify_sig_exit (section: .exit.text)
Message-ID: <202601211041.pcTzwcdp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 033724b1c627885aed049f775e4b10583d895af6 [7328/8302] dm-verity: add dm-verity keyring
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260121/202601211041.pcTzwcdp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211041.pcTzwcdp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601211041.pcTzwcdp-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: drivers/md/dm-verity: section mismatch in reference: init_module+0x44 (section: .init.text) -> dm_verity_verify_sig_exit (section: .exit.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
