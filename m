Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80ED92DF92;
	Thu, 26 Oct 2023 13:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVLdVUHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698328226; x=1729864226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8NvvbSQB2L8e6eXX5hK/qNY+qc2oSyZ1D5FFKG399E=;
  b=MVLdVUHH8pCwi3XCs9EAx6DThWS/cN0U/r8hv65NxEOny3ikl1gniLe+
   YSYVbEElnbLMTT3aIqBXUl8wjxUPmjnuIFkWKH2FnCQ02olKr2wbfeGcE
   zV/kCo+rmyBw7wF52Ushzwu/khAFu7CItO5eWAjn/mZuMG1Anf6uWNA4f
   DyFEKEpCWT8YalRtXMnQ6Ao0ZrCu82aTzX3LYmSEjJmvyBl278aIIutEL
   0UU4gPmKP9DymvG5JD86IoTKcQL0ypk4hW8z/085xp/FvO+m0elfxfE2A
   FVvSkakzJjNJk2Pryc1rI3RlK4anEfqF2bDRIXdGFhHV0GQjeF7EsXh5N
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="377918440"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="377918440"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2023 06:50:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="882836043"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="882836043"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Oct 2023 06:50:23 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qw0kf-0009pn-1A;
	Thu, 26 Oct 2023 13:50:21 +0000
Date: Thu, 26 Oct 2023 21:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>
Subject: [linux-next:master 14416/15220] fs/exportfs/expfs.c:357:5: error:
 expected identifier or '('
Message-ID: <202310262151.renqMvme-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ef7141596eed0b4b45ef18b3626f428a6b0a822
commit: dfaf653dc41557548b2e75e6cd837071f7c63289 [14416/15220] exportfs: make ->encode_fh() a mandatory method for NFS export
config: hexagon-randconfig-r015-20211224 (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMvme-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231026/202310262151.renqMvme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310262151.renqMvme-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/exportfs/expfs.c:357:5: error: expected identifier or '('
   int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
       ^
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
>> fs/exportfs/expfs.c:357:5: error: expected ')'
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
   fs/exportfs/expfs.c:357:5: note: to match this '('
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:15: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                 ^
>> fs/exportfs/expfs.c:357:5: error: expected ')'
   int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
       ^
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                         ^
   fs/exportfs/expfs.c:357:5: note: to match this '('
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
   fs/exportfs/expfs.c:384:19: error: expected identifier or '('
   EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
                     ^
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
   fs/exportfs/expfs.c:384:19: error: expected ')'
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
   fs/exportfs/expfs.c:384:19: note: to match this '('
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:15: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                 ^
   fs/exportfs/expfs.c:384:19: error: expected ')'
   EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
                     ^
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                         ^
   fs/exportfs/expfs.c:384:19: note: to match this '('
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
>> fs/exportfs/expfs.c:384:1: error: pasting formed '__addressable_(', an invalid preprocessing token
   EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
   ^
   include/linux/export.h:87:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
                                           ^
   include/linux/export.h:83:38: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
                                           ^
   include/linux/export.h:75:2: note: expanded from macro '__EXPORT_SYMBOL'
           __ADDRESSABLE(sym)                                      \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:215:15: note: expanded from macro '___ADDRESSABLE'
                   __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                               ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:24: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                          ^
>> fs/exportfs/expfs.c:384:19: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
                     ^
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:16: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                  ^
   fs/exportfs/expfs.c:384:19: error: expected ')'
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:23: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                         ^
   fs/exportfs/expfs.c:384:19: note: to match this '('
   include/linux/exportfs.h:286:33: note: expanded from macro 'generic_encode_ino32_fh'
   #define generic_encode_ino32_fh NULL
                                   ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^
>> fs/exportfs/expfs.c:384:1: error: pasting formed ')216', an invalid preprocessing token
   EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
   ^
   include/linux/export.h:87:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
                                           ^
   include/linux/export.h:83:38: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
                                           ^
   include/linux/export.h:75:2: note: expanded from macro '__EXPORT_SYMBOL'
           __ADDRESSABLE(sym)                                      \
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler-clang.h:20:29: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                               ^
   include/linux/compiler_types.h:75:22: note: expanded from macro '__PASTE'
   #define __PASTE(a,b) ___PASTE(a,b)
                        ^
   include/linux/compiler_types.h:74:24: note: expanded from macro '___PASTE'
   #define ___PASTE(a,b) a##b
                          ^
>> fs/exportfs/expfs.c:384:1: error: expected function body after function declarator
   include/linux/export.h:87:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
                                           ^
   include/linux/export.h:83:38: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
                                           ^
   include/linux/export.h:75:2: note: expanded from macro '__EXPORT_SYMBOL'
           __ADDRESSABLE(sym)                                      \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler.h:215:3: note: expanded from macro '___ADDRESSABLE'
                   __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
                   ^
   include/linux/compiler-clang.h:20:68: note: expanded from macro '__UNIQUE_ID'
   #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                                                      ^
   <scratch space>:114:1: note: expanded from here
   216
   ^
>> fs/exportfs/expfs.c:384:1: error: pasting formed '__export_symbol_(', an invalid preprocessing token
   include/linux/export.h:87:33: note: expanded from macro 'EXPORT_SYMBOL_GPL'
   #define EXPORT_SYMBOL_GPL(sym)          _EXPORT_SYMBOL(sym, "GPL")
                                           ^
   include/linux/export.h:83:38: note: expanded from macro '_EXPORT_SYMBOL'
   #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
                                           ^
   include/linux/export.h:76:18: note: expanded from macro '__EXPORT_SYMBOL'
           asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
                           ^
   include/linux/export.h:47:18: note: expanded from macro '___EXPORT_SYMBOL'
           __export_symbol_##sym:                  ASM_NL  \
                           ^
   12 errors generated.


vim +357 fs/exportfs/expfs.c

   344	
   345	/**
   346	 * generic_encode_ino32_fh - generic export_operations->encode_fh function
   347	 * @inode:   the object to encode
   348	 * @fh:      where to store the file handle fragment
   349	 * @max_len: maximum length to store there (in 4 byte units)
   350	 * @parent:  parent directory inode, if wanted
   351	 *
   352	 * This generic encode_fh function assumes that the 32 inode number
   353	 * is suitable for locating an inode, and that the generation number
   354	 * can be used to check that it is still valid.  It places them in the
   355	 * filehandle fragment where export_decode_fh expects to find them.
   356	 */
 > 357	int generic_encode_ino32_fh(struct inode *inode, __u32 *fh, int *max_len,
   358				    struct inode *parent)
   359	{
   360		struct fid *fid = (void *)fh;
   361		int len = *max_len;
   362		int type = FILEID_INO32_GEN;
   363	
   364		if (parent && (len < 4)) {
   365			*max_len = 4;
   366			return FILEID_INVALID;
   367		} else if (len < 2) {
   368			*max_len = 2;
   369			return FILEID_INVALID;
   370		}
   371	
   372		len = 2;
   373		fid->i32.ino = inode->i_ino;
   374		fid->i32.gen = inode->i_generation;
   375		if (parent) {
   376			fid->i32.parent_ino = parent->i_ino;
   377			fid->i32.parent_gen = parent->i_generation;
   378			len = 4;
   379			type = FILEID_INO32_GEN_PARENT;
   380		}
   381		*max_len = len;
   382		return type;
   383	}
 > 384	EXPORT_SYMBOL_GPL(generic_encode_ino32_fh);
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
