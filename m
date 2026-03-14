Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF152DAFA1;
	Sat, 14 Mar 2026 09:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773481451; cv=none; b=qWGeY7cSl+yzpFjpJ3guUStHj1PHJmMrhHKlkn9LdNuGpP/ibeqKzPDAHsAH6xu0swFXX+5r0s+Ducj4mgheVRfN3jUKKAp3aQR6Eq1+lVCkYI48/LfZn679VtU5TLNsCGXa0VHCsWF8Vvd4cQlVCicXZsNbl4hi6oCy8Ifzex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773481451; c=relaxed/simple;
	bh=CvlI04nTAIT8WTXlMnXiiozO0sYIQq+3jUTa7C8XHDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhYX6th7k1CNG/p63V+2mgZGRJVtu43V/YlBTNQ0U9HdH5Nl0etaox3i3V9/iwY1+VK5Ie/ns6keAxL/dyGCKXv6wXl3UPrmmZllgijyDw07c9LQQQow1o9aVQb/XsUdiX+Km6MYca/UEsuw/x4TL2tmuaWYT7aPswZArwT3f+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SZOL/RrL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SZOL/RrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773481449; x=1805017449;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CvlI04nTAIT8WTXlMnXiiozO0sYIQq+3jUTa7C8XHDI=;
  b=SZOL/RrL1r+rzeoMKqkxUkaMRdKDtAj69fc9FpbsU5r6SHCSDxf4M0WJ
   erTGCw0OiE6yfljyPstN+K0NwSbczs3+2onRGWvPuSD45cwOQk5NFDX/O
   936rddviU+YXiJrMaoh+XztIZB7h+dGnbM6YiRgKgkmcH5KqVl+HawplB
   7Om1E/B+d1r6ax32Q8vHCBmb6BdXqq0XmVAIpumUN+IPSl71Al57i2ff8
   py2O/3udjpEUC8YL6XCK6GI+yqfF0/6GsJPpEf33mfNqZ9VaFb4/F8vSq
   hI2UGS63Ya1F6QPTc2FlncY3hZ3d8vpWBasZN6JcDxbl6hpdyIuUB78wZ
   g==;
X-CSE-ConnectionGUID: ahtVNHIdRO6g1ZkDBAm1oA==
X-CSE-MsgGUID: zpOKG6cOSByiCTW5WYR7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74490562"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74490562"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 02:44:08 -0700
X-CSE-ConnectionGUID: CYkt/EZFTy+zqFX8wixLTg==
X-CSE-MsgGUID: 67hCAbF+QKqw+f6mVQbQwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="226073951"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Mar 2026 02:44:07 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1LXQ-000000004wB-3U1Z;
	Sat, 14 Mar 2026 09:44:04 +0000
Date: Sat, 14 Mar 2026 17:43:41 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Hodges <git@danielhodges.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] io_uring: add high-performance IPC channel
 infrastructure
Message-ID: <202603141705.7b7xxdX7-lkp@intel.com>
References: <20260313130739.23265-2-git@danielhodges.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313130739.23265-2-git@danielhodges.dev>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe/for-next]
[also build test ERROR on next-20260311]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Hodges/io_uring-add-high-performance-IPC-channel-infrastructure/20260314-062737
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-next
patch link:    https://lore.kernel.org/r/20260313130739.23265-2-git%40danielhodges.dev
patch subject: [RFC PATCH 1/2] io_uring: add high-performance IPC channel infrastructure
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260314/202603141705.7b7xxdX7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141705.7b7xxdX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141705.7b7xxdX7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/opdef.c:605:18: error: invalid application of 'sizeof' to an incomplete type 'struct io_ipc_send'
     605 |                 .async_size             = sizeof(struct io_ipc_send),
         |                                           ^     ~~~~~~~~~~~~~~~~~~~~
   io_uring/opdef.c:605:32: note: forward declaration of 'struct io_ipc_send'
     605 |                 .async_size             = sizeof(struct io_ipc_send),
         |                                                         ^
