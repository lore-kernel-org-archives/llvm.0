Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7411C2B
	for <llvm@lists.linux.dev>; Sun, 10 Jul 2022 19:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657480226; x=1689016226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Sr38xJM7rG2LsJ2u/A6vSrlv1ER55RqfPr58rXKOdQ=;
  b=hjrb6pO4zf0dp0vVsmBoMRwTmEuZg3wnYkFOe6OnCsw69S2+73/hwVDr
   q/Lsd3kiX8pNywBSVQMO18BDqldVkuSGFtuMZNLgL3M3T3fHQ2seaHxi7
   JGk6SVokcriVJA6s195BYfPBffNQsBEl3nbl751wPxJ9vJIfTJ60nT6Bw
   sBFulD9MopZTUGjC6nAJsjG2MyJhAnwAM5/PiACErhk7b1xbKXkjgZfwH
   dnAzcVQViVZJFuoHGZRtQ5dRLzKi2tP94nYI7oLBmbvaH3uPPK4gJH66D
   M+fuKpYhiPIRhPxnsMBKILNmBCRD87OtrxJ2WRfbLY2b6HiTrPDAdEMeJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="267574953"
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="267574953"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2022 12:10:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,261,1650956400"; 
   d="scan'208";a="544772245"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Jul 2022 12:10:24 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oAcJz-000Q7F-Cx;
	Sun, 10 Jul 2022 19:10:23 +0000
Date: Mon, 11 Jul 2022 03:10:01 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:bpf/tramp_27 24/33] kernel/bpf/trampoline.c:315:14:
 error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202207110343.uPXNDCd7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tramp_27
head:   08201713df8992b94d140b43fd4f20f1ad4aedb3
commit: 83e7574907cf2bdc5e551a6e39a2b897d0830062 [24/33] bpf: Add support to attach multi trampolines
config: arm-randconfig-r021-20220710 (https://download.01.org/0day-ci/archive/20220711/202207110343.uPXNDCd7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6ce63e267aab79ca87bf63453d34dd3909ab978d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=83e7574907cf2bdc5e551a6e39a2b897d0830062
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tramp_27
        git checkout 83e7574907cf2bdc5e551a6e39a2b897d0830062
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:315:14: error: call to undeclared function 'is_tracing_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           *multi |= is_tracing_multi(prog->expected_attach_type);
                                     ^
   kernel/bpf/trampoline.c:947:9: error: call to undeclared function 'ftrace_hash_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           hash = ftrace_hash_alloc(FTRACE_HASH_MAX_BITS);
                  ^
   kernel/bpf/trampoline.c:947:27: error: use of undeclared identifier 'FTRACE_HASH_MAX_BITS'
           hash = ftrace_hash_alloc(FTRACE_HASH_MAX_BITS);
                                    ^
   kernel/bpf/trampoline.c:974:5: error: call to undeclared function 'ftrace_hash_add_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                   ftrace_hash_add_entry(hash, entry);
                                   ^
   kernel/bpf/trampoline.c:984:4: error: call to undeclared function 'ftrace_hash_add_entry'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ftrace_hash_add_entry(hash, entry);
                           ^
   kernel/bpf/trampoline.c:988:8: error: call to undeclared function 'set_ftrace_direct'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = set_ftrace_direct(hash);
                 ^
   kernel/bpf/trampoline.c:990:2: error: call to undeclared function 'ftrace_hash_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           ftrace_hash_free(hash);
           ^
   7 errors generated.


vim +/is_tracing_multi +315 kernel/bpf/trampoline.c

   287	
   288	static struct bpf_tramp_progs *
   289	bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_arg, bool *multi)
   290	{
   291		const struct bpf_prog_array_item *item;
   292		struct bpf_prog_array *prog_array;
   293		struct bpf_tramp_progs *tprogs;
   294		struct bpf_tramp_prog *tp;
   295		struct bpf_prog *prog;
   296		int kind;
   297	
   298		*total = 0;
   299		tprogs = kcalloc(BPF_TRAMP_MAX, sizeof(*tprogs), GFP_KERNEL);
   300		if (!tprogs)
   301			return ERR_PTR(-ENOMEM);
   302	
   303		for (kind = 0; kind < BPF_TRAMP_MAX; kind++) {
   304			tprogs[kind].nr_progs = tr->progs_cnt[kind];
   305			*total += tr->progs_cnt[kind];
   306			tp = &tprogs[kind].progs[0];
   307	
   308			prog_array = tr->progs_array[kind];
   309			if (!prog_array)
   310				continue;
   311			item = &prog_array->items[0];
   312	
   313			while ((prog = READ_ONCE(item->prog))) {
   314				*ip_arg |= prog->call_get_func_ip;
 > 315				*multi |= is_tracing_multi(prog->expected_attach_type);
   316				tp->prog = prog;
   317				tp->cookie = item->bpf_cookie;
   318				tp++; item++;
   319			}
   320		}
   321		return tprogs;
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
