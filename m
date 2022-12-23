Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C849F17CD;
	Fri, 23 Dec 2022 10:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671791899; x=1703327899;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wlt2EWMcyxmZuz/3KuuoGd8RTmsAYkjaf5Wap9Xp6jg=;
  b=HcHlZDNkbx6Vrq1UpeOTPtfVpvO/Y+IUSdctGxopo2OWyVQueg1sA7sd
   gpILSj+iXzIasBgZ53fP7VLwBAzcq/ozzeRU7E6wBgPvEmMxHWnrE55yt
   V++cEkeVVROEqR+SKOZeNEFmGB0WF+K+WjB6nA/TVRZVSfq8487/h1Gqs
   1QHNEd6Ki3+S60AkWFCxOpGRlnK2TpLVTqUNJexmUH+XQuR1OS0/tOuO/
   Q5CmUxxt9D2ELtpwBT0TlQ/I+g9JDdZWGjQBWL6x71IcFLJ53thmngx7s
   qgwS0eUraUMrlN9QAoq9xrAEy/97BuAKPeEDFdSZYrIKcoU1z1u/IHJzG
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="300650052"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; 
   d="scan'208";a="300650052"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2022 02:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10569"; a="652087135"
X-IronPort-AV: E=Sophos;i="5.96,268,1665471600"; 
   d="scan'208";a="652087135"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Dec 2022 02:38:15 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p8fRK-000Cd6-0S;
	Fri, 23 Dec 2022 10:38:10 +0000
Date: Fri, 23 Dec 2022 18:38:03 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 3221/9999] arch/s390/kernel/vtime.c:132:2:
 error: expected absolute expression
Message-ID: <202212231850.O5aLskj7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="GQWr8MdlYEfjgmhs"
Content-Disposition: inline


--GQWr8MdlYEfjgmhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   5827ddaf4534c52d31dd464679a186b41810ef76
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [3221/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: s390-randconfig-r044-20221223
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 98b13979fb05f3ed288a900deb843e7b27589e58)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

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
   arch/s390/kernel/vtime.c:132:2: error: invalid number of bytes
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
   arch/s390/kernel/vtime.c:132:2: error: invalid number of bytes
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
https://01.org/lkp

--GQWr8MdlYEfjgmhs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/s390 5.15.33 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project f5700e7b69048de958172fb513b336564e7f8709)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=160000
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=160000
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
CONFIG_HAVE_KERNEL_UNCOMPRESSED=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
CONFIG_KERNEL_LZO=y
# CONFIG_KERNEL_LZ4 is not set
# CONFIG_KERNEL_ZSTD is not set
# CONFIG_KERNEL_UNCOMPRESSED is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
# end of BPF subsystem

CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

# CONFIG_CPU_ISOLATION is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=m
# CONFIG_IKCONFIG_PROC is not set
# CONFIG_IKHEADERS is not set

#
# Scheduler features
#
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_CC_HAS_INT128=y
CONFIG_CGROUPS=y
# CONFIG_MEMCG is not set
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
CONFIG_CFS_BANDWIDTH=y
# CONFIG_RT_GROUP_SCHED is not set
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_HUGETLB is not set
# CONFIG_CPUSETS is not set
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_TIME_NS=y
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
CONFIG_CHECKPOINT_RESTORE=y
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
# CONFIG_RELAY is not set
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
CONFIG_RD_LZO=y
CONFIG_RD_LZ4=y
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_HAVE_FUTEX_CMPXCHG=y
CONFIG_EPOLL=y
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
# CONFIG_SHMEM is not set
CONFIG_AIO=y
# CONFIG_IO_URING is not set
# CONFIG_ADVISE_SYSCALLS is not set
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
# CONFIG_USERFAULTFD is not set
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_DEBUG_RSEQ=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
# end of Kernel Performance Events And Counters

CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_COMPAT_BRK is not set
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_MMU=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_AUDIT_ARCH=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_S390=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_HAVE_LIVEPATCH=y

