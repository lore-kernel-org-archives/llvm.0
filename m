Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6512C82
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642608457; x=1674144457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xbh6oY7x3+ATxewkND+lIO4cNUs8cLzZEMO58y889FM=;
  b=Ak71vVGMwu/ltquvZafGLhfHE79atsqlWO3W/jJhGCWaVXFgHPd/EKPe
   JBmgJVaP1IlMI67dGVBa5Iqn8tX43XSBsVU4sdGCsy9GdtUuhK3NLEenD
   xkRh0caz/NYo5LS0+aQ/46YKUZTW2usbucR0NAh/jx7V9dO3dIijCczVC
   H0PYcTrXALpch3ufa46NAq7Hid2eneiw7ceOJLmcWtAFWsJwJGjRHELsQ
   yjwE/xQXhN9b5dYxbKU0VWKbxi7TxDnAJ2c5Kt16cMA//gsz5ar9t3+2R
   lOjGAuqL93TaqGUTPlMvbVumdU2H/8wdyrlSm4ljJryZWwxAerJFZzdHP
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232463726"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="232463726"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2022 08:07:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="578856437"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jan 2022 08:07:34 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nADUk-000Dci-7Z; Wed, 19 Jan 2022 16:07:34 +0000
Date: Thu, 20 Jan 2022 00:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: Hou Tao <houtao1@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>
Subject: net/bpf/bpf_dummy_struct_ops.c:122:6: error: unexpected token,
 expected comma
Message-ID: <202201200024.lLbhNvJC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1d1df41c5a33359a00e919d54eaebfb789711fdc
commit: c196906d50e360d82ed9aa5596a9d0ce89b7ab78 bpf: Add dummy BPF STRUCT_OPS for test purpose
date:   3 months ago
config: mips-randconfig-r003-20220118 (https://download.01.org/0day-ci/archive/20220120/202201200024.lLbhNvJC-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f782d25a742302d25ef3c8b84b54f7483c2deb9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c196906d50e360d82ed9aa5596a9d0ce89b7ab78
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c196906d50e360d82ed9aa5596a9d0ce89b7ab78
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/cxl/ mm// net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/bpf/bpf_dummy_struct_ops.c:122:6: error: unexpected token, expected comma
           if (put_user(prog_ret, &uattr->test.retval))
               ^
   arch/mips/include/asm/uaccess.h:112:33: note: expanded from macro 'put_user'
           access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
                                          ^
   arch/mips/include/asm/uaccess.h:177:18: note: expanded from macro '__put_user'
                   __put_data_asm(user_sw, __pu_ptr);                      \
                                  ^
   <inline asm>:3:10: note: instantiated into assembly here
           .set    eva
                      ^
>> net/bpf/bpf_dummy_struct_ops.c:122:6: error: invalid operand for instruction
           if (put_user(prog_ret, &uattr->test.retval))
               ^
   arch/mips/include/asm/uaccess.h:112:33: note: expanded from macro 'put_user'
           access_ok(__p, sizeof(*__p)) ? __put_user((x), __p) : -EFAULT;  \
                                          ^
   arch/mips/include/asm/uaccess.h:177:18: note: expanded from macro '__put_user'
                   __put_data_asm(user_sw, __pu_ptr);                      \
                                  ^
   <inline asm>:4:11: note: instantiated into assembly here
           swe $19, 0($2)
                    ^
   2 errors generated.


vim +122 net/bpf/bpf_dummy_struct_ops.c

    74	
    75	int bpf_struct_ops_test_run(struct bpf_prog *prog, const union bpf_attr *kattr,
    76				    union bpf_attr __user *uattr)
    77	{
    78		const struct bpf_struct_ops *st_ops = &bpf_bpf_dummy_ops;
    79		const struct btf_type *func_proto;
    80		struct bpf_dummy_ops_test_args *args;
    81		struct bpf_tramp_progs *tprogs;
    82		void *image = NULL;
    83		unsigned int op_idx;
    84		int prog_ret;
    85		int err;
    86	
    87		if (prog->aux->attach_btf_id != st_ops->type_id)
    88			return -EOPNOTSUPP;
    89	
    90		func_proto = prog->aux->attach_func_proto;
    91		args = dummy_ops_init_args(kattr, btf_type_vlen(func_proto));
    92		if (IS_ERR(args))
    93			return PTR_ERR(args);
    94	
    95		tprogs = kcalloc(BPF_TRAMP_MAX, sizeof(*tprogs), GFP_KERNEL);
    96		if (!tprogs) {
    97			err = -ENOMEM;
    98			goto out;
    99		}
   100	
   101		image = bpf_jit_alloc_exec(PAGE_SIZE);
   102		if (!image) {
   103			err = -ENOMEM;
   104			goto out;
   105		}
   106		set_vm_flush_reset_perms(image);
   107	
   108		op_idx = prog->expected_attach_type;
   109		err = bpf_struct_ops_prepare_trampoline(tprogs, prog,
   110							&st_ops->func_models[op_idx],
   111							image, image + PAGE_SIZE);
   112		if (err < 0)
   113			goto out;
   114	
   115		set_memory_ro((long)image, 1);
   116		set_memory_x((long)image, 1);
   117		prog_ret = dummy_ops_call_op(image, args);
   118	
   119		err = dummy_ops_copy_args(args);
   120		if (err)
   121			goto out;
 > 122		if (put_user(prog_ret, &uattr->test.retval))
   123			err = -EFAULT;
   124	out:
   125		kfree(args);
   126		bpf_jit_free_exec(image);
   127		kfree(tprogs);
   128		return err;
   129	}
   130	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
