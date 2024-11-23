Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0A817;
	Sat, 23 Nov 2024 02:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329597; cv=none; b=UMGT3Pc1AcJLNup0618poWNn5zzPuWVRUogneZ4jDU7cll/u/9CsgJksg0PZdTM0eYnmgQaOkSgLgaIGDinb1xjGeH7pYk0APd4Q1q3JDnq6NcpSp9L8pRCw379uK1d0jixN5EJWbqBS78Gw7J+p6KTAypk9ZJkZgqxI8QHlLYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329597; c=relaxed/simple;
	bh=BWkwl0wUrC8fzdHBPtR0QHgU3P7veu2AMHKXyX4woJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+SLo6+DcTSkN7N99fHAvhbFFo2v8CRm7WQl8WFYfmYlejRGjcVrA259jlI7GWxNQU3QgrnEri34cLQre2QaJAxPb9xuUApRwmvZ9bgA4uyjbyfT7LRhqWZqS3cgCpW4PX/WNWN0aMFnjUExX1sw+XDXeSeTcB3DiWl0XVVo9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9/2V/dM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9/2V/dM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732329595; x=1763865595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWkwl0wUrC8fzdHBPtR0QHgU3P7veu2AMHKXyX4woJ0=;
  b=I9/2V/dMwS1PJ/l4i7prEIqpI1Pn+bnWvqiwI/p5NERPm982x5zPQ4N9
   wUVcUXk0V7ugoH7yOBHq/6Z79koCHqxyqkIvroHGy5jAWHaOi0FfColC9
   IQnauR5tZFQoJ5qEOX0H8fMUu1mjqOQQeJ9a0ekJnpEjz95qcvKlRrlg7
   s9C7WuQljkKuxYUqXVJdfP/nJ81i/8xBTVUd1JeZYuqkG+YLC2fIEkuSO
   hj5YtviCpWceng2FjsqYjRqZNx4ePdxXpzZvGK2HlpI4ZdUf8BHExviDE
   2PBrE+hvJC8AZKbdFOVxfaMphEO+nIR+7yY9vbYPYn3SL1xekqOd6i7lE
   w==;
X-CSE-ConnectionGUID: e1WWVO3dRYWFbLLR/7Ixlw==
X-CSE-MsgGUID: zg9g3GVwRo2EA8+tvVVqOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="31856594"
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="31856594"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 18:39:55 -0800
X-CSE-ConnectionGUID: /8W/YqEiRTW96EflkZOyWA==
X-CSE-MsgGUID: fk9+UE78RY+pM3AKY+wUpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,177,1728975600"; 
   d="scan'208";a="95158750"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2024 18:39:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEg3r-0004Ml-2f;
	Sat, 23 Nov 2024 02:39:51 +0000
Date: Sat, 23 Nov 2024 10:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Lawrence <paullawrence@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error: undefined symbol: ZSTD_DStreamWorkspaceBound
Message-ID: <202411231043.rG86kUA2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ambarus/linux-0day syzkaller-id-5ecbc557fcdb8a2864e876f690ef377db999c50f
head:   caa714448992ba4eb583735a4acb26917fbc67a8
commit: 95a43fc99f147282c64e68baf1ea18041c7755ea ANDROID: Incremental fs: Add zstd compression support
date:   4 years, 1 month ago
config: i386-buildonly-randconfig-001-20241123 (https://download.01.org/0day-ci/archive/20241123/202411231043.rG86kUA2-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411231043.rG86kUA2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411231043.rG86kUA2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ZSTD_getFrameParams
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(__unzstd) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_DStreamWorkspaceBound
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(__unzstd) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_initDStream
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(__unzstd) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_decompressStream
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(__unzstd) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_DCtxWorkspaceBound
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(decompress_single) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_initDCtx
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(decompress_single) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_findFrameCompressedSize
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(decompress_single) in archive lib/lib.a
--
>> ld.lld: error: undefined symbol: ZSTD_decompressDCtx
   >>> referenced by decompress_unzstd.c
   >>>               decompress_unzstd.o:(decompress_single) in archive lib/lib.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
