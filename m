Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3547B664C
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 01:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657850159; x=1689386159;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvdmQ9w+gapwigO731le5cyFiNOvHbo1Pum/NKeja04=;
  b=CemLdAbn2Rjgxp6D2ai92vv8ClEzuPpcrNYx+J0uK21R1WOcbRy+BB+6
   sRW79IJXO2g8c0Kkj3FefNRhulQ5nX+OPjaMy72ZsLNNKGNWe6BxvNFXX
   HImw++n4UNpZMmA9EW1L4rxJYIrh8roAtnhanitVcO1sKBquQDajLeDG3
   oDlCrVSIOFznp13uuDZj1USf9m7+vV8aKcunSoq+dbGWGdL9eYCkRwiTt
   20ko63+QyL+Yvvtr0++LCdfziSB7wtDJ4uehdPI6zBwA0Sg29rYcdYVz5
   lG2CMo2mJI5qEa1y1BmBZMXBQDaadQ5eUDxR3NqNfw5w2iW3IWJ1CoD0z
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="266090540"
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="266090540"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 18:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,272,1650956400"; 
   d="scan'208";a="623660962"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 14 Jul 2022 18:55:57 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCAYe-0001Pn-FH;
	Fri, 15 Jul 2022 01:55:56 +0000
Date: Fri, 15 Jul 2022 09:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ast-bpf:memalloc 1/7] kernel/bpf/memalloc.c:158:10: error: call to
 undeclared function 'get_mem_cgroup_from_objcg'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202207150914.NwhVRROz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git memalloc
head:   02e9f2eaae15bfdbc6ab59716ec63c471daa8822
commit: a4e9a79dc137aa2436d0217a0ac415e884cfa862 [1/7] bpf: Introduce any context BPF specific memory allocator.
config: hexagon-randconfig-r006-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150914.NwhVRROz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?id=a4e9a79dc137aa2436d0217a0ac415e884cfa862
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git
        git fetch --no-tags ast-bpf memalloc
        git checkout a4e9a79dc137aa2436d0217a0ac415e884cfa862
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> kernel/bpf/memalloc.c:158:10: error: call to undeclared function 'get_mem_cgroup_from_objcg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   return get_mem_cgroup_from_objcg(c->objcg);
                          ^
   kernel/bpf/memalloc.c:158:10: note: did you mean 'get_mem_cgroup_from_mm'?
   include/linux/memcontrol.h:1271:34: note: 'get_mem_cgroup_from_mm' declared here
   static inline struct mem_cgroup *get_mem_cgroup_from_mm(struct mm_struct *mm)
                                    ^
>> kernel/bpf/memalloc.c:158:10: warning: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct mem_cgroup *' [-Wint-conversion]
                   return get_mem_cgroup_from_objcg(c->objcg);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/get_mem_cgroup_from_objcg +158 kernel/bpf/memalloc.c

   154	
   155	static struct mem_cgroup *get_memcg(const struct bpf_mem_cache *c)
   156	{
   157		if (c->objcg)
 > 158			return get_mem_cgroup_from_objcg(c->objcg);
   159	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
