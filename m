Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C03482F5;
	Mon,  5 Feb 2024 23:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707174828; cv=none; b=MmONVU3JLffxzlIgTvgwlkCSTAaNIlP+14kt2GmxpG1rE0i3Q6/FkvL3wEmIxHIKIMJ7jp3FOPObiJdZiveqTiCqwJTHc7frzvKBi5Z8s/KMv61lkwwtXYfk+OiW775m2wpbNddAriRRtBkcPAiFHPfuXOG+QegtWXeg16Ws3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707174828; c=relaxed/simple;
	bh=uEOPooNg2SYkTD6le+KknqIc+GX5jBSXTh3C3x/DtOE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dyrJzSxjQNN/HVYVP8agQFeIbQZ8MhtWYXT/y8Sd+vZiKpTJmEUlZjiBqsOHYarXxiFJeti3DhLnDJj9Cgp6mQpuExBXxaZLKhc3pGXoadmn1Xr/nRZop9l3MJthqLbHEa+S/J19iO5tdRhL/pJmq1WAE3mUq+bvWX8D+1CXNL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cn+t59ow; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cn+t59ow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707174827; x=1738710827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uEOPooNg2SYkTD6le+KknqIc+GX5jBSXTh3C3x/DtOE=;
  b=Cn+t59owImGdBW7j2soIylOdirSdK2no3/nit7gsr4DlgdqL0caH2pUh
   Xqop3676R4/SoH+0G5ihKIOQo0TgY9tKL1i0PcGR0oydY9rWrRGwI/7fy
   jcQufzkEOy28TPvOAVIZYEPj3WrqK9wmsqUtMneBczRpg5ZCMOvOMKned
   +nErVfB/Gc4FnVQWFyN1MbtwWlZYXZ/POz6SkxROAgGMYGk3HerMT1VGq
   x2l5/qq9hNIbIgaOzT59nbjzn7dwGgk+k88Qc1ILdjlMZ7Y3xmvQk6gFy
   KRn+pv5qPBangP1Ob3TyY8F6mAN1UVwgnK6XdMemdN/4+4WTSTQ3qtONy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="3587699"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="3587699"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 15:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="841529"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Feb 2024 15:13:43 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX89l-0000tB-2q;
	Mon, 05 Feb 2024 23:13:41 +0000
Date: Tue, 6 Feb 2024 07:12:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Justin Stitt <justinstitt@google.com>
Subject: [kees:devel/2-arg-strscpy 2/4] fs/exec.c:1234:2: error: call to
 undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202402060734.jrkbSAtM-lkp@intel.com>
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
commit: db19daefe72fd816f386afed91ae83633382e489 [2/4] string: Allow 2-argument strscpy()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240206/202402060734.jrkbSAtM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240206/202402060734.jrkbSAtM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402060734.jrkbSAtM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/exec.c:1234:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1234 |         strscpy_pad(buf, tsk->comm, buf_size);
         |         ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
     132 |         __wrote = strscpy(__dst, __src, __count);                       \
         |                   ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
     104 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^
>> fs/exec.c:1234:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
     132 |         __wrote = strscpy(__dst, __src, __count);                       \
         |                   ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
     104 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^
   fs/exec.c:1234:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
     132 |         __wrote = strscpy(__dst, __src, __count);                       \
         |                   ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
     104 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^
   fs/exec.c:1249:2: error: call to undeclared function 'CONCATENATE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1249 |         strscpy_pad(tsk->comm, buf, sizeof(tsk->comm));
         |         ^
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
     132 |         __wrote = strscpy(__dst, __src, __count);                       \
         |                   ^
   include/linux/string.h:104:2: note: expanded from macro 'strscpy'
     104 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |         ^
   fs/exec.c:1249:2: error: call to undeclared function 'COUNT_ARGS'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
     132 |         __wrote = strscpy(__dst, __src, __count);                       \
         |                   ^
   include/linux/string.h:104:25: note: expanded from macro 'strscpy'
     104 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                                ^
   fs/exec.c:1249:2: error: use of undeclared identifier '__strscpy'
   include/linux/string.h:132:12: note: expanded from macro 'strscpy_pad'
     132 |         __wrote = strscpy(__dst, __src, __count);                       \
         |                   ^
   include/linux/string.h:104:14: note: expanded from macro 'strscpy'
     104 |         CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src, __VA_ARGS__)
         |                     ^
   6 errors generated.


vim +/COUNT_ARGS +1234 fs/exec.c

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
