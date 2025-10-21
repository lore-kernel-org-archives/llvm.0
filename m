Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085D257431;
	Tue, 21 Oct 2025 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761010567; cv=none; b=r+KtVdP87MJRhIaChZyIBCVPxO7co46p/RoD1hWlmCsAc6aroxTfVw58oJG90GGqBb2bfkZv9uAZsoQ5VcCD+ya9YxmcAGp5TZFPYr2vxXMdjP3tci/kSYeb3oohF/owCBpNvlyU4UKYzPJASjFpgYnXZGOXlWk2ATrqEV9Bhto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761010567; c=relaxed/simple;
	bh=21nqHSeS51b9qxQayy14YmY+cu/HzerVvQyaJ2o8iAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ru1y/3ksspyqtdJ5OHG/KgxSW0JW1TTeuf0eFrAUVRkRGpJvg/x7K32JwbgeJzJ/pdYuBRHes77WV/4+NoDm0PAXRHnsf82FxkJCHWqeHhbTRXips1RWChYmFpY1AyMZEtWSaWp8fka7XTjXu9wIbsJ5GasVi1+JvFhl0iyh1yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gys1Tw0q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gys1Tw0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761010562; x=1792546562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=21nqHSeS51b9qxQayy14YmY+cu/HzerVvQyaJ2o8iAs=;
  b=Gys1Tw0qPgusE2s0AJSI5LmCtxhs36kQhU/pPm6tHVO/UEZ80ISdCNrI
   F7DeCUFWNU/GGxBmyB984ujKq1flGVPsGyw+MHhhZT4hdnA12/RouMBRD
   pP3yS36yh0lXJ5onaXRPwjueeudy49oq1c/xTL4a6bIq3/jYapHAOoaNP
   3U1A0jBwVDU2wYoZZS22eM1WPpQeB59vsg4SSRkJGjkjEm0cmvszkXeQS
   d9JY6zx9a2k3znH3LoRKHQCvLjGcTC3pCF1ZvbME3bdrXy/j36vuzzSAb
   BDLSGn8hTllo82+UbJYsTHgpZslMSogOfxWWiRzq6mF/+cpD6k+XOax0Y
   g==;
X-CSE-ConnectionGUID: kERmXKEBTw6dZQDR944VEg==
X-CSE-MsgGUID: AM3++DF8RBCK44F9FxqFxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62342264"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="62342264"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 18:36:00 -0700
X-CSE-ConnectionGUID: AJZ9KInoRBK3dJY3Pa1T0w==
X-CSE-MsgGUID: EyGCvV98TAu75juBA/b5vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="182616348"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 20 Oct 2025 18:35:59 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB1I4-000ALp-2R;
	Tue, 21 Oct 2025 01:35:56 +0000
Date: Tue, 21 Oct 2025 09:35:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 19/19] fs/fcntl.c:555:9: error: call to undeclared
 function 'fcntl_getdeleg'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202510210932.IJ54HObd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   1fe66e11bc8440fdda126ec2e814e899eeb18554
commit: 1fe66e11bc8440fdda126ec2e814e899eeb18554 [19/19] vfs: add F_SET/GETDELEG fcntl() commands
config: x86_64-buildonly-randconfig-003-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210932.IJ54HObd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210932.IJ54HObd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510210932.IJ54HObd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/fcntl.c:555:9: error: call to undeclared function 'fcntl_getdeleg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     555 |                 err = fcntl_getdeleg(filp);
         |                       ^
>> fs/fcntl.c:560:9: error: call to undeclared function 'fcntl_setdeleg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     560 |                 err = fcntl_setdeleg(fd, filp, &deleg);
         |                       ^
   2 errors generated.


