Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846D024219;
	Thu, 28 Mar 2024 02:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711592034; cv=none; b=FrEHPe4nMN8Xn0OsagotCd/yXpnh7CIOm3SSeolXVcxebZ0WgPG5JhHwPEfeJDune8I9/0ADzK3IjakRG8C9bfTLLbmw5/lfZd0/IQtyLPLKJVkLeKT+y3aKOeztMhNm5ws0YvC/HFHMtSZdtQf5bv8N8Fb6GIQdQISkKXLKgvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711592034; c=relaxed/simple;
	bh=tOzZCUqylV69FRE7bAvExCEF/6vagrJrShIHQgJKHaM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MF/yov8ZXMSvghbtvGGCiMIebxNgdlhNtA3t1TD0CgqXMD8KvH1NBVU3dg7tTs83TI9Kd2KAej5tJ6PgYDq9aVblz/1q3NCMZIJAUrQIbsEH5epIF7OoItkFZDJitRTL9oSTWHuFCyExt7RwTEH25ke6qrK4ub/dLAY/iI0xVoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkjFqshl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkjFqshl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711592031; x=1743128031;
  h=date:from:cc:subject:message-id:mime-version;
  bh=tOzZCUqylV69FRE7bAvExCEF/6vagrJrShIHQgJKHaM=;
  b=DkjFqshlbB+ve3syX2KeB2CU80X7PG97Xaq29CiFayrnHaXxxXfQOQbC
   n/CbtIVpxXWMxWGDqaHoBIY/viLMFrEIy3p7AyYHPEgo0Yl7ThWTCpCwv
   PHuuNX8nwd4bu6jOjUbFEt26izfjLi8LOPXswEtCeX4NLXBlg67MjQmsX
   tZAzJBpDm/RCdGSPJqKYZSAxBy1kZb3yqX/ntzNdbSkfoxUjDIw8S9ehQ
   JyfsMKwKUBQ0JSzbN9lmuFvjov6PRU4XIjzQyv8+pEp+RPXkvQD6Ts9cE
   cRlQ2pGp8e1FLPXORYVpPRtVbAjFKT1375veyHH1qU1orZfZJW2UmtyxR
   w==;
X-CSE-ConnectionGUID: 5hulo8wuSBqQ5HWfWdzW0A==
X-CSE-MsgGUID: V3C/2SESQZO3FFxWVcG+Dg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6842002"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6842002"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 19:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="16391976"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2024 19:13:49 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpfH0-0001ik-2m;
	Thu, 28 Mar 2024 02:13:46 +0000
Date: Thu, 28 Mar 2024 10:13:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [openeuler:OLK-6.6 3966/6925]
 drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:255:9: warning: arithmetic
 between different enumeration types ('enum hinic_node_id' and 'enum
 hinic_fault_err_level')
Message-ID: <202403281003.L0CYgKLz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: kernel@openeuler.org
TO: Zhou Shuai <zhoushuai28@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c8e916a3b26e752d8992dff4fa320353e1f0ec84
commit: 9c1c9598010fbb9daa1e2a67d23830092fb6246a [3966/6925] net/hinic: Update Huawei Intelligent Network Card Driver: hinic
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240328/202403281003.L0CYgKLz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403281003.L0CYgKLz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403281003.L0CYgKLz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:18:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:255:9: warning: arithmetic between different enumeration types ('enum hinic_node_id' and 'enum hinic_fault_err_level') [-Wenum-enum-conversion]
     255 |                HINIC_CHIP_FAULT_SIZE);
         |                ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.h:109:21: note: expanded from macro 'HINIC_CHIP_FAULT_SIZE'
     109 |         (HINIC_NODE_ID_MAX * FAULT_LEVEL_MAX * HINIC_CHIP_ERROR_TYPE_MAX)
         |          ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:524:52: note: expanded from macro 'memset'
     524 | #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
         |                                                    ^
   include/linux/fortify-string.h:514:35: note: expanded from macro '__fortify_memset_chk'
     514 |         size_t __fortify_size = (size_t)(size);                         \
         |                                          ^~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:263:29: warning: arithmetic between different enumeration types ('enum hinic_node_id' and 'enum hinic_fault_err_level') [-Wenum-enum-conversion]
     263 |         if (offset < 0 || offset > HINIC_CHIP_FAULT_SIZE) {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.h:109:21: note: expanded from macro 'HINIC_CHIP_FAULT_SIZE'
     109 |         (HINIC_NODE_ID_MAX * FAULT_LEVEL_MAX * HINIC_CHIP_ERROR_TYPE_MAX)
         |          ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:268:35: warning: arithmetic between different enumeration types ('enum hinic_node_id' and 'enum hinic_fault_err_level') [-Wenum-enum-conversion]
     268 |         if (offset + MAX_DRV_BUF_SIZE <= HINIC_CHIP_FAULT_SIZE)
         |                                          ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.h:109:21: note: expanded from macro 'HINIC_CHIP_FAULT_SIZE'
     109 |         (HINIC_NODE_ID_MAX * FAULT_LEVEL_MAX * HINIC_CHIP_ERROR_TYPE_MAX)
         |          ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c:275:10: warning: arithmetic between different enumeration types ('enum hinic_node_id' and 'enum hinic_fault_err_level') [-Wenum-enum-conversion]
     275 |                        HINIC_CHIP_FAULT_SIZE - offset);
         |                        ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.h:109:21: note: expanded from macro 'HINIC_CHIP_FAULT_SIZE'
     109 |         (HINIC_NODE_ID_MAX * FAULT_LEVEL_MAX * HINIC_CHIP_ERROR_TYPE_MAX)
         |          ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   include/linux/fortify-string.h:693:53: note: expanded from macro 'memcpy'
     693 | #define memcpy(p, q, s)  __fortify_memcpy_chk(p, q, s,                  \
         |                                                     ^
   include/linux/fortify-string.h:636:41: note: expanded from macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   9 warnings generated.
