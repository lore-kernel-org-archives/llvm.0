Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BB5258F;
	Thu, 23 Feb 2023 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677159135; x=1708695135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bBlB4viPSRxDzsbmEaU0vteJ8WIGdaM0wemGQV8n1yE=;
  b=EONRtdGA4Tms1Zm1a9oBtC8jSb3NkRK+hf/XEpJkbJC8GKLZpKzOQ7fC
   XfMBGQjXGFvVu3JBTGePzTivn8OElFCkLk1RN+2f3nT+w7vvkJrsifrYO
   ip1umhPE59H5T6ul47XZYu+dalXyZvbS0jaKs8XzTah31+eONbu/bjdtJ
   qvZsZ4G0w1miYZ/s+jlfI2CKzNnRlsjW9DzwKll3uREUj5up19xXyQlq+
   464SvxbMrKRFmSGj0s0spGAMxyuWpZX0raimnWxDW37tU5qHsfBHSzNLi
   cs6TRb+M+6bGKaWefFs2CjFA0A44hS9wUiWI7ADvYNHdQPUTYmxtc8ttf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335416063"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="335416063"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 05:32:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="917986235"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="917986235"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2023 05:32:01 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVBhY-0001MH-2J;
	Thu, 23 Feb 2023 13:32:00 +0000
Date: Thu, 23 Feb 2023 21:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.4 15/15]
 kernel/bpf/core.c:1570:3: error: implicit declaration of function
 'barrier_nospec'
