Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CFF258F;
	Thu, 23 Feb 2023 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677160337; x=1708696337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8hWqoJPIT8gP/45xylj+uXYFJKMxXhNdfTnEgh+fMo=;
  b=EGz381uO3Sxftmi/BJ8ZCo14TbwmnaASO5oHCvN5qskC3qnibZpIbTRM
   O16kBD/EolbR/nKsAMM8YAuJVH1cDYG5NxSV9zA8Dhys+VqietEZS3TUh
   QXdz+pGgQR2sy5CZWQ/T/IwMxhmVuhdUBqw08E0qdOwc2Stf3QZVJZz6o
   tpXPMJL3nD1Hai2pX4x+oTuJ0alLpNpykU4IMxm81/6NyLJzmTLVewt7R
   nty0CGjTlCkSjEmFZXaeBMjCWvVBsDKLrKJbmqCdhdjL8UzlwryFbu8Fm
   eMf+u/lBDxjMLwbMZ1WaYndEJveR7QQDfsm5eIr4zop0mW5Gqh5Pc2Y2x
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="335419976"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="335419976"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 05:52:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="917992165"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; 
   d="scan'208";a="917992165"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Feb 2023 05:52:02 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVC0v-0001N3-1j;
	Thu, 23 Feb 2023 13:52:01 +0000
Date: Thu, 23 Feb 2023 21:51:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	Sasha Levin <sashal@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [ammarfaizi2-block:stable/linux-stable-rc/queue/5.15 24/30]
 kernel/bpf/core.c:1651:3: error: implicit declaration of function
 'barrier_nospec'
