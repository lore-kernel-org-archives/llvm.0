Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11E82F34
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 00:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653005329; x=1684541329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n76Nf70LbuuyVSj3YywnVMm9NfECB3yjElc64LbA/GQ=;
  b=ORKatm+SfDbwM3/eJBTXkqWu3E5FsU8vMD0ALiiOJhRDxdbThzbIvElU
   5cRCHe2MbIbrWba4Q/h4Aq9Tdnx3odEDpxBa4Hr8v/nAqXORykWtWkOzb
   Ak0gLRCtrCCRVsMTRNIxQLlCUqwvDeD0gowUhVBPac4b1WY2gOYDakYzU
   KUDXf0xnnPeB4s45VX9uC+XWRbyHuNvsF4+xdqxH7b3bZB+rW++t8ZvEM
   21pOy0OeP7W4hyJkmv8MAJ3AV4FApsWKApI8USh4PLwougSTtZu4BsAuk
   xlBXwglgZaac+6JzfbkZjK5KAMguy8woTCFSwN/J5Gw0TyNBhtVIAttS2
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="271248047"
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="271248047"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2022 17:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,238,1647327600"; 
   d="scan'208";a="546386573"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 19 May 2022 17:08:47 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrqCE-00044R-Ng;
	Fri, 20 May 2022 00:08:46 +0000
Date: Fri, 20 May 2022 08:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: Chih-En Lin <shiyn.lin@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/6] mm, pgtable: Add ownership for the PTE table
Message-ID: <202205200836.FzJQhYQg-lkp@intel.com>
References: <20220519183127.3909598-4-shiyn.lin@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220519183127.3909598-4-shiyn.lin@gmail.com>

Hi Chih-En,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/sched/core]
[also build test ERROR on soc/for-next linus/master v5.18-rc7 next-20220519]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Chih-En-Lin/Introduce-Copy-On-Write-to-Page-Table/20220520-023243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387ec2f9d77b00276042b1fa7c95f48ee879d
config: hexagon-randconfig-r041-20220519 (https://download.01.org/0day-ci/archive/20220520/202205200836.FzJQhYQg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/aa5b69eef6a0be734cd331cb3ab4172d854fb93c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Chih-En-Lin/Introduce-Copy-On-Write-to-Page-Table/20220520-023243
        git checkout aa5b69eef6a0be734cd331cb3ab4172d854fb93c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:224:2: error: unknown type name 'pmd_t'
           pmd_t *cow_pte_owner; /* cow pte: pmd */
           ^
>> include/linux/mm_types.h:278:1: error: static_assert failed due to requirement 'sizeof(struct page) == sizeof(struct folio)' "sizeof(struct page) == sizeof(struct folio)"
   static_assert(sizeof(struct page) == sizeof(struct folio));
   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^               ~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:281:1: error: no member named 'flags' in 'folio'
   FOLIO_MATCH(flags, flags);
   ^                  ~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:282:1: error: no member named 'lru' in 'folio'
   FOLIO_MATCH(lru, lru);
   ^                ~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:283:1: error: no member named 'mapping' in 'folio'
   FOLIO_MATCH(mapping, mapping);
   ^                    ~~~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
   include/linux/mm_types.h:284:1: error: no member named 'lru' in 'folio'
   FOLIO_MATCH(compound_head, lru);
   ^                          ~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:285:1: error: no member named 'index' in 'folio'
   FOLIO_MATCH(index, index);
   ^                  ~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:286:1: error: no member named 'private' in 'folio'
   FOLIO_MATCH(private, private);
   ^                    ~~~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:287:1: error: no member named '_mapcount' in 'folio'
   FOLIO_MATCH(_mapcount, _mapcount);
   ^                      ~~~~~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:288:1: error: no member named '_refcount' in 'folio'
   FOLIO_MATCH(_refcount, _refcount);
   ^                      ~~~~~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:290:1: error: no member named 'memcg_data' in 'folio'
   FOLIO_MATCH(memcg_data, memcg_data);
   ^                       ~~~~~~~~~~
   include/linux/mm_types.h:280:45: note: expanded from macro 'FOLIO_MATCH'
           static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
                                                      ^                      ~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
   #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
                                   ^                        ~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
   In file included from include/linux/uio.h:10:
>> include/linux/mm_types.h:296:30: error: no member named 'page' in 'struct folio'
           struct page *tail = &folio->page + 1;
                                ~~~~~  ^
>> include/linux/mm_types.h:333:16: error: no member named 'private' in 'struct folio'
           return folio->private;
                  ~~~~~  ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:15:
   In file included from include/linux/socket.h:8:
>> include/linux/uio.h:153:35: error: no member named 'page' in 'struct folio'
           return copy_page_to_iter(&folio->page, offset, bytes, i);
                                     ~~~~~  ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:13:
   In file included from include/linux/list_lru.h:14:
   In file included from include/linux/xarray.h:15:
   In file included from include/linux/gfp.h:6:
   In file included from include/linux/mmzone.h:22:
>> include/linux/page-flags.h:327:30: error: no member named 'page' in 'struct folio'
           struct page *page = &folio->page;
                                ~~~~~  ^
>> include/linux/page-flags.h:651:32: error: no member named 'mapping' in 'struct folio'
           return ((unsigned long)folio->mapping & PAGE_MAPPING_ANON) != 0;
                                  ~~~~~  ^
   include/linux/page-flags.h:1049:34: error: no member named 'page' in 'struct folio'
           return page_has_private(&folio->page);
                                    ~~~~~  ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)


