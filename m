Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D539B20EB;
	Thu, 27 Feb 2025 00:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740615167; cv=none; b=CSX7G0AMTgd8v1Y303w56QQsbiTJh6cu5HlFA/UPFp2JO1xPPQERvuAf5QmczR49i8yIwa6AjpEuqytn8RvLtzY2ExuymzQrr3wDWDrzeOiPHzKN88VzNCW/FsFJiAXETOMYC8FrH/nNJVDhxuXL49EIn7z5ff+4C/G89gy+ejo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740615167; c=relaxed/simple;
	bh=FSf3ud7/mRl9secZ1I/ALwkUJJoVJdPVpsqpXxz99Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvSjioN7Ta62skWZ0BUbR6jW7yT8DzrTif3PsdW9vxT9lcH+Rnwh968JSVnqtixmKnskYNRg+rpQGrPVqedKmPyZ11Fj3uKk/a6AW3PQrT5gvlO5BfSNrKBeUGHVFvxABc2oHiFZVVO247ZJc9Qdiw5NpnhVfaGSE6lES6TCqXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKi1rXup; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKi1rXup"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740615166; x=1772151166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FSf3ud7/mRl9secZ1I/ALwkUJJoVJdPVpsqpXxz99Ck=;
  b=LKi1rXupN5+qGC0v71hlS0879Hp+p+aBLhwI9GuIYr5T10JR45oFnfXU
   XSbJFnIZHpIEPX7Sa2Y/hqY3i+SFMvgv/tcYnQSQL2ZN0/R7G8Z1OkUZD
   4JxngLhRJam7a+JMos4ZWdrcFOIJm4x6BIadVNUu3PRj8W6+ef2ql9v7b
   DRoXks9pw4Cw4Sa8tWZs2SWBRjE/XuaqEaF1SeglNgyXgLjhlqJlLHay5
   64Utk03EnEkqJC4DnXvxpQrbldSYt5y1gLxmvhWRrY764L/W4oPqi3Sff
   qnMmknEr3mCdvfPVldFMH//QJghhcoRSegObpP6rUAly75hEKClLwz5Kp
   g==;
X-CSE-ConnectionGUID: +8FOMBVZSECaGqxrtp6anQ==
X-CSE-MsgGUID: 47uHphMcSLeMXtfPek2cfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41687279"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41687279"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 16:12:45 -0800
X-CSE-ConnectionGUID: +h+oA7rnRD6gywgfhwsr0A==
X-CSE-MsgGUID: 3sHaOD/IR8CjtAAWGxJ/yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; 
   d="scan'208";a="116886949"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2025 16:12:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnRW5-000Cdi-2c;
	Thu, 27 Feb 2025 00:12:41 +0000
Date: Thu, 27 Feb 2025 08:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>
Subject: [axboe-block:for-6.15/io_uring 55/56] io_uring/net.c:719:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202502270853.xYltEB97-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.15/io_uring
head:   7eb5bb749ed945ead6a089e18e1d1da74523ac9a
commit: 68525267875757520752ff1abbda0af58fc172b9 [55/56] io_uring/net: unify *mshot_prep calls with compat
config: um-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502270853.xYltEB97-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502270853.xYltEB97-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502270853.xYltEB97-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/net.c:719:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     719 |         if (io_is_compat(req->ctx)) {
         |             ^~~~~~~~~~~~~~~~~~~~~~
   io_uring/net.c:733:15: note: uninitialized use occurs here
     733 |         if (unlikely(ret))
         |                      ^~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   io_uring/net.c:719:2: note: remove the 'if' if its condition is always false
     719 |         if (io_is_compat(req->ctx)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     720 | #ifdef CONFIG_COMPAT
         | ~~~~~~~~~~~~~~~~~~~~
     721 |                 struct compat_msghdr cmsg;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
     722 | 
     723 |                 ret = io_compat_msg_copy_hdr(req, iomsg, &cmsg, ITER_DEST,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     724 |                                              &iomsg->uaddr);
         |                                              ~~~~~~~~~~~~~~~
     725 |                 memset(&msg, 0, sizeof(msg));
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     726 |                 msg.msg_namelen = cmsg.msg_namelen;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     727 |                 msg.msg_controllen = cmsg.msg_controllen;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     728 | #endif
         | ~~~~~~
     729 |         } else {
         |         ~~~~~~
   io_uring/net.c:714:9: note: initialize the variable 'ret' to silence this warning
     714 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +719 io_uring/net.c

c55978024d123d Jens Axboe     2024-02-27  709  
f9ead18c10589a Jens Axboe     2022-05-25  710  static int io_recvmsg_copy_hdr(struct io_kiocb *req,
f9ead18c10589a Jens Axboe     2022-05-25  711  			       struct io_async_msghdr *iomsg)
f9ead18c10589a Jens Axboe     2022-05-25  712  {
7fa875b8e53c28 Dylan Yudaken  2022-07-14  713  	struct user_msghdr msg;
f9ead18c10589a Jens Axboe     2022-05-25  714  	int ret;
f9ead18c10589a Jens Axboe     2022-05-25  715  
c55978024d123d Jens Axboe     2024-02-27  716  	iomsg->msg.msg_name = &iomsg->addr;
c55978024d123d Jens Axboe     2024-02-27  717  	iomsg->msg.msg_iter.nr_segs = 0;
f9ead18c10589a Jens Axboe     2022-05-25  718  
91864064622b17 Pavel Begunkov 2025-02-24 @719  	if (io_is_compat(req->ctx)) {
68525267875757 Pavel Begunkov 2025-02-26  720  #ifdef CONFIG_COMPAT
c55978024d123d Jens Axboe     2024-02-27  721  		struct compat_msghdr cmsg;
72c531f8ef3052 Dylan Yudaken  2022-07-14  722  
820c215726a57f Pavel Begunkov 2025-02-26  723  		ret = io_compat_msg_copy_hdr(req, iomsg, &cmsg, ITER_DEST,
820c215726a57f Pavel Begunkov 2025-02-26  724  					     &iomsg->uaddr);
68525267875757 Pavel Begunkov 2025-02-26  725  		memset(&msg, 0, sizeof(msg));
68525267875757 Pavel Begunkov 2025-02-26  726  		msg.msg_namelen = cmsg.msg_namelen;
68525267875757 Pavel Begunkov 2025-02-26  727  		msg.msg_controllen = cmsg.msg_controllen;
f9ead18c10589a Jens Axboe     2022-05-25  728  #endif
68525267875757 Pavel Begunkov 2025-02-26  729  	} else {
820c215726a57f Pavel Begunkov 2025-02-26  730  		ret = io_msg_copy_hdr(req, iomsg, &msg, ITER_DEST, &iomsg->uaddr);
68525267875757 Pavel Begunkov 2025-02-26  731  	}
68525267875757 Pavel Begunkov 2025-02-26  732  
c55978024d123d Jens Axboe     2024-02-27  733  	if (unlikely(ret))
c55978024d123d Jens Axboe     2024-02-27  734  		return ret;
c55978024d123d Jens Axboe     2024-02-27  735  	return io_recvmsg_mshot_prep(req, iomsg, msg.msg_namelen,
c55978024d123d Jens Axboe     2024-02-27  736  					msg.msg_controllen);
f9ead18c10589a Jens Axboe     2022-05-25  737  }
f9ead18c10589a Jens Axboe     2022-05-25  738  

:::::: The code at line 719 was first introduced by commit
:::::: 91864064622b17e74f49fd42689a052eaac4f08e io_uring/net: use io_is_compat()

:::::: TO: Pavel Begunkov <asml.silence@gmail.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
