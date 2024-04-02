Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4222E15D5A3;
	Tue,  2 Apr 2024 20:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712089338; cv=none; b=GDWNiWiRiX67RpSWf8w8MWmSuZA5cp2KIXJMhk0AHQ+QkjOX85xsl/KCRhu5IHCU6U2VAlLE3xVMVKQirxrMbaPDUEkudJJ2L8ftz/ndYxleeNeVUMXETBaEbI/daiijpAWhnJoaLm2Mu+ahn+bElgcL0K/jgN3CUnVPllQz4ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712089338; c=relaxed/simple;
	bh=3HU/Bkk9agRtLmsgEpZ002b3g3lnKRhZZNpyE7rHqDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T6uIWgBDUXuqoYBVcl1vcZN8w2gn3PEGnZZNS0voDtJ9p42IzC6UsTpWSITdqS18iyslzHqA4/wmlVfP8q6OyklHHaWOP124zJzFMbRAlSv1V9gaxC8XfdZHfm21axTE/nj7marM4/Mlfq3GYQmfheNjTu7VTHtrGGwO7cUI2Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A/lSQ1Zo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/lSQ1Zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712089337; x=1743625337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3HU/Bkk9agRtLmsgEpZ002b3g3lnKRhZZNpyE7rHqDI=;
  b=A/lSQ1Zohu/Q27Pu7VYGOewqj67VljJ1+GH6q0QJPCmsPqmtTaNNFmSX
   r+9KXCPpiY+zu9v0b/jLf+P1mzoFgNO3+BQJIXg/mCScKXlyZ7QfY/8/h
   7++paV/fNP96vW1VsKKbMbrsVe1N7qrPkO/ptSbxn5kdpywAO954Yjv8R
   PqQ3u7KMDNCBmJ+h0YPDdh60BkSMZ2HPEYP1mv3ZwKViK8Xt2wn/iEH1n
   QQjZdtl04hIrloE7iDjoYbR55p1tDEuvBqBiNhLWmGvjMBOI83X157jOW
   VjLlIhy4/mlH54tGuoKr8sl7N2gkcBwUezMiBhh//3TMe7whEywFRW7SX
   g==;
X-CSE-ConnectionGUID: K9mm/KyeRhCSo14I7ur4KA==
X-CSE-MsgGUID: rqghBWkpRp2z/Dme72afxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7215211"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="7215211"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 13:22:16 -0700
X-CSE-ConnectionGUID: A9HP70MwQveX6bjd3ruBIQ==
X-CSE-MsgGUID: wzeC1DJuQMizWIo+jhvkfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; 
   d="scan'208";a="18299456"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 02 Apr 2024 13:22:15 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrke4-0001WH-0W;
	Tue, 02 Apr 2024 20:22:12 +0000
Date: Wed, 3 Apr 2024 04:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:read_iter 3/3] fs/signalfd.c:202:34: warning: variable
 'siginfo' set but not used
Message-ID: <202404030421.ir3Jerlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git read_iter
head:   1a84ffcd0664911af64861f2cb3a35193ef6b62e
commit: 1a84ffcd0664911af64861f2cb3a35193ef6b62e [3/3] signalfd: convert to ->read_iter()
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240403/202404030421.ir3Jerlp-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240403/202404030421.ir3Jerlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404030421.ir3Jerlp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/signalfd.c:202:34: warning: variable 'siginfo' set but not used [-Wunused-but-set-variable]
     202 |         struct signalfd_siginfo __user *siginfo;
         |                                         ^
>> fs/signalfd.c:220:3: warning: variable 'siginfo' is uninitialized when used here [-Wuninitialized]
     220 |                 siginfo++;
         |                 ^~~~~~~
   fs/signalfd.c:202:41: note: initialize the variable 'siginfo' to silence this warning
     202 |         struct signalfd_siginfo __user *siginfo;
         |                                                ^
         |                                                 = NULL
   2 warnings generated.


vim +/siginfo +202 fs/signalfd.c

