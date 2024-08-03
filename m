Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4B914D28F;
	Sat,  3 Aug 2024 06:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722667417; cv=none; b=r4dvWZ1E53iieAkWVlbhycBDrd4rollvZmRYuc6h0OOKPY5bTo6NE//ZLt41GQ6MnqkbE0VYkBw0E34pd/WX7Ctbpewc4pTU5RsqJLtp9n5LLvRIZkEAoW2dDrypHbBKR/G7tzwk3RLCcJ9FIj5dCsVUrLfxr2SI7nd0ERceRJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722667417; c=relaxed/simple;
	bh=7SlswvezL0zvAhUahzb7iLkepv0ev2wkEtxh6jzMK9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BXquc1oOFjMnJIjxMCjadrqrJi6sqSTxYWSiWgaaX6ZB83Z6OYqbzPtv6ZkyN0a8sz2AHC6FbtFNYI5DV5pdRJCOA6efMdgdXc6yKKGA3E3NXX4E09xWuQyqo6Di3AJHvaEEzMkbHzQdsoXcrjpOjggf2gcckpfgrDi27GG0vkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nr5Mo8rV; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nr5Mo8rV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722667416; x=1754203416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7SlswvezL0zvAhUahzb7iLkepv0ev2wkEtxh6jzMK9U=;
  b=Nr5Mo8rVsqP46lRjIrwylwWgV+ZhEKPNZ2FTPgG7+bfX/TIHpAUCuG8A
   trvF1tqsUNnkL0lhcp8Z0sEKkik9CdxmfLlIEeOYKdHL6oQTap7CWwShe
   pkl5ZcYRP+PWYHUTeZAUwjE+iNx3rHHinYG5MkAattH6FZvmhXp0CDB9m
   RhIYK1tr0FfDTNg0eJ4zvy5rsLp3/1Kt2eqbOvTtj8eTAWLmojT8r56S9
   wRGkfgljvIyiHV7i2bQ468g0b8x7jKYizD6zsT5WBus1d+DY87ht4sGGN
   dSKKD3bLZjnhoKZvFSh8t+BSRGpQmGfNomUtNeMg3jN98ikkI9qRbyE+V
   A==;
X-CSE-ConnectionGUID: IQ/Euh2XSaqeBLwk4ZpL9Q==
X-CSE-MsgGUID: /xBb7WRBT7aiiKrQoTuIPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20810082"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20810082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 23:43:36 -0700
X-CSE-ConnectionGUID: 9NmlPVhzQM6ecZsJL0ZguA==
X-CSE-MsgGUID: +bOlF8RqRf6CAkFI/5G8Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="56244622"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 02 Aug 2024 23:43:35 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa8UE-0000Bp-1J;
	Sat, 03 Aug 2024 06:43:31 +0000
Date: Sat, 3 Aug 2024 14:41:43 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot+extras/v6.11-rc1 151/152]
 include/linux/arm_mpam.h:11:10: fatal error: 'asm/mpam.h' file not found
Message-ID: <202408031416.mhtafdic-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.11-rc1
head:   31781dfaf7c1998c9a37ccb074dea9638612653c
commit: 8b1745a307374e2ce65e37e124232410b0183ac3 [151/152] fs/resctrl: Add cranky debug for reading CPU msr values
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408031416.mhtafdic-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031416.mhtafdic-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031416.mhtafdic-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_resctrl.c:6:
>> include/linux/arm_mpam.h:11:10: fatal error: 'asm/mpam.h' file not found
      11 | #include <asm/mpam.h>
         |          ^~~~~~~~~~~~
   1 error generated.


vim +11 include/linux/arm_mpam.h

    10	
  > 11	#include <asm/mpam.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
