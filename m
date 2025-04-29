Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC72D322D;
	Tue, 29 Apr 2025 14:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745935999; cv=none; b=fp4Rv39CuUJbgjJe0JLCOBMf9wXI4Xx7Ga0mWWktZnRHgkwKKF5x4KDoradW31aEvJX4Jb6CjThEFGbf831cacPRKWFjQrVT/F5mMCAH0MZpjOTZtClovdytVh+tRcnR314h4LY7olvssCcjFOn3M2OzMpmmCbIYyFB9qrV17CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745935999; c=relaxed/simple;
	bh=Yu7f9tzi6LX1C8UdNtJGalMf9pu2ilKEueJGgLENWAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtpNp+kV5nlgU5yIqTb/E9wa0EwRBRnQqCPo0e789e7HM+yzbONRFWTz1t8sMm8UKfq2oNnR5Hl5NYNwPXExJnPTSl0X/8WTrq+ArfAdtWtQMCwb9H5xCNJG0lqwJVAfDFZJUSnplpwIjt5ELip+k/2nj8oqkf4f36cbdQ3aheY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIuO5GNN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIuO5GNN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745935998; x=1777471998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yu7f9tzi6LX1C8UdNtJGalMf9pu2ilKEueJGgLENWAE=;
  b=GIuO5GNNwgOQDMd8TPE5j6N0hiIj2RmbhSksF1fO0ZoxRpFXPgsTDICl
   PmRHhIc9wddVJIUVyhutK4X/aIdN1l0Erj0Fd4QGGSj0BwfEiI0OExxQ9
   4KWZyZ1jT6H8cDkKtV/NI/hIDPI15cOYEsD1XmzC5SM0FkQpITiFhGnCw
   P8uIvNMxLCZHl4iZOzMO613T1EgGfx3sHjdk/Es3Mw3hG5K6NGCn75TaC
   E/TtQzdlto60SKAwBaZbCD1Ihgw5idV7+YUaDs4rabY810sDdP9FmPV43
   +K9C5bwdi4xTSreu2+3nJOkIspa0LBTlE0/EN4BOE6Krc4pFBO6DYjhv1
   Q==;
X-CSE-ConnectionGUID: DU95cQpKSGWtrcZ0VBAFmA==
X-CSE-MsgGUID: GuOtcIBdRqiP5gxoxLgTlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47654138"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47654138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 07:12:57 -0700
X-CSE-ConnectionGUID: LiH06JmYRpCXr7FKVNMURA==
X-CSE-MsgGUID: oLAD9oZ4SxOleM7Mv5wh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="137869491"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 29 Apr 2025 07:12:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9lhc-0000lL-2T;
	Tue, 29 Apr 2025 14:12:52 +0000
Date: Tue, 29 Apr 2025 22:12:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket 5/7] fs/coredump.c:838:undefined
 reference to `__sys_socket_file'
Message-ID: <202504292132.X8Dp1ivB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket
head:   d8ddde5ebf795ed29f5878dcb81155d7d284a2ea
commit: 2361e84e09b447644c90d5af5863c54862461935 [5/7] coredump: add COREDUMP_SOCK
config: s390-randconfig-001-20250429 (https://download.01.org/0day-ci/archive/20250429/202504292132.X8Dp1ivB-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504292132.X8Dp1ivB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504292132.X8Dp1ivB-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: fs/coredump.o: in function `do_coredump':
>> fs/coredump.c:838:(.text+0xebe): undefined reference to `__sys_socket_file'
>> s390x-linux-ld: fs/coredump.c:843:(.text+0x125e): undefined reference to `__sys_connect_file'
>> s390x-linux-ld: fs/coredump.c:847:(.text+0x1486): undefined reference to `sock_from_file'
>> s390x-linux-ld: fs/coredump.c:847:(.text+0x1490): undefined reference to `__sys_shutdown_sock'


