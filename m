Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4584215195;
	Fri, 10 Jan 2025 23:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736550769; cv=none; b=qR+k6cuaGofQGg8MFDlr0GNd1/pjk1pjLV2la99deDG3HhdgkRTJZSl02dHkcSuUzjr7MPPJNYk1xYr+dzysmiq5VlTi+SJndnE3q4IT0eVtsKwNmtGhj0Yd3sFRVFFcYJM22h3ueI3kU0Urslt5DeFfMlY6PhGIM+zdUylDDog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736550769; c=relaxed/simple;
	bh=wexjx0wt92nmAnqpa6q/pmuowW17XAhK2tFJMUhwzCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmIc/c999kTTSIF6jtcA9WhKvklZg6Beb79DG1Gvg2sorusMCG4I5zInLrYMjIjfuNAhUnqxU1dHHqhFpZkUNRYQE0gVgOf744YXcA9uMm/x45sbudkjlDMzuKT7dFl7J0t5+I+U7vDTDnSuABCDPdZ0EUoKEwP+SIfpdLGmiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k7J1g5Dr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k7J1g5Dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736550768; x=1768086768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wexjx0wt92nmAnqpa6q/pmuowW17XAhK2tFJMUhwzCM=;
  b=k7J1g5Dru6x5VETDtHFyohY+wDR+Y/dk7r/RQaggU0XWwWOxp/5p1Dcr
   i5FtsjbyxXTIUkpJBZWJxCeKe5C/DPvFCvSSA0Eet2QXx1cLbVUY7KRDQ
   Ofr+3vohr0hp1T8kUweEN1LNPmeollv7f/gn9RfpngvYGEEsHrGJQkmt8
   Phhzn860D+667I3ob7o6h4pI9HJjxXqk/WIUBlcjZLo3WTjhBAtxxS2F7
   w9J3yZKpqedYz4Msy+S67WedTkjLx+Bv4PfweiS3WXucuFbvLRWw4HLwP
   3Dq8C/BO/mXpdwDt6c7OtiAJGR4YDEmK5IZlXirP6XK4ezuDTie8S5nVZ
   A==;
X-CSE-ConnectionGUID: i7Fcx93kQQ62z4wv/wpDNA==
X-CSE-MsgGUID: LS64OVbnQVKGT7SLKoY0Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36760289"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36760289"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 15:12:47 -0800
X-CSE-ConnectionGUID: PQ2WqqAJQlGo+Ps4RvI4pg==
X-CSE-MsgGUID: KTTdF6GTRtyG1fuJ79NO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104428554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2025 15:12:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWOBH-000JsE-0q;
	Fri, 10 Jan 2025 23:12:43 +0000
Date: Sat, 11 Jan 2025 07:12:37 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 371/504] drivers/misc/rsmu_cm.c:333:53:
 warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short')
 changes value from 537972560 to 53072
Message-ID: <202501110745.sHP4ZB8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: b77497260b398a80cfe434aec5106a46dcc21456 [371/504] misc: rsmu: add rsmu cdev driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110745.sHP4ZB8s-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110745.sHP4ZB8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110745.sHP4ZB8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/rsmu_cm.c:10:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/misc/rsmu_cm.c:15:
   In file included from drivers/misc/rsmu_cdev.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/misc/rsmu_cm.c:15:
   In file included from drivers/misc/rsmu_cdev.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/misc/rsmu_cm.c:15:
   In file included from drivers/misc/rsmu_cdev.h:13:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:14:
   In file included from arch/s390/include/asm/io.h:95:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/misc/rsmu_cm.c:172:6: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     172 |         int err;
         |             ^
