Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F398373BFB;
	Tue, 24 Mar 2026 01:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317096; cv=none; b=jYBz5Db9nkGqjakVTHYvYlSEyYzxNpXzWQKbNK8HIiVln8iZGR6HOskUpPOlboet9pkG8ESTlLvyWf707OBsQC2og6Nco72lN3nYn8WgLGT7D6Ru2mZdUxHwF4xp68WoeTkn8QRFoIFGaqW/bOT5Sru1r+T5EbdJesWXFBJkClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317096; c=relaxed/simple;
	bh=i3jC+/ADTiAomDZUpXJgJoiCkFlVF7S7TRTBPua4IHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jrCCr5uZ895HTfTRdU035FAYLFYZOvvOFEm7UM0zJIx9L56OYu3msvk/t+fVK3xBlY2YBFdVzoodL9lqtmtl8MDMvbjpRD8KgLIYk3XQMwN0E/1xtMLa5IW4ifa6Vz7pf/Xc1WR7d43KsZdoljHvresOA2aQRBLyTKBnTbxsFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StgddsIG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StgddsIG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774317095; x=1805853095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3jC+/ADTiAomDZUpXJgJoiCkFlVF7S7TRTBPua4IHU=;
  b=StgddsIGnEI+7uum+rx5U+9xqDC+Qkg7u0Tb5M/tFCKXt2k1WvGzuHsH
   HJR/hMu1mgW4v1xgALev7h5E+CEvGlVczchlJxfGhE6Ux6XvK3djSdQYY
   nUsAjFJ3Q9kyh5yAgEnWOdIKtqNntEPT8+Sp6CxtrEJXIckiImUMErsN4
   /3rxq7pob3Y4zJmHhKR6KNo2wru4lhtvCjdVkv114i3jrcjPLvvn2+JV0
   nOQxs3jRnec9E590ftEBCyamvmB6sj0dy9qZ/86GqegYYdJ3LNxzXP8uW
   hBa1oOkhjdzXtT1txIViBV7ZbtZJd6l36iL8dFt9202EbE10baKX6Jvuo
   w==;
X-CSE-ConnectionGUID: SLBnLY4qTRWtGTKIxgTNAw==
X-CSE-MsgGUID: OMsgR4TGRbqcDz0z46xGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100781538"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100781538"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 18:51:33 -0700
X-CSE-ConnectionGUID: p/t/krvFQeuUuNcKVNZETQ==
X-CSE-MsgGUID: TLqbSEaATuOL6KK3uAOPaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228947748"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 18:51:32 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4qva-000000003We-06jb;
	Tue, 24 Mar 2026 01:51:30 +0000
Date: Tue, 24 Mar 2026 09:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh?= (Schneider Electric)" <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/auxclock-nanosleep 18/44]
 /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this
 target
Message-ID: <202603240953.qaWgnKsR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/auxclock-nanosleep
head:   b5f216d75bdbbafb19ea7d79a607512cecaea2c0
commit: a876a196200710a8666ee1bd58be19f1e08fa5fb [18/44] benchmarks
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260324/202603240953.qaWgnKsR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240953.qaWgnKsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240953.qaWgnKsR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/benchmarks-user.c:3:
   In file included from /usr/include/err.h:55:
>> /usr/include/bits/floatn.h:97:9: error: __float128 is not supported on this target
      97 | typedef __float128 _Float128;
         |         ^
   In file included from kernel/time/benchmarks-user.c:7:
   In file included from /usr/include/errno.h:28:
   In file included from /usr/include/bits/errno.h:26:
>> /usr/include/linux/errno.h:1:10: fatal error: 'asm/errno.h' file not found
       1 | #include <asm/errno.h>
         |          ^~~~~~~~~~~~~
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