--
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1061:5: warning: no previous prototype for function 'hinic_msg_to_mgmt_no_ack' [-Wmissing-prototypes]
    1061 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1061:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1061 | int hinic_msg_to_mgmt_no_ack(void *hwdev, enum hinic_mod_type mod, u8 cmd,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1978:5: warning: no previous prototype for function 'comm_pf_mbox_handler' [-Wmissing-prototypes]
    1978 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:1978:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1978 | int comm_pf_mbox_handler(void *handle, u16 vf_id, u8 cmd, void *buf_in,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2749:5: warning: no previous prototype for function 'hinic_ppf_ht_gpa_init' [-Wmissing-prototypes]
    2749 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2749:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2749 | int hinic_ppf_ht_gpa_init(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2795:6: warning: no previous prototype for function 'hinic_ppf_ht_gpa_deinit' [-Wmissing-prototypes]
    2795 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2795:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2795 | void hinic_ppf_ht_gpa_deinit(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2872:5: warning: no previous prototype for function 'mqm_eqm_try_alloc_mem' [-Wmissing-prototypes]
    2872 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2872:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2872 | int mqm_eqm_try_alloc_mem(struct hinic_hwdev *hwdev, u32 page_size,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2909:5: warning: no previous prototype for function 'mqm_eqm_alloc_page_mem' [-Wmissing-prototypes]
    2909 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2909:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2909 | int mqm_eqm_alloc_page_mem(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2934:6: warning: no previous prototype for function 'mqm_eqm_free_page_mem' [-Wmissing-prototypes]
    2934 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2934:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2934 | void mqm_eqm_free_page_mem(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2950:5: warning: no previous prototype for function 'mqm_eqm_set_cfg_2_hw' [-Wmissing-prototypes]
    2950 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2950:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2950 | int mqm_eqm_set_cfg_2_hw(struct hinic_hwdev *hwdev, u32 valid)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2975:5: warning: no previous prototype for function 'mqm_eqm_set_page_2_hw' [-Wmissing-prototypes]
    2975 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:2975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2975 | int mqm_eqm_set_page_2_hw(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3053:5: warning: no previous prototype for function 'mqm_eqm_init' [-Wmissing-prototypes]
    3053 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3053:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3053 | int mqm_eqm_init(struct hinic_hwdev *hwdev)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3116:6: warning: no previous prototype for function 'mqm_eqm_deinit' [-Wmissing-prototypes]
    3116 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         |      ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3116:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    3116 | void mqm_eqm_deinit(struct hinic_hwdev *hwdev)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3397:13: warning: arithmetic between different enumeration types ('enum hinic_node_id' and 'enum hinic_fault_err_level') [-Wenum-enum-conversion]
    3397 |                 if (pos < HINIC_CHIP_FAULT_SIZE)
         |                           ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.h:109:21: note: expanded from macro 'HINIC_CHIP_FAULT_SIZE'
     109 |         (HINIC_NODE_ID_MAX * FAULT_LEVEL_MAX * HINIC_CHIP_ERROR_TYPE_MAX)
         |          ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3719:18: warning: address of array 'chip_node->rt_cmd' will always evaluate to 'true' [-Wpointer-bool-conversion]
    3719 |         if (!chip_node->rt_cmd)
         |             ~~~~~~~~~~~~^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:3748:18: warning: address of array 'chip_node->rt_cmd' will always evaluate to 'true' [-Wpointer-bool-conversion]
    3748 |         if (!chip_node->rt_cmd)
         |             ~~~~~~~~~~~~^~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4581:5: warning: no previous prototype for function '_set_led_status' [-Wmissing-prototypes]
    4581 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4581:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4581 | int _set_led_status(struct hinic_hwdev *hwdev, u8 port,
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4667:5: warning: no previous prototype for function 'hinic_get_phy_init_status' [-Wmissing-prototypes]
    4667 | int hinic_get_phy_init_status(void *hwdev,
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.c:4667:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4667 | int hinic_get_phy_init_status(void *hwdev,
         | ^
         | static 
   21 warnings generated.
--
   In file included from drivers/net/ethernet/huawei/hinic/hinic_cfg.c:21:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2193:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1142:5: warning: no previous prototype for function 'hinic_vector_to_irq' [-Wmissing-prototypes]
    1142 | int hinic_vector_to_irq(void *hwdev, enum hinic_service_type type, int vector)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1142 | int hinic_vector_to_irq(void *hwdev, enum hinic_service_type type, int vector)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1823:5: warning: no previous prototype for function 'cfg_set_func_sf_en' [-Wmissing-prototypes]
    1823 | int cfg_set_func_sf_en(void *hwdev, u32 enbits, u32 enmask)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1823:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1823 | int cfg_set_func_sf_en(void *hwdev, u32 enbits, u32 enmask)
         | ^
         | static 
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1866:5: warning: no previous prototype for function 'cfg_get_func_sf_en' [-Wmissing-prototypes]
    1866 | int cfg_get_func_sf_en(void *hwdev, u32 *enbits)
         |     ^
   drivers/net/ethernet/huawei/hinic/hinic_cfg.c:1866:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1866 | int cfg_get_func_sf_en(void *hwdev, u32 *enbits)
         | ^
         | static 
>> drivers/net/ethernet/huawei/hinic/hinic_cfg.c:2238:37: warning: arithmetic between different enumeration types ('enum hinic_node_id' and 'enum hinic_fault_err_level') [-Wenum-enum-conversion]
    2238 |                 hwdev->chip_fault_stats = vzalloc(HINIC_CHIP_FAULT_SIZE);
         |                                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic/hinic_hwdev.h:109:21: note: expanded from macro 'HINIC_CHIP_FAULT_SIZE'
     109 |         (HINIC_NODE_ID_MAX * FAULT_LEVEL_MAX * HINIC_CHIP_ERROR_TYPE_MAX)
         |          ~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
   9 warnings generated.
--
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'intr_reg_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'db_base_phy' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'db_base' not described in 'hinic_init_hwif'
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:581: warning: Function parameter or member 'dwqe_mapping' not described in 'hinic_init_hwif'
>> drivers/net/ethernet/huawei/hinic/hinic_hwif.c:717: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id from register,used by sriov hot migration process
   drivers/net/ethernet/huawei/hinic/hinic_hwif.c:802: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id, used by sriov hot migratition process.
--
>> drivers/net/ethernet/huawei/hinic/hinic_mgmt.c:939: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * api cmd write or read bypass defaut use poll, if want to use aeq interrupt,
--
>> drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:413: warning: expecting prototype for prepare_cell(). Prototype was for wait_for_resp_polling() instead
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1056: warning: Function parameter or member 'cmd_chain' not described in 'api_cmd_create_chain'
   drivers/net/ethernet/huawei/hinic/hinic_api_cmd.c:1056: warning: Excess function parameter 'chain' description in 'api_cmd_create_chain'
--
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Function parameter or member 'hwe_cb' not described in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:321: warning: Excess function parameter 'hw_cb' description in 'hinic_aeq_register_hw_cb'
   drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: Function parameter or member 'aeq_swe_cb' not described in 'hinic_aeq_register_swe_cb'
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:369: warning: expecting prototype for hinic_aeq_register_sw_cb(). Prototype was for hinic_aeq_register_swe_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:391: warning: expecting prototype for hinic_aeq_unregister_sw_cb(). Prototype was for hinic_aeq_unregister_swe_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_eqs.c:417: warning: expecting prototype for hinic_ceq_register_sw_cb(). Prototype was for hinic_ceq_register_cb() instead
--
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:373: warning: expecting prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for hinic_unregister_pf_mbox_cb() instead
>> drivers/net/ethernet/huawei/hinic/hinic_mbox.c:411: warning: expecting prototype for hinic_unregister_ppf_mbox_cb(). Prototype was for hinic_unregister_ppf_to_pf_mbox_cb() instead


vim +255 drivers/net/ethernet/huawei/hinic/hinic_nic_dbg.c

   243	
   244	u16 hinic_dbg_clear_hw_stats(void *hwdev, u32 *out_size)
   245	{
   246		if (*out_size != sizeof(struct hinic_hw_stats)) {
   247			pr_err("Unexpect out buf size from user :%d, expect: %lu\n",
   248			       *out_size, sizeof(struct hinic_hw_stats));
   249			return -EFAULT;
   250		}
   251	
   252		memset((void *)&((struct hinic_hwdev *)hwdev)->hw_stats, 0,
   253		       sizeof(struct hinic_hw_stats));
   254		memset((void *)((struct hinic_hwdev *)hwdev)->chip_fault_stats, 0,
 > 255		       HINIC_CHIP_FAULT_SIZE);
   256	
   257		return 0;
   258	}
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
