Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F2F23AC
	for <llvm@lists.linux.dev>; Thu, 19 May 2022 04:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652936363; x=1684472363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G7jdHSG+9Ml5FFCJRQZdTKK7R+LHbizl6xTLD+h8S4I=;
  b=l/l8Luv11HY5StB2BmFfWjInXoOBo6darqfSackWKPWSYZtJnr8jnuub
   uSKC8X+Gfg+PUB5lv/D61OmvaW/4sFx0lElwF/fSLNRB5EKTUXJfUe0w0
   LJQDmPTfTqCIai6sNIYRblU8ogzxObYtrzGvayd1+fWYVVHH01noTDzrn
   LM7rXxWFONAZ20JoV0oJPr/FWIFvXU2JaxKAVNlvCDx4bAXbn6lE+/xrI
   MHpv+N8LRXmTks2iTZ5vyCvvmOAhnWuIrLxbmz1ozRWW9Yp/muvFz0Wm2
   JxE+WlzyBZtIpCB5UuioLShU2LfLcYwDUfLZbEJS87s5fI1MWNwzLqJ9J
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10351"; a="254066631"
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; 
   d="scan'208";a="254066631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2022 21:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,236,1647327600"; 
   d="scan'208";a="627407381"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 18 May 2022 21:59:08 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrYFg-00035Z-2J;
	Thu, 19 May 2022 04:59:08 +0000
Date: Thu, 19 May 2022 12:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Florian Westphal <fw@strlen.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [netfilter-nf-next:testing 9/12] net/netfilter/core.c:194:8: error:
 no member named 'hook_prog' in 'struct nf_hook_entries'
