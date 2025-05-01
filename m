Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF22155A4E;
	Thu,  1 May 2025 09:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746092960; cv=none; b=HuZpzN/yqaO5Sa05vInxahmqYHkDmeFmH04MmWOM5hQSXwb+7qaLKBE+VTs9fBHQDK61L5aL60+u1BiySVfzMcPz7WGwyQPRGe5whAS6nWsJnkgchV6SM72h1VAfXEGhvc/clqw5hfccP0CzBOB+eXhGZDiHUgy6HqwqqVKskS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746092960; c=relaxed/simple;
	bh=1esRohv/papPLDdSe2D0wJD6CrWbf7Rb0wcHc4Vktxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I9Gp4kRu29CRAMPPGGV7gB1iALiuVOESYm0Ka16/+FgcR3psnrMK2vY5drk9oTQFWLRocfXxVuRlTK8V4SyjUn0GT+YPhRvA0IZ/FIYH4BNeft4Nodu5+xsQwjLi9h1a4NXPPR3fDoy0UBCEbTArInTfdzdRPo5xLuMyBZXm79E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SrJmMMVt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SrJmMMVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746092958; x=1777628958;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1esRohv/papPLDdSe2D0wJD6CrWbf7Rb0wcHc4Vktxs=;
  b=SrJmMMVttkXTHk+ObbJUt8GeemYeT/5xUJAQCFmjN1TdQTGovzl7s2if
   woAbt/Dpg4Qpb8Pg4hXwbzeD26EyBfphuG57tEVpp8TrdiLUQGa2ZMSTR
   sICpw1Lq2xnyZGrkbOSyWKBa5rtExsxUOTBt6dz/C2zztjWscyl5KvDuB
   YVcfbP+Ohhxtongf8ILRjA0ePPfyyDY2ih2ftbvctJF+3tzaUUv2/5zDH
   R33M5/LzEZz7YKv1e9Yc3xYb/opZLgWlHzzuJlD64mRt0KDYtUvcR2RDN
   QHe3osDBUFtNMjmQkx1gaKgXtqObOoIADhABhvPhguTZcd3NzuSwhI0XK
   A==;
X-CSE-ConnectionGUID: H8nMK648QFyFldPJcv7Oog==
X-CSE-MsgGUID: 8N6M942RTIODy5qmDRSJFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="47012503"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47012503"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 02:49:17 -0700
X-CSE-ConnectionGUID: hZqqKIDrTZ6x9k4u+5X0cQ==
X-CSE-MsgGUID: PvvGOntnR1K1gk/ka/Fmng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134848637"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2025 02:49:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAQXY-00045V-1i;
	Thu, 01 May 2025 09:49:12 +0000
Date: Thu, 1 May 2025 17:49:11 +0800
From: kernel test robot <lkp@intel.com>
To: Igor Belousov <igor.b@beldev.am>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH mm-new] mm/zblock: avoid failing the build
Message-ID: <202505011759.kmXPfmFI-lkp@intel.com>
References: <20250428065727.57990-1-igor.b@beldev.am>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250428065727.57990-1-igor.b@beldev.am>

Hi Igor,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Igor-Belousov/mm-zblock-avoid-failing-the-build/20250428-150012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250428065727.57990-1-igor.b%40beldev.am
patch subject: [PATCH mm-new] mm/zblock: avoid failing the build
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250501/202505011759.kmXPfmFI-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505011759.kmXPfmFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505011759.kmXPfmFI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/zblock.c:27:
>> mm/zblock.h:24:2: error: invalid preprocessing directive
      24 | #warn This PAGE_SIZE is not quite supported yet
         |  ^
   1 error generated.


vim +24 mm/zblock.h

    16	
    17	#if PAGE_SIZE == 0x1000
    18	/* max 128 slots per block, max table size 32 */
    19	#define SLOT_BITS 7
    20	#elif PAGE_SIZE == 0x4000
    21	/* max 256 slots per block, max table size 64 */
    22	#define SLOT_BITS 8
    23	#else
  > 24	#warn This PAGE_SIZE is not quite supported yet
    25	#define SLOT_BITS 8
    26	#endif
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
