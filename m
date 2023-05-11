Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEB41B8FA;
	Thu, 11 May 2023 09:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683796504; x=1715332504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wFmIwrgMAbI25HI30o+f1uR6+JWxPyF7lT2k7NxhXAY=;
  b=bEPGDBA10/wuBwUIS8FNAmnk7TUYhUiSR54ymXRmyVIWv4TxJVx4ZaXO
   Rg6sUTg+t4ubn1Wki3Ij1NYNWk14dPBzi9b6nBMjzjeF4zLXfH0ONVsYZ
   gOYZU7fwzLFYKviEe7HbBQK4nTlnBgGUKVyM4DUYkDOUeciMDAZ5IkZDq
   Fh4GgpDF0E1fXCauViGJYxXazIH3TOooM7op+mwtA8QxAtpm2J+VbLpLx
   ZSE55bngIdhVTAha4mTaF/oC84bP3RcoKybyZhsBNGEMPaV5htxDBBY7v
   Be7Qt1IF/3LjEskuVOSZNG2zXbm/NlhepLRrJAbF4COYXgGNDCT+a6Zt1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="339718151"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="339718151"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 02:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="1029554604"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="1029554604"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 May 2023 02:15:01 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px2O4-0003uW-0X;
	Thu, 11 May 2023 09:15:00 +0000
Date: Thu, 11 May 2023 17:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 36/9999] arch/s390/kernel/vtime.c:132:2: error:
 expected absolute expression
Message-ID: <202305111705.8j4cTm2s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   8a7f2a5c5aa1648edb4f2029c6ec33870afb7a95
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: s390-randconfig-r022-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111705.8j4cTm2s-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kernel/ arch/s390/lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305111705.8j4cTm2s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/vtime.c:132:2: error: expected absolute expression
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
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
   <inline asm>:7:5: note: instantiated into assembly here
   .if 6651b-6641b > 254
       ^
>> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives does not support instructions blocks > 254 bytes
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
                               ^
   arch/s390/include/asm/alternative.h:111:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_REPLACEMENT(altinstr, 1)                               \
           ^
   arch/s390/include/asm/alternative.h:106:2: note: expanded from macro 'ALTINSTR_REPLACEMENT'
           INSTR_LEN_SANITY_CHECK(altinstr_len(num))
           ^
   arch/s390/include/asm/alternative.h:63:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           "\t.error \"cpu alternatives does not support instructions "    \
            ^
   <inline asm>:8:2: note: instantiated into assembly here
           .error "cpu alternatives does not support instructions blocks > 254 bytes"
           ^
>> arch/s390/kernel/vtime.c:132:2: error: expected absolute expression
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
                               ^
   arch/s390/include/asm/alternative.h:111:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_REPLACEMENT(altinstr, 1)                               \
           ^
   arch/s390/include/asm/alternative.h:106:2: note: expanded from macro 'ALTINSTR_REPLACEMENT'
           INSTR_LEN_SANITY_CHECK(altinstr_len(num))
           ^
   arch/s390/include/asm/alternative.h:66:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           ".if (" len ") %% 2\n"                                          \
            ^
   <inline asm>:10:5: note: instantiated into assembly here
   .if (6651b-6641b) % 2
       ^
>> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives instructions length is odd
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
                               ^
   arch/s390/include/asm/alternative.h:111:2: note: expanded from macro 'ALTERNATIVE'
           ALTINSTR_REPLACEMENT(altinstr, 1)                               \
           ^
   arch/s390/include/asm/alternative.h:106:2: note: expanded from macro 'ALTINSTR_REPLACEMENT'
           INSTR_LEN_SANITY_CHECK(altinstr_len(num))
           ^
   arch/s390/include/asm/alternative.h:67:3: note: expanded from macro 'INSTR_LEN_SANITY_CHECK'
           "\t.error \"cpu alternatives instructions length is odd\"\n"    \
            ^
   <inline asm>:11:2: note: instantiated into assembly here
           .error "cpu alternatives instructions length is odd"
           ^
>> arch/s390/kernel/vtime.c:132:2: error: expected absolute expression
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
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
   <inline asm>:19:5: note: instantiated into assembly here
   .if -(((6651b-6641b)-(662b-661b)) > 0) * ((6651b-6641b)-(662b-661b)) > 6
       ^
>> arch/s390/kernel/vtime.c:132:2: error: expected absolute expression
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
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
   <inline asm>:29:5: note: instantiated into assembly here
   .if 662b-661b > 254
       ^
>> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives does not support instructions blocks > 254 bytes
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
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
   <inline asm>:30:2: note: instantiated into assembly here
           .error "cpu alternatives does not support instructions blocks > 254 bytes"
           ^
>> arch/s390/kernel/vtime.c:132:2: error: expected absolute expression
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
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
   <inline asm>:32:5: note: instantiated into assembly here
   .if (662b-661b) % 2
       ^
>> arch/s390/kernel/vtime.c:132:2: error: cpu alternatives instructions length is odd
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
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
   <inline asm>:33:2: note: instantiated into assembly here
           .error "cpu alternatives instructions length is odd"
           ^
>> arch/s390/kernel/vtime.c:132:2: error: invalid number of bytes
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
                               ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:83:2: note: expanded from macro 'OLDINSTR'
           OLDINSTR_PADDING(oldinstr, num)                                 \
           ^
   arch/s390/include/asm/alternative.h:74:3: note: expanded from macro 'OLDINSTR_PADDING'
           "\t.fill (" oldinstr_pad_len(num) " - (6620b-662b)) / 2, 2, 0x0700\n" \
            ^
   <inline asm>:22:8: note: instantiated into assembly here
           .fill (-(((6651b-6641b)-(662b-661b)) > 0) * ((6651b-6641b)-(662b-661b)) - (6620b-662b)) / 2, 2, 0x0700
                 ^