#
# Processor type and features
#
CONFIG_HAVE_MARCH_Z900_FEATURES=y
CONFIG_HAVE_MARCH_Z990_FEATURES=y
CONFIG_HAVE_MARCH_Z9_109_FEATURES=y
CONFIG_HAVE_MARCH_Z10_FEATURES=y
CONFIG_HAVE_MARCH_Z196_FEATURES=y
CONFIG_HAVE_MARCH_ZEC12_FEATURES=y
CONFIG_HAVE_MARCH_Z13_FEATURES=y
# CONFIG_MARCH_Z10 is not set
# CONFIG_MARCH_Z196 is not set
# CONFIG_MARCH_ZEC12 is not set
CONFIG_MARCH_Z13=y
# CONFIG_MARCH_Z14 is not set
# CONFIG_MARCH_Z15 is not set
CONFIG_MARCH_Z15_TUNE=y
# CONFIG_TUNE_DEFAULT is not set
# CONFIG_TUNE_Z10 is not set
# CONFIG_TUNE_Z196 is not set
# CONFIG_TUNE_ZEC12 is not set
# CONFIG_TUNE_Z13 is not set
# CONFIG_TUNE_Z14 is not set
CONFIG_TUNE_Z15=y
CONFIG_64BIT=y
CONFIG_SMP=y
CONFIG_NR_CPUS=64
CONFIG_HOTPLUG_CPU=y
# CONFIG_SCHED_TOPOLOGY is not set
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
CONFIG_KEXEC=y
CONFIG_ARCH_RANDOM=y
CONFIG_KERNEL_NOBP=y
# CONFIG_EXPOLINE is not set
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
# end of Processor type and features

#
# Memory setup
#
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_MAX_PHYSMEM_BITS=46
CONFIG_PACK_STACK=y
# CONFIG_CHECK_STACK is not set
# end of Memory setup

#
# I/O subsystem
#
CONFIG_QDIO=y
CONFIG_CHSC_SCH=m
# CONFIG_SCM_BUS is not set
# end of I/O subsystem

#
# Dump support
#
CONFIG_CRASH_DUMP=y
# end of Dump support

CONFIG_CCW=y

#
# Virtualization
#
# CONFIG_PROTECTED_VIRTUALIZATION_GUEST is not set
CONFIG_PFAULT=y
CONFIG_CMM=y
# CONFIG_APPLDATA_BASE is not set
CONFIG_S390_HYPFS_FS=y
CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
# CONFIG_KVM is not set
# CONFIG_S390_GUEST is not set
# end of Virtualization

#
# Selftests
#
# CONFIG_S390_UNWIND_SELFTEST is not set
# end of Selftests

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
CONFIG_KEXEC_CORE=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_ARCH_32BIT_USTAT_F_TINODE=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_NO_GATHER=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
# CONFIG_SECCOMP is not set
CONFIG_LTO_NONE=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE=y
CONFIG_ARCH_HAS_SCALED_CPUTIME=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_CLONE_BACKWARDS2=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_HAVE_ARCH_VMAP_STACK=y
# CONFIG_VMAP_STACK is not set
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_VDSO_DATA=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
CONFIG_MODULE_REL_CRCS=y
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
CONFIG_MODULE_SIG_FORCE=y
# CONFIG_MODULE_SIG_ALL is not set

#
# Do not forget to sign required modules with scripts/sign-file
#
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
# CONFIG_MODULE_SIG_SHA384 is not set
CONFIG_MODULE_SIG_SHA512=y
CONFIG_MODULE_SIG_HASH="sha512"
# CONFIG_MODULE_COMPRESS_NONE is not set
CONFIG_MODULE_COMPRESS_GZIP=y
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_TRIM_UNUSED_KSYMS is not set
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK=y
CONFIG_ARCH_INLINE_SPIN_TRYLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK=y
CONFIG_ARCH_INLINE_SPIN_LOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_BH=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_READ_TRYLOCK=y
CONFIG_ARCH_INLINE_READ_LOCK=y
CONFIG_ARCH_INLINE_READ_LOCK_BH=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_READ_UNLOCK=y
CONFIG_ARCH_INLINE_READ_UNLOCK_BH=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_READ_UNLOCK_IRQRESTORE=y
CONFIG_ARCH_INLINE_WRITE_TRYLOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK=y
CONFIG_ARCH_INLINE_WRITE_LOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_LOCK_IRQSAVE=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_BH=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ARCH_BINFMT_ELF_STATE=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=m
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_MEMBLOCK_PHYS_MAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG is not set
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_COMPACTION=y
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
# CONFIG_CLEANCACHE is not set
# CONFIG_CMA is not set
# CONFIG_MEM_SOFT_DIRTY is not set
# CONFIG_ZPOOL is not set
# CONFIG_ZSMALLOC is not set
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_PAGE_IDLE_FLAG=y
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ZONE_DMA=y
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
# CONFIG_DAMON_DBGFS is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
# CONFIG_PCCARD is not set

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=m
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
CONFIG_FW_LOADER_COMPRESS=y
# end of Firmware loader

CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SYS_HYPERVISOR=y
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_SPMI=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_GOOGLE_FIRMWARE=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
CONFIG_MTD_CMDLINE_PARTS=m
CONFIG_MTD_REDBOOT_PARTS=y
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=m
# CONFIG_MTD_PARTITIONED_MASTER is not set

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
CONFIG_MTD_CFI_ADV_OPTIONS=y
CONFIG_MTD_CFI_NOSWAP=y
# CONFIG_MTD_CFI_BE_BYTE_SWAP is not set
# CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
CONFIG_MTD_CFI_GEOMETRY=y
CONFIG_MTD_MAP_BANK_WIDTH_1=y
# CONFIG_MTD_MAP_BANK_WIDTH_2 is not set
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_MAP_BANK_WIDTH_8=y
# CONFIG_MTD_MAP_BANK_WIDTH_16 is not set
CONFIG_MTD_MAP_BANK_WIDTH_32=y
CONFIG_MTD_CFI_I1=y
# CONFIG_MTD_CFI_I2 is not set
# CONFIG_MTD_CFI_I4 is not set
# CONFIG_MTD_CFI_I8 is not set
# CONFIG_MTD_OTP is not set
CONFIG_MTD_CFI_INTELEXT=m
# CONFIG_MTD_CFI_AMDSTD is not set
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
CONFIG_MTD_RAM=y
CONFIG_MTD_ROM=m
# CONFIG_MTD_ABSENT is not set
# end of RAM/ROM/Flash chip drivers

#
# NAND
#
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
# CONFIG_MTD_NAND_ECC_SW_HAMMING is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=y
CONFIG_MTD_QINFO_PROBE=y
# end of LPDDR & LPDDR2 PCM memory drivers

CONFIG_MTD_UBI=m
CONFIG_MTD_UBI_WL_THRESHOLD=4096
CONFIG_MTD_UBI_BEB_LIMIT=20
CONFIG_MTD_UBI_FASTMAP=y
CONFIG_MTD_UBI_GLUEBI=m
# CONFIG_OF is not set

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_DUMMY_IRQ=m
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_93CX6=m
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

#
# Altera FPGA firmware download module (requires I2C)
#
CONFIG_ECHO=y
CONFIG_PVPANIC=y
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

#
# Input device support
#
CONFIG_INPUT=m
CONFIG_INPUT_LEDS=m
# CONFIG_INPUT_FF_MEMLESS is not set
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=m
# CONFIG_MOUSE_PS2_ALPS is not set
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
# CONFIG_MOUSE_PS2_SYNAPTICS is not set
CONFIG_MOUSE_PS2_CYPRESS=y
# CONFIG_MOUSE_PS2_TRACKPOINT is not set
# CONFIG_MOUSE_PS2_ELANTECH is not set
CONFIG_MOUSE_PS2_SENTELIC=y
# CONFIG_MOUSE_PS2_TOUCHKIT is not set
CONFIG_MOUSE_PS2_FOCALTECH=y
# CONFIG_MOUSE_SERIAL is not set
# CONFIG_MOUSE_VSXXXAA is not set
# CONFIG_MOUSE_GPIO is not set
# CONFIG_INPUT_JOYSTICK is not set
CONFIG_INPUT_TABLET=y
CONFIG_TABLET_SERIAL_WACOM4=m
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_F03 is not set
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
# CONFIG_RMI4_F30 is not set
# CONFIG_RMI4_F34 is not set
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_LIBPS2=m
CONFIG_SERIO_RAW=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_GPIO_PS2=y
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
# CONFIG_GAMEPORT_L4 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set
# CONFIG_NULL_TTY is not set
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
# CONFIG_TTY_PRINTK is not set
# CONFIG_VIRTIO_CONSOLE is not set
CONFIG_HW_RANDOM=m
CONFIG_HW_RANDOM_VIRTIO=m
# CONFIG_HW_RANDOM_S390 is not set
# CONFIG_DEVMEM is not set
CONFIG_HANGCHECK_TIMER=m

