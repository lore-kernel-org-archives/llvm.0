Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98FF137932;
	Sat, 15 Nov 2025 19:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763233607; cv=none; b=MM+9UBFL3Ru1WNNOq2b8bspmQT28MyNNfgdpOM7AxI0N7PduB/J8pYD27ukkRqK1evwrd17b6Ti10i2+h0fCFUJsxteS6nBqJfQC6Zup3BTxkkJM6bZFRwVv9Zr3BFu5OG1I/75etzptuUe3Vale1OhQoh9YjHhSU6QZMOsDXFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763233607; c=relaxed/simple;
	bh=cVdHc0zZMKwI/lhvVkx0Lah8VDIvpX47gfaLp/x4dOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l6EzD7dGEqWhSBhdNMfrRCnWILch+d3E475vy0PgxZbPGyJSJd9MI3Aw1H8NxYSZ254VYqIrpvah1oH/bB3njU7ar0PqYUWqvAOrdf1DZBq7hXiHHzQeUU28E2eyxuAesDcm84MEKM59X7Sfv12QGv0OJnWrDdK0XLMWhSPCj3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bpv80R/w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bpv80R/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763233605; x=1794769605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cVdHc0zZMKwI/lhvVkx0Lah8VDIvpX47gfaLp/x4dOY=;
  b=bpv80R/w4QiT/MEyH3uP/3OfiwIisROYONMfbioSuQyvOSYQDtY/R+i8
   oxsz03WkBArU3vznajpUNHYhBZgvins19xXPm01atp7apwEUuR1i133iM
   Ibeagc9JSTtict87CxIvmPitSqU/nmmYgb7SSPv3TTctfwCZIrueUhqRk
   YqyW3nuDeLiAlbB/obAAwohQ4k+Pv7RadnEaN04FVFjonATXWtM003/SQ
   V5lc7c/NNgyCWUyv++vhTItv7sHgw/e0/8c/plzeGdDqpe3g6AwOK5/Dy
   UdBw+lDasvm2CpD/gG2Vvdb79MyF2DnLLISRZJwMDxhohV/Z9gYtzfoKd
   A==;
X-CSE-ConnectionGUID: 3yAuudqpSw2P6CrVSOHo+A==
X-CSE-MsgGUID: hMkZv7MsRVeuzg3Z6qEgJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="65326680"
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="65326680"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 11:06:44 -0800
X-CSE-ConnectionGUID: MgxB5T1ZRYywJ2N41Elqaw==
X-CSE-MsgGUID: i0os8C7dQOqSFtYN1KlIhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,307,1754982000"; 
   d="scan'208";a="195210382"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Nov 2025 11:06:43 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKLbb-0008CN-27;
	Sat, 15 Nov 2025 19:06:39 +0000
Date: Sun, 16 Nov 2025 03:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Subject: [akpm-mm:mm-nonmm-unstable 82/133]
 include/linux/kexec_handover.h:108:7: warning: no previous prototype for
 function 'kho_alloc_preserve'
Message-ID: <202511160314.OK0OGRXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4fc88c237bfe11bde443e104428aac56e63a997f
commit: 88316955b5b1b4cb0cb2fad416f7e8dde9b246a0 [82/133] kho: introduce high-level memory allocation API
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20251116/202511160314.OK0OGRXl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160314.OK0OGRXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160314.OK0OGRXl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/mm_init.c:33:
>> include/linux/kexec_handover.h:108:7: warning: no previous prototype for function 'kho_alloc_preserve' [-Wmissing-prototypes]
     108 | void *kho_alloc_preserve(size_t size)
         |       ^
   include/linux/kexec_handover.h:108:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     108 | void *kho_alloc_preserve(size_t size)
         | ^
         | static 
>> include/linux/kexec_handover.h:113:6: warning: no previous prototype for function 'kho_unpreserve_free' [-Wmissing-prototypes]
     113 | void kho_unpreserve_free(void *mem) { }
         |      ^
   include/linux/kexec_handover.h:113:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     113 | void kho_unpreserve_free(void *mem) { }
         | ^
         | static 
>> include/linux/kexec_handover.h:114:6: warning: no previous prototype for function 'kho_restore_free' [-Wmissing-prototypes]
     114 | void kho_restore_free(void *mem) { }
         |      ^
   include/linux/kexec_handover.h:114:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     114 | void kho_restore_free(void *mem) { }
         | ^
         | static 
   3 warnings generated.


vim +/kho_alloc_preserve +108 include/linux/kexec_handover.h

   107	
 > 108	void *kho_alloc_preserve(size_t size)
   109	{
   110		return ERR_PTR(-EOPNOTSUPP);
   111	}
   112	
 > 113	void kho_unpreserve_free(void *mem) { }
 > 114	void kho_restore_free(void *mem) { }
   115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
