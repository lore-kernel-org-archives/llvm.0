Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7D320EC
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 03:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657079312; x=1688615312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BB74kNCn1H0ZUogSQH8rxo8EKrnpqfYmnsJGGMCkQ2o=;
  b=M/PDyEHpAfTT+QMwOZrLzc+H/rRhjlmXkFFlQy4gNcEpbZKzXJXhdiIX
   oFX53kj7V5fb0DbRBkhB/fZU/jwpZZsAJVRvtEJ+1X5sPvh6laoDaiZyn
   LKBPSwAaHcFH2LcYa86pphA9+6Rr6ij4X7nTgxWa4mTqjZT5xvlOXnmi6
   PEYOmIL+M2w46q2VtCH3Y30tylfgC5ZgeOkjvm4MUFmTfUpPzJO54XGgT
   K18dWGGEsFWwfnbXtR/4vx00IQuQJG86x2/T0Vr41GvwI6eZBWevnTsRf
   QbKtY1ylySmqc9zvKSj+TQb9FxOTuFxccYQq/RhHJwt6XuSl3bXF0XuWt
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="281184344"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="281184344"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2022 20:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; 
   d="scan'208";a="919977049"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2022 20:48:22 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8w1V-000JyD-Cd;
	Wed, 06 Jul 2022 03:48:21 +0000
Date: Wed, 6 Jul 2022 11:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jolsa-perf:bpf/tramp_22 21/21] kernel/bpf/syscall.c:3137:15: error:
 call to undeclared function 'bpf_trampoline_multi_detach'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202207061102.sgu5KQzw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tramp_22
head:   1d891c46bb689a24985cea58f4eddb053d6b1331
commit: 1d891c46bb689a24985cea58f4eddb053d6b1331 [21/21] bpf: Add support to attach multi trampolines
config: x86_64-randconfig-a012 (https://download.01.org/0day-ci/archive/20220706/202207061102.sgu5KQzw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 142aca7741d5b06207e87bf4880fbe308c8d6823)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=1d891c46bb689a24985cea58f4eddb053d6b1331
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tramp_22
        git checkout 1d891c46bb689a24985cea58f4eddb053d6b1331
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/bpf/syscall.c:3137:15: error: call to undeclared function 'bpf_trampoline_multi_detach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           WARN_ON_ONCE(bpf_trampoline_multi_detach(&tr_link->tp, tr_link->id));
                        ^
   kernel/bpf/syscall.c:3307:7: error: call to undeclared function 'bpf_tramp_id_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           id = bpf_tramp_id_alloc(cnt);
                ^
   kernel/bpf/syscall.c:3307:5: warning: incompatible integer to pointer conversion assigning to 'struct bpf_tramp_id *' from 'int' [-Wint-conversion]
           id = bpf_tramp_id_alloc(cnt);
              ^ ~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/syscall.c:3348:8: error: call to undeclared function 'bpf_trampoline_multi_attach'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = bpf_trampoline_multi_attach(&link->tp, id);
                 ^
   kernel/bpf/syscall.c:3348:8: note: did you mean 'bpf_tracing_multi_attach'?
   kernel/bpf/syscall.c:3292:12: note: 'bpf_tracing_multi_attach' declared here
   static int bpf_tracing_multi_attach(struct bpf_prog *prog,
              ^
   1 warning and 3 errors generated.


vim +/bpf_trampoline_multi_detach +3137 kernel/bpf/syscall.c

  3131	
  3132	static void bpf_tracing_multi_link_release(struct bpf_link *link)
  3133	{
  3134		struct bpf_tracing_multi_link *tr_link =
  3135			container_of(link, struct bpf_tracing_multi_link, link);
  3136	
> 3137		WARN_ON_ONCE(bpf_trampoline_multi_detach(&tr_link->tp, tr_link->id));
  3138	}
  3139	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
