Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5838FB9;
	Tue, 11 Mar 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741695306; cv=none; b=LGW4FnkV+ugcyE8UaF6UBz2kS7rDAgGSLXxbSCaPLOuaZSaRF1sMZTe8zZZiczhuOtHpJv9kYWh6iXfKLq0EPxX3/QfsvrfizAti6+zjlvxkqOZaoLSMkVUO35hlCOrQXJiMFdVqOQ+cbdHnE1Nz8gMYsuwYFWJeM2j6dkqWAfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741695306; c=relaxed/simple;
	bh=A/F0uSR6umiWDl5d9jv4yniESYFzH+vbUX0MRy0L1TI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYqN81kU/AgZflccw64+rkPCKq7BbddxXFACDZNvtd9lp910JASMrU1F6YeItN9G7ikMwkZuAb84TCZKKkj0OfcdHIhjMpzH67MfsQZ72utABRibZXyp7MbfoCWPEYWu35KULVzaBh6R0D5hMWCq70Ay9HUzr7F3Puy/XJwN3O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GJD4H0Zf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GJD4H0Zf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741695305; x=1773231305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A/F0uSR6umiWDl5d9jv4yniESYFzH+vbUX0MRy0L1TI=;
  b=GJD4H0ZfP2SSPe3CDnebHS+MYRFYrBQJ4zku/IsoYIm++OHzLMaRoqPD
   IuAqfxJA6z1CVgcMUWY2BNHn7gGxN50YbYCFp2KIUayBA5vz7S3rM7Nko
   ckpqKdpXDBXam9jAMA2hbk1F80Luvv3tIktPt46gXC/afSKfIAq7DLzIU
   t6+3ZZ5ms6g6B70onMfX8+9Q29ExthzM37S/ToJwFxQp/DXFri71VQzSS
   i1poIaWcYV5T4nE2IBjCExr6I5V8INDAhSEg5w1krNVGIxjyCxein/pdx
   zd0fEOVgt0uhWBkJ6hxftg95h2S6pVcB3nbKu1n3YW7yzb4XpLEsuydPY
   A==;
X-CSE-ConnectionGUID: YTbO0B9DSY6Hew3fTDjlKQ==
X-CSE-MsgGUID: QvDmMOJmROKnL+GC3LAawQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="45513331"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="45513331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 05:15:04 -0700
X-CSE-ConnectionGUID: U13yHjpFTtezgIVIsAhwSw==
X-CSE-MsgGUID: yOLH1T1WRfW3sBZJ6U6v2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="121013229"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Mar 2025 05:15:03 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tryVh-0006e0-15;
	Tue, 11 Mar 2025 12:15:01 +0000
Date: Tue, 11 Mar 2025 20:14:14 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/module-hashes 9/9] llvm-objcopy: error:
 '.tmp_module_hashes.o': The file was not recognized as a valid object file
Message-ID: <202503112010.RsM1bgi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/module-hashes
head:   8ab7849599f74e8492224b62d852cd9affecea7c
commit: 8ab7849599f74e8492224b62d852cd9affecea7c [9/9] module: Introduce hash-based integrity checking
config: x86_64-randconfig-005-20250311 (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112010.RsM1bgi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503112010.RsM1bgi6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> llvm-objcopy: error: '.tmp_module_hashes.o': The file was not recognized as a valid object file

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
