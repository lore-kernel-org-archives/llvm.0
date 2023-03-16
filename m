Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29590A938;
	Thu, 16 Mar 2023 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678996490; x=1710532490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RkAdyvp9IV90PCOPzGWxAXldt0LYTVr3gCZPg8Iycm8=;
  b=I8kdVaCIYMMBvdQObl4BHkgfhjsHf8jjCpfeo5X/iDBYFq2VRny6rCmh
   ug8dYt9/5WRpwj2leMri6kzK294J06EZHKJ3anTUHtX2H+hwfdSHyK8wD
   LL24hMQnuR9xd3xcoxu6bYDhzo3J88oxJY5ILr5Xb41FVaYTDFNq9Xb+z
   1LIPLIACvzoyNo5U6yCvj+NW6ahdD3K2tbaiKVBLCsdHWDxPEG1JnVP4W
   TuSKNXDClJ94BjM1u/oHrZeyi4KQHOF1ZiIIqK9JTaq+2hrhJwH6MgcVi
   pQVw5TFx4AXT5ujT0/u6nimPu0yXnGfn06BgtDUtxY9P77L4rlUDwd24A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338115122"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="338115122"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 12:54:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712486995"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="712486995"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 16 Mar 2023 12:54:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pctgP-0008mQ-2f;
	Thu, 16 Mar 2023 19:54:41 +0000
Date: Fri, 17 Mar 2023 03:54:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:pipe-list 48/48] fs/splice.c:363:18: warning:
 comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int
 *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka
 'unsigned long *'))
Message-ID: <202303170341.FZYjc9fp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pipe-list
head:   b678626289708f1a3b1f2a46671bf3e0f00282e5
commit: b678626289708f1a3b1f2a46671bf3e0f00282e5 [48/48] pipe: Use a linked-list instead of a ring buffer
config: arm-randconfig-r046-20230312 (https://download.01.org/0day-ci/archive/20230317/202303170341.FZYjc9fp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=b678626289708f1a3b1f2a46671bf3e0f00282e5
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs pipe-list
        git checkout b678626289708f1a3b1f2a46671bf3e0f00282e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303170341.FZYjc9fp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/splice.c:25:
   In file included from include/linux/splice.h:12:
   include/linux/pipe_fs_i.h:109:19: error: no member named 'get' in 'struct pipe_buf_operations'
           return buf->ops->get(pipe, buf);
                  ~~~~~~~~  ^
   fs/splice.c:143:3: error: field designator 'get' does not refer to any field in type 'const struct pipe_buf_operations'
           .get            = generic_pipe_buf_get,
            ^
   fs/splice.c:159:3: error: field designator 'get' does not refer to any field in type 'const struct pipe_buf_operations'
           .get            = generic_pipe_buf_get,
            ^
   fs/splice.c:295:3: error: field designator 'get' does not refer to any field in type 'const struct pipe_buf_operations'
           .get            = generic_pipe_buf_get,
            ^
   fs/splice.c:301:3: error: field designator 'get' does not refer to any field in type 'const struct pipe_buf_operations'
           .get            = generic_pipe_buf_get,
            ^
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:38: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:36:35: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ~~~~~~~~~~~^~~~~
   include/linux/minmax.h:26:16: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:20:21: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                              ^
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof ((typeof (len))__builtin_choose_expr(((!!(sizeof ((typeof (len) *)1 == (typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *)1))) && ((sizeof(int) == sizeof (*(8 ? ((void *)((long)(len) * 0L)) : (int *)8))) && (sizeof(int) == sizeof (*(8 ? ((void *)((long)(((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) * 0L)) : (int *)8))))), ((len) < (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) ? (len) : (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1))))), ({
       typeof (len) __UNIQUE_ID___x303 = (len);
       typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) __UNIQUE_ID___y304 = (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1))));
       ((__UNIQUE_ID___x303) < (__UNIQUE_ID___y304) ? (__UNIQUE_ID___x303) : (__UNIQUE_ID___y304));
   }))) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_d & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:23: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:38: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^
   note: (skipping 4 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:26:43: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                                         ~~~~~~~~~~~~~~~~~~^~~~~
   include/linux/minmax.h:23:19: note: expanded from macro '__no_side_effects'
                   (__is_constexpr(x) && __is_constexpr(y))
                    ~~~~~~~~~~~~~~~^~
   include/linux/const.h:12:48: note: expanded from macro '__is_constexpr'
           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
                                                         ^
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:38: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:37:9: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ~~~~~~^~~~~~~~~
   include/linux/minmax.h:28:27: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                             ^
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:38: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:37:9: note: expanded from macro '__careful_cmp'
                   __cmp(x, y, op), \
                   ~~~~~~^~~~~~~~~
   include/linux/minmax.h:28:40: note: expanded from macro '__cmp'
   #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
                                          ^
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:38: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:10: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x = (x);               \
                          ^
>> fs/splice.c:363:18: warning: comparison of distinct pointer types ('typeof (len) *' (aka 'unsigned int *') and 'typeof (((1UL) << 12) - (offset_s & ~(~((1 << 12) - 1)))) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min3(len,
                                         ^~~~~~~~~
   include/linux/minmax.h:82:38: note: expanded from macro 'min3'
   #define min3(x, y, z) min((typeof(x))min(x, y), z)
                         ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/minmax.h:67:33: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ~~~~~~~~~~~~~~^~~~~~~~
   include/linux/minmax.h:38:14: note: expanded from macro '__careful_cmp'
                   __cmp_once(x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y), op))
                   ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:31:25: note: expanded from macro '__cmp_once'
                   typeof(x) unique_x = (x);               \
                                         ^
   fs/splice.c:1398:25: error: no member named 'ix' in 'struct pipe_buffer'
           unsigned int i = ibuf->ix, o = 0;
                            ~~~~  ^
   fs/splice.c:1405:30: error: no member named 'ix' in 'struct pipe_buffer'
           obuf->nr        = ibuf->nr - ibuf->ix;
                                        ~~~~  ^
   fs/splice.c:1406:44: error: no member named 'ix' in 'struct pipe_buffer'
           obuf->confirmed = ibuf->confirmed - ibuf->ix;
                                               ~~~~  ^
   fs/splice.c:1406:8: error: no member named 'confirmed' in 'struct pipe_buffer'; did you mean 'nr_confirmed'?
           obuf->confirmed = ibuf->confirmed - ibuf->ix;
                 ^~~~~~~~~
                 nr_confirmed
   include/linux/pipe_fs_i.h:45:18: note: 'nr_confirmed' declared here
           unsigned short          nr_confirmed;
                                   ^
   fs/splice.c:1406:26: error: no member named 'confirmed' in 'struct pipe_buffer'; did you mean 'nr_confirmed'?
           obuf->confirmed = ibuf->confirmed - ibuf->ix;
                                   ^~~~~~~~~
                                   nr_confirmed
   include/linux/pipe_fs_i.h:45:18: note: 'nr_confirmed' declared here
           unsigned short          nr_confirmed;
                                   ^
   fs/splice.c:1429:7: error: use of undeclared identifier 'j'
                   if (j >= obuf->max)
                       ^
   fs/splice.c:1433:8: error: no member named 'ix' in 'struct pipe_buffer'
           ibuf->ix = i;
           ~~~~  ^
   fs/splice.c:1434:8: error: no member named 'ix' in 'struct pipe_buffer'
           obuf->ix = o;
           ~~~~  ^
   fs/splice.c:1436:2: error: need to do the page getting thing
   #error need to do the page getting thing
    ^
   fs/splice.c:1437:27: error: too few arguments to function call, expected 2, have 1
           obuf->ops->get_pages(obuf);
           ~~~~~~~~~~~~~~~~~~~~     ^
   fs/splice.c:1566:18: error: no member named 'tail' in 'struct pipe_inode_info'
           i_tail = ipipe->tail;
                    ~~~~~  ^
   fs/splice.c:1567:18: error: no member named 'ring_size' in 'struct pipe_inode_info'
           i_mask = ipipe->ring_size - 1;
                    ~~~~~  ^
   fs/splice.c:1568:18: error: no member named 'head' in 'struct pipe_inode_info'
           o_head = opipe->head;
                    ~~~~~  ^
   fs/splice.c:1569:18: error: no member named 'ring_size' in 'struct pipe_inode_info'
           o_mask = opipe->ring_size - 1;
                    ~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   7 warnings and 20 errors generated.


