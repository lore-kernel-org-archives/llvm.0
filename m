Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26846B5;
	Tue, 26 Nov 2024 04:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732594365; cv=none; b=rP5CczfB0/iMDt9wsH1CEZYLzqzSo7DnNWzI/QpGRXg1gCiW/4/biVgZq5LUEmVls9cMWGwL5tKztny14X3HqKz0Mi+RWuQML2LJE8HG/8unUbVe7OTDMzZBU07yrGEft8TwOaAkD9qIJQOttnweKQRaPL0W9TEuPi13+ejU09c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732594365; c=relaxed/simple;
	bh=/Xtgh+yQLnhOzZvAS4ZRskSu4x0h2OPJojuPJur7c9k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kloagfS3gHHGNMysS//XbokISk7X83qLaWKCKNHCopvHGQRN/8g9PP0tor29z3XxUcctC+BNhzdGDxrMgAuAIk3dhKzY6wNgMUJSor1JEkmQHeMt9c3dcDMYyB4ahhYeeRoeHFRC1AWwI8RWlPU89wdsRvWLTJkP3h0OMjmdsUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJ2kq70b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJ2kq70b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732594364; x=1764130364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Xtgh+yQLnhOzZvAS4ZRskSu4x0h2OPJojuPJur7c9k=;
  b=nJ2kq70bMKQssAIV5V+TlLU0QNBpDNxK6UjsI58INyWM7PtrzrBn3m5V
   0NcT2JUaEpGKEjCQuDzH6G1ye9XD36by0qA1sM9Ym8dbd35j92SX6WCnl
   wW4s+aqFfNeKUPL26p5adraPCnSQA+WviI7KhKMJaV2BOQCaWMyGTCCCT
   Tr4ZXHUctbP2eyl3oTDWAfs8pinsNS/npYQUyAnwl0ps6Lp9Uf2PG5zCw
   e9jHUOz7f7Gh2yIdd4zOH4VAR6TDBx8y0U36ScdkE43XGgGXtt3EiBN31
   +Z8LYPoUTbYyEXMB7rQ19C5J04TyzCT//T0PDjUnuRrGlbvLopdheXtAf
   A==;
X-CSE-ConnectionGUID: 9e4XiWzvTJGo3w2TqplaHA==
X-CSE-MsgGUID: IO/UGobqRBK9hYlPEyquTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36390962"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="36390962"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 20:12:43 -0800
X-CSE-ConnectionGUID: EJLSh4VFRISvngmnKY3/uw==
X-CSE-MsgGUID: qV7+lbtdSNGremvASVU9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="95899714"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2024 20:12:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFmwJ-00073N-1X;
	Tue, 26 Nov 2024 04:12:39 +0000
Date: Tue, 26 Nov 2024 12:12:09 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kbuild-c23-extensions 3/3]
 include/linux/thermal.h:353:30: error: omitting the parameter name in a
 function definition is a C2x extension
Message-ID: <202411261254.BIsVSn3e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kbuild-c23-extensions
head:   11b6309ff8205def52324127c999d3fab33e6f08
commit: 11b6309ff8205def52324127c999d3fab33e6f08 [3/3] DELETEME
config: hexagon-randconfig-001-20241126 (https://download.01.org/0day-ci/archive/20241126/202411261254.BIsVSn3e-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261254.BIsVSn3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261254.BIsVSn3e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/etnaviv/etnaviv_gpu.c:16:
>> include/linux/thermal.h:353:30: error: omitting the parameter name in a function definition is a C2x extension [-Werror,-Wc2x-extensions]
     353 | static inline void foobar(int)
         |                              ^
   1 error generated.


vim +353 include/linux/thermal.h

   352	
 > 353	static inline void foobar(int)
   354	{
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
