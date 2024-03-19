Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B4A81205;
	Tue, 19 Mar 2024 13:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710853780; cv=none; b=s/sAeYiOqnpN/ceHVKr5pru+tSiibLtiWpxBcVXonT5sKkMQHY6euYa83CWnU0zXpyegO75gy9iGMQkUmd9bBlahjHSxsveLKhvI6MdXz9EAGVHrlbORGYjuel38FF6M7KUTusX59vq7/dH8FqilgFE1xJVzx02Q7CBUGntzdqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710853780; c=relaxed/simple;
	bh=OQzf2eJC1PBsaoAxI+RB5EKA78WifBPGnoUun7xdghY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oLldb6Hvp+HPWNF92woPzDsTg8ixJwzWSjCIw5davEdE7zyQCC4AVY7FhtLam6zckRhEch+BknR/3dJ4wCDPBfOyJEhc5gC6qi4x9TyFD635HiAdT8qJokO7n1WwwIJXRiStwjzWu/1jw/FNMCuDw51fEruN8NjYZkvGVxKEsAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQh2ztOz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQh2ztOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710853778; x=1742389778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQzf2eJC1PBsaoAxI+RB5EKA78WifBPGnoUun7xdghY=;
  b=RQh2ztOzWCceAVvqEXkaz+PTR/QPhb9a/M6NHq/ovnQpJUJCmNgH1Jk9
   t6ZRmNzCmKMbsNjVdN0X+YM4t0Mmx+sxyikoMkub2vLiN/1juSTBRFBn9
   Xr1Zjatt6r4zFiAhUdpE1/Ak9tC8oLNm4Vak6erPun+gaSu8OablR1p5s
   /2vJ+GRabxMB/fAIW9H5UyFB45/mpepDRWladGAbYHkKy5G+Dhls2y8FJ
   Shgh1pjLot18OhqKCgQRXEjfnLtSr2COLEOLdejNTtsIsP4PEUPASQJ7q
   wQtD5uIyZQyDsTNavWibJxcOi5UkBYPMJtxtASZSzpNVzCDPGQS1CIICQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5843585"
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="5843585"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 06:09:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,137,1708416000"; 
   d="scan'208";a="36942638"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2024 06:09:35 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmZDg-000HmB-2L;
	Tue, 19 Mar 2024 13:09:32 +0000
Date: Tue, 19 Mar 2024 21:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 25/25]
 io_uring/opdef.c:207:18: error: invalid application of 'sizeof' to an
 incomplete type 'struct io_async_connect'
Message-ID: <202403192108.uKa5LPUj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   eee946ee4f7c1b05793a249f6897442ec81b7f24
commit: eee946ee4f7c1b05793a249f6897442ec81b7f24 [25/25] io_uring: drop ->prep_async()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240319/202403192108.uKa5LPUj-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240319/202403192108.uKa5LPUj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403192108.uKa5LPUj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/opdef.c:11:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/opdef.c:207:18: error: invalid application of 'sizeof' to an incomplete type 'struct io_async_connect'
     207 |                 .async_size             = sizeof(struct io_async_connect),
         |                                           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~
   io_uring/opdef.c:207:32: note: forward declaration of 'struct io_async_connect'
     207 |                 .async_size             = sizeof(struct io_async_connect),
         |                                                         ^
