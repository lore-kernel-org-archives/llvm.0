Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6028B1B86E5;
	Sun, 28 Jul 2024 10:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722163387; cv=none; b=ieDGqqHZ+lDsderG8fqt+5bB9anuRKmyOxWgi4pR7JuhEGuqQ5hfcyXwzaOCzBwRWqIXMp+g9mmyQFbSdEEhS7sKxViRxcI39RH/FXmsvwWz+H81N4Byb9weMwavuSTkzrt4xNoZTy81XJvYV6Ga5awWBm5U4uEWv2jVMZavdiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722163387; c=relaxed/simple;
	bh=lot65y8TDmxfd/RHyrMJzEDcRCK1jQzEF5BMDHCJRtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLdA33QNlkZL/+jE2xVsBiT1KA7+0tuSzWY7NsHtMysqSwBhMuoCqXHoGspBkYC4XQdgwOw6J7s82eUzpmvsj1lFGkWFYG3PXhq5Z6N0WH1n0NNTbS0nVT+HkkLfDmBsn1BIZfFymGE/YXdL8DjA+XXZeo6i0rx9PqQqnqpWJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OsfhY9SS; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsfhY9SS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722163384; x=1753699384;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lot65y8TDmxfd/RHyrMJzEDcRCK1jQzEF5BMDHCJRtc=;
  b=OsfhY9SS7oRDPmZN3mwpzw26IoivFdIWZ0CMDpYokcDODTUr00DgwePq
   9So0qrOzJsQidviSh9CqubpckLcu87bfYAivYUq1KMq00XSRTJP/C69Wt
   YuFURowXVo5kjdrUxjDdN9erV7De5ZI1RpbjEdLmPPkTfrJgxulZ7q3lK
   i4O5OR4J9XfxvGP/kdZ29JoJbXlSI7xmHL14O3sBwJcJmf31f1oUa+fSr
   2d1jj82f9MDR6B6lnmSm6LeSgU0kK2VHldSWAqFzL+mSst/FoW+EHajQ/
   PIHZSk9l6u60OQRiwD6lU9qxWuFUUNYXO77XmRdZm9uuZSFjmMqhprBTC
   A==;
X-CSE-ConnectionGUID: IcJ8UIMdT16ps6YTmxublw==
X-CSE-MsgGUID: qXUGM8OsTQynIaj5b9ddSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11146"; a="31297195"
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="31297195"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2024 03:43:03 -0700
X-CSE-ConnectionGUID: R9I55EuJQWu2+yt6/x9AKg==
X-CSE-MsgGUID: wByR+TZFTAGhbm/c+WvmWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,243,1716274800"; 
   d="scan'208";a="54277184"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Jul 2024 03:43:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sY1Mg-000qjC-2T;
	Sun, 28 Jul 2024 10:42:58 +0000
Date: Sun, 28 Jul 2024 18:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Avri Altman <avri.altman@wdc.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ricky WU <ricky_wu@realtek.com>, Avri Altman <avri.altman@wdc.com>
Subject: Re: [PATCH 09/10] mmc: core: Add Ext memory addressing for erase
Message-ID: <202407281841.RRgIK067-lkp@intel.com>
References: <20240728081154.1782120-10-avri.altman@wdc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728081154.1782120-10-avri.altman@wdc.com>

Hi Avri,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10 next-20240726]
[cannot apply to ulf-hansson-mmc-mirror/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Avri-Altman/mmc-sd-SDUC-Support-Recognition/20240728-161645
base:   linus/master
patch link:    https://lore.kernel.org/r/20240728081154.1782120-10-avri.altman%40wdc.com
patch subject: [PATCH 09/10] mmc: core: Add Ext memory addressing for erase
config: i386-buildonly-randconfig-001-20240728 (https://download.01.org/0day-ci/archive/20240728/202407281841.RRgIK067-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240728/202407281841.RRgIK067-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407281841.RRgIK067-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 6 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   include/linux/bitfield.h:156:30: note: expanded from macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
>> drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   include/linux/bitfield.h:156:30: note: expanded from macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                            ^~~~~
   drivers/mmc/core/core.c:1667:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   include/linux/bitfield.h:156:50: note: expanded from macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                                       ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/mmc/core/core.c:1667:27: warning: shift count is negative [-Wshift-count-negative]
    1667 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   include/linux/bitfield.h:156:50: note: expanded from macro 'FIELD_GET'
     156 |                 (typeof(_mask))(((_reg) & (_mask)) >> __bf_shf(_mask)); \
         |                                                       ~~~~~~~~~^~~~~~
   include/linux/bitfield.h:45:38: note: expanded from macro '__bf_shf'
      45 | #define __bf_shf(x) (__builtin_ffsll(x) - 1)
         |                                      ^
   drivers/mmc/core/core.c:1689:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1689 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, to);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:8:31: note: expanded from macro '__GENMASK'
       8 |         (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
         |                               ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/mmc/core/core.c:1689:27: warning: shift count is negative [-Wshift-count-negative]
    1689 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, to);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^
   include/linux/bits.h:35:31: note: expanded from macro 'GENMASK'
      35 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
         |                                      ^
   include/uapi/linux/bits.h:9:19: note: expanded from macro '__GENMASK'
       9 |          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
         |                   ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   drivers/mmc/core/core.c:1689:27: warning: shift count >= width of type [-Wshift-count-overflow]
    1689 |                 u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, to);
         |                               ~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd_ops.h:14:28: note: expanded from macro 'SDUC_ADDR_EXT_MASK'
      14 | #define SDUC_ADDR_EXT_MASK GENMASK(37, 32)
         |                            ^


