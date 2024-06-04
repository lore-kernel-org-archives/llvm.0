Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA85E82D9A;
	Tue,  4 Jun 2024 19:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717527665; cv=none; b=JMpYak3LRofbArBWlFTabSPgg1e+e/Z2KfuurUBbmMSJjFWLe4DDl/WksVsXnIYvDFRuNCCfSmBHMQgf5vS6oXdQlly8pTz8DaczHhB3SYsqv3vi4EmEYguFOGOWkbnRVmOKqQSBVBvKRdVBOT4XP55M8PwA07OfyxMRvGB1DfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717527665; c=relaxed/simple;
	bh=1+inVE1HhsgyDTRiPyKQladomTv1DYLAlsgkWkYDxaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qRKy/bob4qOi8S0kiAU1ikn/YteMwwwWT2tBwnssxCGMukr1sahqSmleYuFv24OjWmBdAsQKsMhEvpmH2hpEDG83PIWoV10u9p3dGhSGu6jzMjYwnOQA+KSqF+XfFDcm+hcceS77ttwCEhzVxZlQ/CXb3yQV0Pz8AAmsk8tqCQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWBtEl+B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWBtEl+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717527664; x=1749063664;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1+inVE1HhsgyDTRiPyKQladomTv1DYLAlsgkWkYDxaM=;
  b=QWBtEl+BsTjOeIDpfZ8uhzjGBDKQFUOx1TkkSWpU/wHBD4sAyIe21WPx
   6QJGyqYmNs3pimpCudzfRbT+jM//Xfzv/w0vWgEqDdwJPiHHqp3JxrcIc
   P0jFX1vgpZOoNqFL0xAYTPR2c9u9+Co4cTlOWVMBFpuIfIGcj7kpAhq75
   dhtaYrQpDNusWQ/Cg6jdpupbm3OpN3HUJzF6eln8Phow8/1UTFHwpwKuI
   Mvso1nRSdTWb/YiATGkI+8J6QpQ7NgNXrBsjRK2sk+d5mVOUSWjW1BCwu
   9dvgP+ZWXNETSJlbYTakzGrHBQcVpAipGDSmGfoDN8gcWMN/P6FmXYQUW
   w==;
X-CSE-ConnectionGUID: 0tjuustmQaeJOpzJt0zrVQ==
X-CSE-MsgGUID: uOtUhOqSSZOqXjzT4g7KlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="11903027"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="11903027"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2024 12:01:03 -0700
X-CSE-ConnectionGUID: GpxrP3u7SN+kuAQFQufLyQ==
X-CSE-MsgGUID: RyrT2WPxQseR2x66vl/bBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; 
   d="scan'208";a="68149972"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Jun 2024 12:01:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEZP0-0000QB-34;
	Tue, 04 Jun 2024 19:00:58 +0000
Date: Wed, 5 Jun 2024 03:00:15 +0800
From: kernel test robot <lkp@intel.com>
To: Joy Chakraborty <joychakr@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [srini-nvmem:for-next 1/1] drivers/mtd/mtdcore.c:557:18: error:
 incompatible function pointer types assigning to 'nvmem_reg_read_t' (aka
 'long (*)(void *, unsigned int, void *, unsigned long)') from 'int (void *,
 unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void ...
Message-ID: <202406050200.8BOdZUla-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   f5de138db5b76de7d96d4cf92f871ba893ba0119
commit: f5de138db5b76de7d96d4cf92f871ba893ba0119 [1/1] nvmem: Change return type of reg read/write to ssize_t
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240605/202406050200.8BOdZUla-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406050200.8BOdZUla-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406050200.8BOdZUla-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/mtdcore.c:12:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/mtd/mtdcore.c:557:18: error: incompatible function pointer types assigning to 'nvmem_reg_read_t' (aka 'long (*)(void *, unsigned int, void *, unsigned long)') from 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
     557 |         config.reg_read = mtd_nvmem_reg_read;
         |                         ^ ~~~~~~~~~~~~~~~~~~
>> drivers/mtd/mtdcore.c:966:14: error: incompatible function pointer types passing 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') to parameter of type 'nvmem_reg_read_t' (aka 'long (*)(void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
     966 |                                                        mtd_nvmem_user_otp_reg_read);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdcore.c:889:27: note: passing argument to parameter 'reg_read' here
     889 |                                                    nvmem_reg_read_t reg_read)
         |                                                                     ^
   drivers/mtd/mtdcore.c:1004:14: error: incompatible function pointer types passing 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') to parameter of type 'nvmem_reg_read_t' (aka 'long (*)(void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
    1004 |                                                        mtd_nvmem_fact_otp_reg_read);
         |                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/mtdcore.c:889:27: note: passing argument to parameter 'reg_read' here
     889 |                                                    nvmem_reg_read_t reg_read)
         |                                                                     ^
   1 warning and 3 errors generated.
