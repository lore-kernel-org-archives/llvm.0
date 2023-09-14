Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840623C05;
	Thu, 14 Sep 2023 22:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694731853; x=1726267853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z4ug5or7k4TrDT2AACbO1c08ViFDiZBOj1Rlt1drq4M=;
  b=P/JodmYGtohxpM0pmJ00w53BTb6NniwJy5H2TeVO5durT/8Cl8mRA5hD
   4KqYJmsMJM0ZWBL60e8KtoGWhMmOR+QbS7kHYsMX9quSr4SkEjOnaoUk1
   CKFF0KD+yaUI+QwSjYO7RvSjeOqBKjwTXPvtdvqD267BSZ82r5eW6elMZ
   jP0QLYid7Y19yWV42jydW5XfBbRo6Su1gussAHR8otyN0mjqbMi8BRhBv
   b6+wVC2KRQEY6EEijfkx5+CGVanIC1hkvHF1LdT+/ELR6rNPkb3CYSw1s
   D8J9jeRkU4B5aRWKR/kJ3fBK74j6qG3XDXso2h0QmSuEXL1q3ts9E16oN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445548759"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="445548759"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 15:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="859899147"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="859899147"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Sep 2023 15:41:52 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgv1y-000293-0b;
	Thu, 14 Sep 2023 22:41:50 +0000
Date: Fri, 15 Sep 2023 06:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 24/39]
 include/uapi/asm-generic/unistd.h:827:11: error: array designator index
 (453) exceeds array bounds (453)
Message-ID: <202309150640.Qv36FvN5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   5886243daf585a7ed8f45646340af1ee602e1edd
commit: 21d72b8bd77f499b2d293febab37b9dbae5e46d4 [24/39] arm64/mm: Implement map_shadow_stack()
config: hexagon-randconfig-r012-20230913 (https://download.01.org/0day-ci/archive/20230915/202309150640.Qv36FvN5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309150640.Qv36FvN5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309150640.Qv36FvN5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/syscalltab.c:8:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from arch/hexagon/kernel/syscalltab.c:8:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from arch/hexagon/kernel/syscalltab.c:8:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from arch/hexagon/kernel/syscalltab.c:18:
   In file included from arch/hexagon/include/uapi/asm/unistd.h:40:
>> include/uapi/asm-generic/unistd.h:827:11: error: array designator index (453) exceeds array bounds (453)
   __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
             ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/unistd.h:826:31: note: expanded from macro '__NR_map_shadow_stack'
   #define __NR_map_shadow_stack 453
                                 ^~~
   arch/hexagon/kernel/syscalltab.c:15:30: note: expanded from macro '__SYSCALL'
   #define __SYSCALL(nr, call) [nr] = (call),
                                ^~
   6 warnings and 1 error generated.


vim +827 include/uapi/asm-generic/unistd.h

   825	
   826	#define __NR_map_shadow_stack 453
 > 827	__SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
   828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