#
# S/390 character device drivers
#
CONFIG_TN3270=m
CONFIG_TN3270_TTY=m
CONFIG_TN3270_FS=m
# CONFIG_TN3215 is not set
CONFIG_SCLP_TTY=y
CONFIG_SCLP_CONSOLE=y
# CONFIG_SCLP_VT220_TTY is not set
CONFIG_HMC_DRV=m
CONFIG_SCLP_OFB=y
# CONFIG_S390_TAPE is not set
# CONFIG_VMCP is not set
# CONFIG_MONWRITER is not set
CONFIG_S390_VMUR=m
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
# CONFIG_I2C is not set
# end of I2C support

# CONFIG_I3C is not set
CONFIG_SPMI=m
# CONFIG_HSI is not set
CONFIG_PPS=m
CONFIG_PPS_DEBUG=y

#
# PPS clients support
#
# CONFIG_PPS_CLIENT_KTIMER is not set
CONFIG_PPS_CLIENT_LDISC=m
CONFIG_PPS_CLIENT_GPIO=m

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_DEBUG_PINCTRL=y

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y

#
# MFD GPIO expanders
#
# end of MFD GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
# end of Virtual GPIO drivers

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_RESTART=y
CONFIG_POWER_SUPPLY=y
CONFIG_POWER_SUPPLY_DEBUG=y
CONFIG_GENERIC_ADC_BATTERY=m
CONFIG_TEST_POWER=m
CONFIG_BATTERY_BQ27XXX=y
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_GPIO=m
# CONFIG_CHARGER_LT3651 is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
# CONFIG_REGULATOR is not set
CONFIG_RC_CORE=m
CONFIG_RC_MAP=m
CONFIG_LIRC=y
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
CONFIG_RC_LOOPBACK=m
CONFIG_IR_SERIAL=m
# CONFIG_IR_SERIAL_TRANSMITTER is not set
# CONFIG_IR_SIR is not set
CONFIG_MEDIA_CEC_SUPPORT=y

#
# Graphics support
#
# end of Graphics support

#
# HID support
#
# CONFIG_HID is not set
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
CONFIG_MEMSTICK_UNSAFE_RESUME=y

#
# MemoryStick Host Controller Drivers
#
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=m
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=m
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_GPIO=m
CONFIG_LEDS_PWM=m
CONFIG_LEDS_LT3593=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
CONFIG_LEDS_TI_LMU_COMMON=m

#
# Flash and Torch LED drivers
#

#
# LED Triggers
#
# CONFIG_LEDS_TRIGGERS is not set
# CONFIG_ACCESSIBILITY is not set
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
CONFIG_DMADEVICES_VDEBUG=y

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
# CONFIG_INTEL_IDMA64 is not set
CONFIG_QCOM_HIDMA=y

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=m
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
# CONFIG_SYNC_FILE is not set
CONFIG_UDMABUF=y
CONFIG_DMABUF_MOVE_NOTIFY=y
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=m
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
CONFIG_COMEDI_MISC_DRIVERS=y
CONFIG_COMEDI_BOND=m
# CONFIG_COMEDI_TEST is not set
# CONFIG_COMEDI_PARPORT is not set
CONFIG_COMEDI_ISA_DRIVERS=y
# CONFIG_COMEDI_PCL711 is not set
CONFIG_COMEDI_PCL724=m
# CONFIG_COMEDI_PCL726 is not set
CONFIG_COMEDI_PCL730=m
# CONFIG_COMEDI_PCL812 is not set
CONFIG_COMEDI_PCL816=m
CONFIG_COMEDI_PCL818=m
CONFIG_COMEDI_PCM3724=m
CONFIG_COMEDI_AMPLC_DIO200_ISA=m
# CONFIG_COMEDI_AMPLC_PC236_ISA is not set
CONFIG_COMEDI_AMPLC_PC263_ISA=m
CONFIG_COMEDI_RTI800=m
# CONFIG_COMEDI_RTI802 is not set
CONFIG_COMEDI_DAC02=m
# CONFIG_COMEDI_DAS16M1 is not set
CONFIG_COMEDI_DAS08_ISA=m
# CONFIG_COMEDI_DAS16 is not set
CONFIG_COMEDI_DAS800=m
# CONFIG_COMEDI_DAS1800 is not set
CONFIG_COMEDI_DAS6402=m
# CONFIG_COMEDI_DT2801 is not set
CONFIG_COMEDI_DT2811=m
CONFIG_COMEDI_DT2814=m
# CONFIG_COMEDI_DT2815 is not set
# CONFIG_COMEDI_DT2817 is not set
# CONFIG_COMEDI_DT282X is not set
CONFIG_COMEDI_DMM32AT=m
# CONFIG_COMEDI_FL512 is not set
CONFIG_COMEDI_AIO_AIO12_8=m
CONFIG_COMEDI_AIO_IIRO_16=m
CONFIG_COMEDI_C6XDIGIO=m
CONFIG_COMEDI_MPC624=m
# CONFIG_COMEDI_ADQ12B is not set
# CONFIG_COMEDI_NI_AT_A2150 is not set
CONFIG_COMEDI_NI_AT_AO=m
CONFIG_COMEDI_NI_ATMIO=m
CONFIG_COMEDI_NI_ATMIO16D=m
# CONFIG_COMEDI_NI_LABPC_ISA is not set
CONFIG_COMEDI_PCMAD=m
CONFIG_COMEDI_PCMDA12=m
# CONFIG_COMEDI_PCMMIO is not set
# CONFIG_COMEDI_PCMUIO is not set
# CONFIG_COMEDI_MULTIQ3 is not set
CONFIG_COMEDI_S526=m
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=m
# CONFIG_COMEDI_8255_SA is not set
CONFIG_COMEDI_KCOMEDILIB=m
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_DAS08=m
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=m
CONFIG_COMEDI_TESTS=m
CONFIG_COMEDI_TESTS_EXAMPLE=m
CONFIG_COMEDI_TESTS_NI_ROUTES=m
CONFIG_STAGING=y

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=y
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
# end of Active energy metering IC

