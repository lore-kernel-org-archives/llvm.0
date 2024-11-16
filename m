Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C0917BA1;
	Sat, 16 Nov 2024 14:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731768636; cv=none; b=Th04oyDNKOghF//kFFSZESR1+eAWI3jQGf+dnDwusrthi4vTmW1yx/LCFpEIAN/qo1Nn7IL+uhANGv84H9YrzjFG8/B4zoU6fE1rpFQO1Nsedtdph/otCeLbIPCWo3akD15e1CpFLVKJ2kpO7cuGzv9XjKWLKAtQ8JxuCB6ZTz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731768636; c=relaxed/simple;
	bh=jUC4cNlhGXLp5U4iWDIHFeH463bbQwE/QRiuhBUl6aA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZZadMrAy/ru8UKYLYAqARjP61IlBTXMbokuCVyJyujd6fl15opqoT8anirIkX77AXVc4q3UcqrFfhfl9J3PqmiypOKrdQdqX3y2WnzkcWpx8+g92PstaXbPF80aP8Dl28g+rdF9w7X22WAWZ3w3BJSO616/DWtpm85SyTfhmB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IemAUFv/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IemAUFv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731768635; x=1763304635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jUC4cNlhGXLp5U4iWDIHFeH463bbQwE/QRiuhBUl6aA=;
  b=IemAUFv/aa5EtDbylr9hd/ukfu4smQ3we/Zu7Zc11GHVKL2ZV/eoYZDr
   NtzcOOyQo09wO2GMcq/QY0wClC8xJG90gg1o0g2VGAtqfR0YDX6Aab8+5
   sWAoYeC1gCYkVbgYQg9JAOpR4BkZTaXGTVxAN1MlrPl7OutaCn/GtlkyB
   6/HR93Ov6ROhBHMmP//7ujkc81hOoDq3YcDqZch0zcYupBYy6HE5XWrOO
   3QDi4p9bUctM1gsCLki36kiB0TlfbjBU6IzIjJIdAaMMRa6PbnEJwcLyG
   2bVbhHql7wcab4urkmna+coR25XE9JRjww/cRfeqzuG2PpWqbKp0jG9ow
   g==;
X-CSE-ConnectionGUID: CTNWJCa+TxirJMix8pJH3A==
X-CSE-MsgGUID: vzB73usrTk+XrsRJwwT4QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43162612"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="43162612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 06:50:33 -0800
X-CSE-ConnectionGUID: UQmuassKQYCzalayPq5yXA==
X-CSE-MsgGUID: qTucyoVHQAuCDnR+6qQrHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88817534"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Nov 2024 06:50:31 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCK85-0000hm-1h;
	Sat, 16 Nov 2024 14:50:29 +0000
Date: Sat, 16 Nov 2024 22:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [djiang:cxl/fwctl 24/28] drivers/cxl/core/mbox.c:968:38: warning:
 variable 'u' is uninitialized when used here
Message-ID: <202411161501.RHC8S9Oq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   350392d25327a67c7299583a05481dfe524c7257
commit: 6cf5361c36766f6ea8fc0ff6bc80407cd343168e [24/28] fwctl/cxl: Add support to filter exclusive features
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20241116/202411161501.RHC8S9Oq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241116/202411161501.RHC8S9Oq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411161501.RHC8S9Oq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/cxl/core/mbox.c:3:
   In file included from include/linux/security.h:33:
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
   In file included from drivers/cxl/core/mbox.c:10:
   In file included from drivers/cxl/cxlpci.h:5:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/cxl/core/mbox.c:10:
   In file included from drivers/cxl/cxlpci.h:5:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/cxl/core/mbox.c:10:
   In file included from drivers/cxl/cxlpci.h:5:
   In file included from include/linux/pci.h:39:
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
>> drivers/cxl/core/mbox.c:968:38: warning: variable 'u' is uninitialized when used here [-Wuninitialized]
     968 |         feat_out->num_entries = cpu_to_le16(u);
         |                                             ^
   include/linux/byteorder/generic.h:90:21: note: expanded from macro 'cpu_to_le16'
      90 | #define cpu_to_le16 __cpu_to_le16
         |                     ^
   include/uapi/linux/byteorder/big_endian.h:36:53: note: expanded from macro '__cpu_to_le16'
      36 | #define __cpu_to_le16(x) ((__force __le16)__swab16((x)))
         |                                                     ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   drivers/cxl/core/mbox.c:913:24: note: initialize the variable 'u' to silence this warning
     913 |         int out_count, ents, u;
         |                               ^
         |                                = 0
   17 warnings generated.


vim +/u +968 drivers/cxl/core/mbox.c

   900	
   901	/*
   902	 * Emulate the 'get supported features' mailbox command and only copy out the
   903	 * features that are not marked as exclusive for kernel.
   904	 */
   905	static void cxl_mbox_get_supported_features_filtered(struct cxl_mailbox *cxl_mbox,
   906							     struct cxl_mbox_cmd *mbox_cmd)
   907	{
   908		struct cxl_mbox_get_sup_feats_in *feat_in = mbox_cmd->payload_in;
   909		struct cxl_mbox_get_sup_feats_out *feat_out = mbox_cmd->payload_out;
   910		const int feat_out_size = sizeof(*feat_out);
   911		struct cxl_feat_entry *pos;
   912		const int feat_ent_size = sizeof(*pos);
   913		int out_count, ents, u;
   914		u32 count;
   915		u16 start;
   916	
   917		count = le32_to_cpu(feat_in->count);
   918		start = le16_to_cpu(feat_in->start_idx);
   919		ents = count / sizeof(struct cxl_feat_entry);
   920		ents -= start;
   921		if (ents < 0) {
   922			mbox_cmd->size_out = 0;
   923			mbox_cmd->return_code = CXL_MBOX_CMD_RC_INPUT;
   924			return;
   925		}
   926	
   927		if (mbox_cmd->size_out < feat_out_size) {
   928			mbox_cmd->size_out = 0;
   929			mbox_cmd->return_code = CXL_MBOX_CMD_RC_INPUT;
   930			return;
   931		}
   932	
   933		feat_out->supported_feats =
   934			cpu_to_le16(cxl_mbox->num_user_feats);
   935		if (ents == 0) {
   936			feat_out->num_entries = cpu_to_le16(0);
   937			mbox_cmd->size_out = feat_out_size;
   938			mbox_cmd->return_code = CXL_MBOX_CMD_RC_SUCCESS;
   939			return;
   940		}
   941	
   942		pos = &feat_out->ents[0];
   943		out_count = feat_out_size;
   944		for (int i = 0, u = 0; i < cxl_mbox->num_features; i++) {
   945			struct cxl_feature *feat = &cxl_mbox->entries[i];
   946	
   947			if (feat->exclusive)
   948				continue;
   949	
   950			if (u < start) {
   951				u++;
   952				continue;
   953			}
   954	
   955			memcpy(pos, &feat->entry, feat_ent_size);
   956			out_count += feat_ent_size;
   957			pos++;
   958			u++;
   959	
   960			if (u == count)
   961				break;
   962	
   963			/* Make sure it does not go over total output buffer size */
   964			if (out_count + feat_ent_size >= mbox_cmd->size_out)
   965				break;
   966		}
   967	
 > 968		feat_out->num_entries = cpu_to_le16(u);
   969		mbox_cmd->size_out = out_count;
   970		mbox_cmd->return_code = CXL_MBOX_CMD_RC_SUCCESS;
   971	}
   972	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
