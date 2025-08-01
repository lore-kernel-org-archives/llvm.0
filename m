Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5042475F7;
	Fri,  1 Aug 2025 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754059099; cv=none; b=jPJ6ibkSJREe+cL1OE0cOOH2QYr/cgn1eMv4uS13r4LQnpPfikHDMT4Z8LyrbtLZ102WBZbMg9VAAKFUB66Q03vonMKBT5cNGH/SvkicSlEI4d3gi1DF7SMrcxGDT2inDKGaUyaBwrcJgIlK84j+VvTjj05jvDpH9fUb2YEwAjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754059099; c=relaxed/simple;
	bh=yC3o7mfJF/JuMsU86RTs6XLiknd4Zjp6y5xwn/cC2AI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=td2vN/3fZYW7vUb6QDU+cVqUeUdBOZwcl1A93ZXjmk53TD8EAi+cLDBBq+I3BnJ9XWh+aUPCai9bLc6iUmmZ0Ny7Q849qMceQaIqkmIdV3F+MrKbSfQFN/dXkSVVRx0VpnUjnyCZIDpS/wBbxve/6dTEgvWLqaPaV62xo7dveIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JGe1XvV1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JGe1XvV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754059097; x=1785595097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yC3o7mfJF/JuMsU86RTs6XLiknd4Zjp6y5xwn/cC2AI=;
  b=JGe1XvV1LPeaRDKengqyrKgXOHhSNRdsXchBxsPOaUNqVPx47Q0B/pOl
   xldGbto3DFHebaKQt6xquTpF1TPnx3wFugxcftwrvOYy2Ue/tLhLHRLR0
   IaqPGjPNFPR5eP/oFahmAC3CUjy04OcPptSldhV6KSeKkxKGvTBJahmq7
   d5dl6YnvpZRFjuDhG9qX4JBLOEh+AMqOhwVnsXM/7BmpxHD8wTmQpexsk
   eDZFfag9cn6szSzRU8K61A+aPlBo89h+3MXttWQ8pVyzs78nDiqRlFF8v
   0qzD6LthC4848DuTf0rXiASLqspHt7GGzVObPZUmwfz+gstmgMQuFG4BN
   A==;
X-CSE-ConnectionGUID: er0lVJqtRf+mfRiMCE9gTw==
X-CSE-MsgGUID: 6Q5OVrVnT2aGlIiCVvjxKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56552062"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56552062"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 07:38:16 -0700
X-CSE-ConnectionGUID: pmmsNqJ0SNib5PWPUDn9XQ==
X-CSE-MsgGUID: 4k+SltTUTUesB6JITHFMWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="163142329"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Aug 2025 07:38:14 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhqtg-0004h6-16;
	Fri, 01 Aug 2025 14:38:12 +0000
Date: Fri, 1 Aug 2025 22:38:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:ethos-v2 3/11] drivers/accel/ethos/ethos_drv.c:239:9: error:
 call to undeclared function 'FIELD_GET'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202508012221.5omgydR4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git ethos-v2
head:   e0ae8051a79d08497d42bebe772596a353ba477e
commit: 6f107ed06ad239d382531b1710da4dd354dcb7c3 [3/11] accel: Add Arm Ethos-U NPU driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250801/202508012221.5omgydR4-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508012221.5omgydR4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508012221.5omgydR4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/ethos/ethos_drv.c:239:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     239 |         return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosdev->npu_info.id) == 1;
         |                ^
   drivers/accel/ethos/ethos_drv.c:251:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |                                  !FIELD_GET(STATUS_RESET_STATUS, reg),
         |                                   ^
   drivers/accel/ethos/ethos_drv.c:251:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   drivers/accel/ethos/ethos_drv.c:256:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     256 |         if (!FIELD_GET(PROT_ACTIVE_CSL, readl_relaxed(ethosdev->regs + NPU_REG_PROT))) {
         |              ^
   drivers/accel/ethos/ethos_drv.c:327:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^
   drivers/accel/ethos/ethos_drv.c:327:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     326 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                   ~~~
         |                                   %d
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:328:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     326 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                       ~~~
         |                                       %d
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     328 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:329:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     326 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                           ~~~
         |                                           %d
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     328 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     329 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:330:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     326 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                     ~~~
         |                                                     %d
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     328 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     329 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     330 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:331:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     326 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                         ~~~
         |                                                         %d
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     328 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     329 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     330 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
     331 |                 FIELD_GET(ID_VER_MINOR_MASK, id),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   drivers/accel/ethos/ethos_drv.c:332:3: warning: format specifies type 'long' but the argument has type 'int' [-Wformat]
     326 |                 "Ethos NPU, arch v%ld.%ld.%ld, rev r%ldp%ld, cmd stream ver%ld, %d MACs, %dKB SRAM\n",
         |                                                                            ~~~
         |                                                                            %d
     327 |                 FIELD_GET(ID_ARCH_MAJOR_MASK, id),
     328 |                 FIELD_GET(ID_ARCH_MINOR_MASK, id),
     329 |                 FIELD_GET(ID_ARCH_PATCH_MASK, id),
     330 |                 FIELD_GET(ID_VER_MAJOR_MASK, id),
     331 |                 FIELD_GET(ID_VER_MINOR_MASK, id),
     332 |                 FIELD_GET(CONFIG_CMD_STREAM_VER_MASK, config),
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   6 warnings and 5 errors generated.
--
>> drivers/accel/ethos/ethos_gem.c:222:3: error: expected expression
     222 |                 u32 element_size = BIT((fm->precision >> 1) & 0x3);
         |                 ^
>> drivers/accel/ethos/ethos_gem.c:224:60: error: use of undeclared identifier 'element_size'
     224 |                 addr += (c / 16) * fm->stride_c + (16 * x + (c & 0xf)) * element_size;
         |                                                                          ^
   drivers/accel/ethos/ethos_gem.c:393:4: error: expected expression
     393 |                         u64 srclen = dma_length(info, &st.dma, &st.dma.src);
         |                         ^
>> drivers/accel/ethos/ethos_gem.c:399:44: error: use of undeclared identifier 'srclen'
     399 |                                  st.dma.src.region, st.dma.src.offset, srclen,
         |                                                                        ^
   4 errors generated.


vim +/FIELD_GET +239 drivers/accel/ethos/ethos_drv.c

   236	
   237	static bool ethos_is_u65(const struct ethos_device *ethosdev)
   238	{
 > 239		return FIELD_GET(ID_ARCH_MAJOR_MASK, ethosdev->npu_info.id) == 1;
   240	}
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
