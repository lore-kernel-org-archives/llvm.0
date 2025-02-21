Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4763E2139D4;
	Fri, 21 Feb 2025 13:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740145952; cv=none; b=kfybc/MCvSS1uOWHTZ4sE6ImHYewhR0CMMaogUimiN6L3E7atsMCrRqp2LQXwNdgeMtLqENT4kskDZgExhQnneoRkqxvJ28gBk7I60ErMPWwze015/Wk/N0TVDwxMf3e+hhvLsDrvWOm19AMpXLSoHer5sTEGpubsLV5wLdjb7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740145952; c=relaxed/simple;
	bh=afBrcC+37CziKbIMckZmG0fAcvjUCEnw3uPaW9e2deU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G/ZXYK8Eyilr1zPxMHHvYxawCceG0EQ3IOHB/B0OzrvLGi8B5r3KHH6hLPJ1jD1hpWzczPqnDmaU1uCbtKhYyILPissYqA0p0IPi4TjZ9LWxhFZpVcFZEWKYrWxY4PXU1B5BRi8arpOXQInyZy9i30RFU7Llbszy0CUF46fzZP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOCYmrTv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOCYmrTv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740145950; x=1771681950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afBrcC+37CziKbIMckZmG0fAcvjUCEnw3uPaW9e2deU=;
  b=WOCYmrTvO8cqJsZ4s3atjYZESOvsl0c/5QVm6yo+xZBwb+/twOodd/yl
   EOiu0K5ILxxTC1NcC7CXgziw8/OuEEV8G6CYx+R44CLY63l8RnSin13Ud
   oaXBME4flTlLNH1cNfmtn2Z3VzdKFqpTf7X5UHzdZDnfazBBe1QstU5/+
   iPYYPILsZveP3Z0iIN64v9PPKMrWke7b7ErllUccmjuLb0nJobuvWheai
   QKdloTL9NJpgf8efvHTAXMr8NwySbc8Hf8XFaHJrltK18Z2bJ4RqUw1yg
   H73c0PNoe5WUeW5uPYtEExwKY+EgY/K98CTM6AhC9ntOSF5FtK3nh2FoJ
   Q==;
X-CSE-ConnectionGUID: qRv5BdtlQ9SFwf/7lhQZLQ==
X-CSE-MsgGUID: cVdw5xy3SSexuul8+iAmsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44879590"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="44879590"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 05:52:29 -0800
X-CSE-ConnectionGUID: 7MD3cwytS3iYvRYMgAeBdg==
X-CSE-MsgGUID: 8OgJjvkTT8KsK2iZzh4e4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115204508"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 21 Feb 2025 05:52:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlTRZ-0005Zn-0r;
	Fri, 21 Feb 2025 13:52:10 +0000
Date: Fri, 21 Feb 2025 21:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 4334/5524] arch/x86/include/asm/amd_node.h:30:9:
 error: call to undeclared function 'topology_amd_nodes_per_pkg'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202502212112.uhkSOeGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
commit: f120cf33d2325fd95d063eccbff2e86ffc7f493a [4334/5524] ASoC: SOF: amd: Use AMD_NODE
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250221/202502212112.uhkSOeGN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 204dcafec0ecf0db81d420d2de57b02ada6b09ec)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502212112.uhkSOeGN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502212112.uhkSOeGN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/sof/amd/acp.c:15:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/sof/amd/acp.c:15:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/sof/amd/acp.c:15:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from sound/soc/sof/amd/acp.c:19:
>> arch/x86/include/asm/amd_node.h:30:9: error: call to undeclared function 'topology_amd_nodes_per_pkg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |         return topology_amd_nodes_per_pkg() * topology_max_packages();
         |                ^
>> arch/x86/include/asm/amd_node.h:30:40: error: call to undeclared function 'topology_max_packages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      30 |         return topology_amd_nodes_per_pkg() * topology_max_packages();
         |                                               ^
   12 warnings and 2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SOF_AMD_COMMON
   Depends on [n]: SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=m] && AMD_NODE
   Selected by [m]:
   - SND_SOC_SOF_AMD_RENOIR [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=m] && SND_SOC_SOF_PCI [=m]
   - SND_SOC_SOF_AMD_VANGOGH [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=m] && SND_SOC_SOF_PCI [=m]
   - SND_SOC_SOF_AMD_REMBRANDT [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=m] && SND_SOC_SOF_PCI [=m]
   - SND_SOC_SOF_AMD_ACP63 [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=m] && SND_SOC_SOF_PCI [=m]
   - SND_SOC_SOF_AMD_ACP70 [=m] && SOUND [=m] && SND [=m] && SND_SOC [=m] && SND_SOC_SOF_TOPLEVEL [=y] && SND_SOC_SOF_AMD_TOPLEVEL [=m] && SND_SOC_SOF_PCI [=m]


vim +/topology_amd_nodes_per_pkg +30 arch/x86/include/asm/amd_node.h

e6e6e5e85116b8 Yazen Ghannam 2024-12-06  27  
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  28  static inline u16 amd_num_nodes(void)
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  29  {
bc7b2e629e0c92 Yazen Ghannam 2025-01-07 @30  	return topology_amd_nodes_per_pkg() * topology_max_packages();
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  31  }
bc7b2e629e0c92 Yazen Ghannam 2025-01-07  32  

:::::: The code at line 30 was first introduced by commit
:::::: bc7b2e629e0c9251ba96d864a30d34d1497b1b1b x86/amd_nb: Use topology info to get AMD node count

:::::: TO: Yazen Ghannam <yazen.ghannam@amd.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
