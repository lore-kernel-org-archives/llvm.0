Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC2629CA
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642805288; x=1674341288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BAN4q1xOnnetjWkvMiaQjL2tkeooTtGJwU3APK2kZVc=;
  b=jisGtFZfio+hQ5g6vtlKghp43oa2XZDpLjKjMj2bnD8Y9J2uu5vf0x8K
   ip4ZMXH6I0r8UnotzEitBLxKJaWD6xiYpsmifhT0j5SFbx1NZQ9LUGq/X
   Gg3gTsjZx2I1N5QRvIDoqT1Y/W6srfEATwT9zAaUm8Q8Lm2pYXkdv1o8o
   2tAXEhAhaLl6M4+CH0xMfMpPuS7+ZvhdLbo+yg2OVBua4/rrw0s15XLVZ
   Or7tPqlBBx1/pEidzS5t3XjWoasufbXfXu8PEMpelAxjDFcQ4gnQSE4v+
   ldsE7A8m+rK02lgNHA0m4zTfu7SP/nzMjTkmR3jPs6AgwJGL3rWLoIg3C
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="270185741"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="270185741"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 14:48:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="579753123"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jan 2022 14:48:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nB2hR-000Fja-70; Fri, 21 Jan 2022 22:48:05 +0000
Date: Sat, 22 Jan 2022 06:47:31 +0800
From: kernel test robot <lkp@intel.com>
To: Usama Arif <usama.arif@bytedance.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC bpf-next 1/3] bpf: btf: Introduce infrastructure for module
 helpers
