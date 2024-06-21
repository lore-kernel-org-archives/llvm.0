Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB275664;
	Fri, 21 Jun 2024 21:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719006987; cv=none; b=hocIfg0bbkoJIRX+g+zZx//ajbebevhzKKQk7eo1XrbVL70xBpjNldumTy4aEQvPIujQO7HjE7mvac7ibjjw9ClszFYbPIYCdPtLUyh2/KpCLG/QsubHlXBnz6Fqdnlyz/JGBWipOQ41T04+fY7cgNxMebqoCTZvfJ8Bx3iJCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719006987; c=relaxed/simple;
	bh=UP32cnE5jbg87+7h/ZXIOWHABtL/wF0gSNpH/JiqERQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mL34tsIHtKGlEjha0eCefz7ljYaUP1/AzX43D+D4xDg2ZzG4SShYC7C0UIFvFIQ0C34CP1rMj+sf/ElviQf3mkMRg+xwCsj84Xd9oe7h3NO01IGTC8U5WpEgEeCwgsC2YpsgstBvOZwFrJzFaDhmQ1k4FWgWHUH2a8x4Pa4rNEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=US69JU9J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="US69JU9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719006986; x=1750542986;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UP32cnE5jbg87+7h/ZXIOWHABtL/wF0gSNpH/JiqERQ=;
  b=US69JU9JvtGWSzDaK/+zhKtUDbz0HAmmnVVkFwSHu/HKi75KZ+/jElN7
   AmacTj/fMJirVejdkg8k7PKdmPCGPxCdE+WtrevmUNEY6FpvmXFh+1uC6
   SVzMeVrp2jVhIxi37ygHAXMbmKHkDTZLrvSyNmYSRVzwgtpyLJ2tKD/BU
   WMluwr/zR4jKpA1mqCqLMJ2GwjfkAUo9NyFwCBhSJlm5AhAJhkjxmp+gq
   yzhS6l+PGa+6ba/zkUcSBxHYwHYbidxqeHZbQ/alW/84MxaBExXSfwxgK
   9eAwmKATDzJ8TWvnL4U563Y2WIL85g/6SexL/CEaf1miPUt4lUgmra/cl
   A==;
X-CSE-ConnectionGUID: EHC1gBf0Q0m6RTQ9hM56IA==
X-CSE-MsgGUID: TZtZTFW3ShKM54BnGIEy0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="16189467"
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="16189467"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 14:56:26 -0700
X-CSE-ConnectionGUID: 4G5GH+8rRwOHDhHuGA686A==
X-CSE-MsgGUID: b6xA9YBgT02DWEb7/oS3JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,255,1712646000"; 
   d="scan'208";a="47632429"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jun 2024 14:56:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKmF3-000927-0W;
	Fri, 21 Jun 2024 21:56:21 +0000
Date: Sat, 22 Jun 2024 05:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>,
	Himanshu Madhani <himanshu.madhani@oracle.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Keith Busch <kbusch@kernel.org>
Subject: [axboe-block:for-next 69/81] block/blk-settings.c:200:20: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202406220538.GuaaK0FH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   b398f439dc8f6eeb855ba46842cb5d127f39ae77
commit: 9da3d1e912f3953196e66991d75208cde3e845e1 [69/81] block: Add core atomic write support
config: arm-randconfig-003-20240622 (https://download.01.org/0day-ci/archive/20240622/202406220538.GuaaK0FH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220538.GuaaK0FH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220538.GuaaK0FH-lkp@intel.com/

Note: the axboe-block/for-next HEAD b398f439dc8f6eeb855ba46842cb5d127f39ae77 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> block/blk-settings.c:200:20: warning: comparison of distinct pointer types ('typeof ((chunk_sectors)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
                   if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
                       ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                                     ^  ~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
>> block/blk-settings.c:200:20: error: incompatible pointer types passing 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
                   if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
                       ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
           ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
   arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
                                               ^
>> block/blk-settings.c:200:20: warning: shift count >= width of type [-Wshift-count-overflow]
                   if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   include/asm-generic/bug.h:148:18: note: expanded from macro 'WARN_ON_ONCE'
           DO_ONCE_LITE_IF(condition, WARN_ON, 1)
                           ^~~~~~~~~
   include/linux/once_lite.h:28:27: note: expanded from macro 'DO_ONCE_LITE_IF'
                   bool __ret_do_once = !!(condition);                     \
                                           ^~~~~~~~~
   2 warnings and 1 error generated.


vim +200 block/blk-settings.c

   175	
   176	static void blk_validate_atomic_write_limits(struct queue_limits *lim)
   177	{
   178		unsigned int chunk_sectors = lim->chunk_sectors;
   179		unsigned int boundary_sectors;
   180	
   181		if (!lim->atomic_write_hw_max)
   182			goto unsupported;
   183	
   184		boundary_sectors = lim->atomic_write_hw_boundary >> SECTOR_SHIFT;
   185	
   186		if (boundary_sectors) {
   187			/*
   188			 * A feature of boundary support is that it disallows bios to
   189			 * be merged which would result in a merged request which
   190			 * crosses either a chunk sector or atomic write HW boundary,
   191			 * even though chunk sectors may be just set for performance.
   192			 * For simplicity, disallow atomic writes for a chunk sector
   193			 * which is non-zero and smaller than atomic write HW boundary.
   194			 * Furthermore, chunk sectors must be a multiple of atomic
   195			 * write HW boundary. Otherwise boundary support becomes
   196			 * complicated.
   197			 * Devices which do not conform to these rules can be dealt
   198			 * with if and when they show up.
   199			 */
 > 200			if (WARN_ON_ONCE(do_div(chunk_sectors, boundary_sectors)))
   201				goto unsupported;
   202	
   203			/*
   204			 * The boundary size just needs to be a multiple of unit_max
   205			 * (and not necessarily a power-of-2), so this following check
   206			 * could be relaxed in future.
   207			 * Furthermore, if needed, unit_max could even be reduced so
   208			 * that it is compliant with a !power-of-2 boundary.
   209			 */
   210			if (!is_power_of_2(boundary_sectors))
   211				goto unsupported;
   212		}
   213	
   214		blk_atomic_writes_update_limits(lim);
   215		return;
   216	
   217	unsupported:
   218		lim->atomic_write_max_sectors = 0;
   219		lim->atomic_write_boundary_sectors = 0;
   220		lim->atomic_write_unit_min = 0;
   221		lim->atomic_write_unit_max = 0;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
