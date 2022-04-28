Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5E4A32
	for <llvm@lists.linux.dev>; Thu, 28 Apr 2022 02:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651111227; x=1682647227;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfb2JQKIEUIcp5WzHorLM12KqDUQGOVwvksyMLMZF0Q=;
  b=CETV5hUKBTSPqKzChk/59awtrawpaWgSTXDNdxkTLZBVsaW1OBXBxeZe
   mEF67KPldWjTqAGLDrEvvTNflCGOonMlBQ/ZONkLYKsdzmCQ/vYCyVjds
   KPRqMIoua0t3O6WShqPgWD3oVnfZsOXkyHS8y/q360IxyCl9PWJoTHeQI
   j615xPzEJaiEQ+aSZufGxzI7uEOCSUQ5X17vbHExN8ok3Oz21nfcGU23j
   0LrgixGY/UctGQoG4xs+rqfG3jd5ywsEdtEErbRSLSJxufHoXaRmtPgbd
   aljW2xn8oRBvwMt5/omvnDsMNM1vrnzYiG3ErG3MPxc6Jl/cLJ8snn41Y
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265655107"
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; 
   d="scan'208";a="265655107"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2022 19:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,294,1643702400"; 
   d="scan'208";a="651004367"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 27 Apr 2022 19:00:24 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njtSB-0004xq-Le;
	Thu, 28 Apr 2022 02:00:23 +0000
Date: Thu, 28 Apr 2022 09:59:45 +0800
From: kernel test robot <lkp@intel.com>
To: Li kunyu <kunyu@nfschina.com>, ebiederm@xmission.com,
	keescook@chromium.org, tglx@linutronix.de, elver@google.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, oleg@redhat.com,
	legion@kernel.org, linux-kernel@vger.kernel.org,
	Li kunyu <kunyu@nfschina.com>
Subject: Re: [PATCH] kernel: Optimize unused integer return values
Message-ID: <202204280331.Wzldxt2P-lkp@intel.com>
References: <20220427073448.10730-1-kunyu@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427073448.10730-1-kunyu@nfschina.com>