#
# Resolver to digital converters
#
# end of Resolver to digital converters
# end of IIO staging drivers

CONFIG_STAGING_MEDIA=y

#
# Android
#
# end of Android

# CONFIG_GS_FPGABOOT is not set
# CONFIG_UNISYSSPAR is not set
CONFIG_FIELDBUS_DEV=y
# CONFIG_COMMON_CLK is not set
CONFIG_HWSPINLOCK=y

#
# Clock Source drivers
#
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

CONFIG_SOC_TI=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=y
# CONFIG_IIO_SW_TRIGGER is not set
# CONFIG_IIO_TRIGGERED_EVENT is not set

#
# Accelerometers
#
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=m
# CONFIG_KXSD9 is not set
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_HX711 is not set
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
CONFIG_QCOM_SPMI_ADC5=m
# end of Analog to digital converters

#
# Analog Front Ends
#
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=y
# end of Amplifiers

#
# Capacitance to digital converters
#
# end of Capacitance to digital converters

#
# Chemical Sensors
#
# CONFIG_PMS7003 is not set
# CONFIG_SCD30_CORE is not set
CONFIG_SPS30=m
CONFIG_SPS30_SERIAL=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

#
# Digital to analog converters
#
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=y
CONFIG_IIO_SIMPLE_DUMMY=y
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
# CONFIG_DHT11 is not set
# end of Humidity sensors

#
# Inertial measurement units
#
# end of Inertial measurement units

#
# Light sensors
#
# end of Light sensors

#
# Magnetometer sensors
#
# end of Magnetometer sensors

#
# Multiplexers
#
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# end of Digital potentiometers

#
# Digital potentiostats
#
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_MS5611=m
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_PING=y
CONFIG_SRF04=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
# end of Temperature sensors

CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_RESET_CONTROLLER=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_PHY_CAN_TRANSCEIVER=y
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_DTPM is not set
# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID is not set
# end of Android

CONFIG_DAX=m
# CONFIG_DEV_DAX is not set
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
CONFIG_NVMEM_SPMI_SDAM=m

#
# HW tracing support
#
# CONFIG_STM is not set
# end of HW tracing support

