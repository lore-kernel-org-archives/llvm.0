Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA1038BF7A;
	Tue,  5 May 2026 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777998554; cv=none; b=s3UspnDpIvNwaV98SgSfU8YQqF68AMoFF0khCdUfNsi5o4VjfzdU+2Oah+ceGRkqeUPblPDURMGqmgNHwBltvc8cmBTN25aEN6QVBrr+IEQqZvym2cAmtl1jYx8IjvRzCxR+uYy58cmTcB4I7pr1k5oWmctHVUQ+gmySf286Yek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777998554; c=relaxed/simple;
	bh=1fb0+xKHdJaJ3SPOujBb2WL355TWXX8BqCcDeJIjTCY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rzJt7D2iz+bHDeJauHvybikWIMgOGc+iHcvmtQScE0L+eG7ngVXimg1zcaU6rEaK+c/ma9KHYlnccR+Xo9CBc6zHjin1IS7L/re9dZ39scfm0QErGJnzPom+qciIlXxsAFZ1h8frnnWfraNIV8Xbvjn9dlny7rz/M4Tkk3DKKno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sr4c3kKj; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sr4c3kKj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777998552; x=1809534552;
  h=date:from:to:cc:subject:message-id;
  bh=1fb0+xKHdJaJ3SPOujBb2WL355TWXX8BqCcDeJIjTCY=;
  b=Sr4c3kKjWvnAlYS7u+SUQuFIy+7H9m+I+woxfP/ciaYKQM1zNl1Ia+ic
   lBS6y0XNGeqhapbEh53WUcegwzETFe/GaaxcKPAZC5Xw1CMlfJ3B5c3JB
   PWOjpiJZlPCh42iH81xpxi+E0KGf9eKPiALqAsEWQ4JHKQQszDVYez8lV
   0Ean6H7lkgybxcJaGP14J5jTsQm9R3hE8DdxsoAfxyKQHTn5L4O0jNaTt
   +ew7JVNgghiox6Nggwsu60PRej2b+UOjcok8sRYMKJbPHtFi+Cb4/clTS
   O5362pwDX3XfqMsSzqW9D6Xlihy/d9u/QR/3Vcf7y3y86EjT1ZRqqnFXO
   Q==;
X-CSE-ConnectionGUID: w0q8+WuESiqNZLb6+6udug==
X-CSE-MsgGUID: maUyfuvbTVemZAsGIrn7yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="81437151"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="81437151"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 09:29:09 -0700
X-CSE-ConnectionGUID: DTFzgd8ZQry7By57TWOsww==
X-CSE-MsgGUID: QB/AysaAQ2iiA/ANFVmmbw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2026 09:29:07 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKIdt-000000000Hl-0eKz;
	Tue, 05 May 2026 16:29:05 +0000
Date: Wed, 06 May 2026 00:28:15 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 5/5] kernel/locking/rtmutex_api.c:93:1:
 warning: expecting rt_mutex 'lock' to be held at the end of function
Message-ID: <202605060005.JYWpZXr2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   d30a456aa7ce1bab05d9b364eeacad0c9cb10cc2
commit: d30a456aa7ce1bab05d9b364eeacad0c9cb10cc2 [5/5] locking/rtmutex: Annotate API and implementation
config: um-defconfig (https://download.01.org/0day-ci/archive/20260506/202605060005.JYWpZXr2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060005.JYWpZXr2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605060005.JYWpZXr2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/rtmutex_api.c:93:1: warning: expecting rt_mutex 'lock' to be held at the end of function [-Wthread-safety-analysis]
      93 | }
         | ^
   kernel/locking/rtmutex_api.c:90:14: note: rt_mutex acquired here
      90 | void __sched rt_mutex_lock(struct rt_mutex *lock)
         |              ^
   1 warning generated.


vim +/lock +93 kernel/locking/rtmutex_api.c

531ae4b06a737ed Thomas Gleixner           2021-08-15  84  
531ae4b06a737ed Thomas Gleixner           2021-08-15  85  /**
531ae4b06a737ed Thomas Gleixner           2021-08-15  86   * rt_mutex_lock - lock a rt_mutex
531ae4b06a737ed Thomas Gleixner           2021-08-15  87   *
531ae4b06a737ed Thomas Gleixner           2021-08-15  88   * @lock: the rt_mutex to be locked
531ae4b06a737ed Thomas Gleixner           2021-08-15  89   */
531ae4b06a737ed Thomas Gleixner           2021-08-15  90  void __sched rt_mutex_lock(struct rt_mutex *lock)
531ae4b06a737ed Thomas Gleixner           2021-08-15  91  {
a3642021923b26d Sebastian Andrzej Siewior 2021-11-29  92  	__rt_mutex_lock_common(lock, TASK_UNINTERRUPTIBLE, NULL, 0);
531ae4b06a737ed Thomas Gleixner           2021-08-15 @93  }
531ae4b06a737ed Thomas Gleixner           2021-08-15  94  EXPORT_SYMBOL_GPL(rt_mutex_lock);
531ae4b06a737ed Thomas Gleixner           2021-08-15  95  #endif
531ae4b06a737ed Thomas Gleixner           2021-08-15  96  

:::::: The code at line 93 was first introduced by commit
:::::: 531ae4b06a737ed5539cd75dc6f6b9a28f900bba locking/rtmutex: Split API from implementation

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
