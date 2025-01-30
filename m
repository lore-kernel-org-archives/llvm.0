Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B477618E379;
	Thu, 30 Jan 2025 05:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738216305; cv=none; b=H7dpDNaTREi5P/0xsxqW5Yn32mOXDCIUxtAvH/EzIrF9CE+v5PtUv2Ob40+VECIPnJP+JnIsEo6icIinLRXTqAhEYNk+7XxbJ1QzJAp5hkKckbs8ad/aY3p5s7XArhB4rs6ntveXW3hDatQ9oFGAYzH3NdySzaoK62UMBYYyVAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738216305; c=relaxed/simple;
	bh=hlXfn2GCAYT75F9DqzH1SHYMCBi8TdxW31uiOB9rOIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adQ35ZN+NlXM3n9CcatescOGUXbJicsC3J/gG65hHJVvCzq7dI/fq2iTjNq0WJPjo8BWLYcNf4YcZ8WB/0f1fc2pOsg2tZmAeLF+DtsNV9zzyaQ5fxRnFi66OOC54Ichan457n9kB0ObnXRZCZvBqwJl3dljVtzxx2mSWA8ouzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eja6tEV6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eja6tEV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738216304; x=1769752304;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hlXfn2GCAYT75F9DqzH1SHYMCBi8TdxW31uiOB9rOIk=;
  b=Eja6tEV6vJZndw7i0umrcBkxDyyQqu+0qqYHASQUB1KNcEFbYmqcDoKf
   81j21InSdTZPlbYiq9uJDbEf2F6jFfG3FpuzWA7o9Ny5yjJb8OfB8gHvC
   uxwfcK9Zovz0sUDv4gCbT7toBYCz08+tlzLfGvzI1TYEPcYTdO/X6z4aY
   Zrr6NTjXnBk5nxO9oHkuvwpqPkOeBFGLCff6GU9P3MTBwmYNuiVj+E0RA
   032PRtr+v1rOvopTROQVNhU/uouNrIVDyX7OGFCjeA4Pg+0tF5YCocl9l
   siviy8e7aCjqHFArW2I4OVJg1+1Lj4V7LA8ehXR9Kt40pJNG+mwhf85Fy
   Q==;
X-CSE-ConnectionGUID: v5VViW2xRw+zrtwSnNiqUQ==
X-CSE-MsgGUID: lNP9dezmRxWRNjRtz15obQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50169672"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50169672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 21:51:40 -0800
X-CSE-ConnectionGUID: vrSNxxyOS4S3y55U+qEf2w==
X-CSE-MsgGUID: 3YKvEUs6RZ6oF10kxHqrkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132502974"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jan 2025 21:51:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdNSi-000jil-16;
	Thu, 30 Jan 2025 05:51:36 +0000
Date: Thu, 30 Jan 2025 13:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 09/16] xfs: convert timeouts to secs_to_jiffies()
Message-ID: <202501301334.NB6NszQR-lkp@intel.com>
References: <20250128-converge-secs-to-jiffies-part-two-v1-9-9a6ecf0b2308@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128-converge-secs-to-jiffies-part-two-v1-9-9a6ecf0b2308@linux.microsoft.com>

Hi Easwar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9a87ce288fe30f268b3a598422fe76af9bb2c2d2]

url:    https://github.com/intel-lab-lkp/linux/commits/Easwar-Hariharan/coccinelle-misc-secs_to_jiffies-Patch-expressions-too/20250129-022410
base:   9a87ce288fe30f268b3a598422fe76af9bb2c2d2
patch link:    https://lore.kernel.org/r/20250128-converge-secs-to-jiffies-part-two-v1-9-9a6ecf0b2308%40linux.microsoft.com
patch subject: [PATCH 09/16] xfs: convert timeouts to secs_to_jiffies()
config: x86_64-buildonly-randconfig-006-20250129 (https://download.01.org/0day-ci/archive/20250130/202501301334.NB6NszQR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501301334.NB6NszQR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501301334.NB6NszQR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_sysfs.c:572:31: warning: result of comparison of constant 9223372036854775807 with expression of type 'int' is always true [-Wtautological-constant-out-of-range-compare]
     572 |                 ASSERT(secs_to_jiffies(val) < LONG_MAX);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   fs/xfs/xfs_linux.h:224:10: note: expanded from macro 'ASSERT'
     224 |         (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE__))
         |          ~~~~~~~^~~~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   1 warning generated.


vim +/int +572 fs/xfs/xfs_sysfs.c

   549	
   550	static ssize_t
   551	retry_timeout_seconds_store(
   552		struct kobject	*kobject,
   553		const char	*buf,
   554		size_t		count)
   555	{
   556		struct xfs_error_cfg *cfg = to_error_cfg(kobject);
   557		int		ret;
   558		int		val;
   559	
   560		ret = kstrtoint(buf, 0, &val);
   561		if (ret)
   562			return ret;
   563	
   564		/* 1 day timeout maximum, -1 means infinite */
   565		if (val < -1 || val > 86400)
   566			return -EINVAL;
   567	
   568		if (val == -1)
   569			cfg->retry_timeout = XFS_ERR_RETRY_FOREVER;
   570		else {
   571			cfg->retry_timeout = secs_to_jiffies(val);
 > 572			ASSERT(secs_to_jiffies(val) < LONG_MAX);
   573		}
   574		return count;
   575	}
   576	XFS_SYSFS_ATTR_RW(retry_timeout_seconds);
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