Message-ID: <202205191257.Ihd0KGG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   40bcb3243ee8b8ffbd93213c51c3ca11981aa92a
commit: d6058f935b80dfd90272cda816756fe23f9fd969 [9/12] netfilter: add bpf base hook program generator
config: arm-randconfig-c002-20220518 (https://download.01.org/0day-ci/archive/20220519/202205191257.Ihd0KGG2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git/commit/?id=d6058f935b80dfd90272cda816756fe23f9fd969
        git remote add netfilter-nf-next git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git
        git fetch --no-tags netfilter-nf-next testing
        git checkout d6058f935b80dfd90272cda816756fe23f9fd969
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/netfilter/core.c:194:8: error: no member named 'hook_prog' in 'struct nf_hook_entries'
                   new->hook_prog = hook_bpf_prog;
                   ~~~  ^
   net/netfilter/core.c:197:20: error: no member named 'hook_prog' in 'struct nf_hook_entries'
                           old_prog = old->hook_prog;
                                      ~~~  ^
>> net/netfilter/core.c:199:27: error: use of undeclared identifier 'bpf_dispatcher_nf_hook_base'; did you mean 'bpf_dispatcher_nop_func'?
                   nf_hook_bpf_change_prog(BPF_DISPATCHER_PTR(nf_hook_base),
                                           ^
   include/linux/bpf.h:895:36: note: expanded from macro 'BPF_DISPATCHER_PTR'
   #define BPF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
                                      ^
   <scratch space>:65:1: note: expanded from here
   bpf_dispatcher_nf_hook_base
   ^
   include/linux/bpf.h:847:45: note: 'bpf_dispatcher_nop_func' declared here
   static __always_inline __nocfi unsigned int bpf_dispatcher_nop_func(
                                               ^
>> net/netfilter/core.c:199:27: error: incompatible pointer types passing 'unsigned int (*)(const void *, const struct bpf_insn *, unsigned int (*)(const void *, const struct bpf_insn *))' to parameter of type 'struct bpf_dispatcher *' [-Werror,-Wincompatible-pointer-types]
                   nf_hook_bpf_change_prog(BPF_DISPATCHER_PTR(nf_hook_base),
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bpf.h:895:34: note: expanded from macro 'BPF_DISPATCHER_PTR'
   #define BPF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   include/net/netfilter/nf_hook_bpf.h:12:48: note: passing argument to parameter 'd' here
   nf_hook_bpf_change_prog(struct bpf_dispatcher *d, struct bpf_prog *f, struct bpf_prog *t)
                                                  ^
   net/netfilter/core.c:319:26: error: use of undeclared identifier 'bpf_dispatcher_nf_hook_base'; did you mean 'bpf_dispatcher_nop_func'?
           nf_hook_bpf_change_prog(BPF_DISPATCHER_PTR(nf_hook_base),
                                   ^
   include/linux/bpf.h:895:36: note: expanded from macro 'BPF_DISPATCHER_PTR'
   #define BPF_DISPATCHER_PTR(name) (&bpf_dispatcher_##name)
                                      ^
   <scratch space>:108:1: note: expanded from here
   bpf_dispatcher_nf_hook_base
   ^
   include/linux/bpf.h:847:45: note: 'bpf_dispatcher_nop_func' declared here
   static __always_inline __nocfi unsigned int bpf_dispatcher_nop_func(
                                               ^
   net/netfilter/core.c:320:16: error: no member named 'hook_prog' in 'struct nf_hook_entries'
                                   old ? old->hook_prog : NULL, hook_bpf_prog);
                                         ~~~  ^
   6 errors generated.


vim +194 net/netfilter/core.c

   123	
   124	static struct nf_hook_entries *
   125	nf_hook_entries_grow(const struct nf_hook_entries *old,
   126			     const struct nf_hook_ops *reg)
   127	{
   128		unsigned int i, alloc_entries, nhooks, old_entries;
   129		struct nf_hook_ops **orig_ops = NULL;
   130		struct bpf_prog *hook_bpf_prog;
   131		struct nf_hook_ops **new_ops;
   132		struct nf_hook_entries *new;
   133		bool inserted = false;
   134	
   135		alloc_entries = 1;
   136		old_entries = old ? old->num_hook_entries : 0;
   137	
   138		if (old) {
   139			orig_ops = nf_hook_entries_get_hook_ops(old);
   140	
   141			for (i = 0; i < old_entries; i++) {
   142				if (orig_ops[i] != &dummy_ops)
   143					alloc_entries++;
   144			}
   145		}
   146	
   147		if (alloc_entries > MAX_HOOK_COUNT)
   148			return ERR_PTR(-E2BIG);
   149	
   150		new = allocate_hook_entries_size(alloc_entries);
   151		if (!new)
   152			return ERR_PTR(-ENOMEM);
   153	
   154		new_ops = nf_hook_entries_get_hook_ops(new);
   155	
   156		i = 0;
   157		nhooks = 0;
   158		while (i < old_entries) {
   159			if (orig_ops[i] == &dummy_ops) {
   160				++i;
   161				continue;
   162			}
   163	
   164			if (inserted || reg->priority > orig_ops[i]->priority) {
   165				new_ops[nhooks] = (void *)orig_ops[i];
   166				new->hooks[nhooks] = old->hooks[i];
   167				i++;
   168			} else {
   169				new_ops[nhooks] = (void *)reg;
   170				new->hooks[nhooks].hook = reg->hook;
   171				new->hooks[nhooks].priv = reg->priv;
   172				inserted = true;
   173			}
   174			nhooks++;
   175		}
   176	
   177		if (!inserted) {
   178			new_ops[nhooks] = (void *)reg;
   179			new->hooks[nhooks].hook = reg->hook;
   180			new->hooks[nhooks].priv = reg->priv;
   181		}
   182	
   183		hook_bpf_prog = nf_hook_bpf_create(new);
   184	
   185		/* allocate_hook_entries_size() pre-inits ->hook_prog
   186		 * to a fallback program that calls nf_hook_slow().
   187		 *
   188		 * Alternatively we could have nf_hook_entries_grow()
   189		 * return an error here.
   190		 */
   191		if (hook_bpf_prog) {
   192			struct bpf_prog *old_prog = NULL;
   193	
 > 194			new->hook_prog = hook_bpf_prog;
   195	
   196			if (old)
   197				old_prog = old->hook_prog;
   198	
 > 199			nf_hook_bpf_change_prog(BPF_DISPATCHER_PTR(nf_hook_base),
   200						old_prog, hook_bpf_prog);
   201		}
   202	
   203		return new;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
