Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C7A6FD3;
	Sat, 17 Aug 2024 03:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723865908; cv=none; b=XxTpbs/hrlCRQMFMMm7p61QEYhR4bii74mDgVoD8N/ykkNvFBJ77Oyg880/5cykeMMPrxh8DakmXQl4KRkGQcZ5yTi/6MgMzpmy9cPnG02J2tRU4GmUwyH4jeUCwCXqvv1I1wwqcAMdgFQeIOSyUVTf48TqjRNmSHtveXqy+jAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723865908; c=relaxed/simple;
	bh=/S0fVhjL8e2047b9QgJCX6dfg8ItmW4KtR/sH1WyGIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VXxfc06qQe1UFAHYwZT028uIZxz+mA3iHoGNUS5ebHIT2ET1veaB4HG2RXmx2Ce+C1FjgHNu5MKhFfssRJm0Sik7M9sp6jaOgmj03BXjKTJ13lJNXdxPujwxwl8+xFBOhohmoUM/xCfW2WTDPsHLpWjM4O0BTJIHe2qFZqTQXq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8d1Txq6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8d1Txq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723865907; x=1755401907;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/S0fVhjL8e2047b9QgJCX6dfg8ItmW4KtR/sH1WyGIU=;
  b=I8d1Txq6qanmL9U0hKQHX5j3c4llR6jBsC2ip4rI5FyYO94GrTXtoKPk
   y7Ai0UvPX4kAZyrmCENAHNfAdRinMUL+uUWK3YO5caTs04EKqr8Hodnrq
   oCT1SNESeAxBzzaiz97H/kgkkDd+PkVoYasvKuQHxQlzHHMRX2WDXe8UY
   lkS5yIDHN6C2kg5ShCI/5Pu6E6Fx+1wjQ/XLZNn0HyMgU6GCikUIaUlR0
   JUgRfdbu7yc1VShQzbDCpLJ29QkzxXqlJqzRhSffz9Fzvh8xO3JroD+vl
   UcIkhD6wccniwzL0bmzY+Tz+17+wNWQR8OwfYhmN/4RAzfTZKeNGusBLi
   w==;
X-CSE-ConnectionGUID: xtVh/KR+TBaC5rwcgVAoyA==
X-CSE-MsgGUID: V3JAYkPsT/2zXc+uhFLpmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22314093"
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="22314093"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 20:38:27 -0700
X-CSE-ConnectionGUID: f1GGdFW3TbqrHyAJCFoE1w==
X-CSE-MsgGUID: 0bgWTKGjSWOOpYQjRM2ZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,153,1719903600"; 
   d="scan'208";a="90588614"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Aug 2024 20:38:25 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfAGl-00079W-01;
	Sat, 17 Aug 2024 03:38:23 +0000
Date: Sat, 17 Aug 2024 11:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
Message-ID: <202408171121.ZQyCK3P1-lkp@intel.com>
References: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on andi-shyti/i2c/i2c-host]
[also build test ERROR on linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/i2c-designware-Replace-a-while-loop-by-for-loop/20240817-011616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240816171225.3506844-6-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240817/202408171121.ZQyCK3P1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171121.ZQyCK3P1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171121.ZQyCK3P1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-designware-platdrv.c:480:36: error: redefinition of 'dw_i2c_acpi_match'
     480 | static const struct acpi_device_id dw_i2c_acpi_match[] = {
         |                                    ^
   drivers/i2c/busses/i2c-designware-platdrv.c:44:36: note: previous definition is here
      44 | static const struct acpi_device_id dw_i2c_acpi_match[] = {
         |                                    ^
   1 error generated.


vim +/dw_i2c_acpi_match +480 drivers/i2c/busses/i2c-designware-platdrv.c

   479	
 > 480	static const struct acpi_device_id dw_i2c_acpi_match[] = {
   481		{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
   482		{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
   483		{ "AMD0010", ACCESS_INTR_MASK },
   484		{ "AMDI0010", ACCESS_INTR_MASK },
   485		{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
   486		{ "AMDI0510", 0 },
   487		{ "APMC0D0F", 0 },
   488		{ "HISI02A1", 0 },
   489		{ "HISI02A2", 0 },
   490		{ "HISI02A3", 0 },
   491		{ "HYGO0010", ACCESS_INTR_MASK },
   492		{ "INT33C2", 0 },
   493		{ "INT33C3", 0 },
   494		{ "INT3432", 0 },
   495		{ "INT3433", 0 },
   496		{}
   497	};
   498	MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
