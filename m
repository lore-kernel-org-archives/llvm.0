Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB8C146D41;
	Fri,  5 Jul 2024 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720172046; cv=none; b=n4IcYYplVynF6mxbe47Oh6XyaccJQMOCLv4uhR/j4EXAxxo1QRSxrCvV6mNtRWCKs8zuoHSjecgROD0yoc+5KDNAJHJD6FkhHvSGy9tztDI2b5IGuUN4PIe52kvRY4/8g5x20TsRiN4NgEx8Aa3pwVHBNdpp1sOgt0o2tWSuIfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720172046; c=relaxed/simple;
	bh=YX5tZVp00PFMDWlfSQ2Dl8sMbsg4a8I88ejzlI8Zz7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pPSlm0/Cm3uhL/Lsj5dLkEn9FJMxV+LJih0Cpbi/vFmDr5gCxcjHoi3cf5LQnYSqmTOQm7tsr/P3nHHUUwYePZ3k8WSQF1lQkStkX5jZPLv1+QfMabUU0QCv0AGYJ0vDUUGKwjUsKVomHN87YrET08KaHW9lBuHg9Z4Ej8tEzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kE1H1XKU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kE1H1XKU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720172044; x=1751708044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YX5tZVp00PFMDWlfSQ2Dl8sMbsg4a8I88ejzlI8Zz7w=;
  b=kE1H1XKUa/7rjkcFytCCXFQBh859ZMSyViYNpELzYcV7zuQU40G77V1s
   xlUi4f+6Ib2pqI2Mq0bbcFCXhy/G1AfQvkZ9OR2Z1rsw+reJvkLNefqxY
   0NxVMVi2jBg3UdINczXVNRtjZgbVoyIUCOs0lJeF6PfccnY8eOKnl24ft
   alB57ZdoEfFYrZoPVFsCR1P5CntD5d+ZPZNTS44qf6ofUScyC4B22sWSV
   BHbPI97PHm3OlXZeNI4MQifKKYoeyoqsgQDxRoYBBJ4MkDiNydCNFgKoi
   96Kw1WO8Wh2DursGL7QqgBizZnm8SvreA1v58jjA1VzxcQ6drUIzryNTr
   Q==;
X-CSE-ConnectionGUID: vcNKnmdQTDWoYvPQRNW5Xw==
X-CSE-MsgGUID: bpYJ6raMQi6mBP6RBu24fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17105706"
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="17105706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2024 02:34:03 -0700
X-CSE-ConnectionGUID: ad/sm7S6RGGDsNwwZWskHw==
X-CSE-MsgGUID: R/bg8Qo8RtO7OaOazZugPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="scan'208";a="51161590"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Jul 2024 02:34:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPfKJ-000SC2-2z;
	Fri, 05 Jul 2024 09:33:59 +0000
Date: Fri, 5 Jul 2024 17:32:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 38/39] lib/math/div64.c:211:2: error:
 "unknown endianness"
Message-ID: <202407051719.g3Vhv3Nn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   6e608255168707beff8474615c2da433ed0dbd63
commit: 0b7a2b15a66f84b363058df56e392793b2fea2b2 [38/39] mul_u64_u64_div_u64: make it precise always
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240705/202407051719.g3Vhv3Nn-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240705/202407051719.g3Vhv3Nn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407051719.g3Vhv3Nn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/math/div64.c:211:2: error: "unknown endianness"
     211 | #error "unknown endianness"
         |  ^
>> lib/math/div64.c:219:15: error: no member named 'l' in 'union (unnamed at lib/math/div64.c:201:2)'
     219 |         X.v = (u64)A.l * B.l;
         |                    ~ ^
   lib/math/div64.c:219:21: error: no member named 'l' in 'union (unnamed at lib/math/div64.c:201:2)'
     219 |         X.v = (u64)A.l * B.l;
         |                          ~ ^
   lib/math/div64.c:220:15: error: no member named 'l' in 'union (unnamed at lib/math/div64.c:201:2)'
     220 |         Y.v = (u64)A.l * B.h + X.h;
         |                    ~ ^
>> lib/math/div64.c:220:21: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     220 |         Y.v = (u64)A.l * B.h + X.h;
         |                          ~ ^
   lib/math/div64.c:220:27: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     220 |         Y.v = (u64)A.l * B.h + X.h;
         |                                ~ ^
   lib/math/div64.c:221:15: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     221 |         Z.v = (u64)A.h * B.h + Y.h;
         |                    ~ ^
   lib/math/div64.c:221:21: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     221 |         Z.v = (u64)A.h * B.h + Y.h;
         |                          ~ ^
   lib/math/div64.c:221:27: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     221 |         Z.v = (u64)A.h * B.h + Y.h;
         |                                ~ ^
   lib/math/div64.c:222:15: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     222 |         Y.v = (u64)A.h * B.l + Y.l;
         |                    ~ ^
   lib/math/div64.c:222:21: error: no member named 'l' in 'union (unnamed at lib/math/div64.c:201:2)'
     222 |         Y.v = (u64)A.h * B.l + Y.l;
         |                          ~ ^
   lib/math/div64.c:222:27: error: no member named 'l' in 'union (unnamed at lib/math/div64.c:201:2)'
     222 |         Y.v = (u64)A.h * B.l + Y.l;
         |                                ~ ^
   lib/math/div64.c:223:4: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     223 |         X.h = Y.l;
         |         ~ ^
   lib/math/div64.c:223:10: error: no member named 'l' in 'union (unnamed at lib/math/div64.c:201:2)'
     223 |         X.h = Y.l;
         |               ~ ^
   lib/math/div64.c:224:11: error: no member named 'h' in 'union (unnamed at lib/math/div64.c:201:2)'
     224 |         Z.v += Y.h;
         |                ~ ^
   15 errors generated.


vim +211 lib/math/div64.c

   199	
   200		/* perform a 64x64=128 bits multiplication manually */
   201		union {
   202			u64 v;
   203			struct {
   204	#if defined(CONFIG_CPU_LITTLE_ENDIAN)
   205				u32 l;
   206				u32 h;
   207	#elif defined(CONFIG_CPU_BIG_ENDIAN)
   208				u32 h;
   209				u32 l;
   210	#else
 > 211	#error "unknown endianness"
   212	#endif
   213			};
   214		} A, B, X, Y, Z;
   215	
   216		A.v = a;
   217		B.v = b;
   218	
 > 219		X.v = (u64)A.l * B.l;
 > 220		Y.v = (u64)A.l * B.h + X.h;
   221		Z.v = (u64)A.h * B.h + Y.h;
   222		Y.v = (u64)A.h * B.l + Y.l;
   223		X.h = Y.l;
   224		Z.v += Y.h;
   225	
   226		u64 n_lo = X.v, n_hi = Z.v;
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
