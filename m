Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B090B33C1
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 20:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660162327; x=1691698327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hnavblcy/9Z9lk4G3KmLerA46bJwvJS4f8sUG+q8GaU=;
  b=MLSGyjk1Untr3mZ8CVZyKdM/iLNmRjqsMVvK/W/DoKUFlf+7Wd3sGLlX
   Em1WbA7ip+M+FIfmLKeTjo6MVUhnfexdDo+Hs4eaa+uvun1NBsFzIf/QM
   C8mn+b0KjEZdFMC2UB2KrWEsSyODCFlTU3DmFyiZutq6dZYhDeTtCSNe4
   Og5KsXT7pk0f8Cj+TFe1ayzGIIrFqGyU8/4KisiDqpEAQIPbny5nLxpwV
   qHyqFbwQSnIpwmxgIAWjXC38W+6Vng0vEugKCN5rYuLZjUsVPo4nwtCRH
   BrYTXaYhttlMHfCeDjv1bSPKYwSgN9bnGDsxDCSIiqgQmAuaTdJY6D7d0
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="274236638"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="274236638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2022 13:12:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; 
   d="scan'208";a="747556497"
Received: from lkp-server02.sh.intel.com (HELO 5d6b42aa80b8) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 10 Aug 2022 13:12:04 -0700
Received: from kbuild by 5d6b42aa80b8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLs3f-0000fl-2z;
	Wed, 10 Aug 2022 20:12:03 +0000
Date: Thu, 11 Aug 2022 04:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:bpf/bpf/master 1/2] kernel/bpf/syscall.c:5089:5:
 warning: no previous prototype for function 'kern_sys_bpf'
Message-ID: <202208110447.5dGsjBot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf/master
head:   86f44fcec22ce2979507742bc53db8400e454f46
commit: 86f44fcec22ce2979507742bc53db8400e454f46 [1/2] bpf: Disallow bpf programs call prog_run command.
config: arm64-randconfig-r003-20220810 (https://download.01.org/0day-ci/archive/20220811/202208110447.5dGsjBot-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/86f44fcec22ce2979507742bc53db8400e454f46
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf/master
        git checkout 86f44fcec22ce2979507742bc53db8400e454f46
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/syscall.c:5089:5: warning: no previous prototype for function 'kern_sys_bpf' [-Wmissing-prototypes]
   int kern_sys_bpf(int cmd, union bpf_attr *attr, unsigned int size)
       ^
   kernel/bpf/syscall.c:5089:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int kern_sys_bpf(int cmd, union bpf_attr *attr, unsigned int size)
   ^
   static 
   1 warning generated.


vim +/kern_sys_bpf +5089 kernel/bpf/syscall.c

  5088	
> 5089	int kern_sys_bpf(int cmd, union bpf_attr *attr, unsigned int size)
  5090	{
  5091		struct bpf_prog * __maybe_unused prog;
  5092		struct bpf_tramp_run_ctx __maybe_unused run_ctx;
  5093	
  5094		switch (cmd) {
  5095	#ifdef CONFIG_BPF_JIT /* __bpf_prog_enter_sleepable used by trampoline and JIT */
  5096		case BPF_PROG_TEST_RUN:
  5097			if (attr->test.data_in || attr->test.data_out ||
  5098			    attr->test.ctx_out || attr->test.duration ||
  5099			    attr->test.repeat || attr->test.flags)
  5100				return -EINVAL;
  5101	
  5102			prog = bpf_prog_get_type(attr->test.prog_fd, BPF_PROG_TYPE_SYSCALL);
  5103			if (IS_ERR(prog))
  5104				return PTR_ERR(prog);
  5105	
  5106			if (attr->test.ctx_size_in < prog->aux->max_ctx_offset ||
  5107			    attr->test.ctx_size_in > U16_MAX) {
  5108				bpf_prog_put(prog);
  5109				return -EINVAL;
  5110			}
  5111	
  5112			run_ctx.bpf_cookie = 0;
  5113			run_ctx.saved_run_ctx = NULL;
  5114			if (!__bpf_prog_enter_sleepable(prog, &run_ctx)) {
  5115				/* recursion detected */
  5116				bpf_prog_put(prog);
  5117				return -EBUSY;
  5118			}
  5119			attr->test.retval = bpf_prog_run(prog, (void *) (long) attr->test.ctx_in);
  5120			__bpf_prog_exit_sleepable(prog, 0 /* bpf_prog_run does runtime stats */, &run_ctx);
  5121			bpf_prog_put(prog);
  5122			return 0;
  5123	#endif
  5124		default:
  5125			return ____bpf_sys_bpf(cmd, attr, size);
  5126		}
  5127	}
  5128	EXPORT_SYMBOL(kern_sys_bpf);
  5129	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
