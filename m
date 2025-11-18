Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870FD1DC985;
	Tue, 18 Nov 2025 01:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763430380; cv=none; b=PTr9+z37MCuneL9onozad88OinvQqjxPdhIf1Z2fy6CP/YzlUlRW9uBJu6Yg9wVjui41t3E3r7eIh7Sd605ZXcnNGDbiIVyk1vSyG0D5ejOFenp1SVdcknEs46049uTA+373DuI/nz2WL2GTgL2lKm4XOcJaks+RSgJmFecsJ2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763430380; c=relaxed/simple;
	bh=6/+OUOt3n3x7cv0EV1HYluGhVtUMY3emw1tiUi+5KDY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CzGSkIudZLbHhfdU9tgbLaCDsq2JKIHzXwLUGfwWGboM/W348HWRg9S+XnKu/c6RWibMaHNOwS3ALjvgkqxJd+D7zNkyYoTEZt3uqutYudHgPEz88mnuH2F/ydPJt0r/JOD3EmG+TOUg5edTWbFhESpqT98ITO1GltvOWwYfvu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhQ+yvFm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhQ+yvFm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763430378; x=1794966378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6/+OUOt3n3x7cv0EV1HYluGhVtUMY3emw1tiUi+5KDY=;
  b=KhQ+yvFmerCRlxkhGzL/RHDZC+rD/MKNKJDGkhC1yLFtTNTi9WC4YRjW
   htIbBocpkL2fuE/5T6ZW0k92s8I4G3AM1gmWkkg0TolL46qs8bxo2mnXU
   JOIelnycX3cxwlOeH9xsbReyq4huGNw1VWTGSCM/w21jEpTjfg79WkXfw
   huZ3awOgViNRQzLb+gAAn6lgPB3HL6x0ibetdtUguijPiUXurW01c1IaH
   P8wF7k186Ua9kJxJJaxekkcWZWryWS/ZUqdqzTbPy1B5bcm4gfm3BRQHV
   r4TEYQcrLMObIuZUzCiahdHUADc1GQMNK9WJ/KV+al5cFLekSfhnTg0+W
   A==;
X-CSE-ConnectionGUID: MMD4VT0wTjW5+I+ONWIqmA==
X-CSE-MsgGUID: hu7UoFM6Ties22FlpihHlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65597299"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65597299"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 17:46:16 -0800
X-CSE-ConnectionGUID: hXyqQ2kfSG6EFid+kJMMcA==
X-CSE-MsgGUID: b36MMKuURKO8jxdjl/Ibfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="190848722"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Nov 2025 17:46:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLAnN-0001EJ-1n;
	Tue, 18 Nov 2025 01:46:13 +0000
Date: Tue, 18 Nov 2025 09:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Message-ID: <202511180916.NwW7M3B6-lkp@intel.com>
References: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0c1c7a6a83feaf2cf182c52983ffe330ffb50280]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Heidelberg-via-B4-Relay/mm-vmalloc-warn-only-once-when-vmalloc-detect-invalid-gfp-flags/20251118-080722
base:   0c1c7a6a83feaf2cf182c52983ffe330ffb50280
patch link:    https://lore.kernel.org/r/20251118-only-one-vmalloc-v1-1-29f8eacb4605%40ixit.cz
patch subject: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid gfp flags
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180916.NwW7M3B6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180916.NwW7M3B6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180916.NwW7M3B6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmalloc.c:3938:5: error: expected ')'
    3938 |                   invalid_mask, &invalid_mask, flags, &flags);
         |                   ^
   mm/vmalloc.c:3937:2: note: to match this '('
    3937 |         WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
         |         ^
   include/asm-generic/bug.h:159:29: note: expanded from macro 'WARN_ONCE'
     159 |         DO_ONCE_LITE_IF(condition, WARN, 1, format)
         |                                    ^
   1 error generated.


vim +3938 mm/vmalloc.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  3921  
7179b225631532 Vishal Moola (Oracle  2025-11-12  3922) /*
7179b225631532 Vishal Moola (Oracle  2025-11-12  3923)  * See __vmalloc_node_range() for a clear list of supported vmalloc flags.
7179b225631532 Vishal Moola (Oracle  2025-11-12  3924)  * This gfp lists all flags currently passed through vmalloc. Currently,
7179b225631532 Vishal Moola (Oracle  2025-11-12  3925)  * __GFP_ZERO is used by BPF and __GFP_NORETRY is used by percpu. Both drm
7179b225631532 Vishal Moola (Oracle  2025-11-12  3926)  * and BPF also use GFP_USER, which is GFP_KERNEL | __GFP_HARDWALL.
7179b225631532 Vishal Moola (Oracle  2025-11-12  3927)  */
7179b225631532 Vishal Moola (Oracle  2025-11-12  3928) #define GFP_VMALLOC_SUPPORTED (GFP_KERNEL | GFP_ATOMIC | GFP_NOWAIT |\
7179b225631532 Vishal Moola (Oracle  2025-11-12  3929) 				__GFP_NOFAIL |  __GFP_ZERO | __GFP_NORETRY |\
7179b225631532 Vishal Moola (Oracle  2025-11-12  3930) 				__GFP_HARDWALL)
7179b225631532 Vishal Moola (Oracle  2025-11-12  3931) 
7179b225631532 Vishal Moola (Oracle  2025-11-12  3932) static gfp_t vmalloc_fix_flags(gfp_t flags)
7179b225631532 Vishal Moola (Oracle  2025-11-12  3933) {
7179b225631532 Vishal Moola (Oracle  2025-11-12  3934) 	gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
7179b225631532 Vishal Moola (Oracle  2025-11-12  3935) 
7179b225631532 Vishal Moola (Oracle  2025-11-12  3936) 	flags &= GFP_VMALLOC_SUPPORTED;
bf791000a32caf David Heidelberg      2025-11-18  3937  	WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
7179b225631532 Vishal Moola (Oracle  2025-11-12 @3938) 		  invalid_mask, &invalid_mask, flags, &flags);
7179b225631532 Vishal Moola (Oracle  2025-11-12  3939) 	return flags;
7179b225631532 Vishal Moola (Oracle  2025-11-12  3940) }
7179b225631532 Vishal Moola (Oracle  2025-11-12  3941) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
