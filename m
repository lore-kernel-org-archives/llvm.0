Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522F19C569;
	Thu,  6 Feb 2025 18:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865340; cv=none; b=tOlPNfNwEkjh9n7o3I8YBCG/LmUjn4EfAMSCgw+9DZKdE5MuehFaBeL0zczDnZZhJvk+N2LmuSKGrmn2oi0luFP/zjf41va8q5qXj7axf06FekNNwZYAS0r1fftjlo1MqyDLnkIi9mJI01l457aYO9iGAQn+Hm/XjS8BOnn5m+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865340; c=relaxed/simple;
	bh=77jDhv+zUV7K3XVuwBmYvCAV2AyXjLFls7VqLI/2GVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AGBe2nagQ8U+NRVDp/1vht0WVotgIKA+4onUs8UH+YYTVQRanfoqDQ0P/7FvqZuzn9bVnHcdXi9WLLhe+5QHTigKGS/6Z9z0Dds6qzwrTpOEdQSJ7sSmaRE6YZ9JoQcGIt4kx6eiwkINOFVzckFDddGudmJYzvWTpOMnj7VgZyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L14SSZvE; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L14SSZvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865338; x=1770401338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=77jDhv+zUV7K3XVuwBmYvCAV2AyXjLFls7VqLI/2GVU=;
  b=L14SSZvEhTTv2BNnjJx2CE2+ttqNTwlC4bL5EGIhS3x1q2m/ybWXrjiQ
   2lUyD++rFsvwfztkLGOf5lBc0C8pqqiC0+SnTDS4ICK4STJWdzS+bEneb
   KlRcmLNVuka1q5l1nO6N8Uh4AKvu3S1/rhpRpkZ18q4s6ZAhoUDW43MzH
   U3gVRcebPSKvecsNcqxV8Ga30JmaRRhWbGsdvqK9w7lRyKS3kjjTuJy+F
   lbNxE0UTKpS8JnSy9fgTvxBvovHoydG9JfTTy0VVgJVS3Pxsu4fmaEauu
   JbRPkczVDWm+IWUyV+td1OsLgnFtVuxSo3WGIOIzYqWejc36iLwDrhAMY
   g==;
X-CSE-ConnectionGUID: jI/nb0HsRl64asFtAVKlyQ==
X-CSE-MsgGUID: F2qSToiMQAaMzeVuUaDy4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50470783"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="50470783"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:08:58 -0800
X-CSE-ConnectionGUID: Xo5l4RucQo69c3FBnvTo/w==
X-CSE-MsgGUID: Y/ijbQ18TvG8CmlFa9bTYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="111814394"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Feb 2025 10:08:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tg6J4-000xB9-0A;
	Thu, 06 Feb 2025 18:08:54 +0000
Date: Fri, 7 Feb 2025 02:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20250203 16/16]
 drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:71:10: error:
 offsetof of incomplete type 'struct
 mlx5_ifc_menu_resource_dump_response_bits'