fba2afaaec790d Davide Libenzi    2007-05-10  192  
b3762bfc8d0463 Davi Arnaut       2007-05-23  193  /*
b8fceee17a310f Davide Libenzi    2007-09-20  194   * Returns a multiple of the size of a "struct signalfd_siginfo", or a negative
b8fceee17a310f Davide Libenzi    2007-09-20  195   * error code. The "count" parameter must be at least the size of a
b8fceee17a310f Davide Libenzi    2007-09-20  196   * "struct signalfd_siginfo".
b3762bfc8d0463 Davi Arnaut       2007-05-23  197   */
1a84ffcd066491 Jens Axboe        2024-04-02  198  static ssize_t signalfd_read_iter(struct kiocb *iocb, struct iov_iter *to)
b3762bfc8d0463 Davi Arnaut       2007-05-23  199  {
1a84ffcd066491 Jens Axboe        2024-04-02  200  	struct file *file = iocb->ki_filp;
b3762bfc8d0463 Davi Arnaut       2007-05-23  201  	struct signalfd_ctx *ctx = file->private_data;
b3762bfc8d0463 Davi Arnaut       2007-05-23 @202  	struct signalfd_siginfo __user *siginfo;
1a84ffcd066491 Jens Axboe        2024-04-02  203  	size_t count = iov_iter_count(to);
b3762bfc8d0463 Davi Arnaut       2007-05-23  204  	ssize_t ret, total = 0;
ae7795bc6187a1 Eric W. Biederman 2018-09-25  205  	kernel_siginfo_t info;
1a84ffcd066491 Jens Axboe        2024-04-02  206  	bool nonblock;
b3762bfc8d0463 Davi Arnaut       2007-05-23  207  
b3762bfc8d0463 Davi Arnaut       2007-05-23  208  	count /= sizeof(struct signalfd_siginfo);
b3762bfc8d0463 Davi Arnaut       2007-05-23  209  	if (!count)
b3762bfc8d0463 Davi Arnaut       2007-05-23  210  		return -EINVAL;
b3762bfc8d0463 Davi Arnaut       2007-05-23  211  
1a84ffcd066491 Jens Axboe        2024-04-02  212  	nonblock = file->f_flags & O_NONBLOCK || iocb->ki_flags & IOCB_NOWAIT;
b3762bfc8d0463 Davi Arnaut       2007-05-23  213  	do {
b3762bfc8d0463 Davi Arnaut       2007-05-23  214  		ret = signalfd_dequeue(ctx, &info, nonblock);
b3762bfc8d0463 Davi Arnaut       2007-05-23  215  		if (unlikely(ret <= 0))
b3762bfc8d0463 Davi Arnaut       2007-05-23  216  			break;
1a84ffcd066491 Jens Axboe        2024-04-02  217  		ret = signalfd_copyinfo(to, &info);
b3762bfc8d0463 Davi Arnaut       2007-05-23  218  		if (ret < 0)
b3762bfc8d0463 Davi Arnaut       2007-05-23  219  			break;
b3762bfc8d0463 Davi Arnaut       2007-05-23 @220  		siginfo++;
b3762bfc8d0463 Davi Arnaut       2007-05-23  221  		total += ret;
b3762bfc8d0463 Davi Arnaut       2007-05-23  222  		nonblock = 1;
b3762bfc8d0463 Davi Arnaut       2007-05-23  223  	} while (--count);
b3762bfc8d0463 Davi Arnaut       2007-05-23  224  
b3762bfc8d0463 Davi Arnaut       2007-05-23  225  	return total ? total: ret;
fba2afaaec790d Davide Libenzi    2007-05-10  226  }
fba2afaaec790d Davide Libenzi    2007-05-10  227  

:::::: The code at line 202 was first introduced by commit
:::::: b3762bfc8d046342db664d855f8f875e8a4c2ca1 signalfd: retrieve multiple signals with one read() call

:::::: TO: Davi Arnaut <davi@haxent.com.br>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
