Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A8EEAF9;
	Fri, 27 Sep 2024 00:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727398135; cv=none; b=NLwN+O+DzXLIybOXL5WopeQV1OuNqA18/piznqmmS3bR7QLLgEOoaXVg7m917FhcPQ3QEWeoyaKuXfA9N8VLUEaaKgi0ZaOtZaRjHMrYm5SsveaQYi36WrmTDBEuOhD+IAzO7j52P73JJMaJ0OuLIB7fWY4UJZkkPHe6GLWI9oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727398135; c=relaxed/simple;
	bh=jVouVqYMHjPTWEYDCbFdVLU0VUboftdkmHsw9R0tgTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hd1iP19PIfYpW4fEvswvcnWuC+nqfD5knMVaEC6fhbJn/tyZHb3R6XAQzm2cjyDneEWW3VEp4Q7YKUbxy/SJDSjNT3ksffj2V6qyFOzcBQ73kajA1UHxLXhqD8egD9UJCxrDB6SgOx1cvZjtAhRdrqga/dSS/4FJUUsSXhzEfYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CjHFxtUF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CjHFxtUF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727398134; x=1758934134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVouVqYMHjPTWEYDCbFdVLU0VUboftdkmHsw9R0tgTk=;
  b=CjHFxtUFyAtirTnKimsV/JUWuwfEYMkI92ADVPloVa6QXIciq7VggtBU
   lJmnp98PTlamzdTdi6Bv1897lLPI5lWLea7kwfhEk4DEuGszTAZbC42Mr
   jxWSO/i/kZD4Zu8JwbXWV7GGrGsuDv0ldTYIUTLLKJb+XLI5cLhDaEVA8
   +A1n0r2zITsAxShfweUE8BnAFpKwtkLjgyZXKkjEU1rkX4pUI/YTZUsFK
   Ayr8YKqcnDk+CBOBBppAZ0VgSQtkJWqse/SuFmSW++IWXxNE4JzxZgobF
   eu1iC73qaow/8V0qWYA411XEXw36o0bL6keN0peuQqT/DZ8vWv+gkE32c
   Q==;
X-CSE-ConnectionGUID: 42lw40HuTVeNZGumR/ydcA==
X-CSE-MsgGUID: R2QA3cVATZORyBrQqZ25CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37669059"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37669059"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 17:48:52 -0700
X-CSE-ConnectionGUID: RDmipcLCSEuu2AmBAAvIZw==
X-CSE-MsgGUID: 3XqQ8LJmQXuYYoBwlb/LgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103135394"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 17:48:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzA7-000LKp-2R;
	Fri, 27 Sep 2024 00:48:47 +0000
Date: Fri, 27 Sep 2024 08:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 21/25] drivers/fwctl/cxl/cxl.c:44:9: error: call
 to undeclared function 'kzalloc'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202409270849.KwaVae6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   b4f2900f53c72de8fc639b62e44763c6a9695d3b
commit: 69c31732e72a4e65881d0894e34b8f16a9d529c2 [21/25] fwctl/cxl: Add support for get driver information
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409270849.KwaVae6m-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270849.KwaVae6m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270849.KwaVae6m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/fwctl/cxl/cxl.c:44:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      44 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |                ^
>> drivers/fwctl/cxl/cxl.c:44:7: error: incompatible integer to pointer conversion assigning to 'struct fwctl_info_cxl *' from 'int' [-Wint-conversion]
      44 |         info = kzalloc(sizeof(*info), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/kzalloc +44 drivers/fwctl/cxl/cxl.c

    37	
    38	static void *cxlctl_info(struct fwctl_uctx *uctx, size_t *length)
    39	{
    40		struct cxlctl_uctx *cxlctl_uctx =
    41			container_of(uctx, struct cxlctl_uctx, uctx);
    42		struct fwctl_info_cxl *info;
    43	
  > 44		info = kzalloc(sizeof(*info), GFP_KERNEL);
    45		if (!info)
    46			return ERR_PTR(-ENOMEM);
    47	
    48		info->uctx_caps = cxlctl_uctx->uctx_caps;
    49	
    50		return info;
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
