Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E7119E;
	Wed, 10 Apr 2024 00:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712709614; cv=none; b=UlhXLdEsfJIJhTmvswWlaDG6bhTifW7VvdMM1u1pvLuQ1EwNChdUhRArjcr4PWhFpR1bFwWdOhHLoj0uDPlJ+KP+Ig6nROlf1Gm0MBhsFMsgHXpbWnU6vc9ukSpHf+xx4vFx8oE13QPEGCCMCKH+fnSBUsal0ce0Jvhv2BvpUIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712709614; c=relaxed/simple;
	bh=qdKDoFgqGC7rf4IyHpvqVOhYXIVrlns2deNdJVB8rK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7pbc9TXZIrT0ISKbzdxsX/2WTTIXywnh8d1/dPggR4oWgZHGu20WG6nSYC4I8+excT7HGGN85gV7dGIcqD2x+2229xIJ6aah0d2BnBccenseHN3TnTBmCkevU+c+KDiozGf11xHqynkSJWcV5gyL2PNMZAy9lVNZEY8qou9Kno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UsUOjQLo; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UsUOjQLo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712709612; x=1744245612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qdKDoFgqGC7rf4IyHpvqVOhYXIVrlns2deNdJVB8rK8=;
  b=UsUOjQLoTcI4PcJOoMxbRmDUzV4gk29ICnBOxOP1+FKYl+h24r5EJzCS
   Gf3oGd5JsRGmaKNCSxLwpf/Y3RGcgI4lB1peYnUe1Uv8eR/XLoJHFTqPA
   jALqNfpA5ezKOs7tqn1Jxqpll+1iakeFUVrE2Fepjn6jf5HxMDWRzsUIl
   9TlV+FFkIZluxXsrNi9TdbWG5GL9VH6951LSFMprZBgtsms93EcKZLDRx
   B0+tmbdkX8Ht5zhmcCeCUkwMEIxz6pkABAmPRzzuOWepYH6Vpud/tfszU
   c7t5JHKiyBxQprClumnK5uxSoDmVeYCwas6gOhBRpe4rrw64VSVi9+3Yr
   Q==;
X-CSE-ConnectionGUID: Y+kLHGgiT6SuXWO9wN+Iiw==
X-CSE-MsgGUID: JjrQFuv2QuaBtfRShRJjsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="18661921"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="18661921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 17:40:12 -0700
X-CSE-ConnectionGUID: EZTvQitISg2aYh4cDOTRXg==
X-CSE-MsgGUID: xb+RorVDTpSJnunJKPewhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20418735"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Apr 2024 17:40:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruM0X-0006f4-04;
	Wed, 10 Apr 2024 00:40:09 +0000
Date: Wed, 10 Apr 2024 08:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 18/22] include/linux/text-patching.h:5:10:
 fatal error: 'asm/text-patching.h' file not found
Message-ID: <202404100830.JIQavjKK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   a14551111ff8bbf3c520771e89892d599463da71
commit: 158774f2959493d41916e8ea6af40ba2de85c04f [18/22] module: prepare to handle ROX allocations for text
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240410/202404100830.JIQavjKK-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100830.JIQavjKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100830.JIQavjKK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/execmem.c:3:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/execmem.c:7:
>> include/linux/text-patching.h:5:10: fatal error: 'asm/text-patching.h' file not found
       5 | #include <asm/text-patching.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +5 include/linux/text-patching.h

ffdd58e8bffb1b Mike Rapoport (IBM  2024-02-29  4) 
ffdd58e8bffb1b Mike Rapoport (IBM  2024-02-29 @5) #include <asm/text-patching.h>
ffdd58e8bffb1b Mike Rapoport (IBM  2024-02-29  6) 

:::::: The code at line 5 was first introduced by commit
:::::: ffdd58e8bffb1b8316c7abdabd8b2e9bbbb921ff asm-generic: introduce text-patching.h

:::::: TO: Mike Rapoport (IBM) <rppt@kernel.org>
:::::: CC: Mike Rapoport (IBM) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
