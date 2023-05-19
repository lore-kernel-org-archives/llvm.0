Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36897F3;
	Fri, 19 May 2023 07:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684481224; x=1716017224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cDZUxybV82ENuFT7gQjGTerT2spMQBCksOiPKJxTKp4=;
  b=MbGDXk8YuGqVNQlt15nybnJJS7DH7KB9NypltKx5/APg8JyhhYWk4yOh
   4Lj8V7D5k5qzuHUnl02fOFZnq51nikOo1Sw1VPsnu3Y7BXJkqOWIfQEyc
   VGEC/mDbjeos+OyurKqQLgr2UpDCM475th5kTrC3wHEmBObYxy0oxXVTO
   j39lR9hZcVyD/mLls/2pGteqYxqD5Af66cBZUjW5fOsz5KNUWBVuBZzJq
   6DssaYN7cpQqRwduXfkWrU7/4gI5Lp8g9lkbaYUfsbAB7P3jUPiWkSLkw
   lzOH1uXuTspGdnf3bVKYBFhwoyC8kSSWbMzIiqzp3vfjlakmXZS6AWSvg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="415769481"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="415769481"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2023 00:27:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="733200302"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400"; 
   d="scan'208";a="733200302"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 19 May 2023 00:27:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzuVy-000AgO-1B;
	Fri, 19 May 2023 07:27:02 +0000
Date: Fri, 19 May 2023 15:26:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Christie <michael.christie@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 8/8] fork/vhost_task: remove no_files
Message-ID: <202305191545.gVEMXTDt-lkp@intel.com>
References: <20230518000920.191583-9-michael.christie@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230518000920.191583-9-michael.christie@oracle.com>

Hi Mike,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.4-rc2 next-20230519]
[cannot apply to mst-vhost/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mike-Christie/signal-Dequeue-SIGKILL-even-if-SIGNAL_GROUP_EXIT-group_exec_task-is-set/20230518-081200
base:   linus/master
patch link:    https://lore.kernel.org/r/20230518000920.191583-9-michael.christie%40oracle.com
patch subject: [RFC PATCH 8/8] fork/vhost_task: remove no_files
config: hexagon-buildonly-randconfig-r003-20230517 (https://download.01.org/0day-ci/archive/20230519/202305191545.gVEMXTDt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d18f7c90da8b141f82ec5a17a21a58ce6af1b977
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mike-Christie/signal-Dequeue-SIGKILL-even-if-SIGNAL_GROUP_EXIT-group_exec_task-is-set/20230518-081200
        git checkout d18f7c90da8b141f82ec5a17a21a58ce6af1b977
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305191545.gVEMXTDt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/vhost_task.c:99:35: error: incompatible integer to pointer conversion initializing 'int *' with an expression of type 'int' [-Wint-conversion]
                                     CLONE_THREAD | CLONE_FILES, CLONE_SIGHAND,
                                                                 ^~~~~~~~~~~~~
   include/uapi/linux/sched.h:14:23: note: expanded from macro 'CLONE_SIGHAND'
   #define CLONE_SIGHAND   0x00000800      /* set if signal handlers and blocked signals shared */
                           ^~~~~~~~~~
   1 error generated.


vim +99 kernel/vhost_task.c

    83	
    84	/**
    85	 * vhost_task_create - create a copy of a process to be used by the kernel
    86	 * @fn: thread stack
    87	 * @arg: data to be passed to fn
    88	 * @name: the thread's name
    89	 *
    90	 * This returns a specialized task for use by the vhost layer or NULL on
    91	 * failure. The returned task is inactive, and the caller must fire it up
    92	 * through vhost_task_start().
    93	 */
    94	struct vhost_task *vhost_task_create(int (*fn)(void *), void *arg,
    95					     const char *name)
    96	{
    97		struct kernel_clone_args args = {
    98			.flags		= CLONE_FS | CLONE_UNTRACED | CLONE_VM |
  > 99					  CLONE_THREAD | CLONE_FILES, CLONE_SIGHAND,
   100			.exit_signal	= 0,
   101			.fn		= vhost_task_fn,
   102			.name		= name,
   103			.user_worker	= 1,
   104			.block_signals	= 1,
   105		};
   106		struct vhost_task *vtsk;
   107		struct task_struct *tsk;
   108	
   109		vtsk = kzalloc(sizeof(*vtsk), GFP_KERNEL);
   110		if (!vtsk)
   111			return NULL;
   112		init_completion(&vtsk->exited);
   113		vtsk->data = arg;
   114		vtsk->fn = fn;
   115	
   116		args.fn_arg = vtsk;
   117	
   118		tsk = copy_process(NULL, 0, NUMA_NO_NODE, &args);
   119		if (IS_ERR(tsk)) {
   120			kfree(vtsk);
   121			return NULL;
   122		}
   123	
   124		vtsk->task = tsk;
   125		return vtsk;
   126	}
   127	EXPORT_SYMBOL_GPL(vhost_task_create);
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
