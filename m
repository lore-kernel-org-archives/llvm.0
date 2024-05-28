Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06904C622;
	Tue, 28 May 2024 05:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716873912; cv=none; b=VJ/MWtwfSM9roliJ8XQD1AA5ad/HnvjgCeWU13nrcoiKUVVejs10WNBxsDHMFiW6MqZvV/QILZo/g+1ygaugQv2NMH3r2yBWbRfPoD/FCV4ksPUk8Sjhh9kcLJtBsCZqS842DZ1uAbkVnernrdrbnMQK0ZCdQzQVZXLrvK1lRSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716873912; c=relaxed/simple;
	bh=9ljL2SRej7kfSr3/Z80vnbqUEmaAjmzBnY5RLtqXrnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XbERzza+Xkc1lyA+4IFM8AZjGg3zHF+zT1eDx1gX4g9Db/P6cvmzAXOQ89nEMUMIEQbVP2KYXHIbAZAGQwBZGAa52+7oMaIH4egwuUK6vJcXMADZdXj8eQIlZN/u6z2i5WUG7KgHulewf/xkYl3Zg5603AM/87pLQFN/0QLvo90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Crlv4UUK; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Crlv4UUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716873910; x=1748409910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ljL2SRej7kfSr3/Z80vnbqUEmaAjmzBnY5RLtqXrnM=;
  b=Crlv4UUKcjgRtdv2ysfu/WuvtQJLoeWHQbTTFB4duBwP1ejfTjUC7tYt
   IP8uNNc7lA9qNnkl8Cjg+Uvu//TGiziEyS3FysADvRQSQafZuCXjFfHHh
   37CG8poVSDqm+h8tzdq+9Zjg54EjE6IojfoFpc4XLp6ydtO2fmQmptyLD
   WC2g+6e8WpVzmfkwe3MmjVUuA1ui3kziw++U772JE3oY2Y6CIpgqb85gH
   iS6YXThJTa6trog0BBXcaODehG3EmpsuXxz7A5c+BS+68pLYoHRsFJQfO
   PEPNdbCwRW9gp9wil5djGJblvB3NBnvHHHq7qUx9CEP53IHmb920Fyk4m
   Q==;
X-CSE-ConnectionGUID: 2dMZyZPVSXOXgabUCIRY9A==
X-CSE-MsgGUID: kUspt9+5QDadIswm6vpWvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13038220"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="13038220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 22:25:10 -0700
X-CSE-ConnectionGUID: iw1DyotnQsOQ2cZ3eVSkpw==
X-CSE-MsgGUID: fkHDgsOvSi2w7etDCHK2kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; 
   d="scan'208";a="35019332"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 27 May 2024 22:25:10 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBpKa-000Bil-2S;
	Tue, 28 May 2024 05:25:05 +0000
Date: Tue, 28 May 2024 13:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgtime 4/5] fs/inode.c:73:15: error: '__section__'
 attribute only applies to functions, global variables, Objective-C methods,
 and Objective-C properties
Message-ID: <202405281321.aRVc7usN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgtime
head:   05aa6b03b8c3451d4aac5fb47e9e99c6e00ee304
commit: 05ca0fa7e195e028694f41de279dec33ada93d21 [4/5] fs: add infrastructure for multigrain timestamps
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240528/202405281321.aRVc7usN-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405281321.aRVc7usN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405281321.aRVc7usN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/inode.c:73:15: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
      73 | static struct __cacheline_aligned_in_smp ctime_floor_val ctime_floor;
         |               ^
   include/linux/cache.h:60:36: note: expanded from macro '__cacheline_aligned_in_smp'
      60 | #define __cacheline_aligned_in_smp __cacheline_aligned
         |                                    ^
   include/linux/cache.h:55:4: note: expanded from macro '__cacheline_aligned'
      55 |                  __section__(".data..cacheline_aligned")))
         |                  ^
   fs/inode.c:73:15: warning: attribute declaration must precede definition [-Wignored-attributes]
   include/linux/cache.h:60:36: note: expanded from macro '__cacheline_aligned_in_smp'
      60 | #define __cacheline_aligned_in_smp __cacheline_aligned
         |                                    ^
   include/linux/cache.h:54:18: note: expanded from macro '__cacheline_aligned'
      54 |   __attribute__((__aligned__(SMP_CACHE_BYTES),                  \
         |                  ^
   fs/inode.c:64:8: note: previous definition is here
      64 | struct ctime_floor_val {
         |        ^
   1 warning and 1 error generated.


vim +/__section__ +73 fs/inode.c

    62	
    63	/* Floor value for all ctime stamps */
    64	struct ctime_floor_val {
    65		union {
    66			struct {
    67				ktime_t	coarse;
    68				ktime_t	floor;
    69			};
    70			u128	full;
    71		};
    72	};
  > 73	static struct __cacheline_aligned_in_smp ctime_floor_val ctime_floor;
    74	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
