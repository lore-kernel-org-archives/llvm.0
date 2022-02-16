Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968471B69
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 08:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644999935; x=1676535935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7siHgFyWk7oT11ovp/rh7WSrJ8iwJmc0MEtzfxP97Ng=;
  b=ZrpH9ERjkidz2nVRppIYAb7UQRNgqckCnsQRivas18WilHcMABX+nAfk
   MAtXwYRrwKPP4eh6BEj+xFumapD3S4YaGosDA1vVItAoQlXU8W15mm+yu
   H+X4eYIOiYwlfqayiaQwLFfvq7VvaZz1M5iPuFDt4Q2mxCN+oGi3psDJT
   zEuOwKNpFw8ttYz6dnWpzKioVmwwuavNLBYleTALdS/VyxnkxyNjy7Pl/
   cdD3MSJHDD+s1AasPI/SzN5f+U1ytk8MC+O29u8ebHh/n3WGolmg+Jumk
   xg6MKmDd1GDbHWL2e3BApGlQMsf6RnGBH2fcxtvuBxHy97wvhZp3WCLh8
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250494929"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="250494929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 00:25:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="625284297"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Feb 2022 00:25:30 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKFcv-000Abg-VB; Wed, 16 Feb 2022 08:25:29 +0000
Date: Wed, 16 Feb 2022 16:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ast-bpf:ptr 1/1] kernel/bpf/helpers.c:1395:36: warning: unused
 variable 'bpf_kptr_get_proto'
Message-ID: <202202161630.kf6vptKz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git ptr
head:   c49309ef3e137c753d1a87de044f007655fb9958
commit: c49309ef3e137c753d1a87de044f007655fb9958 [1/1] bpf: kptr
config: hexagon-randconfig-r001-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161630.kf6vptKz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git/commit/?id=c49309ef3e137c753d1a87de044f007655fb9958
        git remote add ast-bpf https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git
        git fetch --no-tags ast-bpf ptr
        git checkout c49309ef3e137c753d1a87de044f007655fb9958
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/bpf/helpers.c:1395:36: warning: unused variable 'bpf_kptr_get_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_kptr_get_proto = {
                                      ^
>> kernel/bpf/helpers.c:1411:36: warning: unused variable 'bpf_kptr_xchg_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_kptr_xchg_proto = {
                                      ^
>> kernel/bpf/helpers.c:1433:36: warning: unused variable 'bpf_kptr_try_set_proto' [-Wunused-const-variable]
   static const struct bpf_func_proto bpf_kptr_try_set_proto = {
                                      ^
   3 warnings generated.


vim +/bpf_kptr_get_proto +1395 kernel/bpf/helpers.c

  1394	
> 1395	static const struct bpf_func_proto bpf_kptr_get_proto = {
  1396		.func		= bpf_kptr_get,
  1397		.gpl_only	= false,
  1398		.ret_type	= RET_PTR_TO_BTF_ID_OR_NULL,
  1399		.arg1_type	= ARG_PTR_TO_MAP_VALUE,
  1400	};
  1401	
  1402	BPF_CALL_2(bpf_kptr_xchg, void **, kptr, void *, ptr)
  1403	{
  1404		/* ptr is ptr_to_btf_id returned from bpf_*_lookup() with ptr->refcnt >= 1
  1405		 * or ptr == NULL.
  1406		 * returns ptr_to_btf_id with refcnt >= 1 or NULL
  1407		 */
  1408		return (long) xchg(kptr, ptr);
  1409	}
  1410	
> 1411	static const struct bpf_func_proto bpf_kptr_xchg_proto = {
  1412		.func		= bpf_kptr_xchg,
  1413		.gpl_only	= false,
  1414		.ret_type	= RET_PTR_TO_BTF_ID_OR_NULL,
  1415		.arg1_type	= ARG_PTR_TO_MAP_VALUE,
  1416	};
  1417	
  1418	BPF_CALL_3(bpf_kptr_try_set, void **, kptr, void *, ptr, int, refcnt_off)
  1419	{
  1420		/* ptr is ptr_to_btf_id returned from bpf_*_lookup() with ptr->refcnt >= 1
  1421		 * refcount_inc() has to be done before cmpxchg() because
  1422		 * another cpu might do bpf_kptr_xchg+release.
  1423		 */
  1424		refcount_inc((refcount_t *)(ptr + refcnt_off));
  1425		if (cmpxchg(kptr, NULL, ptr)) {
  1426			/* refcnt >= 2 here */
  1427			refcount_dec((refcount_t *)(ptr + refcnt_off));
  1428			return -EBUSY;
  1429		}
  1430		return 0;
  1431	}
  1432	
> 1433	static const struct bpf_func_proto bpf_kptr_try_set_proto = {
  1434		.func		= bpf_kptr_try_set,
  1435		.gpl_only	= false,
  1436		.ret_type	= RET_INTEGER,
  1437		.arg1_type	= ARG_PTR_TO_MAP_VALUE,
  1438		.arg2_type	= ARG_PTR_TO_BTF_ID,
  1439	};
  1440	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
