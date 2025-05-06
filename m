Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBD672633;
	Tue,  6 May 2025 07:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746515560; cv=none; b=L9kB4OUyxf75duQouoLkrHzeN70Fu3cQsA/6sCs7Q9IUxIVEcGOJf8nj4X4apP0o5J2Rrw3MLSzmfdK8gc3MJPjU0W6XAcjn25Y86QolWSNPL30Oi8kEDCOa/DBflFIF727D4l7Lg716GFQLwH0rxo0JEbzxdMsYIFdL4G5tl7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746515560; c=relaxed/simple;
	bh=hVy5eIBHLWuh00Ha0Bb53IF5Ims8UciisLsh+Vq1MTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kTkAyLNybVSAdPxiv08I/UvKKhMQctVqIZKwu3dWVQx5HIshVVPYXWamckHxM5Z+/GgvCe/Zv5KqK8XN6fHwmcIb+o+hGRGnmz4lNExaSPEhBb0FeXFy1l3tKV0euFEJttpw7IUkMzSPjcHolLXnFLA8rf04TpdI7seB+SRWwlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VkAhbqN2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VkAhbqN2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746515558; x=1778051558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hVy5eIBHLWuh00Ha0Bb53IF5Ims8UciisLsh+Vq1MTA=;
  b=VkAhbqN2vpYJOA3pwOYWoOBEJcP/G4kWssMhBJK2PEtYki02efONVyAw
   zkrk1PT6FE1nrkNAQ4bUNO+pY3rdQOx/08njxvouChEyIun3bVNBIe/uI
   xt3pj/msN6Whwv4AJ/ZqJ4/sjyaRG8bWSu3BROsBougamqxU0f0pfBk/Q
   fYjEU98jpl5SaBiyxsHkb623V7OXQW1LPWiiug6ZWvWg74mIWn783SmYZ
   PGweI+oP4fBxlq7IfI8RJz4ceNYKOzr9h56bzafBLJlUc/npx3hr9diOy
   ldErmTYv7lT3lLgkRZvvrDMeGLIeFYS2RfiIY9z/6ahChHKPm9rur9G2Q
   Q==;
X-CSE-ConnectionGUID: e38wlb8kTWeqStuP5CCApQ==
X-CSE-MsgGUID: BI4F1PY7RWOmNUff7QUB4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="73563563"
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="73563563"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 00:12:37 -0700
X-CSE-ConnectionGUID: krH245DTTDSZsBGy85GPHQ==
X-CSE-MsgGUID: FiUBLqPsSZugijoasJBfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,265,1739865600"; 
   d="scan'208";a="158769218"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 May 2025 00:12:36 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCCTh-0006LB-26;
	Tue, 06 May 2025 07:12:33 +0000
Date: Tue, 6 May 2025 15:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:work.coredump.socket 11/18] fs/coredump.c:891:3:
 warning: void function 'do_coredump' should not return a value