--
   In file included from drivers/rtc/rtc-sun6i.c:21:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/rtc/rtc-sun6i.c:704:14: error: incompatible function pointer types initializing 'nvmem_reg_read_t' (aka 'long (*)(void *, unsigned int, void *, unsigned long)') with an expression of type 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
     704 |         .reg_read       = sun6i_rtc_nvmem_read,
         |                           ^~~~~~~~~~~~~~~~~~~~
>> drivers/rtc/rtc-sun6i.c:705:15: error: incompatible function pointer types initializing 'nvmem_reg_write_t' (aka 'long (*)(void *, unsigned int, void *, unsigned long)') with an expression of type 'int (void *, unsigned int, void *, size_t)' (aka 'int (void *, unsigned int, void *, unsigned long)') [-Wincompatible-function-pointer-types]
     705 |         .reg_write      = sun6i_rtc_nvmem_write,
         |                           ^~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +557 drivers/mtd/mtdcore.c

c4dfa25ab307a2 Alban Bedel        2018-11-13  546  
c4dfa25ab307a2 Alban Bedel        2018-11-13  547  static int mtd_nvmem_add(struct mtd_info *mtd)
c4dfa25ab307a2 Alban Bedel        2018-11-13  548  {
658c4448bbbf02 Christian Marangi  2021-03-12  549  	struct device_node *node = mtd_get_of_node(mtd);
c4dfa25ab307a2 Alban Bedel        2018-11-13  550  	struct nvmem_config config = {};
c4dfa25ab307a2 Alban Bedel        2018-11-13  551  
75f32f4b9d5263 Miquel Raynal      2023-03-07  552  	config.id = NVMEM_DEVID_NONE;
c4dfa25ab307a2 Alban Bedel        2018-11-13  553  	config.dev = &mtd->dev;
7b01b7239d0dc9 Ricardo Ribalda    2020-04-30  554  	config.name = dev_name(&mtd->dev);
c4dfa25ab307a2 Alban Bedel        2018-11-13  555  	config.owner = THIS_MODULE;
2cc3b37f5b6df8 Rafał Miłecki      2023-10-20  556  	config.add_legacy_fixed_of_cells = of_device_is_compatible(node, "nvmem-cells");
c4dfa25ab307a2 Alban Bedel        2018-11-13 @557  	config.reg_read = mtd_nvmem_reg_read;
c4dfa25ab307a2 Alban Bedel        2018-11-13  558  	config.size = mtd->size;
c4dfa25ab307a2 Alban Bedel        2018-11-13  559  	config.word_size = 1;
c4dfa25ab307a2 Alban Bedel        2018-11-13  560  	config.stride = 1;
c4dfa25ab307a2 Alban Bedel        2018-11-13  561  	config.read_only = true;
c4dfa25ab307a2 Alban Bedel        2018-11-13  562  	config.root_only = true;
6c7621890995d0 Christophe Kerello 2022-02-20  563  	config.ignore_wp = true;
c4dfa25ab307a2 Alban Bedel        2018-11-13  564  	config.priv = mtd;
c4dfa25ab307a2 Alban Bedel        2018-11-13  565  
c4dfa25ab307a2 Alban Bedel        2018-11-13  566  	mtd->nvmem = nvmem_register(&config);
c4dfa25ab307a2 Alban Bedel        2018-11-13  567  	if (IS_ERR(mtd->nvmem)) {
c4dfa25ab307a2 Alban Bedel        2018-11-13  568  		/* Just ignore if there is no NVMEM support in the kernel */
5cab06156aade1 Miquel Raynal      2023-03-07  569  		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP)
c4dfa25ab307a2 Alban Bedel        2018-11-13  570  			mtd->nvmem = NULL;
5cab06156aade1 Miquel Raynal      2023-03-07  571  		else
5cab06156aade1 Miquel Raynal      2023-03-07  572  			return dev_err_probe(&mtd->dev, PTR_ERR(mtd->nvmem),
5cab06156aade1 Miquel Raynal      2023-03-07  573  					     "Failed to register NVMEM device\n");
c4dfa25ab307a2 Alban Bedel        2018-11-13  574  	}
c4dfa25ab307a2 Alban Bedel        2018-11-13  575  
c4dfa25ab307a2 Alban Bedel        2018-11-13  576  	return 0;
c4dfa25ab307a2 Alban Bedel        2018-11-13  577  }
c4dfa25ab307a2 Alban Bedel        2018-11-13  578  

:::::: The code at line 557 was first introduced by commit
:::::: c4dfa25ab307a277eafa7067cd927fbe4d9be4ba mtd: add support for reading MTD devices via the nvmem API

:::::: TO: Alban Bedel <albeu@free.fr>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