>> io_uring/opdef.c:606:13: error: use of undeclared identifier 'io_ipc_send_prep'
     606 |                 .prep                   = io_ipc_send_prep,
         |                                           ^
>> io_uring/opdef.c:607:14: error: use of undeclared identifier 'io_ipc_send'
     607 |                 .issue                  = io_ipc_send,
         |                                           ^
>> io_uring/opdef.c:611:18: error: invalid application of 'sizeof' to an incomplete type 'struct io_ipc_recv'
     611 |                 .async_size             = sizeof(struct io_ipc_recv),
         |                                           ^     ~~~~~~~~~~~~~~~~~~~~
   io_uring/opdef.c:611:32: note: forward declaration of 'struct io_ipc_recv'
     611 |                 .async_size             = sizeof(struct io_ipc_recv),
         |                                                         ^
>> io_uring/opdef.c:612:13: error: use of undeclared identifier 'io_ipc_recv_prep'
     612 |                 .prep                   = io_ipc_recv_prep,
         |                                           ^
>> io_uring/opdef.c:613:14: error: use of undeclared identifier 'io_ipc_recv'; did you mean 'io_zcrx_recv'?
     613 |                 .issue                  = io_ipc_recv,
         |                                           ^~~~~~~~~~~
         |                                           io_zcrx_recv
   io_uring/zcrx.h:91:19: note: 'io_zcrx_recv' declared here
      91 | static inline int io_zcrx_recv(struct io_kiocb *req, struct io_zcrx_ifq *ifq,
         |                   ^
>> io_uring/opdef.c:901:15: error: invalid application of 'sizeof' to an incomplete type 'const struct io_issue_def[]'
     901 |         BUILD_BUG_ON(ARRAY_SIZE(io_issue_defs) != IORING_OP_LAST);
         |         ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^
   include/linux/build_bug.h:50:19: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:58: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
   include/linux/compiler_types.h:706:22: note: expanded from macro 'compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:694:23: note: expanded from macro '_compiletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:686:9: note: expanded from macro '__compiletime_assert'
     686 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   io_uring/opdef.c:903:18: error: invalid application of 'sizeof' to an incomplete type 'const struct io_issue_def[]'
     903 |         for (i = 0; i < ARRAY_SIZE(io_issue_defs); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   8 errors generated.


vim +605 io_uring/opdef.c

    54	
    55	const struct io_issue_def io_issue_defs[] = {
    56		[IORING_OP_NOP] = {
    57			.audit_skip		= 1,
    58			.iopoll			= 1,
    59			.prep			= io_nop_prep,
    60			.issue			= io_nop,
    61		},
    62		[IORING_OP_READV] = {
    63			.needs_file		= 1,
    64			.unbound_nonreg_file	= 1,
    65			.pollin			= 1,
    66			.buffer_select		= 1,
    67			.plug			= 1,
    68			.audit_skip		= 1,
    69			.ioprio			= 1,
    70			.iopoll			= 1,
    71			.iopoll_queue		= 1,
    72			.vectored		= 1,
    73			.async_size		= sizeof(struct io_async_rw),
    74			.prep			= io_prep_readv,
    75			.issue			= io_read,
    76		},
    77		[IORING_OP_WRITEV] = {
    78			.needs_file		= 1,
    79			.hash_reg_file		= 1,
    80			.unbound_nonreg_file	= 1,
    81			.pollout		= 1,
    82			.plug			= 1,
    83			.audit_skip		= 1,
    84			.ioprio			= 1,
    85			.iopoll			= 1,
    86			.iopoll_queue		= 1,
    87			.vectored		= 1,
    88			.async_size		= sizeof(struct io_async_rw),
    89			.prep			= io_prep_writev,
    90			.issue			= io_write,
    91		},
    92		[IORING_OP_FSYNC] = {
    93			.needs_file		= 1,
    94			.audit_skip		= 1,
    95			.prep			= io_fsync_prep,
    96			.issue			= io_fsync,
    97		},
    98		[IORING_OP_READ_FIXED] = {
    99			.needs_file		= 1,
   100			.unbound_nonreg_file	= 1,
   101			.pollin			= 1,
   102			.plug			= 1,
   103			.audit_skip		= 1,
   104			.ioprio			= 1,
   105			.iopoll			= 1,
   106			.iopoll_queue		= 1,
   107			.async_size		= sizeof(struct io_async_rw),
   108			.prep			= io_prep_read_fixed,
   109			.issue			= io_read_fixed,
   110		},
   111		[IORING_OP_WRITE_FIXED] = {
   112			.needs_file		= 1,
   113			.hash_reg_file		= 1,
   114			.unbound_nonreg_file	= 1,
   115			.pollout		= 1,
   116			.plug			= 1,
   117			.audit_skip		= 1,
   118			.ioprio			= 1,
   119			.iopoll			= 1,
   120			.iopoll_queue		= 1,
   121			.async_size		= sizeof(struct io_async_rw),
   122			.prep			= io_prep_write_fixed,
   123			.issue			= io_write_fixed,
   124		},
   125		[IORING_OP_POLL_ADD] = {
   126			.needs_file		= 1,
   127			.unbound_nonreg_file	= 1,
   128			.audit_skip		= 1,
   129			.prep			= io_poll_add_prep,
   130			.issue			= io_poll_add,
   131		},
   132		[IORING_OP_POLL_REMOVE] = {
   133			.audit_skip		= 1,
   134			.prep			= io_poll_remove_prep,
   135			.issue			= io_poll_remove,
   136		},
   137		[IORING_OP_SYNC_FILE_RANGE] = {
   138			.needs_file		= 1,
   139			.audit_skip		= 1,
   140			.prep			= io_sfr_prep,
   141			.issue			= io_sync_file_range,
   142		},
   143		[IORING_OP_SENDMSG] = {
   144			.needs_file		= 1,
   145			.unbound_nonreg_file	= 1,
   146			.pollout		= 1,
   147			.ioprio			= 1,
   148	#if defined(CONFIG_NET)
   149			.async_size		= sizeof(struct io_async_msghdr),
   150			.prep			= io_sendmsg_prep,
   151			.issue			= io_sendmsg,
   152	#else
   153			.prep			= io_eopnotsupp_prep,
   154	#endif
   155		},
   156		[IORING_OP_RECVMSG] = {
   157			.needs_file		= 1,
   158			.unbound_nonreg_file	= 1,
   159			.pollin			= 1,
   160			.buffer_select		= 1,
   161			.ioprio			= 1,
   162	#if defined(CONFIG_NET)
   163			.async_size		= sizeof(struct io_async_msghdr),
   164			.prep			= io_recvmsg_prep,
   165			.issue			= io_recvmsg,
   166	#else
   167			.prep			= io_eopnotsupp_prep,
   168	#endif
   169		},
   170		[IORING_OP_TIMEOUT] = {
   171			.audit_skip		= 1,
   172			.async_size		= sizeof(struct io_timeout_data),
   173			.prep			= io_timeout_prep,
   174			.issue			= io_timeout,
   175		},
   176		[IORING_OP_TIMEOUT_REMOVE] = {
   177			/* used by timeout updates' prep() */
   178			.audit_skip		= 1,
   179			.prep			= io_timeout_remove_prep,
   180			.issue			= io_timeout_remove,
   181		},
   182		[IORING_OP_ACCEPT] = {
   183			.needs_file		= 1,
   184			.unbound_nonreg_file	= 1,
   185			.pollin			= 1,
   186			.poll_exclusive		= 1,
   187			.ioprio			= 1,	/* used for flags */
   188	#if defined(CONFIG_NET)
   189			.prep			= io_accept_prep,
   190			.issue			= io_accept,
   191	#else
   192			.prep			= io_eopnotsupp_prep,
   193	#endif
   194		},
   195		[IORING_OP_ASYNC_CANCEL] = {
   196			.audit_skip		= 1,
   197			.prep			= io_async_cancel_prep,
   198			.issue			= io_async_cancel,
   199		},
   200		[IORING_OP_LINK_TIMEOUT] = {
   201			.audit_skip		= 1,
   202			.async_size		= sizeof(struct io_timeout_data),
   203			.prep			= io_link_timeout_prep,
   204			.issue			= io_no_issue,
   205		},
   206		[IORING_OP_CONNECT] = {
   207			.needs_file		= 1,
   208			.unbound_nonreg_file	= 1,
   209			.pollout		= 1,
   210	#if defined(CONFIG_NET)
   211			.async_size		= sizeof(struct io_async_msghdr),
   212			.prep			= io_connect_prep,
   213			.issue			= io_connect,
   214	#else
   215			.prep			= io_eopnotsupp_prep,
   216	#endif
   217		},
   218		[IORING_OP_FALLOCATE] = {
   219			.needs_file		= 1,
   220			.hash_reg_file          = 1,
   221			.prep			= io_fallocate_prep,
   222			.issue			= io_fallocate,
   223		},
   224		[IORING_OP_OPENAT] = {
   225			.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
   226			.prep			= io_openat_prep,
   227			.issue			= io_openat,
   228			.filter_populate	= io_openat_bpf_populate,
   229		},
   230		[IORING_OP_CLOSE] = {
   231			.prep			= io_close_prep,
   232			.issue			= io_close,
   233		},
   234		[IORING_OP_FILES_UPDATE] = {
   235			.audit_skip		= 1,
   236			.iopoll			= 1,
   237			.prep			= io_files_update_prep,
   238			.issue			= io_files_update,
   239		},
   240		[IORING_OP_STATX] = {
   241			.audit_skip		= 1,
   242			.prep			= io_statx_prep,
   243			.issue			= io_statx,
   244		},
   245		[IORING_OP_READ] = {
   246			.needs_file		= 1,
   247			.unbound_nonreg_file	= 1,
   248			.pollin			= 1,
   249			.buffer_select		= 1,
   250			.plug			= 1,
   251			.audit_skip		= 1,
   252			.ioprio			= 1,
   253			.iopoll			= 1,
   254			.iopoll_queue		= 1,
   255			.async_size		= sizeof(struct io_async_rw),
   256			.prep			= io_prep_read,
   257			.issue			= io_read,
   258		},
   259		[IORING_OP_WRITE] = {
   260			.needs_file		= 1,
   261			.hash_reg_file		= 1,
   262			.unbound_nonreg_file	= 1,
   263			.pollout		= 1,
   264			.plug			= 1,
   265			.audit_skip		= 1,
   266			.ioprio			= 1,
   267			.iopoll			= 1,
   268			.iopoll_queue		= 1,
   269			.async_size		= sizeof(struct io_async_rw),
   270			.prep			= io_prep_write,
   271			.issue			= io_write,
   272		},
   273		[IORING_OP_FADVISE] = {
   274			.needs_file		= 1,
   275			.audit_skip		= 1,
   276			.prep			= io_fadvise_prep,
   277			.issue			= io_fadvise,
   278		},
   279		[IORING_OP_MADVISE] = {
   280			.audit_skip		= 1,
   281			.prep			= io_madvise_prep,
   282			.issue			= io_madvise,
   283		},
   284		[IORING_OP_SEND] = {
   285			.needs_file		= 1,
   286			.unbound_nonreg_file	= 1,
   287			.pollout		= 1,
   288			.audit_skip		= 1,
   289			.ioprio			= 1,
   290			.buffer_select		= 1,
   291	#if defined(CONFIG_NET)
   292			.async_size		= sizeof(struct io_async_msghdr),
   293			.prep			= io_sendmsg_prep,
   294			.issue			= io_send,
   295	#else
   296			.prep			= io_eopnotsupp_prep,
   297	#endif
   298		},
   299		[IORING_OP_RECV] = {
   300			.needs_file		= 1,
   301			.unbound_nonreg_file	= 1,
   302			.pollin			= 1,
   303			.buffer_select		= 1,
   304			.audit_skip		= 1,
   305			.ioprio			= 1,
   306	#if defined(CONFIG_NET)
   307			.async_size		= sizeof(struct io_async_msghdr),
   308			.prep			= io_recvmsg_prep,
   309			.issue			= io_recv,
   310	#else
   311			.prep			= io_eopnotsupp_prep,
   312	#endif
   313		},
   314		[IORING_OP_OPENAT2] = {
   315			.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, open),
   316			.prep			= io_openat2_prep,
   317			.issue			= io_openat2,
   318			.filter_populate	= io_openat_bpf_populate,
   319		},
   320		[IORING_OP_EPOLL_CTL] = {
   321			.unbound_nonreg_file	= 1,
   322			.audit_skip		= 1,
   323	#if defined(CONFIG_EPOLL)
   324			.prep			= io_epoll_ctl_prep,
   325			.issue			= io_epoll_ctl,
   326	#else
   327			.prep			= io_eopnotsupp_prep,
   328	#endif
   329		},
   330		[IORING_OP_SPLICE] = {
   331			.needs_file		= 1,
   332			.hash_reg_file		= 1,
   333			.unbound_nonreg_file	= 1,
   334			.audit_skip		= 1,
   335			.prep			= io_splice_prep,
   336			.issue			= io_splice,
   337		},
   338		[IORING_OP_PROVIDE_BUFFERS] = {
   339			.audit_skip		= 1,
   340			.iopoll			= 1,
   341			.prep			= io_provide_buffers_prep,
   342			.issue			= io_manage_buffers_legacy,
   343		},
   344		[IORING_OP_REMOVE_BUFFERS] = {
   345			.audit_skip		= 1,
   346			.iopoll			= 1,
   347			.prep			= io_remove_buffers_prep,
   348			.issue			= io_manage_buffers_legacy,
   349		},
   350		[IORING_OP_TEE] = {
   351			.needs_file		= 1,
   352			.hash_reg_file		= 1,
   353			.unbound_nonreg_file	= 1,
   354			.audit_skip		= 1,
   355			.prep			= io_tee_prep,
   356			.issue			= io_tee,
   357		},
   358		[IORING_OP_SHUTDOWN] = {
   359			.needs_file		= 1,
   360	#if defined(CONFIG_NET)
   361			.prep			= io_shutdown_prep,
   362			.issue			= io_shutdown,
   363	#else
   364			.prep			= io_eopnotsupp_prep,
   365	#endif
   366		},
   367		[IORING_OP_RENAMEAT] = {
   368			.prep			= io_renameat_prep,
   369			.issue			= io_renameat,
   370		},
   371		[IORING_OP_UNLINKAT] = {
   372			.prep			= io_unlinkat_prep,
   373			.issue			= io_unlinkat,
   374		},
   375		[IORING_OP_MKDIRAT] = {
   376			.prep			= io_mkdirat_prep,
   377			.issue			= io_mkdirat,
   378		},
   379		[IORING_OP_SYMLINKAT] = {
   380			.prep			= io_symlinkat_prep,
   381			.issue			= io_symlinkat,
   382		},
   383		[IORING_OP_LINKAT] = {
   384			.prep			= io_linkat_prep,
   385			.issue			= io_linkat,
   386		},
   387		[IORING_OP_MSG_RING] = {
   388			.needs_file		= 1,
   389			.iopoll			= 1,
   390			.prep			= io_msg_ring_prep,
   391			.issue			= io_msg_ring,
   392		},
   393		[IORING_OP_FSETXATTR] = {
   394			.needs_file = 1,
   395			.prep			= io_fsetxattr_prep,
   396			.issue			= io_fsetxattr,
   397		},
   398		[IORING_OP_SETXATTR] = {
   399			.prep			= io_setxattr_prep,
   400			.issue			= io_setxattr,
   401		},
   402		[IORING_OP_FGETXATTR] = {
   403			.needs_file = 1,
   404			.prep			= io_fgetxattr_prep,
   405			.issue			= io_fgetxattr,
   406		},
   407		[IORING_OP_GETXATTR] = {
   408			.prep			= io_getxattr_prep,
   409			.issue			= io_getxattr,
   410		},
   411		[IORING_OP_SOCKET] = {
   412			.audit_skip		= 1,
   413	#if defined(CONFIG_NET)
   414			.filter_pdu_size	= sizeof_field(struct io_uring_bpf_ctx, socket),
   415			.prep			= io_socket_prep,
   416			.issue			= io_socket,
   417			.filter_populate	= io_socket_bpf_populate,
   418	#else
   419			.prep			= io_eopnotsupp_prep,
   420	#endif
   421		},
   422		[IORING_OP_URING_CMD] = {
   423			.buffer_select		= 1,
   424			.needs_file		= 1,
   425			.plug			= 1,
   426			.iopoll			= 1,
   427			.iopoll_queue		= 1,
   428			.async_size		= sizeof(struct io_async_cmd),
   429			.prep			= io_uring_cmd_prep,
   430			.issue			= io_uring_cmd,
   431		},
   432		[IORING_OP_SEND_ZC] = {
   433			.needs_file		= 1,
   434			.unbound_nonreg_file	= 1,
   435			.pollout		= 1,
   436			.audit_skip		= 1,
   437			.ioprio			= 1,
   438	#if defined(CONFIG_NET)
   439			.async_size		= sizeof(struct io_async_msghdr),
   440			.prep			= io_send_zc_prep,
   441			.issue			= io_sendmsg_zc,
   442	#else
   443			.prep			= io_eopnotsupp_prep,
   444	#endif
   445		},
   446		[IORING_OP_SENDMSG_ZC] = {
   447			.needs_file		= 1,
   448			.unbound_nonreg_file	= 1,
   449			.pollout		= 1,
   450			.ioprio			= 1,
   451	#if defined(CONFIG_NET)
   452			.async_size		= sizeof(struct io_async_msghdr),
   453			.prep			= io_send_zc_prep,
   454			.issue			= io_sendmsg_zc,
   455	#else
   456			.prep			= io_eopnotsupp_prep,
   457	#endif
   458		},
   459		[IORING_OP_READ_MULTISHOT] = {
   460			.needs_file		= 1,
   461			.unbound_nonreg_file	= 1,
   462			.pollin			= 1,
   463			.buffer_select		= 1,
   464			.audit_skip		= 1,
   465			.async_size		= sizeof(struct io_async_rw),
   466			.prep			= io_read_mshot_prep,
   467			.issue			= io_read_mshot,
   468		},
   469		[IORING_OP_WAITID] = {
   470			.async_size		= sizeof(struct io_waitid_async),
   471			.prep			= io_waitid_prep,
   472			.issue			= io_waitid,
   473		},
   474		[IORING_OP_FUTEX_WAIT] = {
   475	#if defined(CONFIG_FUTEX)
   476			.prep			= io_futex_prep,
   477			.issue			= io_futex_wait,
   478	#else
   479			.prep			= io_eopnotsupp_prep,
   480	#endif
   481		},
   482		[IORING_OP_FUTEX_WAKE] = {
   483	#if defined(CONFIG_FUTEX)
   484			.prep			= io_futex_prep,
   485			.issue			= io_futex_wake,
   486	#else
   487			.prep			= io_eopnotsupp_prep,
   488	#endif
   489		},
   490		[IORING_OP_FUTEX_WAITV] = {
   491	#if defined(CONFIG_FUTEX)
   492			.prep			= io_futexv_prep,
   493			.issue			= io_futexv_wait,
   494	#else
   495			.prep			= io_eopnotsupp_prep,
   496	#endif
   497		},
   498		[IORING_OP_FIXED_FD_INSTALL] = {
   499			.needs_file		= 1,
   500			.prep			= io_install_fixed_fd_prep,
   501			.issue			= io_install_fixed_fd,
   502		},
   503		[IORING_OP_FTRUNCATE] = {
   504			.needs_file		= 1,
   505			.hash_reg_file		= 1,
   506			.prep			= io_ftruncate_prep,
   507			.issue			= io_ftruncate,
   508		},
   509		[IORING_OP_BIND] = {
   510	#if defined(CONFIG_NET)
   511			.needs_file		= 1,
   512			.prep			= io_bind_prep,
   513			.issue			= io_bind,
   514			.async_size		= sizeof(struct io_async_msghdr),
   515	#else
   516			.prep			= io_eopnotsupp_prep,
   517	#endif
   518		},
   519		[IORING_OP_LISTEN] = {
   520	#if defined(CONFIG_NET)
   521			.needs_file		= 1,
   522			.prep			= io_listen_prep,
   523			.issue			= io_listen,
   524			.async_size		= sizeof(struct io_async_msghdr),
   525	#else
   526			.prep			= io_eopnotsupp_prep,
   527	#endif
   528		},
   529		[IORING_OP_RECV_ZC] = {
   530			.needs_file		= 1,
   531			.unbound_nonreg_file	= 1,
   532			.pollin			= 1,
   533			.ioprio			= 1,
   534	#if defined(CONFIG_NET)
   535			.prep			= io_recvzc_prep,
   536			.issue			= io_recvzc,
   537	#else
   538			.prep			= io_eopnotsupp_prep,
   539	#endif
   540		},
   541		[IORING_OP_EPOLL_WAIT] = {
   542			.needs_file		= 1,
   543			.audit_skip		= 1,
   544			.pollin			= 1,
   545	#if defined(CONFIG_EPOLL)
   546			.prep			= io_epoll_wait_prep,
   547			.issue			= io_epoll_wait,
   548	#else
   549			.prep			= io_eopnotsupp_prep,
   550	#endif
   551		},
   552		[IORING_OP_READV_FIXED] = {
   553			.needs_file		= 1,
   554			.unbound_nonreg_file	= 1,
   555			.pollin			= 1,
   556			.plug			= 1,
   557			.audit_skip		= 1,
   558			.ioprio			= 1,
   559			.iopoll			= 1,
   560			.iopoll_queue		= 1,
   561			.vectored		= 1,
   562			.async_size		= sizeof(struct io_async_rw),
   563			.prep			= io_prep_readv_fixed,
   564			.issue			= io_read,
   565		},
   566		[IORING_OP_WRITEV_FIXED] = {
   567			.needs_file		= 1,
   568			.hash_reg_file		= 1,
   569			.unbound_nonreg_file	= 1,
   570			.pollout		= 1,
   571			.plug			= 1,
   572			.audit_skip		= 1,
   573			.ioprio			= 1,
   574			.iopoll			= 1,
   575			.iopoll_queue		= 1,
   576			.vectored		= 1,
   577			.async_size		= sizeof(struct io_async_rw),
   578			.prep			= io_prep_writev_fixed,
   579			.issue			= io_write,
   580		},
   581		[IORING_OP_PIPE] = {
   582			.prep			= io_pipe_prep,
   583			.issue			= io_pipe,
   584		},
   585		[IORING_OP_NOP128] = {
   586			.audit_skip		= 1,
   587			.iopoll			= 1,
   588			.is_128			= 1,
   589			.prep			= io_nop_prep,
   590			.issue			= io_nop,
   591		},
   592		[IORING_OP_URING_CMD128] = {
   593			.buffer_select		= 1,
   594			.needs_file		= 1,
   595			.plug			= 1,
   596			.iopoll			= 1,
   597			.iopoll_queue		= 1,
   598			.is_128			= 1,
   599			.async_size		= sizeof(struct io_async_cmd),
   600			.prep			= io_uring_cmd_prep,
   601			.issue			= io_uring_cmd,
   602		},
   603		[IORING_OP_IPC_SEND] = {
   604			.audit_skip		= 1,
 > 605			.async_size		= sizeof(struct io_ipc_send),
 > 606			.prep			= io_ipc_send_prep,
 > 607			.issue			= io_ipc_send,
   608		},
   609		[IORING_OP_IPC_RECV] = {
   610			.audit_skip		= 1,
 > 611			.async_size		= sizeof(struct io_ipc_recv),
 > 612			.prep			= io_ipc_recv_prep,
 > 613			.issue			= io_ipc_recv,
   614		},
   615	};
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