Message-ID: <202502070257.jcD8sqxT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20250203
head:   c8a61127eedf61fcbf8d3f34301d29a782b9eeb0
commit: c8a61127eedf61fcbf8d3f34301d29a782b9eeb0 [16/16] net/mlx5: Avoid a couple hundred -Wflex-array-member-not-at-end warnings
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250207/202502070257.jcD8sqxT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502070257.jcD8sqxT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502070257.jcD8sqxT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:4:
   In file included from drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.h:7:
   In file included from include/linux/mlx5/rsc_dump.h:4:
   In file included from include/linux/mlx5/driver.h:38:
   In file included from include/linux/pci.h:1660:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
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
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:71:10: error: offsetof of incomplete type 'struct mlx5_ifc_menu_resource_dump_response_bits'
      71 |                 menu = MLX5_ADDR_OF(menu_resource_dump_response, data, menu);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:71:57: note: expanded from macro 'MLX5_ADDR_OF'
      71 | #define MLX5_ADDR_OF(typ, p, fld) ((void *)((u8 *)(p) + MLX5_BYTE_OFF(typ, fld)))
         |                                                         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:70:34: note: expanded from macro 'MLX5_BYTE_OFF'
      70 | #define MLX5_BYTE_OFF(typ, fld) (__mlx5_bit_off(typ, fld) / 8)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:71:10: note: forward declaration of 'struct mlx5_ifc_menu_resource_dump_response_bits'
   include/linux/mlx5/device.h:71:57: note: expanded from macro 'MLX5_ADDR_OF'
      71 | #define MLX5_ADDR_OF(typ, p, fld) ((void *)((u8 *)(p) + MLX5_BYTE_OFF(typ, fld)))
         |                                                         ^
   include/linux/mlx5/device.h:70:34: note: expanded from macro 'MLX5_BYTE_OFF'
      70 | #define MLX5_BYTE_OFF(typ, fld) (__mlx5_bit_off(typ, fld) / 8)
         |                                  ^
   include/linux/mlx5/device.h:52:51: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                                   ^
   <scratch space>:87:1: note: expanded from here
      87 | mlx5_ifc_menu_resource_dump_response_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: error: offsetof of incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      73 |                                                           num_of_records);
         |                                                           ~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:96:62: note: expanded from macro 'MLX5_GET'
      96 | #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
         |                                                              ^
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         | ~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:54:34: note: expanded from macro '\
   __mlx5_dw_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   include/uapi/linux/byteorder/little_endian.h:41:59: note: expanded from macro '__be32_to_cpu'
      41 | #define __be32_to_cpu(x) __swab32((__force __u32)(__be32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: note: forward declaration of 'struct mlx5_ifc_resource_dump_menu_segment_bits'
   include/linux/mlx5/device.h:96:62: note: expanded from macro 'MLX5_GET'
      96 | #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
         |                                                              ^
   include/linux/mlx5/device.h:54:34: note: expanded from macro '\
   __mlx5_dw_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^
   include/linux/mlx5/device.h:52:51: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                                   ^
   <scratch space>:89:1: note: expanded from here
      89 | mlx5_ifc_resource_dump_menu_segment_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: error: incomplete definition of type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      73 |                                                           num_of_records);
         |                                                           ~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: expanded from macro 'MLX5_GET'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:57:43: note: expanded from macro '__mlx5_dw_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:51:57: note: expanded from macro '__mlx5_bit_sz'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                        ~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: note: forward declaration of 'struct mlx5_ifc_resource_dump_menu_segment_bits'
   include/linux/mlx5/device.h:96:62: note: expanded from macro 'MLX5_GET'
      96 | #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
         |                                                              ^
   include/linux/mlx5/device.h:54:34: note: expanded from macro '\
   __mlx5_dw_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^
   include/linux/mlx5/device.h:52:51: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                                   ^
   <scratch space>:89:1: note: expanded from here
      89 | mlx5_ifc_resource_dump_menu_segment_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: error: offsetof of incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      73 |                                                           num_of_records);
         |                                                           ~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:30: note: expanded from macro 'MLX5_GET'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:57:70: note: expanded from macro '__mlx5_dw_bit_off'
      57 | #define __mlx5_dw_bit_off(typ, fld) (32 - __mlx5_bit_sz(typ, fld) - (__mlx5_bit_off(typ, fld) & 0x1f))
         |                                                                      ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:52:35: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                   ^        ~~~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: note: forward declaration of 'struct mlx5_ifc_resource_dump_menu_segment_bits'
   include/linux/mlx5/device.h:96:62: note: expanded from macro 'MLX5_GET'
      96 | #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
         |                                                              ^
   include/linux/mlx5/device.h:54:34: note: expanded from macro '\
   __mlx5_dw_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^
   include/linux/mlx5/device.h:52:51: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                                   ^
   <scratch space>:89:1: note: expanded from here
      89 | mlx5_ifc_resource_dump_menu_segment_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: error: incomplete definition of type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      73 |                                                           num_of_records);
         |                                                           ~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:97:61: note: expanded from macro 'MLX5_GET'
      97 | __mlx5_dw_off(typ, fld))) >> __mlx5_dw_bit_off(typ, fld)) & \
         |                                                             ^
      98 | __mlx5_mask(typ, fld))
         | ~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:58:47: note: expanded from macro '\
   __mlx5_mask'
      58 | #define __mlx5_mask(typ, fld) ((u32)((1ull << __mlx5_bit_sz(typ, fld)) - 1))
         |                                               ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:51:57: note: expanded from macro '__mlx5_bit_sz'
      51 | #define __mlx5_bit_sz(typ, fld) sizeof(__mlx5_nullp(typ)->fld)
         |                                        ~~~~~~~~~~~~~~~~~^
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: note: forward declaration of 'struct mlx5_ifc_resource_dump_menu_segment_bits'
   include/linux/mlx5/device.h:96:62: note: expanded from macro 'MLX5_GET'
      96 | #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
         |                                                              ^
   include/linux/mlx5/device.h:54:34: note: expanded from macro '\
   __mlx5_dw_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^
   include/linux/mlx5/device.h:52:51: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                                   ^
   <scratch space>:89:1: note: expanded from here
      89 | mlx5_ifc_resource_dump_menu_segment_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: error: invalid application of 'sizeof' to an incomplete type 'struct mlx5_ifc_resource_dump_info_segment_bits'
      74 |                 size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:54:41: note: expanded from macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      54 | #define MLX5_RSC_DUMP_MENU_HEADER_SIZE (MLX5_ST_SZ_BYTES(resource_dump_info_segment) + \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:65:32: note: expanded from macro 'MLX5_ST_SZ_BYTES'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: note: forward declaration of 'struct mlx5_ifc_resource_dump_info_segment_bits'
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:54:41: note: expanded from macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      54 | #define MLX5_RSC_DUMP_MENU_HEADER_SIZE (MLX5_ST_SZ_BYTES(resource_dump_info_segment) + \
         |                                         ^
   include/linux/mlx5/device.h:65:46: note: expanded from macro 'MLX5_ST_SZ_BYTES'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                              ^
   <scratch space>:97:1: note: expanded from here
      97 | mlx5_ifc_resource_dump_info_segment_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: error: invalid application of 'sizeof' to an incomplete type 'struct mlx5_ifc_resource_dump_command_segment_bits'
      74 |                 size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:55:6: note: expanded from macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      55 |                                         MLX5_ST_SZ_BYTES(resource_dump_command_segment) + \
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:65:32: note: expanded from macro 'MLX5_ST_SZ_BYTES'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: note: forward declaration of 'struct mlx5_ifc_resource_dump_command_segment_bits'
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:55:6: note: expanded from macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      55 |                                         MLX5_ST_SZ_BYTES(resource_dump_command_segment) + \
         |                                         ^
   include/linux/mlx5/device.h:65:46: note: expanded from macro 'MLX5_ST_SZ_BYTES'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                              ^
   <scratch space>:99:1: note: expanded from here
      99 | mlx5_ifc_resource_dump_command_segment_bits
         | ^
>> drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:74:10: error: invalid application of 'sizeof' to an incomplete type 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      74 |                 size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:56:6: note: expanded from macro 'MLX5_RSC_DUMP_MENU_HEADER_SIZE'
      56 |                                         MLX5_ST_SZ_BYTES(resource_dump_menu_segment))
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:65:32: note: expanded from macro 'MLX5_ST_SZ_BYTES'
      65 | #define MLX5_ST_SZ_BYTES(typ) (sizeof(struct mlx5_ifc_##typ##_bits) / 8)
         |                                ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c:72:36: note: forward declaration of 'struct mlx5_ifc_resource_dump_menu_segment_bits'
      72 |                 rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
         |                                                  ^
   include/linux/mlx5/device.h:96:62: note: expanded from macro 'MLX5_GET'
      96 | #define MLX5_GET(typ, p, fld) ((be32_to_cpu(*((__be32 *)(p) +\
         |                                                              ^
   include/linux/mlx5/device.h:54:34: note: expanded from macro '\
   __mlx5_dw_off'
      54 | #define __mlx5_dw_off(typ, fld) (__mlx5_bit_off(typ, fld) / 32)
         |                                  ^
   include/linux/mlx5/device.h:52:51: note: expanded from macro '__mlx5_bit_off'
      52 | #define __mlx5_bit_off(typ, fld) (offsetof(struct mlx5_ifc_##typ##_bits, fld))
         |                                                   ^
   <scratch space>:89:1: note: expanded from here
      89 | mlx5_ifc_resource_dump_menu_segment_bits
         | ^
   3 warnings and 8 errors generated.


vim +71 drivers/net/ethernet/mellanox/mlx5/core/diag/rsc_dump.c

