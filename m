Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A37E27816C;
	Sun,  8 Feb 2026 04:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770524587; cv=none; b=NqqJUPhSlU1SwmbRQy5YPAtBMTOXlqaaEB5kIloJX9gRhQTMPmXM2uYRuBtY6ZQ2CkIDOmSj3VCcw218K8wwsHOp49+RVvDOWbBhI7obKh//39M4P315Jk2glrGhV5dt6jp77JZ0dfIVjBJn5tPsloS1P+B0+T8hEkEqqQaScf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770524587; c=relaxed/simple;
	bh=5FypKAiiZG0JncW44UK9vYa1UHh9QY7Yx3aOJ+xS5LE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wt0RrfwYIn+131YmmUeJTE4HsBbt9ilB7KB9NgSdcBWXxcZMdlPgXFedgYTIHTBxxWx0F7SCr22ykp5s562+2fyB7ApvZrGEVVL8ZNB8A9wvzXh+BT4YpjBSyrEnWim3JN4zLMbq51vfuEVKIjaZyhlZEpK3EhzVT3UXeRuRQ8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMH3vTHc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMH3vTHc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770524587; x=1802060587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5FypKAiiZG0JncW44UK9vYa1UHh9QY7Yx3aOJ+xS5LE=;
  b=bMH3vTHcWs/bZvFBBp4U7L1Ooz7Xn5t+d4MquUxVvvTZDrcwhddWFFq/
   lg346Fco8mXVVRxnWASats0XSO6AgdWFjc5Z9zBU5Bd9iPgSTOU9/W9nN
   bo5JNSgt216vdxuyCC+vaU95dhh5jv9OAEKTgaOiYsRQ7f8+QuSTQNPIB
   8IiLRDHlKHWLIP7+MN3yC8xvNvOtBneTEB1jDo020FhdxLc00TE7kSK5b
   DJYggQ6S5D9IIi/6YooOWQ3AbXkQYyL4JckaYgt8m+YpjZKViVpIdkv1A
   lHYleAiGjqEM2T8t3yGghlY3RUlSwPMhi83bZ/Xz+LLcdIv5FwZpJBvoP
   Q==;
X-CSE-ConnectionGUID: jVYwvLRHSXa3LuphYIj+nA==
X-CSE-MsgGUID: zIZkD78AQdq8Qn9DuARLBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="74277462"
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="74277462"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 20:23:06 -0800
X-CSE-ConnectionGUID: cLP6akF5QRqQVdqjg1U3IA==
X-CSE-MsgGUID: T33mwuh9TquMASxqmtQmsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,279,1763452800"; 
   d="scan'208";a="211056280"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Feb 2026 20:23:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vowK6-00000000m2y-07la;
	Sun, 08 Feb 2026 04:23:02 +0000
Date: Sun, 8 Feb 2026 12:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>,
	parthiban.veerasooran@microchip.com, christian.gromm@microchip.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Subject: Re: [PATCH] staging: most: dim2: remove unused header includes
Message-ID: <202602081252.5GSGYfhI-lkp@intel.com>
References: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207212354.51694-1-rajveer.chaudhari.linux@gmail.com>

Hi Rajveer,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Rajveer-Chaudhari/staging-most-dim2-remove-unused-header-includes/20260208-052613
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260207212354.51694-1-rajveer.chaudhari.linux%40gmail.com
patch subject: [PATCH] staging: most: dim2: remove unused header includes
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260208/202602081252.5GSGYfhI-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260208/202602081252.5GSGYfhI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602081252.5GSGYfhI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/most/dim2/hal.c:14:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/staging/most/dim2/hal.c:114:22: error: call to undeclared function 'DIV_ROUND_UP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |                 u32 const blocks = DIV_ROUND_UP(size, DBR_BLOCK_SIZE);
         |                                    ^
   drivers/staging/most/dim2/hal.c:134:21: error: call to undeclared function 'DIV_ROUND_UP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         u32 const blocks = DIV_ROUND_UP(size, DBR_BLOCK_SIZE);
         |                            ^
   drivers/staging/most/dim2/hal.c:759:18: error: call to undeclared function 'DIV_ROUND_UP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     759 |                 ch->dbr_size = ROUND_UP_TO(hw_buffer_size, DBR_BLOCK_SIZE);
         |                                ^
   drivers/staging/most/dim2/hal.c:46:29: note: expanded from macro 'ROUND_UP_TO'
      46 | #define ROUND_UP_TO(x, d)  (DIV_ROUND_UP(x, (d)) * (d))
         |                             ^
   1 warning and 3 errors generated.


vim +/DIV_ROUND_UP +114 drivers/staging/most/dim2/hal.c

ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24   95  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24   96  /**
51ca97af82af8a drivers/staging/most/dim2/hal.c          Lee Jones       2021-04-14   97   * alloc_dbr() - Allocates DBR memory.
7af9b4444fab2e drivers/staging/most/dim2/hal.c          Lee Jones       2021-04-14   98   * @size: Allocating memory size.
51ca97af82af8a drivers/staging/most/dim2/hal.c          Lee Jones       2021-04-14   99   * Returns: Offset in DBR memory by success or DBR_SIZE if out of memory.
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  100   */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  101  static int alloc_dbr(u16 size)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  102  {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  103  	int mask_size;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  104  	int i, block_idx = 0;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  105  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  106  	if (size <= 0)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  107  		return DBR_SIZE; /* out of memory */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  108  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  109  	mask_size = dbr_get_mask_size(size);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  110  	if (mask_size == 0)
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  111  		return DBR_SIZE; /* out of memory */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  112  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  113  	for (i = 0; i < DBR_MAP_SIZE; i++) {
bdc58e3bef647b drivers/staging/most/hdm-dim2/dim2_hal.c simran singhal  2017-02-22 @114  		u32 const blocks = DIV_ROUND_UP(size, DBR_BLOCK_SIZE);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  115  		u32 mask = ~((~(u32)0) << blocks);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  116  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  117  		do {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  118  			if ((g.dbr_map[i] & mask) == 0) {
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  119  				g.dbr_map[i] |= mask;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  120  				return block_idx * DBR_BLOCK_SIZE;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  121  			}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  122  			block_idx += mask_size;
9158d33a5d38d1 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-10-15  123  			/* do shift left with 2 steps in case mask_size == 32 */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  124  			mask <<= mask_size - 1;
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  125  		} while ((mask <<= 1) != 0);
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  126  	}
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  127  
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  128  	return DBR_SIZE; /* out of memory */
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  129  }
ba3d7ddfb5c6a2 drivers/staging/most/hdm-dim2/dim2_hal.c Christian Gromm 2015-07-24  130  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
