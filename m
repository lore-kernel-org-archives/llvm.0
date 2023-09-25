Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA331BDEA;
	Mon, 25 Sep 2023 16:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695660045; x=1727196045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nJnaoEyWCi854vW+LFl/eNN2LpLZ8MjVorKU/42ItkA=;
  b=Nud+YpJrGYCA/TKJHdBmrangGPEE3i0SyDoHhkaa1VfwYUJ7ack9pdxV
   p57uKvqeLmHf1fNJVZHlPQo+yPIBiV4P+x5YWaGQoAOd+LWAOrRiGTTsl
   Y3U1PEWtkRSvlmSeVfeGqA2r5G2Ld4/uM7u3w1AgiKK3KrIGm1CETnWeF
   ZTle5rrCpIuVlkPM1I6uBUefPOQCKZc2NcXBgYSdDpDF8rVzwb3wGrDnL
   NgFuhbivX9yYdUKedPaOqg1ygN0tH303FVl9cUvkw5wZ++K2zYgBhF8PB
   C67vgj+M3B95G/VAU9VMMdOis7uFz93Zmdlqm+qsCnGPEI2ZAUmKQRZkR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="384064501"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="384064501"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 09:40:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698047641"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="698047641"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Sep 2023 09:40:42 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkodS-0001ny-2N;
	Mon, 25 Sep 2023 16:40:39 +0000
Date: Tue, 26 Sep 2023 00:40:23 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [liu-song-6:bpf-tramp-to-prog-pack-test 396/428]
 net/bpf/bpf_dummy_struct_ops.c:126:35: error: too few arguments to function
 call, expected 2, have 1
Message-ID: <202309260032.4ip2fL1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/liu-song-6/linux.git bpf-tramp-to-prog-pack-test
head:   49175e9536aa1b8df9326f079e25985a72589d8a
commit: c40997a7fe1c100d71803b42d0176e353a91424c [396/428] bpf: Add helpers for trampoline image management
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230926/202309260032.4ip2fL1C-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260032.4ip2fL1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260032.4ip2fL1C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/bpf/bpf_dummy_struct_ops.c:126:35: error: too few arguments to function call, expected 2, have 1
           arch_protect_bpf_trampoline(image);
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~      ^
   include/linux/bpf.h:1088:6: note: 'arch_protect_bpf_trampoline' declared here
   void arch_protect_bpf_trampoline(void *image, int size);
        ^
   net/bpf/bpf_dummy_struct_ops.c:136:32: error: too few arguments to function call, expected 2, have 1
           arch_free_bpf_trampoline(image);
           ~~~~~~~~~~~~~~~~~~~~~~~~      ^
   include/linux/bpf.h:1087:6: note: 'arch_free_bpf_trampoline' declared here
   void arch_free_bpf_trampoline(void *image, int size);
        ^
   2 errors generated.


vim +126 net/bpf/bpf_dummy_struct_ops.c

    76	
    77	int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
    78				    union bpf_attr __user *uattr)
    79	{
    80		const struct bpf_struct_ops *st_ops = &bpf_bpf_dummy_ops;
    81		const struct btf_type *func_proto;
    82		struct bpf_dummy_ops_test_args *args;
    83		struct bpf_tramp_links *tlinks;
    84		struct bpf_tramp_link *link = NULL;
    85		void *image = NULL;
    86		unsigned int op_idx;
    87		int prog_ret;
    88		int err;
    89	
    90		if (prog->aux->attach_btf_id != st_ops->type_id)
    91			return -EOPNOTSUPP;
    92	
    93		func_proto = prog->aux->attach_func_proto;
    94		args = dummy_ops_init_args(kattr, btf_type_vlen(func_proto));
    95		if (IS_ERR(args))
    96			return PTR_ERR(args);
    97	
    98		tlinks = kcalloc(BPF_TRAMP_MAX, sizeof(*tlinks), GFP_KERNEL);
    99		if (!tlinks) {
   100			err = -ENOMEM;
   101			goto out;
   102		}
   103	
   104		image = arch_alloc_bpf_trampoline(PAGE_SIZE);
   105		if (!image) {
   106			err = -ENOMEM;
   107			goto out;
   108		}
   109	
   110		link = kzalloc(sizeof(*link), GFP_USER);
   111		if (!link) {
   112			err = -ENOMEM;
   113			goto out;
   114		}
   115		/* prog doesn't take the ownership of the reference from caller */
   116		bpf_prog_inc(prog);
   117		bpf_link_init(&link->link, BPF_LINK_TYPE_STRUCT_OPS, &bpf_struct_ops_link_lops, prog);
   118	
   119		op_idx = prog->expected_attach_type;
   120		err = bpf_struct_ops_prepare_trampoline(tlinks, link,
   121							&st_ops->func_models[op_idx],
   122							image, image + PAGE_SIZE);
   123		if (err < 0)
   124			goto out;
   125	
 > 126		arch_protect_bpf_trampoline(image);
   127		prog_ret = dummy_ops_call_op(image, args);
   128	
   129		err = dummy_ops_copy_args(args);
   130		if (err)
   131			goto out;
   132		if (put_user(prog_ret, &uattr->test.retval))
   133			err = -EFAULT;
   134	out:
   135		kfree(args);
   136		arch_free_bpf_trampoline(image);
   137		if (link)
   138			bpf_link_put(&link->link);
   139		kfree(tlinks);
   140		return err;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
