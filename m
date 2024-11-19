Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291F61384BF;
	Tue, 19 Nov 2024 02:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983799; cv=none; b=D6EGWFc/cx0OxGfpNnD8zRP1vI20QnzF2EzgjCtJrNTLcmDYBxUk03g7B4vdyTEmg+YXVWR4ktNTTL89YhpwzHMT2m0AStp+obAx8gV8b2gqG46/srZw1/9C7FKoKrCYgpKa76Gc3YXhYYh4aC83r2TqND+egLdaM0YQ8C94fxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983799; c=relaxed/simple;
	bh=Jhnj0K+kEnLJztP9V1PW/ln/N7ydF8mrTENcsQbZuxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ri91Etfmj8dYAPRlBr0j5Z8ZgaLQerBlq1mXbEmhHGBxyhDS0xiCwBwbjLdEhypu0BxVYPvjcL7xlvY0S/GNWO07LeyafcFRlhbsM8z62xw8OFbQJLfouKoR7+vQdqpuWSFTYcuCOYiLlD8VIyeVEZQCh0n+8wO2TMmRl+oXpkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y33xDnmh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y33xDnmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731983797; x=1763519797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jhnj0K+kEnLJztP9V1PW/ln/N7ydF8mrTENcsQbZuxE=;
  b=Y33xDnmhVJ//nWuhhPd1c1gqd8ljwXdyJpDbVsXTgtS5qr2ybqKZzjj3
   ZnpOIxIV83Tg69ZYs0ZmPco0vJBOOFk67pWQtDuYooN4iw+LRkGIt5twF
   PCXisBvgMlSrwR7yhhEnQZaiD/4eJT7imMNGFhMZ0c5VDJloSUb7om5hF
   2SykOq0022qYexdgP/ZZUeYB5DY6KKZ3xTwrFB43pyFL+Zv7KjUnl4Z+k
   FKFJkXJnc7MLFPUqduhhM4xuSldvXnehvleqShRun6QCwvtfZivW6lMJz
   pdGBiZqRc3icUkydYG/x27Sw81t5vcPdiavxIpQuF8fyEOMSzsUTMb06P
   A==;
X-CSE-ConnectionGUID: kx7wXOm/SRW4gw++g7cYKA==
X-CSE-MsgGUID: SjpzZ8YARmmOkHfCBlHlDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32024758"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="32024758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:36:37 -0800
X-CSE-ConnectionGUID: CCI9EB0HQ66Tk6FE3JoaUQ==
X-CSE-MsgGUID: s8rVCQyCRlqZIxE8r+ev5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89808412"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2024 18:36:36 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDE5v-00002w-2r;
	Tue, 19 Nov 2024 02:36:11 +0000
Date: Tue, 19 Nov 2024 10:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 19/23] ./usr/include/fwctl/cxl.h:83:33: error:
 field has incomplete type 'struct cxl_mem_query_commands'
Message-ID: <202411190941.mDhK9ioB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux fwctl
head:   e4450fb1459bf712009c7cb1461643287e0f9e75
commit: cd685083320fbb36fbe7973406d5001962699335 [19/23] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241119/202411190941.mDhK9ioB-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190941.mDhK9ioB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190941.mDhK9ioB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/fwctl/cxl.h:83:33: error: field has incomplete type 'struct cxl_mem_query_commands'
      83 |                 struct cxl_mem_query_commands query;
         |                                               ^
   ./usr/include/fwctl/cxl.h:83:10: note: forward declaration of 'struct cxl_mem_query_commands'
      83 |                 struct cxl_mem_query_commands query;
         |                        ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
