Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FC32CA6
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 03:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643425943; x=1674961943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bbBFZnhm7lj8JTYb8ihkU56egt2Zh2n4mjBBCK58bFU=;
  b=NfdRFG+JG7vh9kqbGSptgyGLuqzIc909aMtrBQoWDwYFlD9pu+vwrzTT
   J2jsoP10CxMoBxeB3fMxeJEeqA5AszpllppxU3QHy8Tnj8kUbyz32sOtK
   Wc8LfYlP2tUGxlRlAeGfM12iUFpsYEX5nle/lzlLaFvFe6JpC7NuOtZgq
   z0h07YBXXlgV5dOBXTVAPJMJnUNxlIN5nUTF4zl4Ho9kKWieY/Ua+l8lm
   eFeM/QrIWjXKYUEqDD9WsiefDBBDzzKrtJhryho6mUCeFNRxgHbt027Tf
   5f17gzdmzXUIAK/RINKj6aOEl7uUeMtYtrN9/57I3EjDZ8JEnkIkvuO/M
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10241"; a="234622995"
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="234622995"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 19:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,325,1635231600"; 
   d="scan'208";a="768076024"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2022 19:12:20 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDeA0-000Ogj-8e; Sat, 29 Jan 2022 03:12:20 +0000
Date: Sat, 29 Jan 2022 11:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alexei Starovoitov <ast@kernel.org>
Subject: [linux-next:master 655/2855] net/bpf/test_run.c:249:1: warning: no
 previous prototype for function 'bpf_kfunc_call_test_acquire'
