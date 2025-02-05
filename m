Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A5114D2A2;
	Wed,  5 Feb 2025 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764599; cv=none; b=QS4ZCyM1/N+do/oNbPvEgzdTgsTNXcKoL64NvOcJ1wSSY5hTodMxGNQ5WKE8d83RGeckaMGmmcbAlZUvADyk68BM6kC3c6mVNw3/gadb9LUVPppYW6ElW2uan0mj5Zcl/ui7wm8ZxlnQSPM2BfsiDX5zvY3lK/PwoNSsltFnyHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764599; c=relaxed/simple;
	bh=1O5ZeTHqPRYGz771h1s1xElxt4/YLxv3AYwH1YMVPrA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P7i4Bgx12d+oJrGUZl/RLQ9Jwv/Mpo042nu+iiCJbL4DlapaTyi4ye7k5o47sa5GFXWKdkPtkf6nKicllb8kvx4UwwcZzg2ErPZiwKk7Kdm7CqUaduheMIuDHmgcZAghnzSsMBReiTpK3SQb2UDCzVBA3FwbkVcgi/uvIwigS+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhq8AJE/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhq8AJE/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738764597; x=1770300597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1O5ZeTHqPRYGz771h1s1xElxt4/YLxv3AYwH1YMVPrA=;
  b=mhq8AJE/n0R+dAOWvwUat+OQ630HNvOxP/r8CYEYz9ZKQf/bZy0sMq4a
   sjGr+gCrvx51VK3CQdb4Q6fTlbUpH4Tim+/acgl5uUyY5aJytqTBkxARD
   sjPWCvIw2w/+HBAFPtFFrhPWan1mg3zQoNS26Cxg8w2Y7vxM3cZjrPaxx
   LQ0VpwCtOO4dkR0p+6PsxPdK/3OaW2pXWYMpU/boCKM2rk1ui2amMqIe2
   An/hxY9gHbmOyjTaERKxMjVwSXH7foaaowd3G/HhZtaCFQyKDDFAACYo7
   aoW7Vzi2+Rnz1xVK2/NHGb2a1WQiE/uTEHt+tUpTW9cd8MGGb9CdzDXps
   g==;
X-CSE-ConnectionGUID: ht2NIw95TPOhr9HmxsfSFw==
X-CSE-MsgGUID: na9mCqwuQTKj7FUxQnUP4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39356808"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39356808"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 06:09:57 -0800
X-CSE-ConnectionGUID: ou5cNDP0SB2NKPdA7A4yUA==
X-CSE-MsgGUID: afmz+aeyToaIfkjwR574eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141811693"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 06:09:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfg6C-000uBv-05;
	Wed, 05 Feb 2025 14:09:52 +0000
Date: Wed, 5 Feb 2025 22:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [brauner-vfs:vfs.all 10/38] kernel/signal.c:4091:3: error: expected
 expression
