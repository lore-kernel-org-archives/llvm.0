Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C196A4400
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659089130; x=1690625130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ij/DEsIbLiBH4jFrHG/gvtJ5YIPCXP2XupNXfEGHTT0=;
  b=OMBnER8/s+0Q/fvJXgfRYbEIXfe26Jhq2fO8nVLLdWLd/7RvRAjxqZrX
   Xvt6wIEkCTpvZRXGAlbXpHB3pnic0Jb5CJtpQUpzvCG/X+UuJrM4eK522
   KvLiGOfAs9P9PKW8j8M5UFxsH4PqEGCTEXQ5llPyKUO/0DG06sF4eSJJS
   XF/BkAwH9ZadttgWhpIzm+t5FAgDiKWUlrU4lZd3qZNXA8QmOe+wlEVp8
   yyA0zFFPD6JMtRWLIWSpUKTdIuEZNCHvouq65jQl9qg5tB1Vu6h8uHtkI
   7EV9KbqIJOuKvl1L8IsU9C18wn2Gp9ymkBwWWOtblXYmQ1oZMhQGvmTQ6
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10422"; a="314535650"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="314535650"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 03:05:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="928692903"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 29 Jul 2022 03:05:29 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHMs4-000BVF-1n;
	Fri, 29 Jul 2022 10:05:28 +0000
Date: Fri, 29 Jul 2022 18:04:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao1@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 1/3] bpf: Add support for qp-trie map
Message-ID: <202207291741.AfRRtqqg-lkp@intel.com>
References: <20220726130005.3102470-2-houtao1@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726130005.3102470-2-houtao1@huawei.com>

Hi Hou,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Hou-Tao/Add-support-for-qp-trie-map/20220726-204347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: hexagon-randconfig-r041-20220724 (https://download.01.org/0day-ci/archive/20220729/202207291741.AfRRtqqg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 83882606dbd7ffb0bdd3460356202d97705809c8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/74890023aaa2d8ffed54d96d4999f10bf14ccfef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hou-Tao/Add-support-for-qp-trie-map/20220726-204347
        git checkout 74890023aaa2d8ffed54d96d4999f10bf14ccfef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/bpf_qp_trie.c:622:24: warning: bitwise or with non-zero value always evaluates to true [-Wtautological-bitwise-compare]
           if (!(attr->map_flags | BPF_F_NO_PREALLOC) ||
                 ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
>> kernel/bpf/bpf_qp_trie.c:648:18: warning: division by zero is undefined [-Wdivision-by-zero]
           for (i = 0; i < ARRAY_SIZE(trie->locks); i++)
                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:38: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                        ^ ~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +622 kernel/bpf/bpf_qp_trie.c

   616	
   617	static int qp_trie_alloc_check(union bpf_attr *attr)
   618	{
   619		if (!bpf_capable())
   620			return -EPERM;
   621	
 > 622		if (!(attr->map_flags | BPF_F_NO_PREALLOC) ||
   623		    attr->map_flags & ~QP_TRIE_CREATE_FLAG_MASK ||
   624		    !bpf_map_flags_access_ok(attr->map_flags))
   625			return -EINVAL;
   626	
   627		if (!attr->max_entries || attr->key_size < QP_TRIE_MIN_KEY_SIZE ||
   628		    !attr->value_size)
   629			return -EINVAL;
   630	
   631		if (attr->key_size > QP_TRIE_MAX_KEY_SIZE ||
   632		    !is_valid_k_v_size(attr->key_size, attr->value_size))
   633			return -E2BIG;
   634	
   635		return 0;
   636	}
   637	
   638	static struct bpf_map *qp_trie_alloc(union bpf_attr *attr)
   639	{
   640		struct qp_trie *trie;
   641		unsigned int i;
   642	
   643		trie = bpf_map_area_alloc(sizeof(*trie), bpf_map_attr_numa_node(attr));
   644		if (!trie)
   645			return ERR_PTR(-ENOMEM);
   646	
   647		/* roots are zeroed by bpf_map_area_alloc() */
 > 648		for (i = 0; i < ARRAY_SIZE(trie->locks); i++)
   649			spin_lock_init(&trie->locks[i]);
   650	
   651		atomic_set(&trie->entries, 0);
   652		bpf_map_init_from_attr(&trie->map, attr);
   653	
   654		return &trie->map;
   655	}
   656	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
