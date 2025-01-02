Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A5D2B2CF;
	Thu,  2 Jan 2025 09:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735810456; cv=none; b=jQyu3cok6K9w/5L95pFD6RfycK7sJwiJ5HYECoQfkyrbYHkHtbOA/xbsKAeoWNqJSPhA2XLU7hR5ZBKp9YVItv01hnU+kVRkKI+RXwGsi85yVEY4zQVAsn/33rI1R9jj8dNS86nZL+PGgdQrGsW4cl9Qk18w1ICUIN1sy/YjvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735810456; c=relaxed/simple;
	bh=kM2Bt+VOmE7l19MbdpZrUcymJT/YBMaTJFEzZLRXaWw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9vRgy2c4MYq/wU8vJoBPO7EujEAPvCdyZb4Ck0x/WLPgidxql2O3XEw0oHqbwUW9WlECnvVl19n760b2w8tgGdL45yg3PkKFvAf4JHKdL8/cVbVx+1C4agtQ20dy+O8q/TCqZfrBOhubCuxSm3AZJNEA/4Quubf3AybbqR8ws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OBc1cVq6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OBc1cVq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735810454; x=1767346454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kM2Bt+VOmE7l19MbdpZrUcymJT/YBMaTJFEzZLRXaWw=;
  b=OBc1cVq6AuCaepDGEvbH7i48JEpG7QbgP1qJW3p80Pv8TCCSrsNXqVFN
   d9hop3DS11ZchCmvDag36IokJPYvFHuo2pwZMl+kBRMh6Q1vJZA+gi7e/
   FAJfLaiLcVYihN9B2gAY/EcqyUhMvD52np03c4Kqk54HwuvTui5zcosAC
   KPuRKColEch7GNeIUBIG2X5vONkQeLQMDurgq3L3oQtG2Sx+6MJ9pMpMD
   zEzeWY2EQXnEAxCDo4JYd+HbrKcnUhht4os1fe7S98aYqSenPX/nrRHMM
   nTAfcymq+auM2V21It0d5UZcr/BxNBtGl9E1cImExnQPU2tHpoWVkCRpW
   g==;
X-CSE-ConnectionGUID: fOF1vWo0Qyy1hvI2vMF1Aw==
X-CSE-MsgGUID: 1wPwlJ3FQdiYlvgrUKgCWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61416304"
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="61416304"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2025 01:34:13 -0800
X-CSE-ConnectionGUID: AlNhbbuRS6Cl6FASpZmeiw==
X-CSE-MsgGUID: k6hZ5qfTRfiXjd528GxAug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,285,1728975600"; 
   d="scan'208";a="101643600"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jan 2025 01:34:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTHak-0008ML-1H;
	Thu, 02 Jan 2025 09:34:10 +0000
Date: Thu, 2 Jan 2025 17:33:51 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 27/31] kernel/events/core.c:6944:3: error: call to
 undeclared function 'unwind_user_deferred'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202501021738.Vzk5iweL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   b610703fefd5a3a992e07a383e2e6f6cbf9a41c8
commit: feebf0a91d58b3153c3b8f3eb670b46135521fdd [27/31] perf: Add deferred user callchains
config: x86_64-randconfig-008-20250102 (https://download.01.org/0day-ci/archive/20250102/202501021738.Vzk5iweL-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250102/202501021738.Vzk5iweL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501021738.Vzk5iweL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/events/core.c:12:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/events/core.c:6944:3: error: call to undeclared function 'unwind_user_deferred'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    6944 |                 unwind_user_deferred(&perf_unwind_callback_cb, NULL, event);
         |                 ^
>> kernel/events/core.c:14218:2: error: call to undeclared function 'unwind_user_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    14218 |         unwind_user_register(&perf_unwind_callback_cb, perf_event_callchain_deferred);
          |         ^
   1 warning and 2 errors generated.


vim +/unwind_user_deferred +6944 kernel/events/core.c

  6938	
  6939	static void perf_pending_unwind_irq(struct irq_work *entry)
  6940	{
  6941		struct perf_event *event = container_of(entry, struct perf_event, pending_unwind_irq);
  6942	
  6943		if (event->pending_unwind) {
> 6944			unwind_user_deferred(&perf_unwind_callback_cb, NULL, event);
  6945			event->pending_unwind = 0;
  6946		}
  6947	}
  6948	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