12206b17235aed Aya Levin 2020-02-11  53  
7ba2d9d8de9669 Aya Levin 2022-03-03  54  #define MLX5_RSC_DUMP_MENU_HEADER_SIZE (MLX5_ST_SZ_BYTES(resource_dump_info_segment) + \
7ba2d9d8de9669 Aya Levin 2022-03-03  55  					MLX5_ST_SZ_BYTES(resource_dump_command_segment) + \
7ba2d9d8de9669 Aya Levin 2022-03-03  56  					MLX5_ST_SZ_BYTES(resource_dump_menu_segment))
7ba2d9d8de9669 Aya Levin 2022-03-03  57  
7ba2d9d8de9669 Aya Levin 2022-03-03  58  static int mlx5_rsc_dump_read_menu_sgmt(struct mlx5_rsc_dump *rsc_dump, struct page *page,
7ba2d9d8de9669 Aya Levin 2022-03-03  59  					int read_size, int start_idx)
12206b17235aed Aya Levin 2020-02-11  60  {
12206b17235aed Aya Levin 2020-02-11  61  	void *data = page_address(page);
12206b17235aed Aya Levin 2020-02-11  62  	enum mlx5_sgmt_type sgmt_idx;
12206b17235aed Aya Levin 2020-02-11  63  	int num_of_items;
12206b17235aed Aya Levin 2020-02-11  64  	char *sgmt_name;
12206b17235aed Aya Levin 2020-02-11  65  	void *member;
7ba2d9d8de9669 Aya Levin 2022-03-03  66  	int size = 0;
12206b17235aed Aya Levin 2020-02-11  67  	void *menu;
12206b17235aed Aya Levin 2020-02-11  68  	int i;
12206b17235aed Aya Levin 2020-02-11  69  
7ba2d9d8de9669 Aya Levin 2022-03-03  70  	if (!start_idx) {
12206b17235aed Aya Levin 2020-02-11 @71  		menu = MLX5_ADDR_OF(menu_resource_dump_response, data, menu);
7ba2d9d8de9669 Aya Levin 2022-03-03 @72  		rsc_dump->number_of_menu_items = MLX5_GET(resource_dump_menu_segment, menu,
7ba2d9d8de9669 Aya Levin 2022-03-03  73  							  num_of_records);
7ba2d9d8de9669 Aya Levin 2022-03-03 @74  		size = MLX5_RSC_DUMP_MENU_HEADER_SIZE;
7ba2d9d8de9669 Aya Levin 2022-03-03  75  		data += size;
7ba2d9d8de9669 Aya Levin 2022-03-03  76  	}
7ba2d9d8de9669 Aya Levin 2022-03-03  77  	num_of_items = rsc_dump->number_of_menu_items;
7ba2d9d8de9669 Aya Levin 2022-03-03  78  
7ba2d9d8de9669 Aya Levin 2022-03-03  79  	for (i = 0; start_idx + i < num_of_items; i++) {
7ba2d9d8de9669 Aya Levin 2022-03-03  80  		size += MLX5_ST_SZ_BYTES(resource_dump_menu_record);
7ba2d9d8de9669 Aya Levin 2022-03-03  81  		if (size >= read_size)
7ba2d9d8de9669 Aya Levin 2022-03-03  82  			return start_idx + i;
12206b17235aed Aya Levin 2020-02-11  83  
7ba2d9d8de9669 Aya Levin 2022-03-03  84  		member = data + MLX5_ST_SZ_BYTES(resource_dump_menu_record) * i;
12206b17235aed Aya Levin 2020-02-11  85  		sgmt_name =  MLX5_ADDR_OF(resource_dump_menu_record, member, segment_name);
12206b17235aed Aya Levin 2020-02-11  86  		sgmt_idx = mlx5_rsc_dump_sgmt_get_by_name(sgmt_name);
12206b17235aed Aya Levin 2020-02-11  87  		if (sgmt_idx == -EINVAL)
12206b17235aed Aya Levin 2020-02-11  88  			continue;
12206b17235aed Aya Levin 2020-02-11  89  		rsc_dump->fw_segment_type[sgmt_idx] = MLX5_GET(resource_dump_menu_record,
12206b17235aed Aya Levin 2020-02-11  90  							       member, segment_type);
12206b17235aed Aya Levin 2020-02-11  91  	}
7ba2d9d8de9669 Aya Levin 2022-03-03  92  	return 0;
12206b17235aed Aya Levin 2020-02-11  93  }
12206b17235aed Aya Levin 2020-02-11  94  

:::::: The code at line 71 was first introduced by commit
:::::: 12206b17235aed1ca6390b3e516825ae276f8345 net/mlx5: Add support for resource dump

:::::: TO: Aya Levin <ayal@mellanox.com>
:::::: CC: Saeed Mahameed <saeedm@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