Message-ID: <202302232136.AWzwjCvb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.4
head:   b557ab7cf7793e05e0ab6c833a73b26bec189956
commit: 3bb990ea37595b41a1f06a551e5dd35372ea404a [15/15] uaccess: Add speculation barrier to copy_from_user()
config: mips-randconfig-r036-20230222 (https://download.01.org/0day-ci/archive/20230223/202302232136.AWzwjCvb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/3bb990ea37595b41a1f06a551e5dd35372ea404a
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.4
        git checkout 3bb990ea37595b41a1f06a551e5dd35372ea404a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/bpf/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232136.AWzwjCvb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.c:1570:3: error: implicit declaration of function 'barrier_nospec' [-Werror,-Wimplicit-function-declaration]
                   barrier_nospec();
                   ^
   1 error generated.


vim +/barrier_nospec +1570 kernel/bpf/core.c

f5bffecda951b5 Alexei Starovoitov 2014-07-22  1326  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1327  select_insn:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1328  	goto *jumptable[insn->code];
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1329  
e217aadc9b5574 Daniel Borkmann    2021-06-16  1330  	/* Explicitly mask the register-based shift amounts with 63 or 31
e217aadc9b5574 Daniel Borkmann    2021-06-16  1331  	 * to avoid undefined behavior. Normally this won't affect the
e217aadc9b5574 Daniel Borkmann    2021-06-16  1332  	 * generated code, for example, in case of native 64 bit archs such
e217aadc9b5574 Daniel Borkmann    2021-06-16  1333  	 * as x86-64 or arm64, the compiler is optimizing the AND away for
e217aadc9b5574 Daniel Borkmann    2021-06-16  1334  	 * the interpreter. In case of JITs, each of the JIT backends compiles
e217aadc9b5574 Daniel Borkmann    2021-06-16  1335  	 * the BPF shift operations to machine instructions which produce
e217aadc9b5574 Daniel Borkmann    2021-06-16  1336  	 * implementation-defined results in such a case; the resulting
e217aadc9b5574 Daniel Borkmann    2021-06-16  1337  	 * contents of the register may be arbitrary, but program behaviour
e217aadc9b5574 Daniel Borkmann    2021-06-16  1338  	 * as a whole remains defined. In other words, in case of JIT backends,
e217aadc9b5574 Daniel Borkmann    2021-06-16  1339  	 * the AND must /not/ be added to the emitted LSH/RSH/ARSH translation.
e217aadc9b5574 Daniel Borkmann    2021-06-16  1340  	 */
e217aadc9b5574 Daniel Borkmann    2021-06-16  1341  	/* ALU (shifts) */
e217aadc9b5574 Daniel Borkmann    2021-06-16  1342  #define SHT(OPCODE, OP)					\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1343  	ALU64_##OPCODE##_X:				\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1344  		DST = DST OP (SRC & 63);		\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1345  		CONT;					\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1346  	ALU_##OPCODE##_X:				\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1347  		DST = (u32) DST OP ((u32) SRC & 31);	\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1348  		CONT;					\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1349  	ALU64_##OPCODE##_K:				\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1350  		DST = DST OP IMM;			\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1351  		CONT;					\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1352  	ALU_##OPCODE##_K:				\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1353  		DST = (u32) DST OP (u32) IMM;		\
e217aadc9b5574 Daniel Borkmann    2021-06-16  1354  		CONT;
e217aadc9b5574 Daniel Borkmann    2021-06-16  1355  	/* ALU (rest) */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1356  #define ALU(OPCODE, OP)					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1357  	ALU64_##OPCODE##_X:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1358  		DST = DST OP SRC;			\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1359  		CONT;					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1360  	ALU_##OPCODE##_X:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1361  		DST = (u32) DST OP (u32) SRC;		\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1362  		CONT;					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1363  	ALU64_##OPCODE##_K:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1364  		DST = DST OP IMM;			\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1365  		CONT;					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1366  	ALU_##OPCODE##_K:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1367  		DST = (u32) DST OP (u32) IMM;		\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1368  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1369  	ALU(ADD,  +)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1370  	ALU(SUB,  -)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1371  	ALU(AND,  &)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1372  	ALU(OR,   |)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1373  	ALU(XOR,  ^)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1374  	ALU(MUL,  *)
e217aadc9b5574 Daniel Borkmann    2021-06-16  1375  	SHT(LSH, <<)
e217aadc9b5574 Daniel Borkmann    2021-06-16  1376  	SHT(RSH, >>)
e217aadc9b5574 Daniel Borkmann    2021-06-16  1377  #undef SHT
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1378  #undef ALU
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1379  	ALU_NEG:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1380  		DST = (u32) -DST;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1381  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1382  	ALU64_NEG:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1383  		DST = -DST;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1384  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1385  	ALU_MOV_X:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1386  		DST = (u32) SRC;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1387  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1388  	ALU_MOV_K:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1389  		DST = (u32) IMM;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1390  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1391  	ALU64_MOV_X:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1392  		DST = SRC;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1393  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1394  	ALU64_MOV_K:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1395  		DST = IMM;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1396  		CONT;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1397  	LD_IMM_DW:
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1398  		DST = (u64) (u32) insn[0].imm | ((u64) (u32) insn[1].imm) << 32;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1399  		insn++;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1400  		CONT;
2dc6b100f928aa Jiong Wang         2018-12-05  1401  	ALU_ARSH_X:
e217aadc9b5574 Daniel Borkmann    2021-06-16  1402  		DST = (u64) (u32) (((s32) DST) >> (SRC & 31));
2dc6b100f928aa Jiong Wang         2018-12-05  1403  		CONT;
2dc6b100f928aa Jiong Wang         2018-12-05  1404  	ALU_ARSH_K:
75672dda27bd00 Jiong Wang         2019-06-25  1405  		DST = (u64) (u32) (((s32) DST) >> IMM);
2dc6b100f928aa Jiong Wang         2018-12-05  1406  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1407  	ALU64_ARSH_X:
e217aadc9b5574 Daniel Borkmann    2021-06-16  1408  		(*(s64 *) &DST) >>= (SRC & 63);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1409  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1410  	ALU64_ARSH_K:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1411  		(*(s64 *) &DST) >>= IMM;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1412  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1413  	ALU64_MOD_X:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1414  		div64_u64_rem(DST, SRC, &AX);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1415  		DST = AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1416  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1417  	ALU_MOD_X:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1418  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1419  		DST = do_div(AX, (u32) SRC);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1420  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1421  	ALU64_MOD_K:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1422  		div64_u64_rem(DST, IMM, &AX);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1423  		DST = AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1424  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1425  	ALU_MOD_K:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1426  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1427  		DST = do_div(AX, (u32) IMM);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1428  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1429  	ALU64_DIV_X:
876a7ae65b86d8 Alexei Starovoitov 2015-04-27  1430  		DST = div64_u64(DST, SRC);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1431  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1432  	ALU_DIV_X:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1433  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1434  		do_div(AX, (u32) SRC);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1435  		DST = (u32) AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1436  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1437  	ALU64_DIV_K:
876a7ae65b86d8 Alexei Starovoitov 2015-04-27  1438  		DST = div64_u64(DST, IMM);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1439  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1440  	ALU_DIV_K:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1441  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1442  		do_div(AX, (u32) IMM);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1443  		DST = (u32) AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1444  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1445  	ALU_END_TO_BE:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1446  		switch (IMM) {
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1447  		case 16:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1448  			DST = (__force u16) cpu_to_be16(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1449  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1450  		case 32:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1451  			DST = (__force u32) cpu_to_be32(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1452  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1453  		case 64:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1454  			DST = (__force u64) cpu_to_be64(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1455  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1456  		}
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1457  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1458  	ALU_END_TO_LE:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1459  		switch (IMM) {
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1460  		case 16:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1461  			DST = (__force u16) cpu_to_le16(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1462  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1463  		case 32:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1464  			DST = (__force u32) cpu_to_le32(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1465  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1466  		case 64:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1467  			DST = (__force u64) cpu_to_le64(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1468  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1469  		}
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1470  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1471  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1472  	/* CALL */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1473  	JMP_CALL:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1474  		/* Function call scratches BPF_R1-BPF_R5 registers,
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1475  		 * preserves BPF_R6-BPF_R9, and stores return value
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1476  		 * into BPF_R0.
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1477  		 */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1478  		BPF_R0 = (__bpf_call_base + insn->imm)(BPF_R1, BPF_R2, BPF_R3,
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1479  						       BPF_R4, BPF_R5);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1480  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1481  
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1482  	JMP_CALL_ARGS:
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1483  		BPF_R0 = (__bpf_call_base_args + insn->imm)(BPF_R1, BPF_R2,
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1484  							    BPF_R3, BPF_R4,
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1485  							    BPF_R5,
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1486  							    insn + insn->off + 1);
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1487  		CONT;
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1488  
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1489  	JMP_TAIL_CALL: {
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1490  		struct bpf_map *map = (struct bpf_map *) (unsigned long) BPF_R2;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1491  		struct bpf_array *array = container_of(map, struct bpf_array, map);
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1492  		struct bpf_prog *prog;
90caccdd8cc021 Alexei Starovoitov 2017-10-03  1493  		u32 index = BPF_R3;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1494  
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1495  		if (unlikely(index >= array->map.max_entries))
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1496  			goto out;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1497  		if (unlikely(tail_call_cnt > MAX_TAIL_CALL_CNT))
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1498  			goto out;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1499  
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1500  		tail_call_cnt++;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1501  
2a36f0b92eb638 Wang Nan           2015-08-06  1502  		prog = READ_ONCE(array->ptrs[index]);
1ca1cc98bf7418 Daniel Borkmann    2016-06-28  1503  		if (!prog)
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1504  			goto out;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1505  
c4675f935399cb Daniel Borkmann    2015-07-13  1506  		/* ARG1 at this point is guaranteed to point to CTX from
c4675f935399cb Daniel Borkmann    2015-07-13  1507  		 * the verifier side due to the fact that the tail call is
c4675f935399cb Daniel Borkmann    2015-07-13  1508  		 * handeled like a helper, that is, bpf_tail_call_proto,
c4675f935399cb Daniel Borkmann    2015-07-13  1509  		 * where arg1_type is ARG_PTR_TO_CTX.
c4675f935399cb Daniel Borkmann    2015-07-13  1510  		 */
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1511  		insn = prog->insnsi;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1512  		goto select_insn;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1513  out:
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1514  		CONT;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1515  	}
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1516  	JMP_JA:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1517  		insn += insn->off;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1518  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1519  	JMP_EXIT:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1520  		return BPF_R0;
503a8865a47752 Jiong Wang         2019-01-26  1521  	/* JMP */
503a8865a47752 Jiong Wang         2019-01-26  1522  #define COND_JMP(SIGN, OPCODE, CMP_OP)				\
503a8865a47752 Jiong Wang         2019-01-26  1523  	JMP_##OPCODE##_X:					\
503a8865a47752 Jiong Wang         2019-01-26  1524  		if ((SIGN##64) DST CMP_OP (SIGN##64) SRC) {	\
503a8865a47752 Jiong Wang         2019-01-26  1525  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1526  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1527  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1528  		CONT;						\
503a8865a47752 Jiong Wang         2019-01-26  1529  	JMP32_##OPCODE##_X:					\
503a8865a47752 Jiong Wang         2019-01-26  1530  		if ((SIGN##32) DST CMP_OP (SIGN##32) SRC) {	\
503a8865a47752 Jiong Wang         2019-01-26  1531  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1532  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1533  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1534  		CONT;						\
503a8865a47752 Jiong Wang         2019-01-26  1535  	JMP_##OPCODE##_K:					\
503a8865a47752 Jiong Wang         2019-01-26  1536  		if ((SIGN##64) DST CMP_OP (SIGN##64) IMM) {	\
503a8865a47752 Jiong Wang         2019-01-26  1537  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1538  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1539  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1540  		CONT;						\
503a8865a47752 Jiong Wang         2019-01-26  1541  	JMP32_##OPCODE##_K:					\
503a8865a47752 Jiong Wang         2019-01-26  1542  		if ((SIGN##32) DST CMP_OP (SIGN##32) IMM) {	\
503a8865a47752 Jiong Wang         2019-01-26  1543  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1544  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1545  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1546  		CONT;
503a8865a47752 Jiong Wang         2019-01-26  1547  	COND_JMP(u, JEQ, ==)
503a8865a47752 Jiong Wang         2019-01-26  1548  	COND_JMP(u, JNE, !=)
503a8865a47752 Jiong Wang         2019-01-26  1549  	COND_JMP(u, JGT, >)
503a8865a47752 Jiong Wang         2019-01-26  1550  	COND_JMP(u, JLT, <)
503a8865a47752 Jiong Wang         2019-01-26  1551  	COND_JMP(u, JGE, >=)
503a8865a47752 Jiong Wang         2019-01-26  1552  	COND_JMP(u, JLE, <=)
503a8865a47752 Jiong Wang         2019-01-26  1553  	COND_JMP(u, JSET, &)
503a8865a47752 Jiong Wang         2019-01-26  1554  	COND_JMP(s, JSGT, >)
503a8865a47752 Jiong Wang         2019-01-26  1555  	COND_JMP(s, JSLT, <)
503a8865a47752 Jiong Wang         2019-01-26  1556  	COND_JMP(s, JSGE, >=)
503a8865a47752 Jiong Wang         2019-01-26  1557  	COND_JMP(s, JSLE, <=)
503a8865a47752 Jiong Wang         2019-01-26  1558  #undef COND_JMP
e80c3533c354ed Daniel Borkmann    2021-09-07  1559  	/* ST, STX and LDX*/
e80c3533c354ed Daniel Borkmann    2021-09-07  1560  	ST_NOSPEC:
e80c3533c354ed Daniel Borkmann    2021-09-07  1561  		/* Speculation barrier for mitigating Speculative Store Bypass.
e80c3533c354ed Daniel Borkmann    2021-09-07  1562  		 * In case of arm64, we rely on the firmware mitigation as
e80c3533c354ed Daniel Borkmann    2021-09-07  1563  		 * controlled via the ssbd kernel parameter. Whenever the
e80c3533c354ed Daniel Borkmann    2021-09-07  1564  		 * mitigation is enabled, it works for all of the kernel code
e80c3533c354ed Daniel Borkmann    2021-09-07  1565  		 * with no need to provide any additional instructions here.
e80c3533c354ed Daniel Borkmann    2021-09-07  1566  		 * In case of x86, we use 'lfence' insn for mitigation. We
e80c3533c354ed Daniel Borkmann    2021-09-07  1567  		 * reuse preexisting logic from Spectre v1 mitigation that
e80c3533c354ed Daniel Borkmann    2021-09-07  1568  		 * happens to produce the required code on x86 for v4 as well.
e80c3533c354ed Daniel Borkmann    2021-09-07  1569  		 */
e80c3533c354ed Daniel Borkmann    2021-09-07 @1570  		barrier_nospec();
e80c3533c354ed Daniel Borkmann    2021-09-07  1571  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1572  #define LDST(SIZEOP, SIZE)						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1573  	STX_MEM_##SIZEOP:						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1574  		*(SIZE *)(unsigned long) (DST + insn->off) = SRC;	\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1575  		CONT;							\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1576  	ST_MEM_##SIZEOP:						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1577  		*(SIZE *)(unsigned long) (DST + insn->off) = IMM;	\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1578  		CONT;							\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1579  	LDX_MEM_##SIZEOP:						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1580  		DST = *(SIZE *)(unsigned long) (SRC + insn->off);	\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1581  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1582  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1583  	LDST(B,   u8)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1584  	LDST(H,  u16)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1585  	LDST(W,  u32)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1586  	LDST(DW, u64)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1587  #undef LDST
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1588  	STX_XADD_W: /* lock xadd *(u32 *)(dst_reg + off16) += src_reg */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1589  		atomic_add((u32) SRC, (atomic_t *)(unsigned long)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1590  			   (DST + insn->off));
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1591  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1592  	STX_XADD_DW: /* lock xadd *(u64 *)(dst_reg + off16) += src_reg */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1593  		atomic64_add((u64) SRC, (atomic64_t *)(unsigned long)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1594  			     (DST + insn->off));
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1595  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1596  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1597  	default_label:
5e581dad4fec0e Daniel Borkmann    2018-01-26  1598  		/* If we ever reach this, we have a bug somewhere. Die hard here
5e581dad4fec0e Daniel Borkmann    2018-01-26  1599  		 * instead of just returning 0; we could be somewhere in a subprog,
5e581dad4fec0e Daniel Borkmann    2018-01-26  1600  		 * so execution could continue otherwise which we do /not/ want.
5e581dad4fec0e Daniel Borkmann    2018-01-26  1601  		 *
5e581dad4fec0e Daniel Borkmann    2018-01-26  1602  		 * Note, verifier whitelists all opcodes in bpf_opcode_in_insntable().
5e581dad4fec0e Daniel Borkmann    2018-01-26  1603  		 */
5e581dad4fec0e Daniel Borkmann    2018-01-26  1604  		pr_warn("BPF interpreter: unknown opcode %02x\n", insn->code);
5e581dad4fec0e Daniel Borkmann    2018-01-26  1605  		BUG_ON(1);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1606  		return 0;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1607  }
f696b8f471ec98 Alexei Starovoitov 2017-05-30  1608  

:::::: The code at line 1570 was first introduced by commit
:::::: e80c3533c354ede56146ab0e4fbb8304d0c1209f bpf: Introduce BPF nospec instruction for mitigating Spectre v4

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