Hi Li,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kees/for-next/pstore]
[also build test ERROR on linus/master linux/master v5.18-rc4 next-20220427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-kunyu/kernel-Optimize-unused-integer-return-values/20220427-153840
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220428/202204280331.Wzldxt2P-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ddb369ae612f4391ae754aca94dec2ffc0ea68aa
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Li-kunyu/kernel-Optimize-unused-integer-return-values/20220427-153840
        git checkout ddb369ae612f4391ae754aca94dec2ffc0ea68aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/signal.c:3536:2: error: void function 'post_copy_siginfo_from_user32' should not return a value [-Wreturn-type]
           return 0;
           ^      ~
   1 error generated.


vim +/post_copy_siginfo_from_user32 +3536 kernel/signal.c

ea64d5acc8f033 Eric W. Biederman 2018-01-15  3463  
ddb369ae612f43 Li kunyu          2022-04-27  3464  static void post_copy_siginfo_from_user32(kernel_siginfo_t *to,
601d5abfeaf244 Eric W. Biederman 2018-10-05  3465  					 const struct compat_siginfo *from)
212a36a17efe4d Eric W. Biederman 2017-07-31  3466  {
212a36a17efe4d Eric W. Biederman 2017-07-31  3467  	clear_siginfo(to);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3468  	to->si_signo = from->si_signo;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3469  	to->si_errno = from->si_errno;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3470  	to->si_code  = from->si_code;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3471  	switch(siginfo_layout(from->si_signo, from->si_code)) {
212a36a17efe4d Eric W. Biederman 2017-07-31  3472  	case SIL_KILL:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3473  		to->si_pid = from->si_pid;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3474  		to->si_uid = from->si_uid;
212a36a17efe4d Eric W. Biederman 2017-07-31  3475  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3476  	case SIL_TIMER:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3477  		to->si_tid     = from->si_tid;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3478  		to->si_overrun = from->si_overrun;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3479  		to->si_int     = from->si_int;
212a36a17efe4d Eric W. Biederman 2017-07-31  3480  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3481  	case SIL_POLL:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3482  		to->si_band = from->si_band;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3483  		to->si_fd   = from->si_fd;
212a36a17efe4d Eric W. Biederman 2017-07-31  3484  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3485  	case SIL_FAULT:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3486  		to->si_addr = compat_ptr(from->si_addr);
9abcabe3111811 Eric W. Biederman 2021-04-30  3487  		break;
9abcabe3111811 Eric W. Biederman 2021-04-30  3488  	case SIL_FAULT_TRAPNO:
9abcabe3111811 Eric W. Biederman 2021-04-30  3489  		to->si_addr = compat_ptr(from->si_addr);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3490  		to->si_trapno = from->si_trapno;
31931c93dfe05a Eric W. Biederman 2018-04-24  3491  		break;
31931c93dfe05a Eric W. Biederman 2018-04-24  3492  	case SIL_FAULT_MCEERR:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3493  		to->si_addr = compat_ptr(from->si_addr);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3494  		to->si_addr_lsb = from->si_addr_lsb;
31931c93dfe05a Eric W. Biederman 2018-04-24  3495  		break;
31931c93dfe05a Eric W. Biederman 2018-04-24  3496  	case SIL_FAULT_BNDERR:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3497  		to->si_addr = compat_ptr(from->si_addr);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3498  		to->si_lower = compat_ptr(from->si_lower);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3499  		to->si_upper = compat_ptr(from->si_upper);
31931c93dfe05a Eric W. Biederman 2018-04-24  3500  		break;
31931c93dfe05a Eric W. Biederman 2018-04-24  3501  	case SIL_FAULT_PKUERR:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3502  		to->si_addr = compat_ptr(from->si_addr);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3503  		to->si_pkey = from->si_pkey;
212a36a17efe4d Eric W. Biederman 2017-07-31  3504  		break;
f4ac73023449e6 Eric W. Biederman 2021-04-30  3505  	case SIL_FAULT_PERF_EVENT:
fb6cc127e0b6e6 Marco Elver       2021-04-08  3506  		to->si_addr = compat_ptr(from->si_addr);
0683b53197b553 Eric W. Biederman 2021-05-02  3507  		to->si_perf_data = from->si_perf_data;
0683b53197b553 Eric W. Biederman 2021-05-02  3508  		to->si_perf_type = from->si_perf_type;
fb6cc127e0b6e6 Marco Elver       2021-04-08  3509  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3510  	case SIL_CHLD:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3511  		to->si_pid    = from->si_pid;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3512  		to->si_uid    = from->si_uid;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3513  		to->si_status = from->si_status;
212a36a17efe4d Eric W. Biederman 2017-07-31  3514  #ifdef CONFIG_X86_X32_ABI
212a36a17efe4d Eric W. Biederman 2017-07-31  3515  		if (in_x32_syscall()) {
601d5abfeaf244 Eric W. Biederman 2018-10-05  3516  			to->si_utime = from->_sifields._sigchld_x32._utime;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3517  			to->si_stime = from->_sifields._sigchld_x32._stime;
212a36a17efe4d Eric W. Biederman 2017-07-31  3518  		} else
212a36a17efe4d Eric W. Biederman 2017-07-31  3519  #endif
212a36a17efe4d Eric W. Biederman 2017-07-31  3520  		{
601d5abfeaf244 Eric W. Biederman 2018-10-05  3521  			to->si_utime = from->si_utime;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3522  			to->si_stime = from->si_stime;
212a36a17efe4d Eric W. Biederman 2017-07-31  3523  		}
212a36a17efe4d Eric W. Biederman 2017-07-31  3524  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3525  	case SIL_RT:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3526  		to->si_pid = from->si_pid;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3527  		to->si_uid = from->si_uid;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3528  		to->si_int = from->si_int;
212a36a17efe4d Eric W. Biederman 2017-07-31  3529  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3530  	case SIL_SYS:
601d5abfeaf244 Eric W. Biederman 2018-10-05  3531  		to->si_call_addr = compat_ptr(from->si_call_addr);
601d5abfeaf244 Eric W. Biederman 2018-10-05  3532  		to->si_syscall   = from->si_syscall;
601d5abfeaf244 Eric W. Biederman 2018-10-05  3533  		to->si_arch      = from->si_arch;
212a36a17efe4d Eric W. Biederman 2017-07-31  3534  		break;
212a36a17efe4d Eric W. Biederman 2017-07-31  3535  	}
212a36a17efe4d Eric W. Biederman 2017-07-31 @3536  	return 0;
212a36a17efe4d Eric W. Biederman 2017-07-31  3537  }
601d5abfeaf244 Eric W. Biederman 2018-10-05  3538  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