>> arch/s390/kernel/vtime.c:132:2: error: invalid number of bytes
           alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
           ^
   arch/s390/include/asm/alternative.h:155:22: note: expanded from macro 'alternative_io'
           asm_inline volatile(ALTERNATIVE(oldinstr, altinstr, facility)   \
                               ^
   arch/s390/include/asm/alternative.h:113:2: note: expanded from macro 'ALTERNATIVE'
           OLDINSTR(oldinstr, 1)                                           \
           ^
   arch/s390/include/asm/alternative.h:83:2: note: expanded from macro 'OLDINSTR'
           OLDINSTR_PADDING(oldinstr, num)                                 \
           ^
   arch/s390/include/asm/alternative.h:74:3: note: expanded from macro 'OLDINSTR_PADDING'
           "\t.fill (" oldinstr_pad_len(num) " - (6620b-662b)) / 2, 2, 0x0700\n" \
            ^
   <inline asm>:22:8: note: instantiated into assembly here
           .fill (-(((6651b-6641b)-(662b-661b)) > 0) * ((6651b-6641b)-(662b-661b)) - (6620b-662b)) / 2, 2, 0x0700
                 ^
   11 errors generated.
--
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:67:4: note: while in macro instantiation
                   "       VSTM    8,23,128,1\n"   /* vstm %v8,%v23,128(%r1) */
                    ^
   <inline asm>:7:2: note: instantiated into assembly here
           VSTM    8,23,128,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:74:4: note: while in macro instantiation
                   "       VSTM    0,7,0,1\n"      /* vstm %v0,%v7,0(%r1) */
                    ^
   <inline asm>:13:2: note: instantiated into assembly here
           VSTM    0,7,0,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:76:4: note: while in macro instantiation
                   "1:     VSTM    8,15,128,1\n"   /* vstm %v8,%v15,128(%r1) */
                    ^
   <inline asm>:15:4: note: instantiated into assembly here
   1:      VSTM    8,15,128,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:78:4: note: while in macro instantiation
                   "2:     VSTM    0,15,0,1\n"     /* vstm %v0,%v15,0(%r1) */
                    ^
   <inline asm>:17:4: note: instantiated into assembly here
   2:      VSTM    0,15,0,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:84:4: note: while in macro instantiation
                   "       VSTM    16,23,256,1\n"  /* vstm %v16,%v23,256(%r1) */
                    ^
   <inline asm>:22:2: note: instantiated into assembly here
           VSTM    16,23,256,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:86:4: note: while in macro instantiation
                   "4:     VSTM    24,31,384,1\n"  /* vstm %v24,%v31,384(%r1) */
                    ^
   <inline asm>:24:4: note: instantiated into assembly here
   4:      VSTM    24,31,384,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:88:4: note: while in macro instantiation
                   "5:     VSTM    0,15,0,1\n"     /* vstm %v0,%v15,0(%r1) */
                    ^
   <inline asm>:26:4: note: instantiated into assembly here
   5:      VSTM    0,15,0,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:89:4: note: while in macro instantiation
                   "6:     VSTM    16,31,256,1\n"  /* vstm %v16,%v31,256(%r1) */
                    ^
   <inline asm>:27:4: note: instantiated into assembly here
   6:      VSTM    16,31,256,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:149:4: note: while in macro instantiation
                   "       VLM     8,23,128,1\n"   /* vlm %v8,%v23,128(%r1) */
                    ^
   <inline asm>:7:2: note: instantiated into assembly here
           VLM     8,23,128,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:156:4: note: while in macro instantiation
                   "       VLM     0,7,0,1\n"      /* vlm %v0,%v7,0(%r1) */
                    ^
   <inline asm>:13:2: note: instantiated into assembly here
           VLM     0,7,0,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:158:4: note: while in macro instantiation
                   "1:     VLM     8,15,128,1\n"   /* vlm %v8,%v15,128(%r1) */
                    ^
   <inline asm>:15:4: note: instantiated into assembly here
   1:      VLM     8,15,128,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:160:4: note: while in macro instantiation
                   "2:     VLM     0,15,0,1\n"     /* vlm %v0,%v15,0(%r1) */
                    ^
   <inline asm>:17:4: note: instantiated into assembly here
   2:      VLM     0,15,0,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:166:4: note: while in macro instantiation
                   "       VLM     16,23,256,1\n"  /* vlm %v16,%v23,256(%r1) */
                    ^
   <inline asm>:22:2: note: instantiated into assembly here
           VLM     16,23,256,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:168:4: note: while in macro instantiation
                   "4:     VLM     24,31,384,1\n"  /* vlm %v24,%v31,384(%r1) */
                    ^
   <inline asm>:24:4: note: instantiated into assembly here
   4:      VLM     24,31,384,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:170:4: note: while in macro instantiation
                   "5:     VLM     0,15,0,1\n"     /* vlm %v0,%v15,0(%r1) */
                    ^
   <inline asm>:26:4: note: instantiated into assembly here
   5:      VLM     0,15,0,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:171:4: note: while in macro instantiation
                   "6:     VLM     16,31,256,1\n"  /* vlm %v16,%v31,256(%r1) */
                    ^
   <inline asm>:27:4: note: instantiated into assembly here
   6:      VLM     16,31,256,1
           ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:187:10: note: while in macro instantiation
                                "VLM       0,15,0,1\n"
                                 ^
   <inline asm>:2:1: note: instantiated into assembly here
   VLM     0,15,0,1
   ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:188:10: note: while in macro instantiation
                                "VLM       16,31,256,1\n"
                                 ^
   <inline asm>:3:1: note: instantiated into assembly here
   VLM     16,31,256,1
   ^
>> <instantiation>:3:19: error: too many positional arguments
           GR_NUM  b2, 1       /* Base register */
                               ^
   arch/s390/kernel/fpu.c:238:10: note: while in macro instantiation
                                "VSTM      0,15,0,1\n"
                                 ^
   <inline asm>:2:1: note: instantiated into assembly here
   VSTM    0,15,0,1
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +132 arch/s390/kernel/vtime.c

b7394a5f4ce954 Martin Schwidefsky  2017-01-05  120  
^1da177e4c3f41 Linus Torvalds      2005-04-16  121  /*
^1da177e4c3f41 Linus Torvalds      2005-04-16  122   * Update process times based on virtual cpu times stored by entry.S
^1da177e4c3f41 Linus Torvalds      2005-04-16  123   * to the lowcore fields user_timer, system_timer & steal_clock.
^1da177e4c3f41 Linus Torvalds      2005-04-16  124   */
8f2b468aadc81c Martin Schwidefsky  2016-12-20  125  static int do_account_vtime(struct task_struct *tsk)
^1da177e4c3f41 Linus Torvalds      2005-04-16  126  {
152e9b8676c6e7 Martin Schwidefsky  2019-03-06  127  	u64 timer, clock, user, guest, system, hardirq, softirq;
^1da177e4c3f41 Linus Torvalds      2005-04-16  128  
^1da177e4c3f41 Linus Torvalds      2005-04-16  129  	timer = S390_lowcore.last_update_timer;
^1da177e4c3f41 Linus Torvalds      2005-04-16  130  	clock = S390_lowcore.last_update_clock;
1c7673476b8298 Heiko Carstens      2021-02-02  131  	/* Use STORE CLOCK by default, STORE CLOCK FAST if available. */
1c7673476b8298 Heiko Carstens      2021-02-02 @132  	alternative_io("stpt %0\n .insn s,0xb2050000,%1\n",
1c7673476b8298 Heiko Carstens      2021-02-02  133  		       "stpt %0\n .insn s,0xb27c0000,%1\n",
1c7673476b8298 Heiko Carstens      2021-02-02  134  		       25,
1c7673476b8298 Heiko Carstens      2021-02-02  135  		       ASM_OUTPUT2("=Q" (S390_lowcore.last_update_timer),
1c7673476b8298 Heiko Carstens      2021-02-02  136  				   "=Q" (S390_lowcore.last_update_clock)),
1c7673476b8298 Heiko Carstens      2021-02-02  137  		       ASM_NO_INPUT_CLOBBER("cc"));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  138  	clock = S390_lowcore.last_update_clock - clock;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  139  	timer -= S390_lowcore.last_update_timer;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  140  
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  141  	if (hardirq_count())
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  142  		S390_lowcore.hardirq_timer += timer;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  143  	else
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  144  		S390_lowcore.system_timer += timer;
^1da177e4c3f41 Linus Torvalds      2005-04-16  145  
72d38b19781de4 Martin Schwidefsky  2015-09-18  146  	/* Update MT utilization calculation */
f341b8dff9823a Martin Schwidefsky  2015-08-03  147  	if (smp_cpu_mtid &&
72d38b19781de4 Martin Schwidefsky  2015-09-18  148  	    time_after64(jiffies_64, this_cpu_read(mt_scaling_jiffies)))
72d38b19781de4 Martin Schwidefsky  2015-09-18  149  		update_mt_scaling();
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  150  
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  151  	/* Calculate cputime delta */
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  152  	user = update_tsk_timer(&tsk->thread.user_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  153  				READ_ONCE(S390_lowcore.user_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  154  	guest = update_tsk_timer(&tsk->thread.guest_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  155  				 READ_ONCE(S390_lowcore.guest_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  156  	system = update_tsk_timer(&tsk->thread.system_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  157  				  READ_ONCE(S390_lowcore.system_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  158  	hardirq = update_tsk_timer(&tsk->thread.hardirq_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  159  				   READ_ONCE(S390_lowcore.hardirq_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  160  	softirq = update_tsk_timer(&tsk->thread.softirq_timer,
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  161  				   READ_ONCE(S390_lowcore.softirq_timer));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  162  	S390_lowcore.steal_timer +=
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  163  		clock - user - guest - system - hardirq - softirq;
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  164  
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  165  	/* Push account value */
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  166  	if (user) {
23244a5c8003d4 Frederic Weisbecker 2017-01-31  167  		account_user_time(tsk, cputime_to_nsecs(user));
5613fda9a503cd Frederic Weisbecker 2017-01-31  168  		tsk->utimescaled += cputime_to_nsecs(scale_vtime(user));
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  169  	}
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  170  
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  171  	if (guest) {
fb8b049c988f1f Frederic Weisbecker 2017-01-31  172  		account_guest_time(tsk, cputime_to_nsecs(guest));
5613fda9a503cd Frederic Weisbecker 2017-01-31  173  		tsk->utimescaled += cputime_to_nsecs(scale_vtime(guest));
10ad34bc76dfbc Martin Schwidefsky  2015-01-14  174  	}
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  175  
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  176  	if (system)
b29e061bb7a8d2 Martin Schwidefsky  2017-05-12  177  		account_system_index_scaled(tsk, system, CPUTIME_SYSTEM);
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  178  	if (hardirq)
b29e061bb7a8d2 Martin Schwidefsky  2017-05-12  179  		account_system_index_scaled(tsk, hardirq, CPUTIME_IRQ);
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  180  	if (softirq)
b29e061bb7a8d2 Martin Schwidefsky  2017-05-12  181  		account_system_index_scaled(tsk, softirq, CPUTIME_SOFTIRQ);
^1da177e4c3f41 Linus Torvalds      2005-04-16  182  
b7394a5f4ce954 Martin Schwidefsky  2017-01-05  183  	return virt_timer_forward(user + guest + system + hardirq + softirq);
^1da177e4c3f41 Linus Torvalds      2005-04-16  184  }
^1da177e4c3f41 Linus Torvalds      2005-04-16  185  

:::::: The code at line 132 was first introduced by commit
:::::: 1c7673476b82983768c6a4dd78775f817f0e0f88 s390/vtime: use cpu alternative for stck/stckf

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