Message-ID: <202201220628.8IcADV9U-lkp@intel.com>
References: <20220121193956.198120-2-usama.arif@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121193956.198120-2-usama.arif@bytedance.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Usama,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Usama-Arif/bpf-Introduce-module-helper-functions/20220122-034203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: x86_64-randconfig-a004-20220117 (https://download.01.org/0day-ci/archive/20220122/202201220628.8IcADV9U-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/ca60b90025819a8a03818e86e2105bd15576d134
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Usama-Arif/bpf-Introduce-module-helper-functions/20220122-034203
        git checkout ca60b90025819a8a03818e86e2105bd15576d134
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from net/bpf/test_run.c:5:
>> include/linux/btf.h:391:5: warning: no previous prototype for function 'register_mod_helper' [-Wmissing-prototypes]
   int register_mod_helper(struct btf_mod_helper *mod_helper)
       ^
   include/linux/btf.h:391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int register_mod_helper(struct btf_mod_helper *mod_helper)
   ^
   static 
>> include/linux/btf.h:395:5: warning: no previous prototype for function 'unregister_mod_helper' [-Wmissing-prototypes]
   int unregister_mod_helper(struct btf_mod_helper *mod_helper)
       ^
   include/linux/btf.h:395:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int unregister_mod_helper(struct btf_mod_helper *mod_helper)
   ^
   static 
>> include/linux/btf.h:399:30: warning: no previous prototype for function 'get_mod_helper_proto' [-Wmissing-prototypes]
   const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
                                ^
   include/linux/btf.h:399:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
   const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
         ^
   static 
   net/bpf/test_run.c:171:14: warning: no previous prototype for function 'bpf_fentry_test1' [-Wmissing-prototypes]
   int noinline bpf_fentry_test1(int a)
                ^
   net/bpf/test_run.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test1(int a)
   ^
   static 
   net/bpf/test_run.c:178:14: warning: no previous prototype for function 'bpf_fentry_test2' [-Wmissing-prototypes]
   int noinline bpf_fentry_test2(int a, u64 b)
                ^
   net/bpf/test_run.c:178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test2(int a, u64 b)
   ^
   static 
   net/bpf/test_run.c:183:14: warning: no previous prototype for function 'bpf_fentry_test3' [-Wmissing-prototypes]
   int noinline bpf_fentry_test3(char a, int b, u64 c)
                ^
   net/bpf/test_run.c:183:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test3(char a, int b, u64 c)
   ^
   static 
   net/bpf/test_run.c:188:14: warning: no previous prototype for function 'bpf_fentry_test4' [-Wmissing-prototypes]
   int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                ^
   net/bpf/test_run.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
   ^
   static 
   net/bpf/test_run.c:193:14: warning: no previous prototype for function 'bpf_fentry_test5' [-Wmissing-prototypes]
   int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                ^
   net/bpf/test_run.c:193:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
   ^
   static 
   net/bpf/test_run.c:198:14: warning: no previous prototype for function 'bpf_fentry_test6' [-Wmissing-prototypes]
   int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                ^
   net/bpf/test_run.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
   ^
   static 
   net/bpf/test_run.c:207:14: warning: no previous prototype for function 'bpf_fentry_test7' [-Wmissing-prototypes]
   int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                ^
   net/bpf/test_run.c:207:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
   ^
   static 
   net/bpf/test_run.c:212:14: warning: no previous prototype for function 'bpf_fentry_test8' [-Wmissing-prototypes]
   int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                ^
   net/bpf/test_run.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
   ^
   static 
   net/bpf/test_run.c:217:14: warning: no previous prototype for function 'bpf_modify_return_test' [-Wmissing-prototypes]
   int noinline bpf_modify_return_test(int a, int *b)
                ^
   net/bpf/test_run.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_modify_return_test(int a, int *b)
   ^
   static 
   net/bpf/test_run.c:223:14: warning: no previous prototype for function 'bpf_kfunc_call_test1' [-Wmissing-prototypes]
   u64 noinline bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
                ^
   net/bpf/test_run.c:223:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 noinline bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
   ^
   static 
   net/bpf/test_run.c:228:14: warning: no previous prototype for function 'bpf_kfunc_call_test2' [-Wmissing-prototypes]
   int noinline bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
                ^
   net/bpf/test_run.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
   ^
   static 
   net/bpf/test_run.c:233:24: warning: no previous prototype for function 'bpf_kfunc_call_test3' [-Wmissing-prototypes]
   struct sock * noinline bpf_kfunc_call_test3(struct sock *sk)
                          ^
   net/bpf/test_run.c:233:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sock * noinline bpf_kfunc_call_test3(struct sock *sk)
   ^
   static 
   net/bpf/test_run.c:251:1: warning: no previous prototype for function 'bpf_kfunc_call_test_acquire' [-Wmissing-prototypes]
   bpf_kfunc_call_test_acquire(unsigned long *scalar_ptr)
   ^
   net/bpf/test_run.c:250:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline struct prog_test_ref_kfunc *
            ^
            static 
   net/bpf/test_run.c:259:15: warning: no previous prototype for function 'bpf_kfunc_call_test_release' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                 ^


vim +/register_mod_helper +391 include/linux/btf.h

   373	
   374	#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
   375	int register_mod_helper(struct btf_mod_helper *mod_helper);
   376	int unregister_mod_helper(struct btf_mod_helper *mod_helper);
   377	const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
   378		const u32 kfunc_btf_id);
   379	
   380	#define DEFINE_MOD_HELPER(mod_helper, owner, helper_func, func_proto) \
   381	BTF_SET_START(helper_func##__id_set) \
   382	BTF_ID(func, helper_func) \
   383	BTF_SET_END(helper_func##__id_set) \
   384	struct btf_mod_helper mod_helper = { \
   385		LIST_HEAD_INIT(mod_helper.list), \
   386		(owner), \
   387		(&(helper_func##__id_set)), \
   388		(&(func_proto)) \
   389	}
   390	#else
 > 391	int register_mod_helper(struct btf_mod_helper *mod_helper)
   392	{
   393		return -EPERM;
   394	}
 > 395	int unregister_mod_helper(struct btf_mod_helper *mod_helper)
   396	{
   397		return -EPERM;
   398	}
 > 399	const struct bpf_func_proto *get_mod_helper_proto(const struct btf *btf,
   400		const u32 kfunc_btf_id)
   401	{
   402		return NULL;
   403	}
   404	#endif
   405	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
