Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E531876
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650541629; x=1682077629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2F/BcEcvdUM4LUPv2mjDfcTeIXqj17vQlDnB2vFPKM8=;
  b=OPQnQzF4WOoo7JaGH3707jqubQf37dnTuD2OU56iNqwGMSJv0NBhkhaA
   h6tQNMLwXL4AF2qgVDOpTllDAyvYXcQ53h5bo+Smk2aThs1YNWyLqfu+C
   lqUaMUICBNijM3KbdgFjWi2/1rPjhryF5vGnshyQGo1h3HlcwkUD9hFzE
   Z0ZVrFhrh8iXR7tPMz8LdADv80nkQmeSIcDdWPVhOAZRDBaAqFvTcipdM
   cQz8EszLkhGf23CTbGTbu6wWmcCgFeBqp2YhnbrLJZaPCSlllDPlGch0c
   Bi1TkVPquRXeeyGGWObDC+eHKAz8Q7cC8mns/yF+PZ7Yi1URIbAuxImKJ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="246221336"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="246221336"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 04:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="577183829"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Apr 2022 04:47:00 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhVH2-0008M6-5L;
	Thu, 21 Apr 2022 11:47:00 +0000
Date: Thu, 21 Apr 2022 19:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH] ptrace: Don't change __state
Message-ID: <202204211957.AbHAsMyV-lkp@intel.com>
References: <875yn3zdag.fsf_-_@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875yn3zdag.fsf_-_@email.froward.int.ebiederm.org>

Hi "Eric,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.18-rc3 next-20220421]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/ptrace-Don-t-change-__state/20220421-045703
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b253435746d9a4a701b5f09211b9c14d3370d0da
config: hexagon-randconfig-r045-20220420 (https://download.01.org/0day-ci/archive/20220421/202204211957.AbHAsMyV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7d3fafb75102c0e8d5282487c2822d0f3b301aa9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Eric-W-Biederman/ptrace-Don-t-change-__state/20220421-045703
        git checkout 7d3fafb75102c0e8d5282487c2822d0f3b301aa9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/ptrace.c:894:6: warning: variable 'need_siglock' is uninitialized when used here [-Wuninitialized]
           if (need_siglock)
               ^~~~~~~~~~~~
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                      ^~~~
   kernel/ptrace.c:852:19: note: initialize the variable 'need_siglock' to silence this warning
           bool need_siglock;
                            ^
                             = 0
   1 warning generated.


vim +/need_siglock +894 kernel/ptrace.c

36df29d7994180 Roland McGrath 2008-01-30  868  
5b88abbf770a0e Roland McGrath 2008-01-30  869  	if (is_singleblock(request)) {
5b88abbf770a0e Roland McGrath 2008-01-30  870  		if (unlikely(!arch_has_block_step()))
5b88abbf770a0e Roland McGrath 2008-01-30  871  			return -EIO;
5b88abbf770a0e Roland McGrath 2008-01-30  872  		user_enable_block_step(child);
5b88abbf770a0e Roland McGrath 2008-01-30  873  	} else if (is_singlestep(request) || is_sysemu_singlestep(request)) {
36df29d7994180 Roland McGrath 2008-01-30  874  		if (unlikely(!arch_has_single_step()))
36df29d7994180 Roland McGrath 2008-01-30  875  			return -EIO;
36df29d7994180 Roland McGrath 2008-01-30  876  		user_enable_single_step(child);
3a709703538c47 Roland McGrath 2009-04-07  877  	} else {
36df29d7994180 Roland McGrath 2008-01-30  878  		user_disable_single_step(child);
3a709703538c47 Roland McGrath 2009-04-07  879  	}
36df29d7994180 Roland McGrath 2008-01-30  880  
b72c186999e689 Oleg Nesterov  2015-04-16  881  	/*
b72c186999e689 Oleg Nesterov  2015-04-16  882  	 * Change ->exit_code and ->state under siglock to avoid the race
b72c186999e689 Oleg Nesterov  2015-04-16  883  	 * with wait_task_stopped() in between; a non-zero ->exit_code will
b72c186999e689 Oleg Nesterov  2015-04-16  884  	 * wrongly look like another report from tracee.
b72c186999e689 Oleg Nesterov  2015-04-16  885  	 *
b72c186999e689 Oleg Nesterov  2015-04-16  886  	 * Note that we need siglock even if ->exit_code == data and/or this
b72c186999e689 Oleg Nesterov  2015-04-16  887  	 * status was not reported yet, the new status must not be cleared by
b72c186999e689 Oleg Nesterov  2015-04-16  888  	 * wait_task_stopped() after resume.
b72c186999e689 Oleg Nesterov  2015-04-16  889  	 *
b72c186999e689 Oleg Nesterov  2015-04-16  890  	 * If data == 0 we do not care if wait_task_stopped() reports the old
b72c186999e689 Oleg Nesterov  2015-04-16  891  	 * status and clears the code too; this can't race with the tracee, it
b72c186999e689 Oleg Nesterov  2015-04-16  892  	 * takes siglock after resume.
b72c186999e689 Oleg Nesterov  2015-04-16  893  	 */
b72c186999e689 Oleg Nesterov  2015-04-16 @894  	if (need_siglock)
b72c186999e689 Oleg Nesterov  2015-04-16  895  		spin_lock_irq(&child->sighand->siglock);
36df29d7994180 Roland McGrath 2008-01-30  896  	child->exit_code = data;
0666fb51b1483f Oleg Nesterov  2011-05-25  897  	wake_up_state(child, __TASK_TRACED);
b72c186999e689 Oleg Nesterov  2015-04-16  898  	if (need_siglock)
b72c186999e689 Oleg Nesterov  2015-04-16  899  		spin_unlock_irq(&child->sighand->siglock);
36df29d7994180 Roland McGrath 2008-01-30  900  
36df29d7994180 Roland McGrath 2008-01-30  901  	return 0;
36df29d7994180 Roland McGrath 2008-01-30  902  }
36df29d7994180 Roland McGrath 2008-01-30  903  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
