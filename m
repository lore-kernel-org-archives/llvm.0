Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FD51FAE
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 06:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650523437; x=1682059437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KXzTwUe1iXGr9kDF7hwATHlkcfdunw0lijaUMYydCU=;
  b=O9WxP/zALeaU6EhFSMS+8nA7Ndj4dKsWcDxI1ah/hHU3OU/FZfQ+Jrvq
   SCheo+P7dWmGg5F2rNqCkVO90VVbkl+ZCGhlxaYrWfvF8DiIm5kl750Bz
   9SUDH4beJ4aUuOFQfjfBvrlzbpUlrEgx9dI7Ee0pfPUdpdnWiiikt9BZj
   lgnxbyd3w2qEktfbRcbfG9nKybQAeFdpMA9sjqDuuwEKHp9bMy6wxPuWE
   z3pynN2fVbWalszner96CVeReoUTFhGNatgWjVSkj1+u60smJqW8QcL1n
   F/eUaztfaIUcfoPW3E49PWJR96BzFXHtR7tD6B4L/dwlTLqQjxWY6x3X8
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="261857566"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="261857566"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2022 23:43:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="532792902"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Apr 2022 23:43:51 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhQXf-00080m-0P;
	Thu, 21 Apr 2022 06:43:51 +0000
Date: Thu, 21 Apr 2022 14:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 2441/2579] include/linux/fs_api.h:424:29:
 error: static declaration of 'file_inode' follows non-static declaration
Message-ID: <202204210634.Db7gTUaE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 5e5b9f1427ab55c511d68e2ee5471cbeabf50830 [2441/2579] headers/deps: mm: Optimize <linux/pagemap.h> dependencies
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220421/202204210634.Db7gTUaE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project bac6cd5bf85669e3376610cfc4c4f9ca015e7b9b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=5e5b9f1427ab55c511d68e2ee5471cbeabf50830
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 5e5b9f1427ab55c511d68e2ee5471cbeabf50830
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ubifs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/ubifs/budget.c:21:
   In file included from fs/ubifs/ubifs.h:40:
   include/linux/fscrypt.h:758:30: error: implicit declaration of function 'file_inode' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           const struct inode *inode = file_inode(iocb->ki_filp);
                                       ^
   include/linux/fscrypt.h:758:30: note: did you mean 'folio_inode'?
   include/linux/pagemap.h:375:29: note: 'folio_inode' declared here
   static inline struct inode *folio_inode(struct folio *folio)
                               ^
   In file included from fs/ubifs/budget.c:21:
   In file included from fs/ubifs/ubifs.h:40:
   include/linux/fscrypt.h:758:22: warning: incompatible integer to pointer conversion initializing 'const struct inode *' with an expression of type 'int' [-Wint-conversion]
           const struct inode *inode = file_inode(iocb->ki_filp);
                               ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ubifs/budget.c:22:
   In file included from include/linux/writeback_api.h:16:
   In file included from include/linux/backing-dev-api.h:16:
>> include/linux/fs_api.h:424:29: error: static declaration of 'file_inode' follows non-static declaration
   static inline struct inode *file_inode(const struct file *f)
                               ^
   include/linux/fscrypt.h:758:30: note: previous implicit declaration is here
           const struct inode *inode = file_inode(iocb->ki_filp);
                                       ^
   1 warning and 2 errors generated.
--
   In file included from fs/ubifs/file.c:40:
   In file included from fs/ubifs/ubifs.h:40:
   include/linux/fscrypt.h:758:30: error: implicit declaration of function 'file_inode' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           const struct inode *inode = file_inode(iocb->ki_filp);
                                       ^
   include/linux/fscrypt.h:758:30: note: did you mean 'folio_inode'?
   include/linux/pagemap.h:375:29: note: 'folio_inode' declared here
   static inline struct inode *folio_inode(struct folio *folio)
                               ^
   In file included from fs/ubifs/file.c:40:
   In file included from fs/ubifs/ubifs.h:40:
   include/linux/fscrypt.h:758:22: warning: incompatible integer to pointer conversion initializing 'const struct inode *' with an expression of type 'int' [-Wint-conversion]
           const struct inode *inode = file_inode(iocb->ki_filp);
                               ^       ~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ubifs/file.c:42:
   In file included from include/linux/writeback_api.h:16:
   In file included from include/linux/backing-dev-api.h:16:
>> include/linux/fs_api.h:424:29: error: static declaration of 'file_inode' follows non-static declaration
   static inline struct inode *file_inode(const struct file *f)
                               ^
   include/linux/fscrypt.h:758:30: note: previous implicit declaration is here
           const struct inode *inode = file_inode(iocb->ki_filp);
                                       ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:97:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                           ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:97:25: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return (set->sig[3] | set->sig[2] |
                                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:113:11: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:113:27: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                   return  (set1->sig[3] == set2->sig[3]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:114:5: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:114:21: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
                           (set1->sig[2] == set2->sig[2]) &&
                                            ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:8: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:137:24: note: expanded from macro '_SIG_SET_BINOP'
                   a3 = a->sig[3]; a2 = a->sig[2];                         \
                                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
                   b3 = b->sig[3]; b2 = b->sig[2];                         \
                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:156:1: warning: array index 2 is past the end of the array (which contains 2 elements) [-Warray-bounds]
   _SIG_SET_BINOP(sigorsets, _sig_or)
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
                   b3 = b->sig[3]; b2 = b->sig[2];                         \
                                        ^      ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
           unsigned long sig[_NSIG_WORDS];
           ^
   In file included from fs/ubifs/file.c:44:
   In file included from include/linux/syscalls_api.h:11:
   include/linux/signal.h:156:1: warning: array index 3 is past the end of the array (which contains 2 elements) [-Warray-bounds]


vim +/file_inode +424 include/linux/fs_api.h

0f5d0a0fe62409 Ingo Molnar 2022-04-16  423  
0f5d0a0fe62409 Ingo Molnar 2022-04-16 @424  static inline struct inode *file_inode(const struct file *f)
0f5d0a0fe62409 Ingo Molnar 2022-04-16  425  {
0f5d0a0fe62409 Ingo Molnar 2022-04-16  426  	return f->f_inode;
0f5d0a0fe62409 Ingo Molnar 2022-04-16  427  }
0f5d0a0fe62409 Ingo Molnar 2022-04-16  428  

:::::: The code at line 424 was first introduced by commit
:::::: 0f5d0a0fe6240979a116fdd86cc2997879173bff headers/deps: fs: Split <linux/fs.h> into <linux/fs_types.h> and <linux/fs_api.h>

:::::: TO: Ingo Molnar <mingo@kernel.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
