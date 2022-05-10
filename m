Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C962F4E
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652222872; x=1683758872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oCorWBDZgyr85ZjU4xVV0U2n3wx9Gdw1/P9F/jPxx84=;
  b=T/Nj0+HqJsJEkFEZadRwelsnBokkXigNyoPN1YnnbgqFzbSIkLzEP6fv
   eTaVpnYtVyDE61dwybpakAebm6yFKL+ookzmxteBx1mVOtKyhD9SEiYCt
   LhfjIx65lIUyUub+BUjViawygir+BLkV5F25t0KOvCQciRg7exlpotw4f
   O7CSRxVZhh1yWzO/y3dwfMLk5mHeIONNH3ZJ97HWs6mpUjEytuMgJwrFe
   013uwDUx5+vI4mTxAcSQkoDlUtYF8AwXMoXsey8wcJG/ElQsOvLavIVJq
   NR5hedAWPKb6/krqvf6buc83GoIkKhdsMG4SiOprsQgnC2e9Xwr+9sI6+
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="330119964"
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; 
   d="scan'208";a="330119964"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 15:47:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,215,1647327600"; 
   d="scan'208";a="602681924"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 May 2022 15:47:49 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noYdx-000ISQ-1e;
	Tue, 10 May 2022 22:47:49 +0000
Date: Wed, 11 May 2022 06:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Andrii Nakryiko <andrii@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [linux-next:master 10107/10661] libbpf.c:4954:8: error: variable 'i'
 set but not used
Message-ID: <202205110646.qxnrqHzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3bf222d317a20170ee17f082626c1e0f83537e13
commit: 0087a681fa8c22f719a567317e8f8f894d734b9c [10107/10661] libbpf: Automatically fix up BPF_MAP_TYPE_RINGBUF size, if necessary
config: hexagon-randconfig-r036-20220510 (https://download.01.org/0day-ci/archive/20220511/202205110646.qxnrqHzi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0087a681fa8c22f719a567317e8f8f894d734b9c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0087a681fa8c22f719a567317e8f8f894d734b9c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> libbpf.c:4954:8: error: variable 'i' set but not used [-Werror,-Wunused-but-set-variable]
           __u32 i, mul;
                 ^
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf.o] Error 1
   make[5]: *** Waiting for unfinished jobs....
   make[4]: *** [Makefile:157: tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o] Error 2
   make[3]: *** [Makefile:55: tools/bpf/resolve_btfids//libbpf/libbpf.a] Error 2
   make[2]: *** [Makefile:72: bpf/resolve_btfids] Error 2
   make[1]: *** [Makefile:1337: tools/bpf/resolve_btfids] Error 2
   <stdin>:1517:2: warning: syscall clone3 not implemented [-W#warnings]
   #warning syscall clone3 not implemented
    ^
   1 warning generated.
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