Message-ID: <202505061537.sRLQaVw9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git work.coredump.socket
head:   d8527ff7eedddbd9827f61df7c80d9870cdc1241
commit: 1197c3157a4f679945feb70835b5db5b1baaef3f [11/18] coredump: add coredump socket
config: hexagon-randconfig-002-20250506 (https://download.01.org/0day-ci/archive/20250506/202505061537.sRLQaVw9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505061537.sRLQaVw9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505061537.sRLQaVw9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/coredump.c:891:3: warning: void function 'do_coredump' should not return a value [-Wreturn-mismatch]
     891 |                 return -EINVAL;
         |                 ^      ~~~~~~~
   1 warning generated.


vim +/do_coredump +891 fs/coredump.c

   639	
   640	void do_coredump(const kernel_siginfo_t *siginfo)
   641	{
   642		struct core_state core_state;
   643		struct core_name cn;
   644		struct mm_struct *mm = current->mm;
   645		struct linux_binfmt * binfmt;
   646		const struct cred *old_cred;
   647		struct cred *cred;
   648		int retval = 0;
   649		size_t *argv = NULL;
   650		int argc = 0;
   651		/* require nonrelative corefile path and be extra careful */
   652		bool need_suid_safe = false;
   653		bool core_dumped = false;
   654		static atomic_t core_dump_count = ATOMIC_INIT(0);
   655		struct coredump_params cprm = {
   656			.siginfo = siginfo,
   657			.limit = rlimit(RLIMIT_CORE),
   658			/*
   659			 * We must use the same mm->flags while dumping core to avoid
   660			 * inconsistency of bit flags, since this flag is not protected
   661			 * by any locks.
   662			 */
   663			.mm_flags = mm->flags,
   664			.vma_meta = NULL,
   665			.cpu = raw_smp_processor_id(),
   666		};
   667	
   668		audit_core_dumps(siginfo->si_signo);
   669	
   670		binfmt = mm->binfmt;
   671		if (!binfmt || !binfmt->core_dump)
   672			goto fail;
   673		if (!__get_dumpable(cprm.mm_flags))
   674			goto fail;
   675	
   676		cred = prepare_creds();
   677		if (!cred)
   678			goto fail;
   679		/*
   680		 * We cannot trust fsuid as being the "true" uid of the process
   681		 * nor do we know its entire history. We only know it was tainted
   682		 * so we dump it as root in mode 2, and only into a controlled
   683		 * environment (pipe handler or fully qualified path).
   684		 */
   685		if (__get_dumpable(cprm.mm_flags) == SUID_DUMP_ROOT) {
   686			/* Setuid core dump mode */
   687			cred->fsuid = GLOBAL_ROOT_UID;	/* Dump root private */
   688			need_suid_safe = true;
   689		}
   690	
   691		retval = coredump_wait(siginfo->si_signo, &core_state);
   692		if (retval < 0)
   693			goto fail_creds;
   694	
   695		old_cred = override_creds(cred);
   696	
   697		retval = format_corename(&cn, &cprm, &argv, &argc);
   698		if (retval < 0) {
   699			coredump_report_failure("format_corename failed, aborting core");
   700			goto fail_unlock;
   701		}
   702	
   703		switch (cn.core_type) {
   704		case COREDUMP_FILE: {
   705			struct mnt_idmap *idmap;
   706			struct inode *inode;
   707			int open_flags = O_CREAT | O_WRONLY | O_NOFOLLOW |
   708					 O_LARGEFILE | O_EXCL;
   709	
   710			if (cprm.limit < binfmt->min_coredump)
   711				goto fail_unlock;
   712	
   713			if (need_suid_safe && cn.corename[0] != '/') {
   714				coredump_report_failure(
   715					"this process can only dump core to a fully qualified path, skipping core dump");
   716				goto fail_unlock;
   717			}
   718	
   719			/*
   720			 * Unlink the file if it exists unless this is a SUID
   721			 * binary - in that case, we're running around with root
   722			 * privs and don't want to unlink another user's coredump.
   723			 */
   724			if (!need_suid_safe) {
   725				/*
   726				 * If it doesn't exist, that's fine. If there's some
   727				 * other problem, we'll catch it at the filp_open().
   728				 */
   729				do_unlinkat(AT_FDCWD, getname_kernel(cn.corename));
   730			}
   731	
   732			/*
   733			 * There is a race between unlinking and creating the
   734			 * file, but if that causes an EEXIST here, that's
   735			 * fine - another process raced with us while creating
   736			 * the corefile, and the other process won. To userspace,
   737			 * what matters is that at least one of the two processes
   738			 * writes its coredump successfully, not which one.
   739			 */
   740			if (need_suid_safe) {
   741				/*
   742				 * Using user namespaces, normal user tasks can change
   743				 * their current->fs->root to point to arbitrary
   744				 * directories. Since the intention of the "only dump
   745				 * with a fully qualified path" rule is to control where
   746				 * coredumps may be placed using root privileges,
   747				 * current->fs->root must not be used. Instead, use the
   748				 * root directory of init_task.
   749				 */
   750				struct path root;
   751	
   752				task_lock(&init_task);
   753				get_fs_root(init_task.fs, &root);
   754				task_unlock(&init_task);
   755				cprm.file = file_open_root(&root, cn.corename,
   756							   open_flags, 0600);
   757				path_put(&root);
   758			} else {
   759				cprm.file = filp_open(cn.corename, open_flags, 0600);
   760			}
   761			if (IS_ERR(cprm.file))
   762				goto fail_unlock;
   763	
   764			inode = file_inode(cprm.file);
   765			if (inode->i_nlink > 1)
   766				goto close_fail;
   767			if (d_unhashed(cprm.file->f_path.dentry))
   768				goto close_fail;
   769			/*
   770			 * AK: actually i see no reason to not allow this for named
   771			 * pipes etc, but keep the previous behaviour for now.
   772			 */
   773			if (!S_ISREG(inode->i_mode))
   774				goto close_fail;
   775			/*
   776			 * Don't dump core if the filesystem changed owner or mode
   777			 * of the file during file creation. This is an issue when
   778			 * a process dumps core while its cwd is e.g. on a vfat
   779			 * filesystem.
   780			 */
   781			idmap = file_mnt_idmap(cprm.file);
   782			if (!vfsuid_eq_kuid(i_uid_into_vfsuid(idmap, inode),
   783					    current_fsuid())) {
   784				coredump_report_failure("Core dump to %s aborted: "
   785					"cannot preserve file owner", cn.corename);
   786				goto close_fail;
   787			}
   788			if ((inode->i_mode & 0677) != 0600) {
   789				coredump_report_failure("Core dump to %s aborted: "
   790					"cannot preserve file permissions", cn.corename);
   791				goto close_fail;
   792			}
   793			if (!(cprm.file->f_mode & FMODE_CAN_WRITE))
   794				goto close_fail;
   795			if (do_truncate(idmap, cprm.file->f_path.dentry,
   796					0, 0, cprm.file))
   797				goto close_fail;
   798			break;
   799		}
   800		case COREDUMP_PIPE: {
   801			int argi;
   802			int dump_count;
   803			char **helper_argv;
   804			struct subprocess_info *sub_info;
   805	
   806			if (cprm.limit == 1) {
   807				/* See umh_coredump_setup() which sets RLIMIT_CORE = 1.
   808				 *
   809				 * Normally core limits are irrelevant to pipes, since
   810				 * we're not writing to the file system, but we use
   811				 * cprm.limit of 1 here as a special value, this is a
   812				 * consistent way to catch recursive crashes.
   813				 * We can still crash if the core_pattern binary sets
   814				 * RLIM_CORE = !1, but it runs as root, and can do
   815				 * lots of stupid things.
   816				 *
   817				 * Note that we use task_tgid_vnr here to grab the pid
   818				 * of the process group leader.  That way we get the
   819				 * right pid if a thread in a multi-threaded
   820				 * core_pattern process dies.
   821				 */
   822				coredump_report_failure("RLIMIT_CORE is set to 1, aborting core");
   823				goto fail_unlock;
   824			}
   825			cprm.limit = RLIM_INFINITY;
   826	
   827			dump_count = atomic_inc_return(&core_dump_count);
   828			if (core_pipe_limit && (core_pipe_limit < dump_count)) {
   829				coredump_report_failure("over core_pipe_limit, skipping core dump");
   830				goto fail_dropcount;
   831			}
   832	
   833			helper_argv = kmalloc_array(argc + 1, sizeof(*helper_argv),
   834						    GFP_KERNEL);
   835			if (!helper_argv) {
   836				coredump_report_failure("%s failed to allocate memory", __func__);
   837				goto fail_dropcount;
   838			}
   839			for (argi = 0; argi < argc; argi++)
   840				helper_argv[argi] = cn.corename + argv[argi];
   841			helper_argv[argi] = NULL;
   842	
   843			retval = -ENOMEM;
   844			sub_info = call_usermodehelper_setup(helper_argv[0],
   845							helper_argv, NULL, GFP_KERNEL,
   846							umh_coredump_setup, NULL, &cprm);
   847			if (sub_info)
   848				retval = call_usermodehelper_exec(sub_info,
   849								  UMH_WAIT_EXEC);
   850	
   851			kfree(helper_argv);
   852			if (retval) {
   853				coredump_report_failure("|%s pipe failed", cn.corename);
   854				goto close_fail;
   855			}
   856			break;
   857		}
   858		case COREDUMP_SOCK: {
   859	#ifdef CONFIG_UNIX
   860			struct file *file __free(fput) = NULL;
   861			struct socket *socket;
   862	
   863			/*
   864			 * It is possible that the userspace process which is
   865			 * supposed to handle the coredump and is listening on
   866			 * the AF_UNIX socket coredumps. Userspace should just
   867			 * mark itself non dumpable.
   868			 */
   869	
   870			retval = sock_create_kern(&init_net, AF_UNIX, SOCK_STREAM, 0, &socket);
   871			if (retval < 0)
   872				goto close_fail;
   873	
   874			file = sock_alloc_file(socket, 0, NULL);
   875			if (IS_ERR(file)) {
   876				sock_release(socket);
   877				retval = PTR_ERR(file);
   878				goto close_fail;
   879			}
   880	
   881			retval = kernel_connect(socket,
   882						(struct sockaddr *)(&coredump_unix_socket),
   883						COREDUMP_UNIX_SOCKET_ADDR_SIZE, 0);
   884			if (retval)
   885				goto close_fail;
   886	
   887			cprm.limit = RLIM_INFINITY;
   888			cprm.file = no_free_ptr(file);
   889	#else
   890			coredump_report_failure("Coredump socket support %s disabled", cn.corename);
 > 891			return -EINVAL;
   892	#endif
   893			break;
   894		}
   895		default:
   896			WARN_ON_ONCE(true);
   897			retval = -EINVAL;
   898			goto close_fail;
   899		}
   900	
   901		/* get us an unshared descriptor table; almost always a no-op */
   902		/* The cell spufs coredump code reads the file descriptor tables */
   903		retval = unshare_files();
   904		if (retval)
   905			goto close_fail;
   906		if (!dump_interrupted()) {
   907			/*
   908			 * umh disabled with CONFIG_STATIC_USERMODEHELPER_PATH="" would
   909			 * have this set to NULL.
   910			 */
   911			if (!cprm.file) {
   912				coredump_report_failure("Core dump to |%s disabled", cn.corename);
   913				goto close_fail;
   914			}
   915			if (!dump_vma_snapshot(&cprm))
   916				goto close_fail;
   917	
   918			file_start_write(cprm.file);
   919			core_dumped = binfmt->core_dump(&cprm);
   920			/*
   921			 * Ensures that file size is big enough to contain the current
   922			 * file postion. This prevents gdb from complaining about
   923			 * a truncated file if the last "write" to the file was
   924			 * dump_skip.
   925			 */
   926			if (cprm.to_skip) {
   927				cprm.to_skip--;
   928				dump_emit(&cprm, "", 1);
   929			}
   930			file_end_write(cprm.file);
   931			free_vma_snapshot(&cprm);
   932		}
   933	
   934		/*
   935		 * When core_pipe_limit is set we wait for the coredump server
   936		 * or usermodehelper to finish before exiting so it can e.g.,
   937		 * inspect /proc/<pid>.
   938		 */
   939		if (core_pipe_limit) {
   940			switch (cn.core_type) {
   941			case COREDUMP_PIPE:
   942				wait_for_dump_helpers(cprm.file);
   943				break;
   944			case COREDUMP_SOCK: {
   945				char buf[1];
   946				/*
   947				 * We use a simple read to wait for the coredump
   948				 * processing to finish. Either the socket is
   949				 * closed or we get sent unexpected data. In
   950				 * both cases, we're done.
   951				 */
   952				__kernel_read(cprm.file, buf, 1, NULL);
   953				break;
   954			}
   955			default:
   956				break;
   957			}
   958		}
   959	
   960	close_fail:
   961		if (cprm.file)
   962			filp_close(cprm.file, NULL);
   963	fail_dropcount:
   964		if (cn.core_type == COREDUMP_PIPE)
   965			atomic_dec(&core_dump_count);
   966	fail_unlock:
   967		kfree(argv);
   968		kfree(cn.corename);
   969		coredump_finish(core_dumped);
   970		revert_creds(old_cred);
   971	fail_creds:
   972		put_cred(cred);
   973	fail:
   974		return;
   975	}
   976	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
