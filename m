Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A977E;
	Sat, 21 Jan 2023 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674313109; x=1705849109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWqYWW9AiOigUr6eFnzMG/Kyd+9zgxWEPcz+7ITAyms=;
  b=V0iX2nEn13Nk+HZfZCcf5OMH17oclmRXQHyoIArXDQkGlWzUD/TzNEYy
   b13YYEfBKrBaLDrkhKsOkSoUExbnRwY+auqpF4UzxjhLI1Swlr8ngwlCH
   zn+b+L19kdv2jBb+yFc1RkcsqqUkeAl31PaO4E54UV1c6iq5B4FUcaFgw
   VAFmgpXv120SJHptjKtd85eg5xj8MdHzEoWNeTC20lNTlHleNmiLWSuMn
   /IFyfXyWbnFgLLmuDniAZNmIGhxH95l+wBYdhGA5GcGNja8qc0mRjTptp
   pWN2w5se7Yux6Jzbx8v/L7iukADWKO0kq9X31vkOZDRY1tz9BrcpglnDz
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="305458652"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="305458652"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 06:58:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="834752275"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="834752275"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Jan 2023 06:58:27 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJFK6-0004Ba-0x;
	Sat, 21 Jan 2023 14:58:26 +0000
Date: Sat, 21 Jan 2023 22:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 15/26] kernel/bpf/trampoline.c:1236:8:
 error: implicit declaration of function 'set_filter_ftrace_direct_multi' is
 invalid in C99
Message-ID: <202301212207.XqiRKGL9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   e79b272f8d9eb2a5990c18c3e4db22f7eb2fe9bc
commit: 344656556fbfdfcd3164ffb4d3e9bda0358bae81 [15/26] bpf: Add support to attach multi trampolines
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230121/202301212207.XqiRKGL9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=344656556fbfdfcd3164ffb4d3e9bda0358bae81
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi
        git checkout 344656556fbfdfcd3164ffb4d3e9bda0358bae81
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/trampoline.c:1236:8: error: implicit declaration of function 'set_filter_ftrace_direct_multi' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           err = set_filter_ftrace_direct_multi(tr->fops, ips, tr->multi.bmap->cnt,
                 ^
   kernel/bpf/trampoline.c:1236:8: note: did you mean 'register_ftrace_direct_multi'?
   include/linux/ftrace.h:445:19: note: 'register_ftrace_direct_multi' declared here
   static inline int register_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long addr)
                     ^
   1 error generated.


vim +/set_filter_ftrace_direct_multi +1236 kernel/bpf/trampoline.c

  1226	
  1227	static int trampoline_multi_reset_bmap(struct bpf_trampoline *tr)
  1228	{
  1229		unsigned long *ips;
  1230		int err;
  1231	
  1232		err = btf_bitmap_funcs_resolve(tr->multi.bmap, &ips);
  1233		if (err)
  1234			return err;
  1235		mutex_lock(&tr->mutex);
> 1236		err = set_filter_ftrace_direct_multi(tr->fops, ips, tr->multi.bmap->cnt,
  1237						     (unsigned long) tr->cur_image->image);
  1238		mutex_unlock(&tr->mutex);
  1239		kfree(ips);
  1240		return err;
  1241	}
  1242	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
