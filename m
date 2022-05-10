Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DE92C80
	for <llvm@lists.linux.dev>; Tue, 10 May 2022 19:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652211091; x=1683747091;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PIb+gNfBFqBSzz9/S51SJbydknLYdulMXqVaAoabRCY=;
  b=AFBzkW9ovl70HLz0dOnnUToxbwwrOWxV926762U5SXWVa75bAPXa4NBL
   N+o4EogyiGzjyZSViTC35z0Je02cUswliIjv0g3R5r6Gn0LjBG0nQ5KfO
   y+pJxm6VF6vIcHMkgmtE/UrtQ1anrdJZJmvVa87CXSCcAHTA/LTPB+gWF
   VGfFPXB6e71s0K3k1ZZOkgQrtA2YjDxCK25KDUNt69qKGc9gF2nlWTsLT
   lac9t7wc1JjZjmTPk+6c8PeJdS5DO3cXpfJpQ86zDZkY+kngEl0bW64zD
   M24MKQBmDoIQhkn9QjlT5iJxvR8pnn9euoVZO6uHv0MmFVvX11ONJAaiG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="268323888"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="268323888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 12:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="738865403"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2022 12:31:27 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1noVZt-000IIs-Kt;
	Tue, 10 May 2022 19:31:25 +0000
Date: Wed, 11 May 2022 03:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.garry@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 2/2] sbitmap: Spread sbitmap word allocation over
 NUMA nodes
Message-ID: <202205110332.EbWRHZ10-lkp@intel.com>
References: <1652181274-136198-3-git-send-email-john.garry@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1652181274-136198-3-git-send-email-john.garry@huawei.com>

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linux/master linus/master v5.18-rc6 next-20220510]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/sbitmap-NUMA-node-spreading/20220510-192122
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
config: x86_64-randconfig-a003-20220509 (https://download.01.org/0day-ci/archive/20220511/202205110332.EbWRHZ10-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9cb4cd7060790dcb3d7f9405c11a0da884a0c616
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/sbitmap-NUMA-node-spreading/20220510-192122
        git checkout 9cb4cd7060790dcb3d7f9405c11a0da884a0c616
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/sbitmap.c:138:63: warning: variable 'map_nr_cnt' is uninitialized when used here [-Wuninitialized]
           for (index = 0, nid = 0; index < sb->map_nr; index++, map++, map_nr_cnt++) {
                                                                        ^~~~~~~~~~
   lib/sbitmap.c:103:21: note: initialize the variable 'map_nr_cnt' to silence this warning
           int nid, map_nr_cnt;
                              ^
                               = 0
   1 warning generated.


vim +/map_nr_cnt +138 lib/sbitmap.c

    95	
    96	int sbitmap_init_node(struct sbitmap *sb, unsigned int depth, int shift,
    97			      gfp_t flags, int node, bool round_robin,
    98			      bool alloc_hint)
    99	{
   100		unsigned int bits_per_word;
   101		struct sbitmap_word *map;
   102		int index, num_nodes = num_online_nodes();
   103		int nid, map_nr_cnt;
   104	
   105		if (shift < 0)
   106			shift = sbitmap_calculate_shift(depth);
   107	
   108		bits_per_word = 1U << shift;
   109		if (bits_per_word > BITS_PER_LONG)
   110			return -EINVAL;
   111	
   112		sb->shift = shift;
   113		sb->depth = depth;
   114		sb->map_nr = DIV_ROUND_UP(sb->depth, bits_per_word);
   115		sb->round_robin = round_robin;
   116	
   117		if (depth == 0) {
   118			sb->map = NULL;
   119			return 0;
   120		}
   121	
   122		if (sb->map_nr < num_nodes) {
   123			sb->map_nr_per_node = 1;
   124		} else {
   125			sb->map_nr_per_node = sb->map_nr / num_nodes;
   126		}
   127		if (alloc_hint) {
   128			if (init_alloc_hint(sb, flags))
   129				return -ENOMEM;
   130		} else {
   131			sb->alloc_hint = NULL;
   132		}
   133	
   134		sb->map = kvzalloc_node(sb->map_nr * sizeof(*sb->map), flags, node);
   135		if (!sb->map)
   136			goto err_map;
   137	
 > 138		for (index = 0, nid = 0; index < sb->map_nr; index++, map++, map_nr_cnt++) {
   139			struct sbitmap_word **_map;
   140	
   141			if ((index % sb->map_nr_per_node) == 0) {
   142				int cnt;
   143	
   144				if (index == 0) {
   145					cnt = sb->map_nr_per_node +
   146						(sb->map_nr % sb->map_nr_per_node);
   147				} else {
   148					cnt = sb->map_nr_per_node;
   149				}
   150	
   151				map = kvzalloc_node(cnt * sizeof(**sb->map), flags, nid);
   152				if (!map)
   153					goto err_map_numa;
   154				nid++;
   155			}
   156	
   157			_map = &sb->map[index];
   158			*_map = map;
   159		}
   160	
   161		return 0;
   162	err_map_numa:
   163		for (index = 0; index < sb->map_nr; index++, map++) {
   164			if ((index % sb->map_nr_per_node) == 0) {
   165				kfree(map);
   166			}
   167		}
   168	err_map:
   169		free_percpu(sb->alloc_hint);
   170	
   171		return -ENOMEM;
   172	}
   173	EXPORT_SYMBOL_GPL(sbitmap_init_node);
   174	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
