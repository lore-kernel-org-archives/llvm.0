Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1A81758F;
	Sat, 31 Aug 2024 06:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725085973; cv=none; b=Ru+hmhKv1hwdCcZiImm2QYhZdRnzzxUx7gRoDEXJ1lx0Sc187JIYAQB4WXrKbNh2Woq5/FjQoDOyqeKjE8oQmqIhZ0ASeLhR92oQK2ZBaRa2ByYBgX56QuZlbtwT2ugdXefAChj7c42w6iBpIDc23ryrdxHA1W4wZMX/uC0ZAVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725085973; c=relaxed/simple;
	bh=4CK1/41L47kIuAQFq+ES6aU+VRmnMYoLH6YotiIjHJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5TBz2U3F/4IifJfE4OoPv1Spy6vjFRT/mhyxdbtuArnzwwyWMg0CBnpPllTCspro1I0q5A3Xg69SHLrArCn57tV2wz2dcpz+klhHaAf9lzZ6A2vnR3uJ8rk/na+BTOevJNse9B0VM2kF2slFY8sw3ZX2I+Of7ovVbCzj/dV+Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GE3OhLtB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GE3OhLtB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725085971; x=1756621971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CK1/41L47kIuAQFq+ES6aU+VRmnMYoLH6YotiIjHJ8=;
  b=GE3OhLtB26n0uhxADZc314aTHWzLTYjtWACy06NBZhxXVnEakzMeQ6B9
   fE/9QSM6KB9U8UneTOASYcLZyEJNa+G8VLpXABarvLYDdYFOjr2M2Ja/+
   SMQj8iCPscZLudHrUBqy+rhmOJNOuBIXRNwf0YvjtXvmCZINKUd2JtR1R
   6RG4SwssOLNJnXFs86RzvbtF/CkET+k3rndL9oOLzzL928UEt71S3fVYW
   s7pPSqLKAhjT0X6ETmzVUfXjuLU5fQncVZyP6i0gJbHKeckq0grU1ucPg
   V5jDs97JEOmBqBmtQEboYBhKNvR7wYFbHWBX+LN3aIcBGFw3ilVK121Dx
   Q==;
X-CSE-ConnectionGUID: D3igQ2gSQZWhT9IgkuX8RA==
X-CSE-MsgGUID: 8Y8ewG+4S+uGTmTQ0C8Xig==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23694928"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23694928"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 23:32:50 -0700
X-CSE-ConnectionGUID: ofK0ba+YQeuTUVJ0Az5gFg==
X-CSE-MsgGUID: aeN2V/UmRke/bQwgANyvNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="64285448"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2024 23:32:49 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skHfD-0002Ow-0e;
	Sat, 31 Aug 2024 06:32:47 +0000
Date: Sat, 31 Aug 2024 14:32:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.f_version 10/25] fs/read_write.c:101: warning:
 Function parameter or struct member 'file' not described in 'must_set_pos'
Message-ID: <202408311424.c7gx0m7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.f_version
head:   d72dc08ce60a47a989d21ef59e54f19875a02bc0
commit: cceaab97d92605d32034f3451e1cfec1cc80299a [10/25] fs: add must_set_pos()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240831/202408311424.c7gx0m7d-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311424.c7gx0m7d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311424.c7gx0m7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/read_write.c:101: warning: Function parameter or struct member 'file' not described in 'must_set_pos'


vim +101 fs/read_write.c

    87	
    88	/**
    89	 * must_set_pos - check whether f_pos has to be updated
    90	 * @offset: offset to use
    91	 * @whence: type of seek operation
    92	 * @eof: end of file
    93	 *
    94	 * Check whether f_pos needs to be updated and update @offset according
    95	 * to @whence.
    96	 *
    97	 * Return: 0 if f_pos doesn't need to be updated, 1 if f_pos has to be
    98	 * updated, and negative error code on failure.
    99	 */
   100	static __maybe_unused int must_set_pos(struct file *file, loff_t *offset, int whence, loff_t eof)
 > 101	{
   102		switch (whence) {
   103		case SEEK_END:
   104			*offset += eof;
   105			break;
   106		case SEEK_CUR:
   107			/*
   108			 * Here we special-case the lseek(fd, 0, SEEK_CUR)
   109			 * position-querying operation.  Avoid rewriting the "same"
   110			 * f_pos value back to the file because a concurrent read(),
   111			 * write() or lseek() might have altered it
   112			 */
   113			if (*offset == 0) {
   114				*offset = file->f_pos;
   115				return 0;
   116			}
   117			break;
   118		case SEEK_DATA:
   119			/*
   120			 * In the generic case the entire file is data, so as long as
   121			 * offset isn't at the end of the file then the offset is data.
   122			 */
   123			if ((unsigned long long)*offset >= eof)
   124				return -ENXIO;
   125			break;
   126		case SEEK_HOLE:
   127			/*
   128			 * There is a virtual hole at the end of the file, so as long as
   129			 * offset isn't i_size or larger, return i_size.
   130			 */
   131			if ((unsigned long long)*offset >= eof)
   132				return -ENXIO;
   133			*offset = eof;
   134			break;
   135		}
   136	
   137		return 1;
   138	}
   139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