Message-ID: <202302232141.4Sr7gOg8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block stable/linux-stable-rc/queue/5.15
head:   54d44a17724e2850d2db01f885d1253a502306a8
commit: adf26475d30d3f3828e843567ec617d21136233c [24/30] uaccess: Add speculation barrier to copy_from_user()
config: hexagon-randconfig-r045-20230222 (https://download.01.org/0day-ci/archive/20230223/202302232141.4Sr7gOg8-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/adf26475d30d3f3828e843567ec617d21136233c
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block stable/linux-stable-rc/queue/5.15
        git checkout adf26475d30d3f3828e843567ec617d21136233c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302232141.4Sr7gOg8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/core.c:1651:3: error: implicit declaration of function 'barrier_nospec' [-Werror,-Wimplicit-function-declaration]
                   barrier_nospec();
                   ^
   1 error generated.


vim +/barrier_nospec +1651 kernel/bpf/core.c

f5bffecda951b5 Alexei Starovoitov 2014-07-22  1407  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1408  select_insn:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1409  	goto *jumptable[insn->code];
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1410  
28131e9d933339 Daniel Borkmann    2021-06-16  1411  	/* Explicitly mask the register-based shift amounts with 63 or 31
28131e9d933339 Daniel Borkmann    2021-06-16  1412  	 * to avoid undefined behavior. Normally this won't affect the
28131e9d933339 Daniel Borkmann    2021-06-16  1413  	 * generated code, for example, in case of native 64 bit archs such
28131e9d933339 Daniel Borkmann    2021-06-16  1414  	 * as x86-64 or arm64, the compiler is optimizing the AND away for
28131e9d933339 Daniel Borkmann    2021-06-16  1415  	 * the interpreter. In case of JITs, each of the JIT backends compiles
28131e9d933339 Daniel Borkmann    2021-06-16  1416  	 * the BPF shift operations to machine instructions which produce
28131e9d933339 Daniel Borkmann    2021-06-16  1417  	 * implementation-defined results in such a case; the resulting
28131e9d933339 Daniel Borkmann    2021-06-16  1418  	 * contents of the register may be arbitrary, but program behaviour
28131e9d933339 Daniel Borkmann    2021-06-16  1419  	 * as a whole remains defined. In other words, in case of JIT backends,
28131e9d933339 Daniel Borkmann    2021-06-16  1420  	 * the AND must /not/ be added to the emitted LSH/RSH/ARSH translation.
28131e9d933339 Daniel Borkmann    2021-06-16  1421  	 */
28131e9d933339 Daniel Borkmann    2021-06-16  1422  	/* ALU (shifts) */
28131e9d933339 Daniel Borkmann    2021-06-16  1423  #define SHT(OPCODE, OP)					\
28131e9d933339 Daniel Borkmann    2021-06-16  1424  	ALU64_##OPCODE##_X:				\
28131e9d933339 Daniel Borkmann    2021-06-16  1425  		DST = DST OP (SRC & 63);		\
28131e9d933339 Daniel Borkmann    2021-06-16  1426  		CONT;					\
28131e9d933339 Daniel Borkmann    2021-06-16  1427  	ALU_##OPCODE##_X:				\
28131e9d933339 Daniel Borkmann    2021-06-16  1428  		DST = (u32) DST OP ((u32) SRC & 31);	\
28131e9d933339 Daniel Borkmann    2021-06-16  1429  		CONT;					\
28131e9d933339 Daniel Borkmann    2021-06-16  1430  	ALU64_##OPCODE##_K:				\
28131e9d933339 Daniel Borkmann    2021-06-16  1431  		DST = DST OP IMM;			\
28131e9d933339 Daniel Borkmann    2021-06-16  1432  		CONT;					\
28131e9d933339 Daniel Borkmann    2021-06-16  1433  	ALU_##OPCODE##_K:				\
28131e9d933339 Daniel Borkmann    2021-06-16  1434  		DST = (u32) DST OP (u32) IMM;		\
28131e9d933339 Daniel Borkmann    2021-06-16  1435  		CONT;
28131e9d933339 Daniel Borkmann    2021-06-16  1436  	/* ALU (rest) */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1437  #define ALU(OPCODE, OP)					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1438  	ALU64_##OPCODE##_X:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1439  		DST = DST OP SRC;			\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1440  		CONT;					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1441  	ALU_##OPCODE##_X:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1442  		DST = (u32) DST OP (u32) SRC;		\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1443  		CONT;					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1444  	ALU64_##OPCODE##_K:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1445  		DST = DST OP IMM;			\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1446  		CONT;					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1447  	ALU_##OPCODE##_K:				\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1448  		DST = (u32) DST OP (u32) IMM;		\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1449  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1450  	ALU(ADD,  +)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1451  	ALU(SUB,  -)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1452  	ALU(AND,  &)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1453  	ALU(OR,   |)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1454  	ALU(XOR,  ^)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1455  	ALU(MUL,  *)
28131e9d933339 Daniel Borkmann    2021-06-16  1456  	SHT(LSH, <<)
28131e9d933339 Daniel Borkmann    2021-06-16  1457  	SHT(RSH, >>)
28131e9d933339 Daniel Borkmann    2021-06-16  1458  #undef SHT
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1459  #undef ALU
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1460  	ALU_NEG:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1461  		DST = (u32) -DST;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1462  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1463  	ALU64_NEG:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1464  		DST = -DST;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1465  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1466  	ALU_MOV_X:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1467  		DST = (u32) SRC;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1468  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1469  	ALU_MOV_K:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1470  		DST = (u32) IMM;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1471  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1472  	ALU64_MOV_X:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1473  		DST = SRC;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1474  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1475  	ALU64_MOV_K:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1476  		DST = IMM;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1477  		CONT;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1478  	LD_IMM_DW:
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1479  		DST = (u64) (u32) insn[0].imm | ((u64) (u32) insn[1].imm) << 32;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1480  		insn++;
02ab695bb37ee9 Alexei Starovoitov 2014-09-04  1481  		CONT;
2dc6b100f928aa Jiong Wang         2018-12-05  1482  	ALU_ARSH_X:
28131e9d933339 Daniel Borkmann    2021-06-16  1483  		DST = (u64) (u32) (((s32) DST) >> (SRC & 31));
2dc6b100f928aa Jiong Wang         2018-12-05  1484  		CONT;
2dc6b100f928aa Jiong Wang         2018-12-05  1485  	ALU_ARSH_K:
75672dda27bd00 Jiong Wang         2019-06-25  1486  		DST = (u64) (u32) (((s32) DST) >> IMM);
2dc6b100f928aa Jiong Wang         2018-12-05  1487  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1488  	ALU64_ARSH_X:
28131e9d933339 Daniel Borkmann    2021-06-16  1489  		(*(s64 *) &DST) >>= (SRC & 63);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1490  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1491  	ALU64_ARSH_K:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1492  		(*(s64 *) &DST) >>= IMM;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1493  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1494  	ALU64_MOD_X:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1495  		div64_u64_rem(DST, SRC, &AX);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1496  		DST = AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1497  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1498  	ALU_MOD_X:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1499  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1500  		DST = do_div(AX, (u32) SRC);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1501  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1502  	ALU64_MOD_K:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1503  		div64_u64_rem(DST, IMM, &AX);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1504  		DST = AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1505  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1506  	ALU_MOD_K:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1507  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1508  		DST = do_div(AX, (u32) IMM);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1509  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1510  	ALU64_DIV_X:
876a7ae65b86d8 Alexei Starovoitov 2015-04-27  1511  		DST = div64_u64(DST, SRC);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1512  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1513  	ALU_DIV_X:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1514  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1515  		do_div(AX, (u32) SRC);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1516  		DST = (u32) AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1517  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1518  	ALU64_DIV_K:
876a7ae65b86d8 Alexei Starovoitov 2015-04-27  1519  		DST = div64_u64(DST, IMM);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1520  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1521  	ALU_DIV_K:
144cd91c4c2bce Daniel Borkmann    2019-01-03  1522  		AX = (u32) DST;
144cd91c4c2bce Daniel Borkmann    2019-01-03  1523  		do_div(AX, (u32) IMM);
144cd91c4c2bce Daniel Borkmann    2019-01-03  1524  		DST = (u32) AX;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1525  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1526  	ALU_END_TO_BE:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1527  		switch (IMM) {
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1528  		case 16:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1529  			DST = (__force u16) cpu_to_be16(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1530  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1531  		case 32:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1532  			DST = (__force u32) cpu_to_be32(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1533  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1534  		case 64:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1535  			DST = (__force u64) cpu_to_be64(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1536  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1537  		}
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1538  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1539  	ALU_END_TO_LE:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1540  		switch (IMM) {
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1541  		case 16:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1542  			DST = (__force u16) cpu_to_le16(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1543  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1544  		case 32:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1545  			DST = (__force u32) cpu_to_le32(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1546  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1547  		case 64:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1548  			DST = (__force u64) cpu_to_le64(DST);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1549  			break;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1550  		}
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1551  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1552  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1553  	/* CALL */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1554  	JMP_CALL:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1555  		/* Function call scratches BPF_R1-BPF_R5 registers,
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1556  		 * preserves BPF_R6-BPF_R9, and stores return value
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1557  		 * into BPF_R0.
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1558  		 */
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1559  		BPF_R0 = (__bpf_call_base + insn->imm)(BPF_R1, BPF_R2, BPF_R3,
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1560  						       BPF_R4, BPF_R5);
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1561  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1562  
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1563  	JMP_CALL_ARGS:
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1564  		BPF_R0 = (__bpf_call_base_args + insn->imm)(BPF_R1, BPF_R2,
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1565  							    BPF_R3, BPF_R4,
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1566  							    BPF_R5,
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1567  							    insn + insn->off + 1);
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1568  		CONT;
1ea47e01ad6ea0 Alexei Starovoitov 2017-12-14  1569  
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1570  	JMP_TAIL_CALL: {
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1571  		struct bpf_map *map = (struct bpf_map *) (unsigned long) BPF_R2;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1572  		struct bpf_array *array = container_of(map, struct bpf_array, map);
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1573  		struct bpf_prog *prog;
90caccdd8cc021 Alexei Starovoitov 2017-10-03  1574  		u32 index = BPF_R3;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1575  
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1576  		if (unlikely(index >= array->map.max_entries))
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1577  			goto out;
f9dabe016b63c9 Daniel Borkmann    2021-08-19  1578  		if (unlikely(tail_call_cnt > MAX_TAIL_CALL_CNT))
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1579  			goto out;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1580  
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1581  		tail_call_cnt++;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1582  
2a36f0b92eb638 Wang Nan           2015-08-06  1583  		prog = READ_ONCE(array->ptrs[index]);
1ca1cc98bf7418 Daniel Borkmann    2016-06-28  1584  		if (!prog)
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1585  			goto out;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1586  
c4675f935399cb Daniel Borkmann    2015-07-13  1587  		/* ARG1 at this point is guaranteed to point to CTX from
c4675f935399cb Daniel Borkmann    2015-07-13  1588  		 * the verifier side due to the fact that the tail call is
0142dddcbe9654 Chris Packham      2020-05-26  1589  		 * handled like a helper, that is, bpf_tail_call_proto,
c4675f935399cb Daniel Borkmann    2015-07-13  1590  		 * where arg1_type is ARG_PTR_TO_CTX.
c4675f935399cb Daniel Borkmann    2015-07-13  1591  		 */
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1592  		insn = prog->insnsi;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1593  		goto select_insn;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1594  out:
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1595  		CONT;
04fd61ab36ec06 Alexei Starovoitov 2015-05-19  1596  	}
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1597  	JMP_JA:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1598  		insn += insn->off;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1599  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1600  	JMP_EXIT:
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1601  		return BPF_R0;
503a8865a47752 Jiong Wang         2019-01-26  1602  	/* JMP */
503a8865a47752 Jiong Wang         2019-01-26  1603  #define COND_JMP(SIGN, OPCODE, CMP_OP)				\
503a8865a47752 Jiong Wang         2019-01-26  1604  	JMP_##OPCODE##_X:					\
503a8865a47752 Jiong Wang         2019-01-26  1605  		if ((SIGN##64) DST CMP_OP (SIGN##64) SRC) {	\
503a8865a47752 Jiong Wang         2019-01-26  1606  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1607  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1608  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1609  		CONT;						\
503a8865a47752 Jiong Wang         2019-01-26  1610  	JMP32_##OPCODE##_X:					\
503a8865a47752 Jiong Wang         2019-01-26  1611  		if ((SIGN##32) DST CMP_OP (SIGN##32) SRC) {	\
503a8865a47752 Jiong Wang         2019-01-26  1612  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1613  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1614  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1615  		CONT;						\
503a8865a47752 Jiong Wang         2019-01-26  1616  	JMP_##OPCODE##_K:					\
503a8865a47752 Jiong Wang         2019-01-26  1617  		if ((SIGN##64) DST CMP_OP (SIGN##64) IMM) {	\
503a8865a47752 Jiong Wang         2019-01-26  1618  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1619  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1620  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1621  		CONT;						\
503a8865a47752 Jiong Wang         2019-01-26  1622  	JMP32_##OPCODE##_K:					\
503a8865a47752 Jiong Wang         2019-01-26  1623  		if ((SIGN##32) DST CMP_OP (SIGN##32) IMM) {	\
503a8865a47752 Jiong Wang         2019-01-26  1624  			insn += insn->off;			\
503a8865a47752 Jiong Wang         2019-01-26  1625  			CONT_JMP;				\
503a8865a47752 Jiong Wang         2019-01-26  1626  		}						\
503a8865a47752 Jiong Wang         2019-01-26  1627  		CONT;
503a8865a47752 Jiong Wang         2019-01-26  1628  	COND_JMP(u, JEQ, ==)
503a8865a47752 Jiong Wang         2019-01-26  1629  	COND_JMP(u, JNE, !=)
503a8865a47752 Jiong Wang         2019-01-26  1630  	COND_JMP(u, JGT, >)
503a8865a47752 Jiong Wang         2019-01-26  1631  	COND_JMP(u, JLT, <)
503a8865a47752 Jiong Wang         2019-01-26  1632  	COND_JMP(u, JGE, >=)
503a8865a47752 Jiong Wang         2019-01-26  1633  	COND_JMP(u, JLE, <=)
503a8865a47752 Jiong Wang         2019-01-26  1634  	COND_JMP(u, JSET, &)
503a8865a47752 Jiong Wang         2019-01-26  1635  	COND_JMP(s, JSGT, >)
503a8865a47752 Jiong Wang         2019-01-26  1636  	COND_JMP(s, JSLT, <)
503a8865a47752 Jiong Wang         2019-01-26  1637  	COND_JMP(s, JSGE, >=)
503a8865a47752 Jiong Wang         2019-01-26  1638  	COND_JMP(s, JSLE, <=)
503a8865a47752 Jiong Wang         2019-01-26  1639  #undef COND_JMP
f5e81d11175015 Daniel Borkmann    2021-07-13  1640  	/* ST, STX and LDX*/
f5e81d11175015 Daniel Borkmann    2021-07-13  1641  	ST_NOSPEC:
f5e81d11175015 Daniel Borkmann    2021-07-13  1642  		/* Speculation barrier for mitigating Speculative Store Bypass.
f5e81d11175015 Daniel Borkmann    2021-07-13  1643  		 * In case of arm64, we rely on the firmware mitigation as
f5e81d11175015 Daniel Borkmann    2021-07-13  1644  		 * controlled via the ssbd kernel parameter. Whenever the
f5e81d11175015 Daniel Borkmann    2021-07-13  1645  		 * mitigation is enabled, it works for all of the kernel code
f5e81d11175015 Daniel Borkmann    2021-07-13  1646  		 * with no need to provide any additional instructions here.
f5e81d11175015 Daniel Borkmann    2021-07-13  1647  		 * In case of x86, we use 'lfence' insn for mitigation. We
f5e81d11175015 Daniel Borkmann    2021-07-13  1648  		 * reuse preexisting logic from Spectre v1 mitigation that
f5e81d11175015 Daniel Borkmann    2021-07-13  1649  		 * happens to produce the required code on x86 for v4 as well.
f5e81d11175015 Daniel Borkmann    2021-07-13  1650  		 */
f5e81d11175015 Daniel Borkmann    2021-07-13 @1651  		barrier_nospec();
f5e81d11175015 Daniel Borkmann    2021-07-13  1652  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1653  #define LDST(SIZEOP, SIZE)						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1654  	STX_MEM_##SIZEOP:						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1655  		*(SIZE *)(unsigned long) (DST + insn->off) = SRC;	\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1656  		CONT;							\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1657  	ST_MEM_##SIZEOP:						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1658  		*(SIZE *)(unsigned long) (DST + insn->off) = IMM;	\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1659  		CONT;							\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1660  	LDX_MEM_##SIZEOP:						\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1661  		DST = *(SIZE *)(unsigned long) (SRC + insn->off);	\
f95e24bf19e273 Menglong Dong      2022-05-24  1662  		CONT;							\
f95e24bf19e273 Menglong Dong      2022-05-24  1663  	LDX_PROBE_MEM_##SIZEOP:						\
f95e24bf19e273 Menglong Dong      2022-05-24  1664  		bpf_probe_read_kernel(&DST, sizeof(SIZE),		\
f95e24bf19e273 Menglong Dong      2022-05-24  1665  				      (const void *)(long) (SRC + insn->off));	\
f95e24bf19e273 Menglong Dong      2022-05-24  1666  		DST = *((SIZE *)&DST);					\
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1667  		CONT;
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1668  
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1669  	LDST(B,   u8)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1670  	LDST(H,  u16)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1671  	LDST(W,  u32)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1672  	LDST(DW, u64)
f5bffecda951b5 Alexei Starovoitov 2014-07-22  1673  #undef LDST
2a02759ef5f8a3 Alexei Starovoitov 2019-10-15  1674  

:::::: The code at line 1651 was first introduced by commit
:::::: f5e81d1117501546b7be050c5fbafa6efd2c722c bpf: Introduce BPF nospec instruction for mitigating Spectre v4

:::::: TO: Daniel Borkmann <daniel@iogearbox.net>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
