Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E5430E832;
	Thu, 11 Sep 2025 10:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757585986; cv=none; b=QvDXhdn0i/yz5PYhN3VXuua7K7z36KqYAsjN5gHIteE6XSaP8hbkjap0qG6tWSntd6Uy1Aam6ZCSITXBNkK1doP3UsusDE02JhawtRJMJR8ESlvLWhpxCo40lyGrQGlG0NkF/7RUZUjaGOdo8a0vWhErqIu7C8r61mLztevrrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757585986; c=relaxed/simple;
	bh=TZ+gB7FneFF6N5Ep3Up+ehaju3jmPzL+plK2CQKHViA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9FDrCIuU4PxSEFWjlwXzyIE7UplJczCg3HHRRuY+YZzZ/X+pVx/+Uxczm/eK2WbuwDAgBRjo3K8l9sCfHhu7FVLNahn49on+d2GhlCVvcfuwiITMVLYurkzs1ijSUvYRrdvn8ubFl8sKoLg68+Mc1Q2R0OFCjfj/6iH/4KB+2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emS6rYGo; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emS6rYGo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757585985; x=1789121985;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TZ+gB7FneFF6N5Ep3Up+ehaju3jmPzL+plK2CQKHViA=;
  b=emS6rYGo/xLoktZ9EbjlONFEnUBM7SxBKe8na/O5vOgJva19P5L5XJPQ
   UUAKD/y6RScR647aEGmvtht8Oo/PsLrCvJh0LQ1EXJ3W5fInoM+DnQ9up
   OU4p+ZfhUmUfaLpoIOnu3fVul9twFjSEBs4qQYXbVGf5jROStGyOvpkJf
   P0pjlCWzocd8TDGDMTbPlfl1M3eJJbufkeiGwvz5EfjEK+/oZAmpljxge
   JKVobS6g4EFeKuAjjBtBbNen+9S4Dt2TElbKvpL0p0OgObSVFxJlEDNzY
   KLrDlakdb9gKZVE2EetfUoagLSgonKWtVvgXaE8CI8j5bDYSD32to3bGg
   A==;
X-CSE-ConnectionGUID: d14reUS6T92P7M5rU0VEmw==
X-CSE-MsgGUID: xbGjQBzzQE686JOe1y1AGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63547158"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="63547158"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 03:19:44 -0700
X-CSE-ConnectionGUID: 3oLmwhcuRhu7UJDildlYow==
X-CSE-MsgGUID: XN2N7ml2RxGq78IOl0OUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="177963584"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2025 03:19:42 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uweOx-0000ES-24;
	Thu, 11 Sep 2025 10:19:39 +0000
Date: Thu, 11 Sep 2025 18:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb Sander Mateos <csander@purestorage.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Keith Busch <kbusch@kernel.org>
Subject: [linux-next:master 5075/8263] include/linux/io_uring/cmd.h:112:8:
 error: unknown type name 'io_uring_tw_t'; did you mean 'io_uring_cmd_tw_t'?
Message-ID: <202509111833.pUskVuP3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f21d9da46702c4d6951ba60ca8a05f42870fe8f
commit: df3a7762ee24ba6a33d4215244e329ca300f4819 [5075/8263] io_uring/uring_cmd: add io_uring_cmd_tw_t type alias
config: x86_64-buildonly-randconfig-005-20250911 (https://download.01.org/0day-ci/archive/20250911/202509111833.pUskVuP3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509111833.pUskVuP3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509111833.pUskVuP3-lkp@intel.com/

Note: the linux-next/master HEAD 8f21d9da46702c4d6951ba60ca8a05f42870fe8f builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from block/fops.c:20:
>> include/linux/io_uring/cmd.h:112:8: error: unknown type name 'io_uring_tw_t'; did you mean 'io_uring_cmd_tw_t'?
     112 |                             io_uring_tw_t task_work_cb,
         |                             ^~~~~~~~~~~~~
         |                             io_uring_cmd_tw_t
   include/linux/io_uring/cmd.h:14:16: note: 'io_uring_cmd_tw_t' declared here
      14 | typedef void (*io_uring_cmd_tw_t)(struct io_uring_cmd *cmd,
         |                ^
   1 error generated.


vim +112 include/linux/io_uring/cmd.h

    75	
    76	/*
    77	 * Select a buffer from the provided buffer group for multishot uring_cmd.
    78	 * Returns the selected buffer address and size.
    79	 */
    80	struct io_br_sel io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd,
    81						    unsigned buf_group, size_t *len,
    82						    unsigned int issue_flags);
    83	
    84	/*
    85	 * Complete a multishot uring_cmd event. This will post a CQE to the completion
    86	 * queue and update the provided buffer.
    87	 */
    88	bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
    89					 struct io_br_sel *sel, unsigned int issue_flags);
    90	
    91	#else
    92	static inline int
    93	io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
    94				  struct iov_iter *iter, struct io_uring_cmd *ioucmd,
    95				  unsigned int issue_flags)
    96	{
    97		return -EOPNOTSUPP;
    98	}
    99	static inline int io_uring_cmd_import_fixed_vec(struct io_uring_cmd *ioucmd,
   100							const struct iovec __user *uvec,
   101							size_t uvec_segs,
   102							int ddir, struct iov_iter *iter,
   103							unsigned issue_flags)
   104	{
   105		return -EOPNOTSUPP;
   106	}
   107	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
   108			u64 ret2, unsigned issue_flags)
   109	{
   110	}
   111	static inline void __io_uring_cmd_do_in_task(struct io_uring_cmd *ioucmd,
 > 112				    io_uring_tw_t task_work_cb,
   113				    unsigned flags)
   114	{
   115	}
   116	static inline void io_uring_cmd_mark_cancelable(struct io_uring_cmd *cmd,
   117			unsigned int issue_flags)
   118	{
   119	}
   120	static inline void io_uring_cmd_issue_blocking(struct io_uring_cmd *ioucmd)
   121	{
   122	}
   123	static inline struct io_br_sel
   124	io_uring_cmd_buffer_select(struct io_uring_cmd *ioucmd, unsigned buf_group,
   125				   size_t *len, unsigned int issue_flags)
   126	{
   127		return (struct io_br_sel) { .val = -EOPNOTSUPP };
   128	}
   129	static inline bool io_uring_mshot_cmd_post_cqe(struct io_uring_cmd *ioucmd,
   130					ssize_t ret, unsigned int issue_flags)
   131	{
   132		return true;
   133	}
   134	#endif
   135	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
