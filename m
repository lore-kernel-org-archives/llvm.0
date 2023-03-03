Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20853399;
	Fri,  3 Mar 2023 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677802193; x=1709338193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEO69e7t4SUCptDZHAye6J7VUmZunSOCkRUou3oEIcw=;
  b=c4CBJkA+8VxVuJkt8pFVUw+gI6N/KehGVgJ+96TpG/wMBa3w2BDMAUrL
   erDr44uxLKUPVddD2RDgzxgX/nq4zoMhBmzpE2rV8vZ9WQJNeUfyhkfHP
   /yF5bzCJDyTDrUsOsQwLd6FDR6iA4sWq16Qi+KGyPcMlHiM37hhpR7QYt
   Zp0EWTibvbwyS37HKD7diBvnGTn8EcLDJBovizJK3BWTVHKgPoqYebxIM
   +Ak8DvE9P2hkCcSJUrebk0WVqMYsyWu8tqmVOndHX/FCHJQ2KfC5MZvwW
   +29io88dv6a85Y71tRkbDczLJSKHwQuZz890SvHt3N41aYULu4I+H+uu4
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="318720578"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="318720578"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 16:09:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="668451827"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="668451827"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 02 Mar 2023 16:08:42 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXsyX-000110-1T;
	Fri, 03 Mar 2023 00:08:41 +0000
Date: Fri, 3 Mar 2023 08:08:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 1447/9999] <inline asm>:6:2: error: cpu
 alternatives does not support instructions blocks > 254 bytes
Message-ID: <202303030805.rRkU4bRr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   d383d0f28ecac0f3375bdfb9a0c4bfac979f6f8f
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [1447/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: s390-randconfig-r034-20230303 (https://download.01.org/0day-ci/archive/20230303/202303030805.rRkU4bRr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash fs/jbd2/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303030805.rRkU4bRr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:94:
   arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
                   ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                   ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:83:2: note: expanded from macro 'OLDINSTR'
           OLDINSTR_PADDING(oldinstr, num)                                 \
           ^
   arch/s390/include/asm/alternative.h:71:3: note: expanded from macro 'OLDINSTR_PADDING'
           ".if " oldinstr_pad_len(num) " > 6\n"                           \
            ^
   <inline asm>:15:5: note: instantiated into assembly here
   .if -(((6651b-6641b)-(662b-661b)) > 0) * ((6651b-6641b)-(662b-661b)) > 6
       ^
   In file included from fs/jbd2/transaction.c:18:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:94:
   arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
                   ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                   ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:85:2: note: expanded from macro 'OLDINSTR'
           INSTR_LEN_SANITY_CHECK(oldinstr_len)
           ^
   arch/s390/include/asm/alternative.h:62:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           ".if " len " > 254\n"                                           \
            ^
   <inline asm>:25:5: note: instantiated into assembly here
   .if 662b-661b > 254
       ^
   In file included from fs/jbd2/transaction.c:18:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:94:
   arch/s390/include/asm/spinlock.h:89:3: error: cpu alternatives does not support instructions blocks > 254 bytes
                   ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                   ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:85:2: note: expanded from macro 'OLDINSTR'
           INSTR_LEN_SANITY_CHECK(oldinstr_len)
           ^
   arch/s390/include/asm/alternative.h:63:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           "\t.error \"cpu alternatives does not support instructions "    \
            ^
   <inline asm>:26:2: note: instantiated into assembly here
           .error "cpu alternatives does not support instructions blocks > 254 bytes"
           ^
   In file included from fs/jbd2/transaction.c:18:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:94:
   arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
                   ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                   ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:85:2: note: expanded from macro 'OLDINSTR'
           INSTR_LEN_SANITY_CHECK(oldinstr_len)
           ^
   arch/s390/include/asm/alternative.h:66:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           ".if (" len ") %% 2\n"                                          \
            ^
   <inline asm>:28:5: note: instantiated into assembly here
   .if (662b-661b) % 2
       ^
   In file included from fs/jbd2/transaction.c:18:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:94:
   arch/s390/include/asm/spinlock.h:89:3: error: cpu alternatives instructions length is odd
                   ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                   ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:85:2: note: expanded from macro 'OLDINSTR'
           INSTR_LEN_SANITY_CHECK(oldinstr_len)
           ^
   arch/s390/include/asm/alternative.h:67:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           "\t.error \"cpu alternatives instructions length is odd\"\n"    \
            ^
   <inline asm>:29:2: note: instantiated into assembly here
           .error "cpu alternatives instructions length is odd"
           ^
   <inline asm>:5:5: error: expected absolute expression
   .if 6651b-6641b > 254
       ^
>> <inline asm>:6:2: error: cpu alternatives does not support instructions blocks > 254 bytes
           .error "cpu alternatives does not support instructions blocks > 254 bytes"
           ^
   <inline asm>:8:5: error: expected absolute expression
   .if (6651b-6641b) % 2
       ^
>> <inline asm>:9:2: error: cpu alternatives instructions length is odd
           .error "cpu alternatives instructions length is odd"
           ^
   <inline asm>:15:5: error: expected absolute expression
   .if -(((6651b-6641b)-(662b-661b)) > 0) * ((6651b-6641b)-(662b-661b)) > 6
       ^
   <inline asm>:25:5: error: expected absolute expression
   .if 662b-661b > 254
       ^
   <inline asm>:26:2: error: cpu alternatives does not support instructions blocks > 254 bytes
           .error "cpu alternatives does not support instructions blocks > 254 bytes"
           ^
   <inline asm>:28:5: error: expected absolute expression
   .if (662b-661b) % 2
       ^
   <inline asm>:29:2: error: cpu alternatives instructions length is odd
           .error "cpu alternatives instructions length is odd"
           ^
   In file included from fs/jbd2/transaction.c:18:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:94:
   arch/s390/include/asm/spinlock.h:89:3: error: expected absolute expression
                   ALTERNATIVE("", ".long 0xb2fa0070", 49) /* NIAI 7 */
                   ^
   arch/s390/include/asm/alternative.h:111:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_REPLACEMENT(altinstr, 1)                               \
           ^
   arch/s390/include/asm/alternative.h:106:2: note: expanded from macro 'ALTINSTR_REPLACEMENT'
           INSTR_LEN_SANITY_CHECK(altinstr_len(num))
           ^
   arch/s390/include/asm/alternative.h:62:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           ".if " len " > 254\n"                                           \
            ^
   <inline asm>:5:5: note: instantiated into assembly here
   .if 6651b-6641b > 254
       ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   12 warnings and 20 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