vim +/pmd_t +224 include/linux/mm_types.h

   220	
   221	#ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
   222		int _last_cpupid;
   223	#endif
 > 224		pmd_t *cow_pte_owner; /* cow pte: pmd */
   225	} _struct_page_alignment;
   226	
   227	/**
   228	 * struct folio - Represents a contiguous set of bytes.
   229	 * @flags: Identical to the page flags.
   230	 * @lru: Least Recently Used list; tracks how recently this folio was used.
   231	 * @mapping: The file this page belongs to, or refers to the anon_vma for
   232	 *    anonymous memory.
   233	 * @index: Offset within the file, in units of pages.  For anonymous memory,
   234	 *    this is the index from the beginning of the mmap.
   235	 * @private: Filesystem per-folio data (see folio_attach_private()).
   236	 *    Used for swp_entry_t if folio_test_swapcache().
   237	 * @_mapcount: Do not access this member directly.  Use folio_mapcount() to
   238	 *    find out how many times this folio is mapped by userspace.
   239	 * @_refcount: Do not access this member directly.  Use folio_ref_count()
   240	 *    to find how many references there are to this folio.
   241	 * @memcg_data: Memory Control Group data.
   242	 *
   243	 * A folio is a physically, virtually and logically contiguous set
   244	 * of bytes.  It is a power-of-two in size, and it is aligned to that
   245	 * same power-of-two.  It is at least as large as %PAGE_SIZE.  If it is
   246	 * in the page cache, it is at a file offset which is a multiple of that
   247	 * power-of-two.  It may be mapped into userspace at an address which is
   248	 * at an arbitrary page offset, but its kernel virtual address is aligned
   249	 * to its size.
   250	 */
   251	struct folio {
   252		/* private: don't document the anon union */
   253		union {
   254			struct {
   255		/* public: */
   256				unsigned long flags;
   257				union {
   258					struct list_head lru;
   259					struct {
   260						void *__filler;
   261						unsigned int mlock_count;
   262					};
   263				};
   264				struct address_space *mapping;
   265				pgoff_t index;
   266				void *private;
   267				atomic_t _mapcount;
   268				atomic_t _refcount;
   269	#ifdef CONFIG_MEMCG
   270				unsigned long memcg_data;
   271	#endif
   272		/* private: the union with struct page is transitional */
   273			};
   274			struct page page;
   275		};
   276	};
   277	
 > 278	static_assert(sizeof(struct page) == sizeof(struct folio));
   279	#define FOLIO_MATCH(pg, fl)						\
   280		static_assert(offsetof(struct page, pg) == offsetof(struct folio, fl))
 > 281	FOLIO_MATCH(flags, flags);
 > 282	FOLIO_MATCH(lru, lru);
 > 283	FOLIO_MATCH(mapping, mapping);
   284	FOLIO_MATCH(compound_head, lru);
 > 285	FOLIO_MATCH(index, index);
 > 286	FOLIO_MATCH(private, private);
 > 287	FOLIO_MATCH(_mapcount, _mapcount);
 > 288	FOLIO_MATCH(_refcount, _refcount);
   289	#ifdef CONFIG_MEMCG
 > 290	FOLIO_MATCH(memcg_data, memcg_data);
   291	#endif
   292	#undef FOLIO_MATCH
   293	
   294	static inline atomic_t *folio_mapcount_ptr(struct folio *folio)
   295	{
 > 296		struct page *tail = &folio->page + 1;
   297		return &tail->compound_mapcount;
   298	}
   299	
   300	static inline atomic_t *compound_mapcount_ptr(struct page *page)
   301	{
   302		return &page[1].compound_mapcount;
   303	}
   304	
   305	static inline atomic_t *compound_pincount_ptr(struct page *page)
   306	{
   307		return &page[1].compound_pincount;
   308	}
   309	
   310	/*
   311	 * Used for sizing the vmemmap region on some architectures
   312	 */
   313	#define STRUCT_PAGE_MAX_SHIFT	(order_base_2(sizeof(struct page)))
   314	
   315	#define PAGE_FRAG_CACHE_MAX_SIZE	__ALIGN_MASK(32768, ~PAGE_MASK)
   316	#define PAGE_FRAG_CACHE_MAX_ORDER	get_order(PAGE_FRAG_CACHE_MAX_SIZE)
   317	
   318	/*
   319	 * page_private can be used on tail pages.  However, PagePrivate is only
   320	 * checked by the VM on the head page.  So page_private on the tail pages
   321	 * should be used for data that's ancillary to the head page (eg attaching
   322	 * buffer heads to tail pages after attaching buffer heads to the head page)
   323	 */
   324	#define page_private(page)		((page)->private)
   325	
   326	static inline void set_page_private(struct page *page, unsigned long private)
   327	{
   328		page->private = private;
   329	}
   330	
   331	static inline void *folio_get_private(struct folio *folio)
   332	{
 > 333		return folio->private;
   334	}
   335	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
