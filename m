Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52679189B9C;
	Fri, 25 Oct 2024 19:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729885532; cv=none; b=sbZ+EgB4ZM+v+CQQDCjlusSAOO+317c/FPEjLvAkXyARyhE5dy/zLkOBrbUCrU+tuk7kvVwhiOAYb1ZGdiQNe53hkCQJWyYqae+KtjBX5yCCA5p99fiy+Hpc4oHFf2LXtdgoMiIZhS2jGY4TOxEtlOZsliyH/ikiL0NZH8gob9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729885532; c=relaxed/simple;
	bh=35fKuFNjNFa4eOloH9WvX0CjkQRbk1EB+qm/4oXIadY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tnBhNliLUFXsKGrr+F/ZF+b8Q8Uh5AqZ9ybCeYPzzju3BroomqwueLSn0r4lFSjA5u+JhCTwyd+fVDuiV3AjjhTfZMPBOSndCWU/9IH7L9DQ+Q8i4lbkig/ggkVGfhRnz0UlrLxv1OynsMIGEVGBBViDSGIqIt1Pj3f3ak2v+Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zg83DXN/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zg83DXN/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729885529; x=1761421529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=35fKuFNjNFa4eOloH9WvX0CjkQRbk1EB+qm/4oXIadY=;
  b=Zg83DXN/Ncigxt2F4wzo+dT18ggWMF3vYQrqAbMN3NZd6sQqNApG9MEj
   6KNxbduKP/9sr56npUOO9PbfmfVshAvU8nbftYZulgbhAdgYpXtHrSbr1
   Di6KpTr76UnXBFmvW0WHHDX20kMgzmXoCXMnawUMB/lo3q1CjphD7R34U
   /BcM9KvWDWGrOUgmBgb4+Zi0xdlZ3zqGEvwaKD2EYOoC5QpNE6J72wsh8
   504FDQX3/TbdnzKYY3y3jkNJ6yQOOX0Sji1FMLZZTRe7IZXSG9ck+jNXQ
   dzmkF5ry1/QSmB69FbyXiLdOGHctu9B1Cbwtuk/BjLkNzIL/3/dsbVdi9
   Q==;
X-CSE-ConnectionGUID: mPCDVyebSBiowtZFXy/0UA==
X-CSE-MsgGUID: ev1zdcGrT+iUUDJLLucDvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47027510"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="47027510"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 12:45:29 -0700
X-CSE-ConnectionGUID: v1xUbYt8TOmNZzcy5gZHqA==
X-CSE-MsgGUID: oFy5VWnrTrOoSks9/ew0hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81113764"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2024 12:45:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4QFR-000Yp6-1U;
	Fri, 25 Oct 2024 19:45:25 +0000
Date: Sat, 26 Oct 2024 03:44:53 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:crc32-lib 19/33] lib/crc32.c:342:5: error: expected
 identifier or '('
Message-ID: <202410260329.Irc7bUKL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc32-lib
head:   173b25426b0584097e1e1a772bc09bf8c0780837
commit: f7f6af3d9ab8c5e851046390ac3f9d67b67a1033 [19/33] lib/crc32: expose whether the lib is really optimized at runtime
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241026/202410260329.Irc7bUKL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260329.Irc7bUKL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410260329.Irc7bUKL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/crc32.c:342:5: error: expected identifier or '('
     342 | u32 crc32_optimizations;
         |     ^
   include/linux/crc32.h:52:29: note: expanded from macro 'crc32_optimizations'
      52 | #define crc32_optimizations 0
         |                             ^
   lib/crc32.c:343:15: error: expected identifier or '('
     343 | EXPORT_SYMBOL(crc32_optimizations);
         |               ^
   include/linux/crc32.h:52:29: note: expanded from macro 'crc32_optimizations'
      52 | #define crc32_optimizations 0
         |                             ^
>> lib/crc32.c:343:1: error: cannot take the address of an rvalue of type 'int'
     343 | EXPORT_SYMBOL(crc32_optimizations);
         | ^             ~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:68:29: note: expanded from macro 'EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                         ^              ~~~
   include/linux/export.h:65:38: note: expanded from macro '_EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                         ^               ~~~
   include/linux/export.h:57:2: note: expanded from macro '__EXPORT_SYMBOL'
      57 |         __ADDRESSABLE(sym)                                      \
         |         ^             ~~~
   include/linux/compiler.h:229:2: note: expanded from macro '__ADDRESSABLE'
     229 |         ___ADDRESSABLE(sym, __section(".discard.addressable"))
         |         ^              ~~~
   include/linux/compiler.h:227:64: note: expanded from macro '___ADDRESSABLE'
     227 |         __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)(uintptr_t)&sym;
         |                                                                       ^~~~
   3 errors generated.


vim +342 lib/crc32.c

   341	
 > 342	u32 crc32_optimizations;
 > 343	EXPORT_SYMBOL(crc32_optimizations);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