CONFIG_FPGA=y
CONFIG_ALTERA_PR_IP_CORE=m
CONFIG_FPGA_BRIDGE=y
CONFIG_FPGA_REGION=m
# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
# CONFIG_MOST is not set
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
# CONFIG_FILE_LOCKING is not set
# CONFIG_FS_ENCRYPTION is not set
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
# CONFIG_FANOTIFY is not set
CONFIG_QUOTA=y
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=m
# CONFIG_QFMT_V1 is not set
CONFIG_QFMT_V2=m
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=m
# CONFIG_CUSE is not set
# CONFIG_VIRTIO_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_VMCORE=y
# CONFIG_PROC_VMCORE_DEVICE_DUMP is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=y
# CONFIG_ECRYPT_FS is not set
# CONFIG_JFFS2_FS is not set
# CONFIG_UBIFS_FS is not set
# CONFIG_CRAMFS is not set
# CONFIG_ROMFS_FS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=m
CONFIG_PSTORE_LZO_COMPRESS=y
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_LZ4HC_COMPRESS=m
# CONFIG_PSTORE_842_COMPRESS is not set
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
CONFIG_PSTORE_CONSOLE=y
CONFIG_PSTORE_PMSG=y
CONFIG_NLS=m
CONFIG_NLS_DEFAULT="iso8859-1"
# CONFIG_NLS_CODEPAGE_437 is not set
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=m
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=m
# CONFIG_NLS_CODEPAGE_866 is not set
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
# CONFIG_NLS_CODEPAGE_874 is not set
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
# CONFIG_NLS_ISO8859_14 is not set
# CONFIG_NLS_ISO8859_15 is not set
CONFIG_NLS_KOI8_R=m
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=m
# CONFIG_NLS_MAC_CROATIAN is not set
CONFIG_NLS_MAC_CYRILLIC=m
# CONFIG_NLS_MAC_GAELIC is not set
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=m
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=m
# CONFIG_UNICODE is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
CONFIG_ENCRYPTED_KEYS=y
# CONFIG_KEY_DH_OPERATIONS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
CONFIG_SECURITY_NETWORK=y
# CONFIG_SECURITY_PATH is not set
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_SECURITY_YAMA=y
# CONFIG_SECURITY_SAFESETID is not set
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
# CONFIG_SECURITY_LANDLOCK is not set
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
CONFIG_INTEGRITY_ASYMMETRIC_KEYS=y
# CONFIG_INTEGRITY_TRUSTED_KEYRING is not set
CONFIG_INTEGRITY_PLATFORM_KEYRING=y
CONFIG_LOAD_IPL_KEYS=y
# CONFIG_IMA is not set
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
CONFIG_EVM=y
# CONFIG_EVM_ATTR_FSUUID is not set
CONFIG_EVM_ADD_XATTRS=y
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
# CONFIG_CRYPTO_FIPS is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_ENGINE=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
CONFIG_CRYPTO_ECC=y
# CONFIG_CRYPTO_ECDH is not set
CONFIG_CRYPTO_ECDSA=y
# CONFIG_CRYPTO_ECRDSA is not set
# CONFIG_CRYPTO_SM2 is not set
# CONFIG_CRYPTO_CURVE25519 is not set

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=m

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=m
CONFIG_CRYPTO_LRW=m
# CONFIG_CRYPTO_OFB is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_ADIANTUM=y
CONFIG_CRYPTO_ESSIV=m

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_VMAC=y

#
# Digest
#
CONFIG_CRYPTO_CRC32C=m
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_XXHASH is not set
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_BLAKE2S is not set
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_MD4=y
# CONFIG_CRYPTO_MD5 is not set
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_CHACHA20=y
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_SM4 is not set
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=m

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
CONFIG_CRYPTO_ZSTD=m

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_HASH_INFO=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
# CONFIG_CRYPTO_LIB_BLAKE2S is not set
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=m
CONFIG_CRYPTO_LIB_CURVE25519=m
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA256=y
CONFIG_CRYPTO_HW=y
CONFIG_ZCRYPT=m
CONFIG_ZCRYPT_DEBUG=y
# CONFIG_ZCRYPT_MULTIDEVNODES is not set
# CONFIG_PKEY is not set
CONFIG_CRYPTO_SHA1_S390=m
# CONFIG_CRYPTO_SHA256_S390 is not set
CONFIG_CRYPTO_SHA512_S390=y
# CONFIG_CRYPTO_SHA3_256_S390 is not set
CONFIG_CRYPTO_SHA3_512_S390=y
CONFIG_CRYPTO_DES_S390=m
CONFIG_CRYPTO_AES_S390=m
# CONFIG_S390_PRNG is not set
# CONFIG_CRYPTO_GHASH_S390 is not set
CONFIG_CRYPTO_CRC32_S390=y
CONFIG_CRYPTO_DEV_VIRTIO=y
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=y
CONFIG_SIGNED_PE_FILE_VERIFICATION=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
CONFIG_MODULE_SIG_KEY_TYPE_RSA=y
# CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
# CONFIG_SECONDARY_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
# CONFIG_PACKING is not set
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_FIND_FIRST_BIT=y
CONFIG_CORDIC=m
# CONFIG_PRIME_NUMBERS is not set
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_CRC_CCITT=m
CONFIG_CRC16=m
CONFIG_CRC_T10DIF=y
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
# CONFIG_CRC64 is not set
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=m
# CONFIG_CRC8 is not set
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_ZLIB_DFLTCC=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=m
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
CONFIG_XZ_DEC_X86=y
CONFIG_XZ_DEC_POWERPC=y
# CONFIG_XZ_DEC_IA64 is not set
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
# CONFIG_XZ_DEC_SPARC is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=m
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_OID_REGISTRY=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACK_HASH_ORDER=20
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
CONFIG_SYMBOLIC_ERRNAME=y
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