>> io_uring/opdef.c:730:15: error: invalid application of 'sizeof' to an incomplete type 'const struct io_issue_def[]'
     730 |         BUILD_BUG_ON(ARRAY_SIZE(io_issue_defs) != IORING_OP_LAST);
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
   include/linux/compiler_types.h:449:22: note: expanded from macro 'compiletime_assert'
     449 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:437:23: note: expanded from macro '_compiletime_assert'
     437 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:429:9: note: expanded from macro '__compiletime_assert'
     429 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   io_uring/opdef.c:732:18: error: invalid application of 'sizeof' to an incomplete type 'const struct io_issue_def[]'
     732 |         for (i = 0; i < ARRAY_SIZE(io_issue_defs); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   1 warning and 3 errors generated.


vim +207 io_uring/opdef.c

    51	
    52	const struct io_issue_def io_issue_defs[] = {
    53		[IORING_OP_NOP] = {
    54			.audit_skip		= 1,
    55			.iopoll			= 1,
    56			.prep			= io_nop_prep,
    57			.issue			= io_nop,
    58		},
    59		[IORING_OP_READV] = {
    60			.needs_file		= 1,
    61			.unbound_nonreg_file	= 1,
    62			.pollin			= 1,
    63			.buffer_select		= 1,
    64			.plug			= 1,
    65			.audit_skip		= 1,
    66			.ioprio			= 1,
    67			.iopoll			= 1,
    68			.iopoll_queue		= 1,
    69			.vectored		= 1,
    70			.async_size		= sizeof(struct io_async_rw),
    71			.prep			= io_prep_readv,
    72			.issue			= io_read,
    73		},
    74		[IORING_OP_WRITEV] = {
    75			.needs_file		= 1,
    76			.hash_reg_file		= 1,
    77			.unbound_nonreg_file	= 1,
    78			.pollout		= 1,
    79			.plug			= 1,
    80			.audit_skip		= 1,
    81			.ioprio			= 1,
    82			.iopoll			= 1,
    83			.iopoll_queue		= 1,
    84			.vectored		= 1,
    85			.async_size		= sizeof(struct io_async_rw),
    86			.prep			= io_prep_writev,
    87			.issue			= io_write,
    88		},
    89		[IORING_OP_FSYNC] = {
    90			.needs_file		= 1,
    91			.audit_skip		= 1,
    92			.prep			= io_fsync_prep,
    93			.issue			= io_fsync,
    94		},
    95		[IORING_OP_READ_FIXED] = {
    96			.needs_file		= 1,
    97			.unbound_nonreg_file	= 1,
    98			.pollin			= 1,
    99			.plug			= 1,
   100			.audit_skip		= 1,
   101			.ioprio			= 1,
   102			.iopoll			= 1,
   103			.iopoll_queue		= 1,
   104			.async_size		= sizeof(struct io_async_rw),
   105			.prep			= io_prep_read_fixed,
   106			.issue			= io_read,
   107		},
   108		[IORING_OP_WRITE_FIXED] = {
   109			.needs_file		= 1,
   110			.hash_reg_file		= 1,
   111			.unbound_nonreg_file	= 1,
   112			.pollout		= 1,
   113			.plug			= 1,
   114			.audit_skip		= 1,
   115			.ioprio			= 1,
   116			.iopoll			= 1,
   117			.iopoll_queue		= 1,
   118			.async_size		= sizeof(struct io_async_rw),
   119			.prep			= io_prep_write_fixed,
   120			.issue			= io_write,
   121		},
   122		[IORING_OP_POLL_ADD] = {
   123			.needs_file		= 1,
   124			.unbound_nonreg_file	= 1,
   125			.audit_skip		= 1,
   126			.prep			= io_poll_add_prep,
   127			.issue			= io_poll_add,
   128		},
   129		[IORING_OP_POLL_REMOVE] = {
   130			.audit_skip		= 1,
   131			.prep			= io_poll_remove_prep,
   132			.issue			= io_poll_remove,
   133		},
   134		[IORING_OP_SYNC_FILE_RANGE] = {
   135			.needs_file		= 1,
   136			.audit_skip		= 1,
   137			.prep			= io_sfr_prep,
   138			.issue			= io_sync_file_range,
   139		},
   140		[IORING_OP_SENDMSG] = {
   141			.needs_file		= 1,
   142			.unbound_nonreg_file	= 1,
   143			.pollout		= 1,
   144			.ioprio			= 1,
   145			.async_size		= sizeof(struct io_async_msghdr),
   146	#if defined(CONFIG_NET)
   147			.prep			= io_sendmsg_prep,
   148			.issue			= io_sendmsg,
   149	#else
   150			.prep			= io_eopnotsupp_prep,
   151	#endif
   152		},
   153		[IORING_OP_RECVMSG] = {
   154			.needs_file		= 1,
   155			.unbound_nonreg_file	= 1,
   156			.pollin			= 1,
   157			.buffer_select		= 1,
   158			.ioprio			= 1,
   159			.async_size		= sizeof(struct io_async_msghdr),
   160	#if defined(CONFIG_NET)
   161			.prep			= io_recvmsg_prep,
   162			.issue			= io_recvmsg,
   163	#else
   164			.prep			= io_eopnotsupp_prep,
   165	#endif
   166		},
   167		[IORING_OP_TIMEOUT] = {
   168			.audit_skip		= 1,
   169			.async_size		= sizeof(struct io_timeout_data),
   170			.prep			= io_timeout_prep,
   171			.issue			= io_timeout,
   172		},
   173		[IORING_OP_TIMEOUT_REMOVE] = {
   174			/* used by timeout updates' prep() */
   175			.audit_skip		= 1,
   176			.prep			= io_timeout_remove_prep,
   177			.issue			= io_timeout_remove,
   178		},
   179		[IORING_OP_ACCEPT] = {
   180			.needs_file		= 1,
   181			.unbound_nonreg_file	= 1,
   182			.pollin			= 1,
   183			.poll_exclusive		= 1,
   184			.ioprio			= 1,	/* used for flags */
   185	#if defined(CONFIG_NET)
   186			.prep			= io_accept_prep,
   187			.issue			= io_accept,
   188	#else
   189			.prep			= io_eopnotsupp_prep,
   190	#endif
   191		},
   192		[IORING_OP_ASYNC_CANCEL] = {
   193			.audit_skip		= 1,
   194			.prep			= io_async_cancel_prep,
   195			.issue			= io_async_cancel,
   196		},
   197		[IORING_OP_LINK_TIMEOUT] = {
   198			.audit_skip		= 1,
   199			.async_size		= sizeof(struct io_timeout_data),
   200			.prep			= io_link_timeout_prep,
   201			.issue			= io_no_issue,
   202		},
   203		[IORING_OP_CONNECT] = {
   204			.needs_file		= 1,
   205			.unbound_nonreg_file	= 1,
   206			.pollout		= 1,
 > 207			.async_size		= sizeof(struct io_async_connect),
   208	#if defined(CONFIG_NET)
   209			.prep			= io_connect_prep,
   210			.issue			= io_connect,
   211	#else
   212			.prep			= io_eopnotsupp_prep,
   213	#endif
   214		},
   215		[IORING_OP_FALLOCATE] = {
   216			.needs_file		= 1,
   217			.prep			= io_fallocate_prep,
   218			.issue			= io_fallocate,
   219		},
   220		[IORING_OP_OPENAT] = {
   221			.prep			= io_openat_prep,
   222			.issue			= io_openat,
   223		},
   224		[IORING_OP_CLOSE] = {
   225			.prep			= io_close_prep,
   226			.issue			= io_close,
   227		},
   228		[IORING_OP_FILES_UPDATE] = {
   229			.audit_skip		= 1,
   230			.iopoll			= 1,
   231			.prep			= io_files_update_prep,
   232			.issue			= io_files_update,
   233		},
   234		[IORING_OP_STATX] = {
   235			.audit_skip		= 1,
   236			.prep			= io_statx_prep,
   237			.issue			= io_statx,
   238		},
   239		[IORING_OP_READ] = {
   240			.needs_file		= 1,
   241			.unbound_nonreg_file	= 1,
   242			.pollin			= 1,
   243			.buffer_select		= 1,
   244			.plug			= 1,
   245			.audit_skip		= 1,
   246			.ioprio			= 1,
   247			.iopoll			= 1,
   248			.iopoll_queue		= 1,
   249			.async_size		= sizeof(struct io_async_rw),
   250			.prep			= io_prep_read,
   251			.issue			= io_read,
   252		},
   253		[IORING_OP_WRITE] = {
   254			.needs_file		= 1,
   255			.hash_reg_file		= 1,
   256			.unbound_nonreg_file	= 1,
   257			.pollout		= 1,
   258			.plug			= 1,
   259			.audit_skip		= 1,
   260			.ioprio			= 1,
   261			.iopoll			= 1,
   262			.iopoll_queue		= 1,
   263			.async_size		= sizeof(struct io_async_rw),
   264			.prep			= io_prep_write,
   265			.issue			= io_write,
   266		},
   267		[IORING_OP_FADVISE] = {
   268			.needs_file		= 1,
   269			.audit_skip		= 1,
   270			.prep			= io_fadvise_prep,
   271			.issue			= io_fadvise,
   272		},
   273		[IORING_OP_MADVISE] = {
   274			.audit_skip		= 1,
   275			.prep			= io_madvise_prep,
   276			.issue			= io_madvise,
   277		},
   278		[IORING_OP_SEND] = {
   279			.needs_file		= 1,
   280			.unbound_nonreg_file	= 1,
   281			.pollout		= 1,
   282			.audit_skip		= 1,
   283			.ioprio			= 1,
   284			.buffer_select		= 1,
   285			.async_size		= sizeof(struct io_async_msghdr),
   286	#if defined(CONFIG_NET)
   287			.prep			= io_sendmsg_prep,
   288			.issue			= io_send,
   289	#else
   290			.prep			= io_eopnotsupp_prep,
   291	#endif
   292		},
   293		[IORING_OP_RECV] = {
   294			.needs_file		= 1,
   295			.unbound_nonreg_file	= 1,
   296			.pollin			= 1,
   297			.buffer_select		= 1,
   298			.audit_skip		= 1,
   299			.ioprio			= 1,
   300			.async_size		= sizeof(struct io_async_msghdr),
   301	#if defined(CONFIG_NET)
   302			.prep			= io_recvmsg_prep,
   303			.issue			= io_recv,
   304	#else
   305			.prep			= io_eopnotsupp_prep,
   306	#endif
   307		},
   308		[IORING_OP_OPENAT2] = {
   309			.prep			= io_openat2_prep,
   310			.issue			= io_openat2,
   311		},
   312		[IORING_OP_EPOLL_CTL] = {
   313			.unbound_nonreg_file	= 1,
   314			.audit_skip		= 1,
   315	#if defined(CONFIG_EPOLL)
   316			.prep			= io_epoll_ctl_prep,
   317			.issue			= io_epoll_ctl,
   318	#else
   319			.prep			= io_eopnotsupp_prep,
   320	#endif
   321		},
   322		[IORING_OP_SPLICE] = {
   323			.needs_file		= 1,
   324			.hash_reg_file		= 1,
   325			.unbound_nonreg_file	= 1,
   326			.audit_skip		= 1,
   327			.prep			= io_splice_prep,
   328			.issue			= io_splice,
   329		},
   330		[IORING_OP_PROVIDE_BUFFERS] = {
   331			.audit_skip		= 1,
   332			.iopoll			= 1,
   333			.prep			= io_provide_buffers_prep,
   334			.issue			= io_provide_buffers,
   335		},
   336		[IORING_OP_REMOVE_BUFFERS] = {
   337			.audit_skip		= 1,
   338			.iopoll			= 1,
   339			.prep			= io_remove_buffers_prep,
   340			.issue			= io_remove_buffers,
   341		},
   342		[IORING_OP_TEE] = {
   343			.needs_file		= 1,
   344			.hash_reg_file		= 1,
   345			.unbound_nonreg_file	= 1,
   346			.audit_skip		= 1,
   347			.prep			= io_tee_prep,
   348			.issue			= io_tee,
   349		},
   350		[IORING_OP_SHUTDOWN] = {
   351			.needs_file		= 1,
   352	#if defined(CONFIG_NET)
   353			.prep			= io_shutdown_prep,
   354			.issue			= io_shutdown,
   355	#else
   356			.prep			= io_eopnotsupp_prep,
   357	#endif
   358		},
   359		[IORING_OP_RENAMEAT] = {
   360			.prep			= io_renameat_prep,
   361			.issue			= io_renameat,
   362		},
   363		[IORING_OP_UNLINKAT] = {
   364			.prep			= io_unlinkat_prep,
   365			.issue			= io_unlinkat,
   366		},
   367		[IORING_OP_MKDIRAT] = {
   368			.prep			= io_mkdirat_prep,
   369			.issue			= io_mkdirat,
   370		},
   371		[IORING_OP_SYMLINKAT] = {
   372			.prep			= io_symlinkat_prep,
   373			.issue			= io_symlinkat,
   374		},
   375		[IORING_OP_LINKAT] = {
   376			.prep			= io_linkat_prep,
   377			.issue			= io_linkat,
   378		},
   379		[IORING_OP_MSG_RING] = {
   380			.needs_file		= 1,
   381			.iopoll			= 1,
   382			.prep			= io_msg_ring_prep,
   383			.issue			= io_msg_ring,
   384		},
   385		[IORING_OP_FSETXATTR] = {
   386			.needs_file = 1,
   387			.prep			= io_fsetxattr_prep,
   388			.issue			= io_fsetxattr,
   389		},
   390		[IORING_OP_SETXATTR] = {
   391			.prep			= io_setxattr_prep,
   392			.issue			= io_setxattr,
   393		},
   394		[IORING_OP_FGETXATTR] = {
   395			.needs_file = 1,
   396			.prep			= io_fgetxattr_prep,
   397			.issue			= io_fgetxattr,
   398		},
   399		[IORING_OP_GETXATTR] = {
   400			.prep			= io_getxattr_prep,
   401			.issue			= io_getxattr,
   402		},
   403		[IORING_OP_SOCKET] = {
   404			.audit_skip		= 1,
   405	#if defined(CONFIG_NET)
   406			.prep			= io_socket_prep,
   407			.issue			= io_socket,
   408	#else
   409			.prep			= io_eopnotsupp_prep,
   410	#endif
   411		},
   412		[IORING_OP_URING_CMD] = {
   413			.needs_file		= 1,
   414			.plug			= 1,
   415			.iopoll			= 1,
   416			.iopoll_queue		= 1,
   417			.async_size		= 2 * sizeof(struct io_uring_sqe),
   418			.prep			= io_uring_cmd_prep,
   419			.issue			= io_uring_cmd,
   420		},
   421		[IORING_OP_SEND_ZC] = {
   422			.needs_file		= 1,
   423			.unbound_nonreg_file	= 1,
   424			.pollout		= 1,
   425			.audit_skip		= 1,
   426			.ioprio			= 1,
   427			.async_size		= sizeof(struct io_async_msghdr),
   428	#if defined(CONFIG_NET)
   429			.prep			= io_send_zc_prep,
   430			.issue			= io_send_zc,
   431	#else
   432			.prep			= io_eopnotsupp_prep,
   433	#endif
   434		},
   435		[IORING_OP_SENDMSG_ZC] = {
   436			.needs_file		= 1,
   437			.unbound_nonreg_file	= 1,
   438			.pollout		= 1,
   439			.ioprio			= 1,
   440			.async_size		= sizeof(struct io_async_msghdr),
   441	#if defined(CONFIG_NET)
   442			.prep			= io_send_zc_prep,
   443			.issue			= io_sendmsg_zc,
   444	#else
   445			.prep			= io_eopnotsupp_prep,
   446	#endif
   447		},
   448		[IORING_OP_READ_MULTISHOT] = {
   449			.needs_file		= 1,
   450			.unbound_nonreg_file	= 1,
   451			.pollin			= 1,
   452			.buffer_select		= 1,
   453			.audit_skip		= 1,
   454			.async_size		= sizeof(struct io_async_rw),
   455			.prep			= io_read_mshot_prep,
   456			.issue			= io_read_mshot,
   457		},
   458		[IORING_OP_WAITID] = {
   459			.async_size		= sizeof(struct io_waitid_async),
   460			.prep			= io_waitid_prep,
   461			.issue			= io_waitid,
   462		},
   463		[IORING_OP_FUTEX_WAIT] = {
   464	#if defined(CONFIG_FUTEX)
   465			.prep			= io_futex_prep,
   466			.issue			= io_futex_wait,
   467	#else
   468			.prep			= io_eopnotsupp_prep,
   469	#endif
   470		},
   471		[IORING_OP_FUTEX_WAKE] = {
   472	#if defined(CONFIG_FUTEX)
   473			.prep			= io_futex_prep,
   474			.issue			= io_futex_wake,
   475	#else
   476			.prep			= io_eopnotsupp_prep,
   477	#endif
   478		},
   479		[IORING_OP_FUTEX_WAITV] = {
   480	#if defined(CONFIG_FUTEX)
   481			.prep			= io_futexv_prep,
   482			.issue			= io_futexv_wait,
   483	#else
   484			.prep			= io_eopnotsupp_prep,
   485	#endif
   486		},
   487		[IORING_OP_FIXED_FD_INSTALL] = {
   488			.needs_file		= 1,
   489			.prep			= io_install_fixed_fd_prep,
   490			.issue			= io_install_fixed_fd,
   491		},
   492		[IORING_OP_FTRUNCATE] = {
   493			.needs_file		= 1,
   494			.hash_reg_file		= 1,
   495			.prep			= io_ftruncate_prep,
   496			.issue			= io_ftruncate,
   497		},
   498	};
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