vim +838 fs/coredump.c

   608	
   609	void do_coredump(const kernel_siginfo_t *siginfo)
   610	{
   611		struct core_state core_state;
   612		struct core_name cn;
   613		struct mm_struct *mm = current->mm;
   614		struct linux_binfmt * binfmt;
   615		const struct cred *old_cred;
   616		struct cred *cred;
   617		int retval = 0;
   618		size_t *argv = NULL;
   619		int argc = 0;
   620		/* require nonrelative corefile path and be extra careful */
   621		bool need_suid_safe = false;
   622		bool core_dumped = false;
   623		static atomic_t core_dump_count = ATOMIC_INIT(0);
   624		struct coredump_params cprm = {
   625			.siginfo = siginfo,
   626			.limit = rlimit(RLIMIT_CORE),
   627			/*
   628			 * We must use the same mm->flags while dumping core to avoid
   629			 * inconsistency of bit flags, since this flag is not protected
   630			 * by any locks.
   631			 */
   632			.mm_flags = mm->flags,
   633			.vma_meta = NULL,
   634			.cpu = raw_smp_processor_id(),
   635		};
   636	
   637		audit_core_dumps(siginfo->si_signo);
   638	
   639		binfmt = mm->binfmt;
   640		if (!binfmt || !binfmt->core_dump)
   641			goto fail;
   642		if (!__get_dumpable(cprm.mm_flags))
   643			goto fail;
   644	
   645		cred = prepare_creds();
   646		if (!cred)
   647			goto fail;
   648		/*
   649		 * We cannot trust fsuid as being the "true" uid of the process
   650		 * nor do we know its entire history. We only know it was tainted
   651		 * so we dump it as root in mode 2, and only into a controlled
   652		 * environment (pipe handler or fully qualified path).
   653		 */
   654		if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
   655			/* Setuid core dump mode */
   656			cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
   657			need_suid_safe = true;
   658		}
   659	
   660		retval = coredump_wait(siginfo->si_signo, &core_state);
   661		if (retval < 0)
   662			goto fail_creds;
   663	
   664		old_cred = override_creds(cred);
   665	
   666		retval = format_corename(&cn, &cprm, &argv, &argc);
   667		if (retval < 0) {
   668			coredump_report_failure("format_corename failed, aborting core");
   669			goto fail_unlock;
   670		}
   671	
   672		switch (cn.core_type) {
   673		case COREDUMP_FILE: {
   674			struct mnt_idmap *idmap;
   675			struct inode *inode;
   676			int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
   677					 O_LARGEFILE | O_EXCL;
   678	
   679			if (cprm.limit < binfmt->min_coredump)
   680				goto fail_unlock;
   681	
   682			if (need_suid_safe && cn.corename[0] != '/') {
   683				coredump_report_failure(
   684					"this process can only dump core to a fully qualified path, skipping core dump");
   685				goto fail_unlock;
   686			}
   687	
   688			/*
   689			 * Unlink the file if it exists unless this is a SUID
   690			 * binary - in that case, we're running around with root
   691			 * privs and don't want to unlink another user's coredump.
   692			 */
   693			if (!need_suid_safe) {
   694				/*
   695				 * If it doesn't exist, that's fine. If there's some
   696				 * other problem, we'll catch it at the filp_open().
   697				 */
   698				do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
   699			}
   700	
   701			/*
   702			 * There is a race between unlinking and creating the
   703			 * file, but if that causes an EEXIST here, that's
   704			 * fine - another process raced with us while creating
   705			 * the corefile, and the other process won. To userspace,
   706			 * what matters is that at least one of the two processes
   707			 * writes its coredump successfully, not which one.
   708			 */
   709			if (need_suid_safe) {
   710				/*
   711				 * Using user namespaces, normal user tasks can change
   712				 * their current->fs->root to point to arbitrary
   713				 * directories. Since the intention of the "only dump
   714				 * with a fully qualified path" rule is to control where
   715				 * coredumps may be placed using root privileges,
   716				 * current->fs->root must not be used. Instead, use the
   717				 * root directory of init_task.
   718				 */
   719				struct path root;
   720	
   721				task_lock(&init_task);
   722				get_fs_root(init_task.fs, &root);
   723				task_unlock(&init_task);
   724				cprm.file = file_open_root(&root, cn.corename,
   725							   open_flags, 0600);
   726				path_put(&root);
   727			} else {
   728				cprm.file = filp_open(cn.corename, open_flags, 0600);
   729			}
   730			if (IS_ERR(cprm.file))
   731				goto fail_unlock;
   732	
   733			inode = file_inode(cprm.file);
   734			if (inode->i_nlink > 1)
   735				goto close_fail;
   736			if (d_unhashed(cprm.file->f_path.dentry))
   737				goto close_fail;
   738			/*
   739			 * AK: actually i see no reason to not allow this for named
   740			 * pipes etc, but keep the previous behaviour for now.
   741			 */
   742			if (!S_ISREG(inode->i_mode))
   743				goto close_fail;
   744			/*
   745			 * Don't dump core if the filesystem changed owner or mode
   746			 * of the file during file creation. This is an issue when
   747			 * a process dumps core while its cwd is e.g. on a vfat
   748			 * filesystem.
   749			 */
   750			idmap = file_mnt_idmap(cprm.file);
   751			if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
   752					    current_fsuid())) {
   753				coredump_report_failure("Core dump to %s aborted: "
   754					"cannot preserve file owner", cn.corename);
   755				goto close_fail;
   756			}
   757			if ((inode->i_mode & 0677) != 0600) {
   758				coredump_report_failure("Core dump to %s aborted: "
   759					"cannot preserve file permissions", cn.corename);
   760				goto close_fail;
   761			}
   762			if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
   763				goto close_fail;
   764			if (do_truncate(idmap, cprm.file->f_path.dentry,
   765					0, 0, cprm.file))
   766				goto close_fail;
   767			break;
   768		}
   769		case COREDUMP_PIPE: {
   770			int argi;
   771			int dump_count;
   772			char **helper_argv;
   773			struct subprocess_info *sub_info;
   774	
   775			if (cprm.limit == 1) {
   776				/* See umh_coredump_setup() which sets RLIMIT_CORE = 1.
   777				 *
   778				 * Normally core limits are irrelevant to pipes, since
   779				 * we're not writing to the file system, but we use
   780				 * cprm.limit of 1 here as a special value, this is a
   781				 * consistent way to catch recursive crashes.
   782				 * We can still crash if the core_pattern binary sets
   783				 * RLIM_CORE = !1, but it runs as root, and can do
   784				 * lots of stupid things.
   785				 *
   786				 * Note that we use task_tgid_vnr here to grab the pid
   787				 * of the process group leader.  That way we get the
   788				 * right pid if a thread in a multi-threaded
   789				 * core_pattern process dies.
   790				 */
   791				coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
   792				goto fail_unlock;
   793			}
   794			cprm.limit = RLIM_INFINITY;
   795	
   796			dump_count = atomic_inc_return(&core_dump_count);
   797			if (core_pipe_limit && (core_pipe_limit < dump_count)) {
   798				coredump_report_failure("over core_pipe_limit, skipping core dump");
   799				goto fail_dropcount;
   800			}
   801	
   802			helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
   803						    GFP_KERNEL);
   804			if (!helper_argv) {
   805				coredump_report_failure("%s failed to allocate memory", __func__);
   806				goto fail_dropcount;
   807			}
   808			for (argi = 0; argi < argc; argi++)
   809				helper_argv[argi] = cn.corename + argv[argi];
   810			helper_argv[argi] = NULL;
   811	
   812			retval = -ENOMEM;
   813			sub_info = call_usermodehelper_setup(helper_argv[0],
   814							helper_argv, NULL, GFP_KERNEL,
   815							umh_coredump_setup, NULL, &cprm);
   816			if (sub_info)
   817				retval = call_usermodehelper_exec(sub_info,
   818								  UMH_WAIT_EXEC);
   819	
   820			kfree(helper_argv);
   821			if (retval) {
   822				coredump_report_failure("|%s pipe failed", cn.corename);
   823				goto close_fail;
   824			}
   825			break;
   826		}
   827		case COREDUMP_SOCK: {
   828			struct file *file __free(fput) = NULL;
   829			struct sockaddr_un unix_addr = {
   830				.sun_family = AF_UNIX,
   831			};
   832			struct sockaddr_storage *addr;
   833	
   834			retval = strscpy(unix_addr.sun_path, cn.corename, sizeof(unix_addr.sun_path));
   835			if (retval < 0)
   836				goto close_fail;
   837	
 > 838			file = __sys_socket_file(AF_UNIX, SOCK_STREAM, 0);
   839			if (IS_ERR(file))
   840				goto close_fail;
   841	
   842			addr = (struct sockaddr_storage *)(&unix_addr);
 > 843			retval = __sys_connect_file(file, addr, sizeof(unix_addr), O_CLOEXEC);
   844			if (retval)
   845				goto close_fail;
   846	
 > 847			retval =  __sys_shutdown_sock(sock_from_file(file), SHUT_RD);
   848			if (retval)
   849				goto close_fail;
   850	
   851			cprm.file = no_free_ptr(file);
   852			break;
   853		}
   854		default:
   855			WARN_ON_ONCE(true);
   856			retval = -EINVAL;
   857			goto close_fail;
   858		}
   859	
   860		/* get us an unshared descriptor table; almost always a no-op */
   861		/* The cell spufs coredump code reads the file descriptor tables */
   862		retval = unshare_files();
   863		if (retval)
   864			goto close_fail;
   865		if (!dump_interrupted()) {
   866			/*
   867			 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
   868			 * have this set to NULL.
   869			 */
   870			if (!cprm.file) {
   871				coredump_report_failure("Core dump to |%s disabled", cn.corename);
   872				goto close_fail;
   873			}
   874			if (!dump_vma_snapshot(&cprm))
   875				goto close_fail;
   876	
   877			file_start_write(cprm.file);
   878			core_dumped = binfmt->core_dump(&cprm);
   879			/*
   880			 * Ensures that file size is big enough to contain the current
   881			 * file postion. This prevents gdb from complaining about
   882			 * a truncated file if the last "write" to the file was
   883			 * dump_skip.
   884			 */
   885			if (cprm.to_skip) {
   886				cprm.to_skip--;
   887				dump_emit(&cprm, "", 1);
   888			}
   889			file_end_write(cprm.file);
   890			free_vma_snapshot(&cprm);
   891		}
   892		if ((cn.core_type == COREDUMP_PIPE) && core_pipe_limit)
   893			wait_for_dump_helpers(cprm.file);
   894	close_fail:
   895		if (cprm.file)
   896			filp_close(cprm.file, NULL);
   897	fail_dropcount:
   898		if (cn.core_type == COREDUMP_PIPE)
   899			atomic_dec(&core_dump_count);
   900	fail_unlock:
   901		kfree(argv);
   902		kfree(cn.corename);
   903		coredump_finish(core_dumped);
   904		revert_creds(old_cred);
   905	fail_creds:
   906		put_cred(cred);
   907	fail:
   908		return;
   909	}
   910	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