>> drivers/misc/rsmu_cm.c:333:53: warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short') changes value from 537972560 to 53072 [-Wconstant-conversion]
     333 |         u16 scratch = IDTCM_FW_REG(rsmu->fw_version, V520, SCRATCH);
         |             ~~~~~~~                                        ^~~~~~~
   include/linux/mfd/idt8a340_reg.h:503:43: note: expanded from macro 'SCRATCH'
     503 | #define SCRATCH                           0x2010cf50
         |                                           ^~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:744:55: note: expanded from macro 'IDTCM_FW_REG'
     744 | #define IDTCM_FW_REG(FW, VER, REG)      (((FW) < (VER)) ? (REG) : (REG##_##VER))
         |                                                            ^~~
   drivers/misc/rsmu_cm.c:333:16: warning: implicit conversion from 'int' to 'u16' (aka 'unsigned short') changes value from 537972556 to 53068 [-Wconstant-conversion]
     333 |         u16 scratch = IDTCM_FW_REG(rsmu->fw_version, V520, SCRATCH);
         |             ~~~~~~~   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:744:63: note: expanded from macro 'IDTCM_FW_REG'
     744 | #define IDTCM_FW_REG(FW, VER, REG)      (((FW) < (VER)) ? (REG) : (REG##_##VER))
         |                                                                    ^~~~~~~~~~~
   <scratch space>:154:1: note: expanded from here
     154 | SCRATCH_V520
         | ^~~~~~~~~~~~
   include/linux/mfd/idt8a340_reg.h:504:43: note: expanded from macro 'SCRATCH_V520'
     504 | #define SCRATCH_V520                      0x2010cf4c
         |                                           ^~~~~~~~~~
   19 warnings generated.


vim +333 drivers/misc/rsmu_cm.c

   329	
   330	static int rsmu_cm_load_firmware(struct rsmu_cdev *rsmu,
   331					 char fwname[FW_NAME_LEN_MAX])
   332	{
 > 333		u16 scratch = IDTCM_FW_REG(rsmu->fw_version, V520, SCRATCH);
   334		char fname[FW_NAME_LEN_MAX] = FW_FILENAME;
   335		const struct firmware *fw;
   336		struct idtcm_fwrc *rec;
   337		u32 regaddr;
   338		int err;
   339		s32 len;
   340		u8 val;
   341		u8 loaddr;
   342	
   343		if (fwname) /* Module parameter */
   344			snprintf(fname, sizeof(fname), "%s", fwname);
   345	
   346		dev_info(rsmu->dev, "requesting firmware '%s'", fname);
   347	
   348		err = request_firmware(&fw, fname, rsmu->dev);
   349		if (err) {
   350			dev_err(rsmu->dev, "Loading firmware %s failed !!!", fname);
   351			return err;
   352		}
   353	
   354		dev_dbg(rsmu->dev, "firmware size %zu bytes", fw->size);
   355	
   356		rec = (struct idtcm_fwrc *) fw->data;
   357	
   358		for (len = fw->size; len > 0; len -= sizeof(*rec)) {
   359			if (rec->reserved) {
   360				dev_err(rsmu->dev,
   361					"bad firmware, reserved field non-zero");
   362				err = -EINVAL;
   363			} else {
   364				regaddr = rec->hiaddr << 8;
   365				regaddr |= rec->loaddr;
   366	
   367				val = rec->value;
   368				loaddr = rec->loaddr;
   369	
   370				rec++;
   371	
   372				err = check_and_set_masks(rsmu, regaddr, val);
   373			}
   374	
   375			if (err != -EINVAL) {
   376				err = 0;
   377	
   378				/* Top (status registers) and bottom are read-only */
   379				if (regaddr < SCSR_ADDR(GPIO_USER_CONTROL) || regaddr >= scratch)
   380					continue;
   381	
   382				/* Page size 128, last 4 bytes of page skipped */
   383				if ((loaddr > 0x7b && loaddr <= 0x7f) || loaddr > 0xfb)
   384					continue;
   385	
   386				err = regmap_bulk_write(rsmu->regmap, SCSR_BASE + regaddr,
   387						       &val, sizeof(val));
   388			}
   389	
   390			if (err)
   391				goto out;
   392		}
   393	
   394	out:
   395		release_firmware(fw);
   396		return err;
   397	}
   398	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
