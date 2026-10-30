Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793328134;
	b=kwAvFrEd7KfzxN+RWVE7njOfZqzGORhcBRtLjBlL1LjMUx0OStAJarVTR65+NA8MU/Og
	 kfQ6bFebkWZZPI9u8AV1wdfMTUa/TOf43OqddVTtLAly2SKIas3j0pM7SDSlf53yYSW+r
	 eh9YQyYksXCEVIPBvdK4uAJiI7awAa9gUFlc4Ur0NGehOPTpeur5oRYkI445tuRnJq6ZM
	 Tq3mJdJTVXI4CLclPm5iei5MgYMIKecmDwYUG13sbEv6/+fR0XG45S5Qi5SSgB8Utf5Nu
	 Vre6lqp8Qjb6zlcmONaQyd+p0oIm0MujnO2YyGg3tmDzBFeJD5YhiJjvq1s6LStWSCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793328134;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7hkD+UjN71G7BZyY5Y9RW111HNX/NnGSBu4FBuXqUSw=;
	b=J4GQeW+EOph5p/sbMj3gcFLLz8txlnkb0IVy2uWILECerBpZq439ZK9nMxzI/BjLeK2x
	 x7hMjj7q3xuB1WmV59mwV/p86BtPWwKyEYfoAGsN0pTajJtssSZ0szk+6OXmJgpfUMSry
	 UIwANbaLIzLuGOqtBYRLzNqZLYLR1zLLgVVl7Hcb6f2DSHnJf6+91hsZPdnriSexK5FNM
	 zA9zp1n3duFK0sZl5GSm0qCyltUxT6025z4vjX33biX2NEHVuaWVpdJLsOPnvoufkQKGi
	 N5QyCBE7pthpQmJVQULPeVDA3Bk0e/YIx3BCgksuwQ/crIdUOkGLS8byP/B/PqpQ63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWljuG+b;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A9F606A31A;
	Fri, 30 Oct 2026 02:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YWljuG+b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793328133; x=1824864133;
  h=date:from:to:cc:subject:message-id;
  bh=6jzvhM+0VMNhdnuJJUPI4GV/If7uaje6ZgOBwRySVmg=;
  b=YWljuG+bSAc9+eSa+/4gMIXQH2tpsBAGipF0NCvmFTHHa1A8ZxyotDFS
   ZPVML/lGlLrylRkrcFYvOf8AkY2wddLqWMoiTAVQ6/Tv+fVtUnjE4E+6Q
   63lcBeXvDvXaelNtTvUcT4NuYMjV+fDqWOPNePHBZXuZNjgF5qPvPxpBD
   pv2sGa8UG+nodkCMARfOqXiVaAkLtAVtpvmxbKlK6Mf9vLQq6BZ6p7Ryt
   4kMFgaoDEj7mRZ+q5YUqytQ9cjiOHt7siDvKE0jhPgviWwAAxK+3RUa07
   o75Yv2EIzn/dR9WlaOULnwnYoChTeGs8MzlJ2px+RuU1XvFfBTirz3uSj
   w==;
X-CSE-ConnectionGUID: DWLhDmj+QCqlRTdXKNXdsQ==
X-CSE-MsgGUID: wZdt3fTyRmuSB1xmhWxD4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1971553"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1971553"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 19:42:12 -0700
X-CSE-ConnectionGUID: +bOw7zSOSrKjHe4jAYWiTQ==
X-CSE-MsgGUID: LSEE1JFeRJycHgHfkNio1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5413041"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2026 19:42:11 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMcZD-000000005SJ-2LqV;
	Fri, 30 Oct 2026 02:42:07 +0000
Date: Fri, 30 Oct 2026 03:41:25 +0100
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:nowait/fsnotify 1/2]
 fs/notify/inotify/inotify_user.c:698:9: error: member reference type 'const
 struct fd_prepare *const' is a pointer; did you mean to use '->'?
Message-ID: <202610300357.n7Os1pXZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nowait/fsnotify
head:   0257f0c419d8ac11d8401ca3125b3712ccd706b4
commit: e226d04bfaf89cd0024a132fd9bafc3de182894d [1/2] inotify: convert read to read_iter
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20261030/202610300357.n7Os1pXZ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300357.n7Os1pXZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300357.n7Os1pXZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/notify/inotify/inotify_user.c:698:9: error: member reference type 'const struct fd_prepare *const' is a pointer; did you mean to use '->'?
     698 |         if (fdf.err) {
         |             ~~~^
         |                ->
>> fs/notify/inotify/inotify_user.c:698:10: error: no member named 'err' in 'struct fd_prepare'
     698 |         if (fdf.err) {
         |             ~~~ ^
   fs/notify/inotify/inotify_user.c:700:13: error: member reference type 'const struct fd_prepare *const' is a pointer; did you mean to use '->'?
     700 |                 return fdf.err;
         |                        ~~~^
         |                           ->
   fs/notify/inotify/inotify_user.c:700:14: error: no member named 'err' in 'struct fd_prepare'
     700 |                 return fdf.err;
         |                        ~~~ ^
   4 errors generated.


vim +698 fs/notify/inotify/inotify_user.c

   676	
   677	
   678	/* inotify syscalls */
   679	static int do_inotify_init(int flags)
   680	{
   681		struct fsnotify_group *group;
   682	
   683		/* Check the IN_* constants for consistency.  */
   684		BUILD_BUG_ON(IN_CLOEXEC != O_CLOEXEC);
   685		BUILD_BUG_ON(IN_NONBLOCK != O_NONBLOCK);
   686	
   687		if (flags & ~(IN_CLOEXEC | IN_NONBLOCK))
   688			return -EINVAL;
   689	
   690		/* fsnotify_obtain_group took a reference to group, we put this when we kill the file in the end */
   691		group = inotify_new_group(inotify_max_queued_events);
   692		if (IS_ERR(group))
   693			return PTR_ERR(group);
   694	
   695		FD_PREPARE(fdf, O_RDONLY | flags,
   696			   anon_inode_getfile_fmode("inotify", &inotify_fops, group,
   697						    O_RDONLY | flags, FMODE_NOWAIT));
 > 698		if (fdf.err) {
   699			fsnotify_destroy_group(group);
   700			return fdf.err;
   701		}
   702	
   703		return fd_publish(fdf);
   704	}
   705	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