Message-ID: <202201291133.pGWHJVKN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b605fdc54c2b28c30ef06d9db99282d8a32ae4be
commit: c1ff181ffabc292abcd1832a1c83aac2bc499e71 [655/2855] selftests/bpf: Extend kfunc selftests
config: i386-randconfig-a014-20220124 (https://download.01.org/0day-ci/archive/20220129/202201291133.pGWHJVKN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c1ff181ffabc292abcd1832a1c83aac2bc499e71
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c1ff181ffabc292abcd1832a1c83aac2bc499e71
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   net/bpf/test_run.c:171:14: warning: no previous prototype for function 'bpf_fentry_test1' [-Wmissing-prototypes]
   int noinline bpf_fentry_test1(int a)
                ^
   net/bpf/test_run.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test1(int a)
   ^
   static 
   net/bpf/test_run.c:176:14: warning: no previous prototype for function 'bpf_fentry_test2' [-Wmissing-prototypes]
   int noinline bpf_fentry_test2(int a, u64 b)
                ^
   net/bpf/test_run.c:176:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test2(int a, u64 b)
   ^
   static 
   net/bpf/test_run.c:181:14: warning: no previous prototype for function 'bpf_fentry_test3' [-Wmissing-prototypes]
   int noinline bpf_fentry_test3(char a, int b, u64 c)
                ^
   net/bpf/test_run.c:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test3(char a, int b, u64 c)
   ^
   static 
   net/bpf/test_run.c:186:14: warning: no previous prototype for function 'bpf_fentry_test4' [-Wmissing-prototypes]
   int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
                ^
   net/bpf/test_run.c:186:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test4(void *a, char b, int c, u64 d)
   ^
   static 
   net/bpf/test_run.c:191:14: warning: no previous prototype for function 'bpf_fentry_test5' [-Wmissing-prototypes]
   int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
                ^
   net/bpf/test_run.c:191:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test5(u64 a, void *b, short c, int d, u64 e)
   ^
   static 
   net/bpf/test_run.c:196:14: warning: no previous prototype for function 'bpf_fentry_test6' [-Wmissing-prototypes]
   int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
                ^
   net/bpf/test_run.c:196:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test6(u64 a, void *b, short c, int d, void *e, u64 f)
   ^
   static 
   net/bpf/test_run.c:205:14: warning: no previous prototype for function 'bpf_fentry_test7' [-Wmissing-prototypes]
   int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
                ^
   net/bpf/test_run.c:205:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test7(struct bpf_fentry_test_t *arg)
   ^
   static 
   net/bpf/test_run.c:210:14: warning: no previous prototype for function 'bpf_fentry_test8' [-Wmissing-prototypes]
   int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
                ^
   net/bpf/test_run.c:210:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_fentry_test8(struct bpf_fentry_test_t *arg)
   ^
   static 
   net/bpf/test_run.c:215:14: warning: no previous prototype for function 'bpf_modify_return_test' [-Wmissing-prototypes]
   int noinline bpf_modify_return_test(int a, int *b)
                ^
   net/bpf/test_run.c:215:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_modify_return_test(int a, int *b)
   ^
   static 
   net/bpf/test_run.c:221:14: warning: no previous prototype for function 'bpf_kfunc_call_test1' [-Wmissing-prototypes]
   u64 noinline bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
                ^
   net/bpf/test_run.c:221:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u64 noinline bpf_kfunc_call_test1(struct sock *sk, u32 a, u64 b, u32 c, u64 d)
   ^
   static 
   net/bpf/test_run.c:226:14: warning: no previous prototype for function 'bpf_kfunc_call_test2' [-Wmissing-prototypes]
   int noinline bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
                ^
   net/bpf/test_run.c:226:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int noinline bpf_kfunc_call_test2(struct sock *sk, u32 a, u32 b)
   ^
   static 
   net/bpf/test_run.c:231:24: warning: no previous prototype for function 'bpf_kfunc_call_test3' [-Wmissing-prototypes]
   struct sock * noinline bpf_kfunc_call_test3(struct sock *sk)
                          ^
   net/bpf/test_run.c:231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sock * noinline bpf_kfunc_call_test3(struct sock *sk)
   ^
   static 
>> net/bpf/test_run.c:249:1: warning: no previous prototype for function 'bpf_kfunc_call_test_acquire' [-Wmissing-prototypes]
   bpf_kfunc_call_test_acquire(unsigned long *scalar_ptr)
   ^
   net/bpf/test_run.c:248:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline struct prog_test_ref_kfunc *
            ^
            static 
>> net/bpf/test_run.c:257:15: warning: no previous prototype for function 'bpf_kfunc_call_test_release' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
                 ^
   net/bpf/test_run.c:257:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
            ^
            static 
>> net/bpf/test_run.c:299:15: warning: no previous prototype for function 'bpf_kfunc_call_test_pass_ctx' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
                 ^
   net/bpf/test_run.c:299:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
            ^
            static 
>> net/bpf/test_run.c:303:15: warning: no previous prototype for function 'bpf_kfunc_call_test_pass1' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
                 ^
   net/bpf/test_run.c:303:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
            ^
            static 
>> net/bpf/test_run.c:307:15: warning: no previous prototype for function 'bpf_kfunc_call_test_pass2' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
                 ^
   net/bpf/test_run.c:307:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
            ^
            static 
>> net/bpf/test_run.c:311:15: warning: no previous prototype for function 'bpf_kfunc_call_test_fail1' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
                 ^
   net/bpf/test_run.c:311:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
            ^
            static 
>> net/bpf/test_run.c:315:15: warning: no previous prototype for function 'bpf_kfunc_call_test_fail2' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
                 ^
   net/bpf/test_run.c:315:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
            ^
            static 
>> net/bpf/test_run.c:319:15: warning: no previous prototype for function 'bpf_kfunc_call_test_fail3' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
                 ^
   net/bpf/test_run.c:319:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
            ^
            static 
>> net/bpf/test_run.c:323:15: warning: no previous prototype for function 'bpf_kfunc_call_test_mem_len_pass1' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
                 ^
   net/bpf/test_run.c:323:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
            ^
            static 
>> net/bpf/test_run.c:327:15: warning: no previous prototype for function 'bpf_kfunc_call_test_mem_len_fail1' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
                 ^
   net/bpf/test_run.c:327:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
            ^
            static 
>> net/bpf/test_run.c:331:15: warning: no previous prototype for function 'bpf_kfunc_call_test_mem_len_fail2' [-Wmissing-prototypes]
   noinline void bpf_kfunc_call_test_mem_len_fail2(u64 *mem, int len)
                 ^
   net/bpf/test_run.c:331:10: note: declare 'static' if the function is not intended to be used outside of this translation unit
   noinline void bpf_kfunc_call_test_mem_len_fail2(u64 *mem, int len)
            ^
            static 
   23 warnings generated.


vim +/bpf_kfunc_call_test_acquire +249 net/bpf/test_run.c

   247	
   248	noinline struct prog_test_ref_kfunc *
 > 249	bpf_kfunc_call_test_acquire(unsigned long *scalar_ptr)
   250	{
   251		/* randomly return NULL */
   252		if (get_jiffies_64() % 2)
   253			return NULL;
   254		return &prog_test_struct;
   255	}
   256	
 > 257	noinline void bpf_kfunc_call_test_release(struct prog_test_ref_kfunc *p)
   258	{
   259	}
   260	
   261	struct prog_test_pass1 {
   262		int x0;
   263		struct {
   264			int x1;
   265			struct {
   266				int x2;
   267				struct {
   268					int x3;
   269				};
   270			};
   271		};
   272	};
   273	
   274	struct prog_test_pass2 {
   275		int len;
   276		short arr1[4];
   277		struct {
   278			char arr2[4];
   279			unsigned long arr3[8];
   280		} x;
   281	};
   282	
   283	struct prog_test_fail1 {
   284		void *p;
   285		int x;
   286	};
   287	
   288	struct prog_test_fail2 {
   289		int x8;
   290		struct prog_test_pass1 x;
   291	};
   292	
   293	struct prog_test_fail3 {
   294		int len;
   295		char arr1[2];
   296		char arr2[0];
   297	};
   298	
 > 299	noinline void bpf_kfunc_call_test_pass_ctx(struct __sk_buff *skb)
   300	{
   301	}
   302	
 > 303	noinline void bpf_kfunc_call_test_pass1(struct prog_test_pass1 *p)
   304	{
   305	}
   306	
 > 307	noinline void bpf_kfunc_call_test_pass2(struct prog_test_pass2 *p)
   308	{
   309	}
   310	
 > 311	noinline void bpf_kfunc_call_test_fail1(struct prog_test_fail1 *p)
   312	{
   313	}
   314	
 > 315	noinline void bpf_kfunc_call_test_fail2(struct prog_test_fail2 *p)
   316	{
   317	}
   318	
 > 319	noinline void bpf_kfunc_call_test_fail3(struct prog_test_fail3 *p)
   320	{
   321	}
   322	
 > 323	noinline void bpf_kfunc_call_test_mem_len_pass1(void *mem, int mem__sz)
   324	{
   325	}
   326	
 > 327	noinline void bpf_kfunc_call_test_mem_len_fail1(void *mem, int len)
   328	{
   329	}
   330	
 > 331	noinline void bpf_kfunc_call_test_mem_len_fail2(u64 *mem, int len)
   332	{
   333	}
   334	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
