Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB801E32D6;
	Thu, 18 Sep 2025 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758168243; cv=none; b=KRp79n4eW+BQOYhEbrFnAJN4FpzQOHK6TOVBRETgxIKbcgdfMY+Ka3f3HknsYTqv13TzdG/GygpAVwfaQFGjFX0bM4zpkO82ORarZvEEZFNzwvhGLD8f5XG59PZGGDuUmW/e64U6HwgV4AJY+pEkmZlA5shu/FD2rvNytyBq5nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758168243; c=relaxed/simple;
	bh=ZCwmUQXybQLGPW2326ZtmtlI6/BYNGa69RHza6zjskY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e44GphTCYpxmTm7W2lKXFMznv4jMbKr9UH78AuRvo/BVROZNUvV4jy58f50+iw7jw2QOtR5/4gNhYY+BaN6dBVi91uaSOUnZkJ4VNYXC2Fpa/ZIuvIgojK4wglqhNreYOcfX+hRq7RsRE22BWaCtZfIyFM7EBqetP2HuU9R31zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aa++RnZN; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aa++RnZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758168241; x=1789704241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZCwmUQXybQLGPW2326ZtmtlI6/BYNGa69RHza6zjskY=;
  b=aa++RnZNZSD3qfuxDetVFai2BixprVJUjkSU2aQhZoircwMh5sbiKVxn
   sYv3Lg0gdubh/xp21J+EA7GYiJVXB2OG4K0BVkNv9Uvg+6ZSMu2iKSbsw
   gzYVtYCHZmWtlzDqYoXb4EVG0HLmug4AiFpna6SaJvMF1JgUKjhQAlMnT
   cnGRawOP2tbP7H1p4oc2HUMDUEDFaYQvQZB70/gNadrS0iyor9NZPbs5g
   UC1uBUY8Tyhe1qvCSrUGZYQW/UhcmgBA2OFglTCmbudBPLkQk+RtV2sLv
   NFtPu56/F2ZtIULjggrCRoSUdif3jqxU3fzNgGr7Lb1G07dje/+n+1Jm3
   g==;
X-CSE-ConnectionGUID: u4PYTHxfTfaJOYDrQUOQbg==
X-CSE-MsgGUID: THjYidCdSRawk5ybOxAf4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="59528811"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="59528811"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 21:04:00 -0700
X-CSE-ConnectionGUID: P25WDRgwSJu5p0ocJVdQ9A==
X-CSE-MsgGUID: +Em1otdLRdGniNLqrpV+Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="206219545"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Sep 2025 21:03:59 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz5sD-0002kZ-0e;
	Thu, 18 Sep 2025 04:03:57 +0000
Date: Thu, 18 Sep 2025 12:03:04 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 60/63] error: objtool: --checksum not supported;
 install xxhash-devel and recompile
Message-ID: <202509181111.05E8V2hw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   262d11ae2557639839ede7312ba834817615e0a8
commit: 2b990d8d7a82905cd5dd6cca2286b6cf72da8e0f [60/63] livepatch/klp-build: Introduce klp-build script for generating livepatch modules
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250918/202509181111.05E8V2hw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509181111.05E8V2hw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509181111.05E8V2hw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:24:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
   1 warning generated.
>> error: objtool: --checksum not supported; install xxhash-devel and recompile

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