vim +/fcntl_getdeleg +555 fs/fcntl.c

   443	
   444	static long do_fcntl(int fd, unsigned int cmd, unsigned long arg,
   445			struct file *filp)
   446	{
   447		void __user *argp = (void __user *)arg;
   448		struct delegation deleg;
   449		int argi = (int)arg;
   450		struct flock flock;
   451		long err = -EINVAL;
   452	
   453		switch (cmd) {
   454		case F_CREATED_QUERY:
   455			err = f_created_query(filp);
   456			break;
   457		case F_DUPFD:
   458			err = f_dupfd(argi, filp, 0);
   459			break;
   460		case F_DUPFD_CLOEXEC:
   461			err = f_dupfd(argi, filp, O_CLOEXEC);
   462			break;
   463		case F_DUPFD_QUERY:
   464			err = f_dupfd_query(argi, filp);
   465			break;
   466		case F_GETFD:
   467			err = get_close_on_exec(fd) ? FD_CLOEXEC : 0;
   468			break;
   469		case F_SETFD:
   470			err = 0;
   471			set_close_on_exec(fd, argi & FD_CLOEXEC);
   472			break;
   473		case F_GETFL:
   474			err = filp->f_flags;
   475			break;
   476		case F_SETFL:
   477			err = setfl(fd, filp, argi);
   478			break;
   479	#if BITS_PER_LONG != 32
   480		/* 32-bit arches must use fcntl64() */
   481		case F_OFD_GETLK:
   482	#endif
   483		case F_GETLK:
   484			if (copy_from_user(&flock, argp, sizeof(flock)))
   485				return -EFAULT;
   486			err = fcntl_getlk(filp, cmd, &flock);
   487			if (!err && copy_to_user(argp, &flock, sizeof(flock)))
   488				return -EFAULT;
   489			break;
   490	#if BITS_PER_LONG != 32
   491		/* 32-bit arches must use fcntl64() */
   492		case F_OFD_SETLK:
   493		case F_OFD_SETLKW:
   494			fallthrough;
   495	#endif
   496		case F_SETLK:
   497		case F_SETLKW:
   498			if (copy_from_user(&flock, argp, sizeof(flock)))
   499				return -EFAULT;
   500			err = fcntl_setlk(fd, filp, cmd, &flock);
   501			break;
   502		case F_GETOWN:
   503			/*
   504			 * XXX If f_owner is a process group, the
   505			 * negative return value will get converted
   506			 * into an error.  Oops.  If we keep the
   507			 * current syscall conventions, the only way
   508			 * to fix this will be in libc.
   509			 */
   510			err = f_getown(filp);
   511			force_successful_syscall_return();
   512			break;
   513		case F_SETOWN:
   514			err = f_setown(filp, argi, 1);
   515			break;
   516		case F_GETOWN_EX:
   517			err = f_getown_ex(filp, arg);
   518			break;
   519		case F_SETOWN_EX:
   520			err = f_setown_ex(filp, arg);
   521			break;
   522		case F_GETOWNER_UIDS:
   523			err = f_getowner_uids(filp, arg);
   524			break;
   525		case F_GETSIG:
   526			err = f_owner_sig(filp, 0, false);
   527			break;
   528		case F_SETSIG:
   529			err = f_owner_sig(filp, argi, true);
   530			break;
   531		case F_GETLEASE:
   532			err = fcntl_getlease(filp);
   533			break;
   534		case F_SETLEASE:
   535			err = fcntl_setlease(fd, filp, argi);
   536			break;
   537		case F_NOTIFY:
   538			err = fcntl_dirnotify(fd, filp, argi);
   539			break;
   540		case F_SETPIPE_SZ:
   541		case F_GETPIPE_SZ:
   542			err = pipe_fcntl(filp, cmd, argi);
   543			break;
   544		case F_ADD_SEALS:
   545		case F_GET_SEALS:
   546			err = memfd_fcntl(filp, cmd, argi);
   547			break;
   548		case F_GET_RW_HINT:
   549			err = fcntl_get_rw_hint(filp, arg);
   550			break;
   551		case F_SET_RW_HINT:
   552			err = fcntl_set_rw_hint(filp, arg);
   553			break;
   554		case F_GETDELEG:
 > 555			err = fcntl_getdeleg(filp);
   556			break;
   557		case F_SETDELEG:
   558			if (copy_from_user(&deleg, argp, sizeof(deleg)))
   559				return -EFAULT;
 > 560			err = fcntl_setdeleg(fd, filp, &deleg);
   561			break;
   562		default:
   563			break;
   564		}
   565		return err;
   566	}
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