#
# Compile-time checks and compiler options
#
# CONFIG_DEBUG_INFO is not set
CONFIG_FRAME_WARN=2048
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_VMLINUX_MAP=y
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
# CONFIG_MAGIC_SYSRQ is not set
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
CONFIG_UBSAN_TRAP=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_LOCAL_BOUNDS=y
# CONFIG_UBSAN_SHIFT is not set
# CONFIG_UBSAN_DIV_ZERO is not set
# CONFIG_UBSAN_UNREACHABLE is not set
# CONFIG_UBSAN_BOOL is not set
CONFIG_UBSAN_ENUM=y
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# CONFIG_KCSAN is not set
# end of Generic Kernel Debugging Instruments

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_PAGE_REF is not set
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
CONFIG_PTDUMP_CORE=y
CONFIG_PTDUMP_DEBUGFS=y
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_VMACACHE is not set
CONFIG_DEBUG_VM_RB=y
# CONFIG_DEBUG_VM_PGFLAGS is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_HAVE_ARCH_KFENCE=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
CONFIG_PROVE_RAW_LOCK_NESTING=y
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_SCF_TORTURE_TEST=m
CONFIG_CSD_LOCK_WAIT_DEBUG=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
# CONFIG_RCU_SCALE_TEST is not set
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_NOP_MCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y

#
# s390 Debugging
#
CONFIG_EARLY_PRINTK=y
CONFIG_DEBUG_ENTRY=y
CONFIG_CIO_INJECT=y
# end of s390 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
# CONFIG_KCOV_ENABLE_COMPARISONS is not set
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=m
CONFIG_TEST_MIN_HEAP=m
CONFIG_TEST_DIV64=y
# CONFIG_KPROBES_SANITY_TEST is not set
CONFIG_BACKTRACE_SELF_TEST=m
# CONFIG_RBTREE_TEST is not set
CONFIG_REED_SOLOMON_TEST=m
CONFIG_INTERVAL_TREE_TEST=m
CONFIG_PERCPU_TEST=m
CONFIG_ATOMIC64_SELFTEST=y
CONFIG_TEST_HEXDUMP=m
CONFIG_STRING_SELFTEST=m
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_STRSCPY is not set
CONFIG_TEST_KSTRTOX=m
CONFIG_TEST_PRINTF=y
CONFIG_TEST_SCANF=m
CONFIG_TEST_BITMAP=y
CONFIG_TEST_UUID=m
# CONFIG_TEST_XARRAY is not set
# CONFIG_TEST_OVERFLOW is not set
CONFIG_TEST_RHASHTABLE=y
# CONFIG_TEST_HASH is not set
CONFIG_TEST_IDA=m
CONFIG_TEST_LKM=m
# CONFIG_TEST_BITOPS is not set
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_FIND_BIT_BENCHMARK=m
CONFIG_TEST_FIRMWARE=m
CONFIG_TEST_SYSCTL=y
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
CONFIG_TEST_MEMCAT_P=y
# CONFIG_TEST_STACKINIT is not set
CONFIG_TEST_MEMINIT=y
CONFIG_TEST_FREE_PAGES=m
# end of Kernel Testing and Coverage
# end of Kernel hacking

--GQWr8MdlYEfjgmhs--
