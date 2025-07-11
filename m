Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B37279DB5;
	Fri, 11 Jul 2025 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752243040; cv=none; b=lsCUXS+kj5YiwnWNUvtYx+245tZpS1J7jDQxq/3Yuu/IirtFiadqY4A9HMX2pYY8Q3SOyHw3B67pBqdpCxp7vDlx2lCFDhNu/ZwOfPa+427aZt3lh62SCTt0Sn4X3RZMr0JlFUsf8zZvIPW7UWxyaMZdvlXUw0wM29myziqef2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752243040; c=relaxed/simple;
	bh=GIq7dWJG9937sIIi39h7wseHaiFFPGopZKeVqU8Imv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CblMhlEyCbMBC3uIYxiZ6jieDYfUMJaTgxc4TwvOslVowJrJesZp4oVKN59yKXKnQohIDEMmys/Mz8NcfluPErwwq9kA8IqGqL5rapZsDJ7BkFcfIqH9C/8/MAsM72y+1l+e/i3yQBdwFuEMulBsWynQnD2GTw5FC3hR11ZOMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ken/A3lN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ken/A3lN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752243038; x=1783779038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GIq7dWJG9937sIIi39h7wseHaiFFPGopZKeVqU8Imv8=;
  b=Ken/A3lNlxMxYFrNkzDwPVHHgEaNy3vs3Kl7XfWQ2zgreMsQUCwGG+NH
   CHXh4PNly2NEIUQ8V00JBMP2amyQy/Brgg9tE/j9mBOdX/CTdZiz3/OVc
   j61YVjzEcMkbJOOfs12IryBOA3mwEWxVLPciKZDbElZE0o1Tz2vZO0JAt
   a8Vh0h0jIq2YfdJQZ46B9fJ7TLhLLC8j/RkQUXrTsp8pqcU4FJz1jjbAd
   5hRlL9IWYNphj7VZPFb2wLX3hTvLxnMG1dt/QqsbmuximC7VsSttfMNjx
   +kgKTFEG6I7d6Fcpenxpkum/1XghQO8z97VGdVimDN6xsYJdxzguOwZu8
   g==;
X-CSE-ConnectionGUID: Umurz5BeSnC/tbkTS+MmWw==
X-CSE-MsgGUID: NGWG3ETlRxaip+qGd6VhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53760567"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="53760567"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 07:10:38 -0700
X-CSE-ConnectionGUID: I1jZ79fDSdi7rwnw3XhQtA==
X-CSE-MsgGUID: C6uFJGvCSHuAeB40j/lLkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="187358345"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jul 2025 07:10:37 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaESQ-0006Qt-2M;
	Fri, 11 Jul 2025 14:10:34 +0000
Date: Fri, 11 Jul 2025 22:10:05 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 2/4] drivers/rtc/rtc-efi.c:151:21: warning:
 unused variable 'rtc'
Message-ID: <202507112141.qUTkwckc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   2b69cc853cfd5d483e48785735ee845d3bffde85
commit: 1dcb6fdcd10617262528f945a11852fb4aee9197 [2/4] efi-rtc: Remove wakeup functionality
config: arm-randconfig-004-20250711 (https://download.01.org/0day-ci/archive/20250711/202507112141.qUTkwckc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250711/202507112141.qUTkwckc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507112141.qUTkwckc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/rtc/rtc-efi.c:151:21: warning: unused variable 'rtc' [-Wunused-variable]
     151 |         struct rtc_device *rtc = dev_get_drvdata(dev);
         |                            ^~~
   1 warning generated.


vim +/rtc +151 drivers/rtc/rtc-efi.c

5e3fd9e5810f14 dann frazier       2009-03-31  146  
501385f2a783c0 Geliang Tang       2015-11-07  147  static int efi_procfs(struct device *dev, struct seq_file *seq)
501385f2a783c0 Geliang Tang       2015-11-07  148  {
1dcb6fdcd10617 Ard Biesheuvel     2025-07-11  149  	efi_time_t        eft;
501385f2a783c0 Geliang Tang       2015-11-07  150  	efi_time_cap_t    cap;
101ca8d05913b7 Shanker Donthineni 2023-01-02 @151  	struct rtc_device *rtc = dev_get_drvdata(dev);
501385f2a783c0 Geliang Tang       2015-11-07  152  
501385f2a783c0 Geliang Tang       2015-11-07  153  	memset(&eft, 0, sizeof(eft));
501385f2a783c0 Geliang Tang       2015-11-07  154  	memset(&cap, 0, sizeof(cap));
501385f2a783c0 Geliang Tang       2015-11-07  155  
501385f2a783c0 Geliang Tang       2015-11-07  156  	efi.get_time(&eft, &cap);
501385f2a783c0 Geliang Tang       2015-11-07  157  
501385f2a783c0 Geliang Tang       2015-11-07  158  	seq_printf(seq,
501385f2a783c0 Geliang Tang       2015-11-07  159  		   "Time\t\t: %u:%u:%u.%09u\n"
501385f2a783c0 Geliang Tang       2015-11-07  160  		   "Date\t\t: %u-%u-%u\n"
501385f2a783c0 Geliang Tang       2015-11-07  161  		   "Daylight\t: %u\n",
501385f2a783c0 Geliang Tang       2015-11-07  162  		   eft.hour, eft.minute, eft.second, eft.nanosecond,
501385f2a783c0 Geliang Tang       2015-11-07  163  		   eft.year, eft.month, eft.day,
501385f2a783c0 Geliang Tang       2015-11-07  164  		   eft.daylight);
501385f2a783c0 Geliang Tang       2015-11-07  165  
501385f2a783c0 Geliang Tang       2015-11-07  166  	if (eft.timezone == EFI_UNSPECIFIED_TIMEZONE)
501385f2a783c0 Geliang Tang       2015-11-07  167  		seq_puts(seq, "Timezone\t: unspecified\n");
501385f2a783c0 Geliang Tang       2015-11-07  168  	else
501385f2a783c0 Geliang Tang       2015-11-07  169  		/* XXX fixme: convert to string? */
501385f2a783c0 Geliang Tang       2015-11-07  170  		seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
501385f2a783c0 Geliang Tang       2015-11-07  171  
501385f2a783c0 Geliang Tang       2015-11-07  172  	/*
501385f2a783c0 Geliang Tang       2015-11-07  173  	 * now prints the capabilities
501385f2a783c0 Geliang Tang       2015-11-07  174  	 */
501385f2a783c0 Geliang Tang       2015-11-07  175  	seq_printf(seq,
501385f2a783c0 Geliang Tang       2015-11-07  176  		   "Resolution\t: %u\n"
501385f2a783c0 Geliang Tang       2015-11-07  177  		   "Accuracy\t: %u\n"
501385f2a783c0 Geliang Tang       2015-11-07  178  		   "SetstoZero\t: %u\n",
501385f2a783c0 Geliang Tang       2015-11-07  179  		   cap.resolution, cap.accuracy, cap.sets_to_zero);
501385f2a783c0 Geliang Tang       2015-11-07  180  
501385f2a783c0 Geliang Tang       2015-11-07  181  	return 0;
501385f2a783c0 Geliang Tang       2015-11-07  182  }
501385f2a783c0 Geliang Tang       2015-11-07  183  

:::::: The code at line 151 was first introduced by commit
:::::: 101ca8d05913b7d1e6e8b9dd792193d4082fff86 rtc: efi: Enable SET/GET WAKEUP services as optional

:::::: TO: Shanker Donthineni <sdonthineni@nvidia.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
