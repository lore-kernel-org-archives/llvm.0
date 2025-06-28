Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A911DFCB;
	Sat, 28 Jun 2025 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127704; cv=none; b=YdOiGvEbLY5oThxuxns6/NiQPXTqNXuVn1a3bUBHghz/eZ0DrMUmJOrtSuGmHfQR3IAWxP73TdgmO+n8PVgXFYGCYgIZM+4n3+M+/W8UTDTGSp14b7PUuET/2Q0O55qdZviMcE+m5k3Bm1nZEHSO0onaLkV/CNiET/tSjie5k/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127704; c=relaxed/simple;
	bh=oazmQwM8XUXtOeVvrr5qYqJZs/rdBQuNTe6B6av7xqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I7g5F6Z+sxlNu4FYjPD+mrmX+FTVcdOMPN4ZPqeyxOAJKqSEjWjhJTZfQGTHm5fWPhWzR8eNm+3DcWycqN50JpH+Veg6z3cZ8HNu43K4Q4HRNjPLv5VoPzYxGhjVV8YqV6Oedimot954rIhUIDcAo/MlOd3H9xuWOkdpD/2gfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SMJdCIPI; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SMJdCIPI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751127703; x=1782663703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oazmQwM8XUXtOeVvrr5qYqJZs/rdBQuNTe6B6av7xqw=;
  b=SMJdCIPIPxTFh5jkeKvOZrKNmLEFEO1GYiIMklRrv932FqFiA8YEaOoK
   thW/8oIYUwROOHxxz5CbfQekNaIMO4FZqy9RD6F6gOR4NzAOa97C+CzDQ
   VulyaLmTjnB9B2Hq35g9/XthHxBZUMLe7YIJqfK6XrrnLfqyi8/OINwJC
   im5tJZnTGlLZkbOZsKailAvBbg15DbNdAy1HndAPRo2LFG0pgbB8ViAT+
   UyIAP/Gq7zdR8nRynr07e/B7Dr2WuQdCFYkI9m4CP5yFPa2+UoXCfSFBf
   TcsKtG/Og4XwC1Ekn+oSdxHMohEawJSq/LMbbHalzEC2r3VrbHpQUbuDk
   w==;
X-CSE-ConnectionGUID: x9GmNxbmQba1Lv9SvKYNMw==
X-CSE-MsgGUID: YW8Q/FVgSh6qOAae8gFAhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="64469973"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="64469973"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 09:21:42 -0700
X-CSE-ConnectionGUID: sconU7UZT3y/EzvHVwHg6A==
X-CSE-MsgGUID: Pvai9mNuR+6qYQNaiUsOUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="153156822"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jun 2025 09:21:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVYJ8-000XBY-1I;
	Sat, 28 Jun 2025 16:21:38 +0000
Date: Sun, 29 Jun 2025 00:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:kunit-kselftests-integration 46/47] ld.lld:
 error: undefined symbol: __aeabi_i2d
Message-ID: <202506290022.0gid0Rbz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git kunit-kselftests-integration
head:   1d66824abdccea956a455fc694f5967c0163ce31
commit: ab2c318d8f620f55c8a89b91e878a8246a24aecd [46/47] timens
config: arm-randconfig-002-20250628 (https://download.01.org/0day-ci/archive/20250629/202506290022.0gid0Rbz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290022.0gid0Rbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290022.0gid0Rbz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_i2d
   >>> referenced by timens_test_procfs.c
   >>>               /tmp/timens_test_procfs-7966a1.o:(check_uptime)
--
>> ld.lld: error: undefined symbol: __aeabi_dcmpgt
   >>> referenced by timens_test_procfs.c
   >>>               /tmp/timens_test_procfs-7966a1.o:(check_uptime)
>> clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
