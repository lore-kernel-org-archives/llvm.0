Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295F1566A;
	Thu,  5 Jun 2025 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749115409; cv=none; b=uc7ltj2iCnk0i3aN26Qwks3WcpsLUpFyaCAWCDC0tM0+PWNzfKJQRSa29AsAqPJ8eWuQ6/7XBopvqfAAABO7DppMjPb7N8unAGw54loScHzjlHDdlRhVB4krd0v9os7Hy5LVDqXXiyZWgw2OHZuYS77X/csW/XqNya5ceIlUxCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749115409; c=relaxed/simple;
	bh=I+kE3/Px+SSn48ljQajBM6l/xv/Hgd66cC2Mhxzpf4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7rTvk/qeupDxBvoheAx9lCo3LG0+1puvrDl28Jgl/HaSYHlVvMTYFBL3mJr695Kh48MPW92mgFUa63CKwSnp3CeqFesv+bi2xQtXX4ZetYI7w5V7LEkcFMWTcIAjFdnqAjclLaZL7OMxtlu5+g68GtpkqxhE7TLv3k5UNGB+cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZuzL8s/7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZuzL8s/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749115408; x=1780651408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I+kE3/Px+SSn48ljQajBM6l/xv/Hgd66cC2Mhxzpf4w=;
  b=ZuzL8s/7U7JXTsELx6XBqvJfmgEIGjyGABIkdYmZ8vGAb91N//kDfGxF
   cg1nXbCmLbXBmmp0+gK8Mm+9mvPgwmTTsRfqkF0PRoeC0T0XkjirwOqvD
   dGzz2bnR1kHl4At9QlNdcssHaFCoDfsVp/Le5emJv2DdLZXf6UeTKxi9d
   oR5Wc/CmfcuDtmf59rqcxWhvt6z+ZKiqiBfTyRd1qlTszDcnKNrKcLd8c
   0tMqv+dZKTlzAUsFzWLbs0jiDPnRE0sehKxSZ0zyGGq+ec2dPS+rSD/St
   sX9Vm2LIpyOAc1GvfdHs9O43s1L/ZxEbx4g/iAjIL7O50748fZp4+ZKY6
   A==;
X-CSE-ConnectionGUID: YmmSlpXCQVOPUcbF6RDRlQ==
X-CSE-MsgGUID: U/d5BIacQtSdm63btW4CdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51141644"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="51141644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:23:27 -0700
X-CSE-ConnectionGUID: qjPQuT/FQEmGWBhcxBQEcg==
X-CSE-MsgGUID: 8ecH5uogSQ+pUJx0OQcg4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="176318504"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2025 02:23:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN6ol-0003xJ-2P;
	Thu, 05 Jun 2025 09:23:23 +0000
Date: Thu, 5 Jun 2025 17:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Igor Belousov <igor.b@beldev.am>
Subject: [akpm-mm:mm-new 57/59] mm/zblock.h:24:2: warning: This PAGE_SIZE is
 not quite supported yet
Message-ID: <202506051739.ZMRkokhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   574966cc970ddc4ec6fb435bbbca9804d92e4953
commit: 8666580be1b209caae87288805cda74dc347440a [57/59] mm-zblock-avoid-failing-the-build-fix
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250605/202506051739.ZMRkokhj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506051739.ZMRkokhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051739.ZMRkokhj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zblock.c:28:
>> mm/zblock.h:24:2: warning: This PAGE_SIZE is not quite supported yet [-W#warnings]
      24 | #warning This PAGE_SIZE is not quite supported yet
         |  ^
   1 warning generated.


vim +24 mm/zblock.h

    16	
    17	#if PAGE_SIZE == 0x1000
    18	/* max 128 slots per block, max table size 32 */
    19	#define SLOT_BITS 7
    20	#elif PAGE_SIZE == 0x4000
    21	/* max 256 slots per block, max table size 64 */
    22	#define SLOT_BITS 8
    23	#else
  > 24	#warning This PAGE_SIZE is not quite supported yet
    25	#define SLOT_BITS 8
    26	#endif
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
