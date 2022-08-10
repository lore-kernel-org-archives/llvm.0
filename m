Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7E15C83
	for <llvm@lists.linux.dev>; Wed, 10 Aug 2022 03:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660103229; x=1691639229;
  h=date:from:cc:subject:message-id:mime-version;
  bh=L4cq4RTjlHVbx9WYtgrEikVG3LTQUTuxI/NHk+MoSAg=;
  b=XoACMWB0G8yzOki+Kjo8o+OVvaHArEjzRjxBBgGeHL0JkrSjdtCflChs
   IP4ad2uGGr+dYW2N5ERaWR+51rE4V3TN21m5UZEr+o9ClPMvAdxu1IfOg
   RLwTNPP4kAG6VeV1MXmk8tyAB/Cd9XfewuYXG/sQbVG/3FgkFI2dg+7li
   bZaiC89KQaNpayJ0nq6ehyYFxk+zsMzLTI0SPic4tFGkwVevUxUsYJlIg
   t0/lEpp4Em8pJV0tD/09tM8XwbuyuAMnS6a/cqp8k59736tH0JHyzwC5z
   +mjpmVTidCr4j4Z9ybAiT005SYXKk0WIh7lpLF7jBVqfKKxHeRZjzdY+s
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10434"; a="352720281"
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="352720281"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2022 20:47:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,226,1654585200"; 
   d="scan'208";a="932728357"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2022 20:47:07 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oLcgV-000NU7-0T;
	Wed, 10 Aug 2022 03:47:07 +0000
Date: Wed, 10 Aug 2022 11:46:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH 16/16] objtool/powerpc: Add --mcount specific
 implementation
Message-ID: <202208101138.8BblKl1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20220808114908.240813-17-sv@linux.ibm.com>
References: <20220808114908.240813-17-sv@linux.ibm.com>
TO: Sathvika Vasireddy <sv@linux.ibm.com>
TO: linuxppc-dev@lists.ozlabs.org
CC: jpoimboe@redhat.com
CC: peterz@infradead.org
CC: linux-kernel@vger.kernel.org
CC: aik@ozlabs.ru
CC: mpe@ellerman.id.au
CC: mingo@redhat.com
CC: christophe.leroy@csgroup.eu
CC: rostedt@goodmis.org
CC: mbenes@suse.cz
CC: npiggin@gmail.com
CC: chenzhongjin@huawei.com
CC: linux-arm-kernel@lists.infradead.org
CC: naveen.n.rao@linux.vnet.ibm.com
CC: sv@linux.ibm.com

Hi Sathvika,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19 next-20220810]
[cannot apply to powerpc/next powerpc/topic/ppc-kvm masahiroy-kbuild/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220808-200702
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 4e23eeebb2e57f5a28b36221aa776b5a1122dde5
config: powerpc-randconfig-r024-20220808 (https://download.01.org/0day-ci/archive/20220810/202208101138.8BblKl1L-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/eb2c41f83b8e1f2967fd2342fbdc7c116def52c0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sathvika-Vasireddy/objtool-Enable-and-implement-mcount-option-on-powerpc/20220808-200702
        git checkout eb2c41f83b8e1f2967fd2342fbdc7c116def52c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash arch/powerpc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/powerpc/kernel/prom_init.o: warning: objtool: prom_init+0x14: unannotated intra-function call
--
>> arch/powerpc/platforms/powermac/bootx_init.o: warning: objtool: bootx_init+0x28: unannotated intra-function call


objdump-func vmlinux.o prom_init:
0000 00000004 <prom_init>:
0000        4:	7c 08 02 a6 	mflr    r0
0004        8:	90 01 00 04 	stw     r0,4(r1)
0008        c:	94 21 ff e0 	stwu    r1,-32(r1)
000c       10:	93 c1 00 18 	stw     r30,24(r1)
0010       14:	93 a1 00 14 	stw     r29,20(r1)
0014       18:	48 00 00 05 	bl      1c <prom_init+0x18>
0018       1c:	7c bd 2b 78 	mr      r29,r5
001c       20:	7f c8 02 a6 	mflr    r30
0020       24:	80 7e ff e4 	lwz     r3,-28(r30)
0024       28:	7f c3 f2 14 	add     r30,r3,r30
0028       2c:	48 00 00 01 	bl      2c <prom_init+0x28>	2c: R_PPC_PLTREL24	reloc_offset
002c       30:	48 00 00 01 	bl      30 <prom_init+0x2c>	30: R_PPC_PLTREL24	reloc_got2
0030       34:	80 9e 80 00 	lwz     r4,-32768(r30)
0034       38:	80 7e 80 04 	lwz     r3,-32764(r30)
0038       3c:	7c a3 20 50 	subf    r5,r3,r4
003c       40:	38 80 00 00 	li      r4,0
0040       44:	48 00 00 01 	bl      44 <prom_init+0x40>	44: R_PPC_PLTREL24	memset
0044       48:	7f a3 eb 78 	mr      r3,r29
0048       4c:	48 00 00 45 	bl      90 <prom_init_client_services>
004c       50:	48 00 01 01 	bl      150 <prom_find_mmu>
0050       54:	48 00 02 a9 	bl      2fc <prom_init_stdout>
0054       58:	80 7e 80 08 	lwz     r3,-32760(r30)
0058       5c:	80 9e 80 0c 	lwz     r4,-32756(r30)
005c       60:	4c c6 31 82 	crclr   4*cr1+eq
0060       64:	48 00 04 39 	bl      49c <prom_printf>
0064       68:	48 00 08 19 	bl      880 <prom_find_machine_type>
0068       6c:	80 be 80 10 	lwz     r5,-32752(r30)
006c       70:	7c 64 1b 78 	mr      r4,r3
0070       74:	4c c6 31 82 	crclr   4*cr1+eq
0074       78:	90 65 00 00 	stw     r3,0(r5)
0078       7c:	80 7e 80 14 	lwz     r3,-32748(r30)
007c       80:	48 00 04 1d 	bl      49c <prom_printf>
0080       84:	80 7e 80 18 	lwz     r3,-32744(r30)
0084       88:	48 00 09 01 	bl      988 <prom_panic>
0088       8c:	00 00 00 00 	.long 0x0	8c: R_PPC_REL32	.got2+0x7fe4

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