vim +363 fs/splice.c

   336	
   337	/*
   338	 * Try to steal the page from a pipe buffer and if we fail, copy the folio and
   339	 * update the pipe buffer to point to the copy.
   340	 */
   341	static int splice_steal_or_copy(struct pipe_inode_info *pipe,
   342					struct pipe_buffer *buf,
   343					struct splice_desc *sd)
   344	{
   345		struct bio_vec *bv = &buf->bvec[buf->index];
   346	
   347		if (!pipe_buf_try_steal(pipe, buf)) {
   348			/* Fall back to replacing the buffer folio with a copy. */
   349			struct folio *folio;
   350			size_t offset_d = 0;
   351			size_t offset_s = bv->bv_offset, len = bv->bv_len;
   352			size_t size = roundup_pow_of_two(len);
   353			size_t order = ilog2(size);
   354	
   355			WARN_ON(order > folio_order(bv->bv_folio));
   356	
   357			folio = folio_alloc(GFP_KERNEL, order);
   358			if (!folio)
   359				return -ENOMEM;
   360	
   361			do {
   362				void *src, *dst;
 > 363				size_t part = min3(len,
   364						   PAGE_SIZE - (offset_s & ~PAGE_MASK),
   365						   PAGE_SIZE - (offset_d & ~PAGE_MASK));
   366	
   367				src = kmap_local_folio(bv->bv_folio, offset_s);
   368				dst = kmap_local_folio(folio, offset_d);
   369				memcpy(dst, src, part);
   370				kunmap_local(src);
   371				kunmap_local(dst);
   372				offset_s += part;
   373				offset_d += part;
   374				len -= part;
   375			} while (len > 0);
   376	
   377			pipe_buf_release(pipe, buf);
   378	
   379			bv->bv_folio = folio;
   380			bv->bv_offset = 0;
   381		} else {
   382			/* Need to unlock the page */
   383			folio_unlock(bv->bv_folio);
   384		}
   385	
   386		buf->flags |= PIPE_BUF_FLAG_IX_STOLEN;
   387		return 0;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