Message-ID: <202502052137.74NcNNI2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
head:   d740eaae6bc3aa29d1440413f482b153264df85d
commit: e6e4ed42f8d8be56bec57c864e07437fc887a366 [10/38] pidfd: add PIDFD_SELF* sentinels to refer to own thread/process
config: hexagon-randconfig-001-20250205 (https://download.01.org/0day-ci/archive/20250205/202502052137.74NcNNI2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502052137.74NcNNI2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502052137.74NcNNI2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/signal.c:4091:3: error: expected expression
    4091 |                 CLASS(fd, f)(pidfd);
         |                 ^
   include/linux/cleanup.h:258:2: note: expanded from macro 'CLASS'
     258 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:140:1: note: expanded from here
     140 | class_fd_t
         | ^
>> kernel/signal.c:4092:16: error: use of undeclared identifier 'f'
    4092 |                 if (fd_empty(f))
         |                              ^
   kernel/signal.c:4096:30: error: use of undeclared identifier 'f'
    4096 |                 pid = pidfd_to_pid(fd_file(f));
         |                                            ^
   kernel/signal.c:4104:15: error: use of undeclared identifier 'f'
    4104 |                 if (fd_file(f)->f_flags & PIDFD_THREAD)
         |                             ^
   4 errors generated.


vim +4091 kernel/signal.c

e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4052  
3eb39f47934f9d Christian Brauner 2018-11-19  4053  /**
c732327f04a381 Christian Brauner 2019-06-04  4054   * sys_pidfd_send_signal - Signal a process through a pidfd
c732327f04a381 Christian Brauner 2019-06-04  4055   * @pidfd:  file descriptor of the process
c732327f04a381 Christian Brauner 2019-06-04  4056   * @sig:    signal to send
c732327f04a381 Christian Brauner 2019-06-04  4057   * @info:   signal info
c732327f04a381 Christian Brauner 2019-06-04  4058   * @flags:  future flags
3eb39f47934f9d Christian Brauner 2018-11-19  4059   *
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4060   * Send the signal to the thread group or to the individual thread depending
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4061   * on PIDFD_THREAD.
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4062   * In the future extension to @flags may be used to override the default scope
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4063   * of @pidfd.
3eb39f47934f9d Christian Brauner 2018-11-19  4064   *
3eb39f47934f9d Christian Brauner 2018-11-19  4065   * Return: 0 on success, negative errno on failure
3eb39f47934f9d Christian Brauner 2018-11-19  4066   */
3eb39f47934f9d Christian Brauner 2018-11-19  4067  SYSCALL_DEFINE4(pidfd_send_signal, int, pidfd, int, sig,
3eb39f47934f9d Christian Brauner 2018-11-19  4068  		siginfo_t __user *, info, unsigned int, flags)
3eb39f47934f9d Christian Brauner 2018-11-19  4069  {
3eb39f47934f9d Christian Brauner 2018-11-19  4070  	struct pid *pid;
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4071  	enum pid_type type;
3eb39f47934f9d Christian Brauner 2018-11-19  4072  
3eb39f47934f9d Christian Brauner 2018-11-19  4073  	/* Enforce flags be set to 0 until we add an extension. */
e1fb1dc08e7346 Christian Brauner 2024-02-09  4074  	if (flags & ~PIDFD_SEND_SIGNAL_FLAGS)
e1fb1dc08e7346 Christian Brauner 2024-02-09  4075  		return -EINVAL;
e1fb1dc08e7346 Christian Brauner 2024-02-09  4076  
e1fb1dc08e7346 Christian Brauner 2024-02-09  4077  	/* Ensure that only a single signal scope determining flag is set. */
e1fb1dc08e7346 Christian Brauner 2024-02-09  4078  	if (hweight32(flags & PIDFD_SEND_SIGNAL_FLAGS) > 1)
3eb39f47934f9d Christian Brauner 2018-11-19  4079  		return -EINVAL;
3eb39f47934f9d Christian Brauner 2018-11-19  4080  
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4081  	switch (pidfd) {
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4082  	case PIDFD_SELF_THREAD:
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4083  		pid = get_task_pid(current, PIDTYPE_PID);
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4084  		type = PIDTYPE_PID;
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4085  		break;
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4086  	case PIDFD_SELF_THREAD_GROUP:
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4087  		pid = get_task_pid(current, PIDTYPE_TGID);
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4088  		type = PIDTYPE_TGID;
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4089  		break;
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4090  	default:
8152f820108835 Al Viro           2024-07-19 @4091  		CLASS(fd, f)(pidfd);
8152f820108835 Al Viro           2024-07-19 @4092  		if (fd_empty(f))
3eb39f47934f9d Christian Brauner 2018-11-19  4093  			return -EBADF;
3eb39f47934f9d Christian Brauner 2018-11-19  4094  
3eb39f47934f9d Christian Brauner 2018-11-19  4095  		/* Is this a pidfd? */
1da91ea87aefe2 Al Viro           2024-05-31  4096  		pid = pidfd_to_pid(fd_file(f));
8152f820108835 Al Viro           2024-07-19  4097  		if (IS_ERR(pid))
8152f820108835 Al Viro           2024-07-19  4098  			return PTR_ERR(pid);
3eb39f47934f9d Christian Brauner 2018-11-19  4099  
3eb39f47934f9d Christian Brauner 2018-11-19  4100  		if (!access_pidfd_pidns(pid))
8152f820108835 Al Viro           2024-07-19  4101  			return -EINVAL;
3eb39f47934f9d Christian Brauner 2018-11-19  4102  
e1fb1dc08e7346 Christian Brauner 2024-02-09  4103  		/* Infer scope from the type of pidfd. */
1da91ea87aefe2 Al Viro           2024-05-31  4104  		if (fd_file(f)->f_flags & PIDFD_THREAD)
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4105  			type = PIDTYPE_PID;
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4106  		else
81b9d8ac0640b2 Oleg Nesterov     2024-02-09  4107  			type = PIDTYPE_TGID;
3eb39f47934f9d Christian Brauner 2018-11-19  4108  
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4109  		return do_pidfd_send_signal(pid, sig, type, info, flags);
3eb39f47934f9d Christian Brauner 2018-11-19  4110  	}
3eb39f47934f9d Christian Brauner 2018-11-19  4111  
e6e4ed42f8d8be Lorenzo Stoakes   2025-01-30  4112  	return do_pidfd_send_signal(pid, sig, type, info, flags);
3eb39f47934f9d Christian Brauner 2018-11-19  4113  }
3eb39f47934f9d Christian Brauner 2018-11-19  4114  

:::::: The code at line 4091 was first introduced by commit
:::::: 8152f8201088350c76bb9685cd5990dd51d59aff fdget(), more trivial conversions

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
