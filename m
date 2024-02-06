Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FE756B61;
	Tue,  6 Feb 2024 02:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707186172; cv=none; b=G1XilWuakjTwKC9tlmB4ScoRghzf48CUFGeWmwmSCIO7S1AM8qcm9zGb8o+v6wUq0b96VFLd62dqvFPundtoFHD7o7dlZ+mTGr4mG/8iIAdpzuWN7pg/ULQK4lQ0qRga+ELoa3L/hLWezjXhT4tfz+Lw79js5kW9FDAau2wcfNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707186172; c=relaxed/simple;
	bh=tnN0sWDvnX9erc9l40geLmSpq5/F1xT82zl3SMkzgp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0F2kbQysaD07StNwwvwIS1/P08ohbEAQVZzoVwAOqEGFn/TNkT4qa9fYMdUvkRE2bBxAyxTxUYQ4pfFPuQ69zitIQm4eUcvJx0xLk+aeLAnImlHkk/xC0sLMoCRxNKC0g0h8gDq057pNxd2UEP5PrlhMC8YGfaQrG7fE/1erXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XivcVHo9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XivcVHo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707186170; x=1738722170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tnN0sWDvnX9erc9l40geLmSpq5/F1xT82zl3SMkzgp8=;
  b=XivcVHo9o38mMA5ZXhMThFwDdzKd0xWFh13BKCUoWnCFo7tYDydItzQx
   tzWSFogd1d6WSDcf/5/NPyBvVBfDdgUtnqLmyi5LXhf2Plco2gsGR8kIP
   Zgs7EN3zyxl59uwIhkrlk+RqVOXDvbq2o4EGbxJcoC5xblV7GJ1ilGui0
   LHyTkE5/zzYP0/icA/J3R5Hn+/wai1uhbOoun+j8tEebc0EmQzyVmr9Nx
   6HhOMsAmlWx/uOgXprY7d4MIoGwA1oR+L/4ofG41AhvG7TMVyLCM7+sws
   gNMGCAkZIFJio4sDgNwen0MfENIt5nUTNrKyPNLNMP/W15wmRc49rlFel
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="537524"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="537524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 18:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="904694"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Feb 2024 18:22:48 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXB6j-000108-2d;
	Tue, 06 Feb 2024 02:22:45 +0000
Date: Tue, 6 Feb 2024 10:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/2-arg-strscpy 3/4] fs/exec.c:1234:2: error: use of
 undeclared identifier '__strscpy_pad'
Message-ID: <202402061029.R0opV08e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/2-arg-strscpy
head:   ec83dccab8c18d8482dc1934e7079916508b8eea
commit: dec483587dcaf35a567dc38c50a8800ad4b106d3 [3/4] string: Allow 2-argument strscpy_pad()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240206/202402061029.R0opV08e-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402061029.R0opV08e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402061029.R0opV08e-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/exec.c:1234:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1234 |         strscpy_pad(buf, tsk->comm, buf_size);
         |         ^
   include/linux/string.h:143:2: note: expanded from macro 'strscpy_pad'
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^
   fs/exec.c:1234:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/string.h:143:29: note: expanded from macro 'strscpy_pad'
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                    ^
>> fs/exec.c:1234:2: error: use of undeclared identifier '__strscpy_pad'
   include/linux/string.h:143:14: note: expanded from macro 'strscpy_pad'
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^
   fs/exec.c:1249:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1249 |         strscpy_pad(tsk->comm, buf, sizeof(tsk->comm));
         |         ^
   include/linux/string.h:143:2: note: expanded from macro 'strscpy_pad'
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^
   fs/exec.c:1249:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/string.h:143:29: note: expanded from macro 'strscpy_pad'
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                    ^
   fs/exec.c:1249:2: error: use of undeclared identifier '__strscpy_pad'
   include/linux/string.h:143:14: note: expanded from macro 'strscpy_pad'
     143 |         CONCATENATE(__strscpy_pad, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^
   6 errors generated.


vim +/__strscpy_pad +1234 fs/exec.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1229  
3756f6401c3026 Arnd Bergmann  2017-12-14  1230  char *__get_task_comm(char *buf, size_t buf_size, struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1231  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1232  	task_lock(tsk);
503471ac36df60 Yafang Shao    2022-01-19  1233  	/* Always NUL terminated and zero-padded */
503471ac36df60 Yafang Shao    2022-01-19 @1234  	strscpy_pad(buf, tsk->comm, buf_size);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1235  	task_unlock(tsk);
59714d65dfbc86 Andrew Morton  2008-02-04  1236  	return buf;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1237  }
3756f6401c3026 Arnd Bergmann  2017-12-14  1238  EXPORT_SYMBOL_GPL(__get_task_comm);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1239  

:::::: The code at line 1234 was first introduced by commit
:::::: 503471ac36df60bba037c3b110d76f53a93f61b5 fs/exec: replace strncpy with strscpy_pad in __get_task_comm

:::::: TO: Yafang Shao <laoar.shao@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