vim +1667 drivers/mmc/core/core.c

  1618	
  1619	static int mmc_do_erase(struct mmc_card *card, sector_t from,
  1620				sector_t to, unsigned int arg)
  1621	{
  1622		struct mmc_command cmd = {};
  1623		unsigned int qty = 0, busy_timeout = 0;
  1624		bool use_r1b_resp;
  1625		int err;
  1626	
  1627		mmc_retune_hold(card->host);
  1628	
  1629		/*
  1630		 * qty is used to calculate the erase timeout which depends on how many
  1631		 * erase groups (or allocation units in SD terminology) are affected.
  1632		 * We count erasing part of an erase group as one erase group.
  1633		 * For SD, the allocation units are always a power of 2.  For MMC, the
  1634		 * erase group size is almost certainly also power of 2, but it does not
  1635		 * seem to insist on that in the JEDEC standard, so we fall back to
  1636		 * division in that case.  SD may not specify an allocation unit size,
  1637		 * in which case the timeout is based on the number of write blocks.
  1638		 *
  1639		 * Note that the timeout for secure trim 2 will only be correct if the
  1640		 * number of erase groups specified is the same as the total of all
  1641		 * preceding secure trim 1 commands.  Since the power may have been
  1642		 * lost since the secure trim 1 commands occurred, it is generally
  1643		 * impossible to calculate the secure trim 2 timeout correctly.
  1644		 */
  1645		if (card->erase_shift)
  1646			qty += ((to >> card->erase_shift) -
  1647				(from >> card->erase_shift)) + 1;
  1648		else if (mmc_card_sd(card))
  1649			qty += to - from + 1;
  1650		else
  1651			qty += ((to / card->erase_size) -
  1652				(from / card->erase_size)) + 1;
  1653	
  1654		if (!mmc_card_blockaddr(card)) {
  1655			from <<= 9;
  1656			to <<= 9;
  1657		}
  1658	
  1659		if (mmc_card_sd(card))
  1660			cmd.opcode = SD_ERASE_WR_BLK_START;
  1661		else
  1662			cmd.opcode = MMC_ERASE_GROUP_START;
  1663		cmd.arg = from & 0xFFFFFFFF;
  1664		cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
  1665	
  1666		if (mmc_card_is_sduc(card->host)) {
> 1667			u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, from);
  1668	
  1669			mmc_send_ext_addr(card->host, ext_addr);
  1670		}
  1671	
  1672		err = mmc_wait_for_cmd(card->host, &cmd, 0);
  1673		if (err) {
  1674			pr_err("mmc_erase: group start error %d, "
  1675			       "status %#x\n", err, cmd.resp[0]);
  1676			err = -EIO;
  1677			goto out;
  1678		}
  1679	
  1680		memset(&cmd, 0, sizeof(struct mmc_command));
  1681		if (mmc_card_sd(card))
  1682			cmd.opcode = SD_ERASE_WR_BLK_END;
  1683		else
  1684			cmd.opcode = MMC_ERASE_GROUP_END;
  1685		cmd.arg = to & 0xFFFFFFFF;
  1686		cmd.flags = MMC_RSP_SPI_R1 | MMC_RSP_R1 | MMC_CMD_AC;
  1687	
  1688		if (mmc_card_is_sduc(card->host)) {
  1689			u8 ext_addr = FIELD_GET(SDUC_ADDR_EXT_MASK, to);
  1690	
  1691			mmc_send_ext_addr(card->host, ext_addr);
  1692		}
  1693	
  1694		err = mmc_wait_for_cmd(card->host, &cmd, 0);
  1695		if (err) {
  1696			pr_err("mmc_erase: group end error %d, status %#x\n",
  1697			       err, cmd.resp[0]);
  1698			err = -EIO;
  1699			goto out;
  1700		}
  1701	
  1702		memset(&cmd, 0, sizeof(struct mmc_command));
  1703		cmd.opcode = MMC_ERASE;
  1704		cmd.arg = arg;
  1705		busy_timeout = mmc_erase_timeout(card, arg, qty);
  1706		use_r1b_resp = mmc_prepare_busy_cmd(card->host, &cmd, busy_timeout);
  1707	
  1708		err = mmc_wait_for_cmd(card->host, &cmd, 0);
  1709		if (err) {
  1710			pr_err("mmc_erase: erase error %d, status %#x\n",
  1711			       err, cmd.resp[0]);
  1712			err = -EIO;
  1713			goto out;
  1714		}
  1715	
  1716		if (mmc_host_is_spi(card->host))
  1717			goto out;
  1718	
  1719		/*
  1720		 * In case of when R1B + MMC_CAP_WAIT_WHILE_BUSY is used, the polling
  1721		 * shall be avoided.
  1722		 */
  1723		if ((card->host->caps & MMC_CAP_WAIT_WHILE_BUSY) && use_r1b_resp)
  1724			goto out;
  1725	
  1726		/* Let's poll to find out when the erase operation completes. */
  1727		err = mmc_poll_for_busy(card, busy_timeout, false, MMC_BUSY_ERASE);
  1728	
  1729	out:
  1730		mmc_retune_release(card->host);
  1731		return err;
  1732	}
  1733	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
