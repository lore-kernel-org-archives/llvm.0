Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11801AE01C;
	Sat,  8 Mar 2025 12:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741437227; cv=none; b=MhYWMHYB3KQTouvqMvT+7Qw/CVjzteMkzC52TtSpxSMv15CzcwJ51qbkCkwoDGCtx/5zGseDSed1+H8mPoq0MueXGE5r4+7y+DQtEwQL5wGVrrCM1Z6GAu3DqnCOkVkyhf9+ZD6c/nabTZOZ/6qCa4Sh9TuzePDACRMrbkDPncQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741437227; c=relaxed/simple;
	bh=nQODRthharD482MdMgBIwltZQbkGsgg48fSYm5FQw2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sfOYEXIPQFsbIgI2NdNMQrbL7UnZ53n0uhlXF537Z8vWsmd+HxYxb/x48jVoBi7GVtpie2LrVsKGGcJaeJnjeAphRhZAQcBj032nH+l6TtBMSGZJTCAjIIpgBgPTCUy9rLSGqu5wmcQ7kI0+f2CUzGjgEupF4luuKNDbLNwCFkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eCWT3xdh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eCWT3xdh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741437224; x=1772973224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nQODRthharD482MdMgBIwltZQbkGsgg48fSYm5FQw2g=;
  b=eCWT3xdhC+ktC9c6DSpvCg/XuXjFVhTjuhfq8OM9nMxnAtTL8I/FGjjU
   NEdVdeTooE8RX+8n1b97wBdo9CT32uqGnXcYxeoNcX1xAQZeNgNAPW+9c
   0GiX1xeLqtdvg4c/aDzFlSmkxzCJuAUpJtwPlnUxJRJusvBSTZ1MK2wQX
   cXvLeChuztFP0XF3nB5YYXOVNnzhM/6+Nd3xR+z9kRvGIqYypy6Z54bxt
   Amaizavny7RHvLu04MiSuAdYO9FaWHogr4SUQdFkpIA/T3gyGUxluTKGs
   A/FCIvwMknB+up7d4MuDTPG8bizeOHlfbv8URbItdf6upyare4LOmvNnY
   g==;
X-CSE-ConnectionGUID: C7QC6LWtSGin85TeMFrmSQ==
X-CSE-MsgGUID: NeHNfkmaTzK7abbLsK9Qrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42620462"
X-IronPort-AV: E=Sophos;i="6.14,232,1736841600"; 
   d="scan'208";a="42620462"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 04:33:43 -0800
X-CSE-ConnectionGUID: c6xZ00tqTLi5TDLFtyPD2Q==
X-CSE-MsgGUID: yBB6JiMzRrGSqUXWUrFXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150505927"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2025 04:33:42 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqtN6-0001sy-0p;
	Sat, 08 Mar 2025 12:33:40 +0000
Date: Sat, 8 Mar 2025 20:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH rdma-next v1 2/6] RDMA/mlx5: Create UCAP char devices for
 supported device capabilities
Message-ID: <202503082057.0xxskyFs-lkp@intel.com>
References: <30ed40e7a12a694cf4ee257459ed61b145b7837d.1741261611.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30ed40e7a12a694cf4ee257459ed61b145b7837d.1741261611.git.leon@kernel.org>

Hi Leon,

kernel test robot noticed the following build errors:

[auto build test ERROR on rdma/for-next]
[also build test ERROR on linus/master v6.14-rc5 next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Leon-Romanovsky/RDMA-uverbs-Introduce-UCAP-User-CAPabilities-API/20250306-195708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
patch link:    https://lore.kernel.org/r/30ed40e7a12a694cf4ee257459ed61b145b7837d.1741261611.git.leon%40kernel.org
patch subject: [PATCH rdma-next v1 2/6] RDMA/mlx5: Create UCAP char devices for supported device capabilities
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250308/202503082057.0xxskyFs-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503082057.0xxskyFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503082057.0xxskyFs-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/mlx5/main.c:4207:42: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL'; did you mean 'MLX5_UCTX_CAP_RAW_TX'?
    4207 |         if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                 MLX5_UCTX_CAP_RAW_TX
   include/linux/mlx5/mlx5_ifc.h:1571:2: note: 'MLX5_UCTX_CAP_RAW_TX' declared here
    1571 |         MLX5_UCTX_CAP_RAW_TX = 1UL << 0,
         |         ^
>> drivers/infiniband/hw/mlx5/main.c:4211:6: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA'; did you mean 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA'?
    4211 |             MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             RDMA_UCAP_MLX5_CTRL_OTHER_VHCA
   include/rdma/ib_ucaps.h:13:2: note: 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA' declared here
      13 |         RDMA_UCAP_MLX5_CTRL_OTHER_VHCA,
         |         ^
   drivers/infiniband/hw/mlx5/main.c:4219:42: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL'; did you mean 'MLX5_UCTX_CAP_RAW_TX'?
    4219 |         if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL) {
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                 MLX5_UCTX_CAP_RAW_TX
   include/linux/mlx5/mlx5_ifc.h:1571:2: note: 'MLX5_UCTX_CAP_RAW_TX' declared here
    1571 |         MLX5_UCTX_CAP_RAW_TX = 1UL << 0,
         |         ^
   drivers/infiniband/hw/mlx5/main.c:4226:6: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA'; did you mean 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA'?
    4226 |             MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             RDMA_UCAP_MLX5_CTRL_OTHER_VHCA
   include/rdma/ib_ucaps.h:13:2: note: 'RDMA_UCAP_MLX5_CTRL_OTHER_VHCA' declared here
      13 |         RDMA_UCAP_MLX5_CTRL_OTHER_VHCA,
         |         ^
   drivers/infiniband/hw/mlx5/main.c:4235:42: error: use of undeclared identifier 'MLX5_UCTX_CAP_RDMA_CTRL'; did you mean 'MLX5_UCTX_CAP_RAW_TX'?
    4235 |         if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                                                 MLX5_UCTX_CAP_RAW_TX
   include/linux/mlx5/mlx5_ifc.h:1571:2: note: 'MLX5_UCTX_CAP_RAW_TX' declared here
    1571 |         MLX5_UCTX_CAP_RAW_TX = 1UL << 0,
         |         ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:131:31: note: expanded from macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:25:12: note: expanded from macro '___constant_swab64'
      25 |         (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:26:12: note: expanded from macro '___constant_swab64'
      26 |         (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:27:12: note: expanded from macro '___constant_swab64'
      27 |         (((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:28:12: note: expanded from macro '___constant_swab64'
      28 |         (((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:29:12: note: expanded from macro '___constant_swab64'
      29 |         (((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:30:12: note: expanded from macro '___constant_swab64'
      30 |         (((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:31:12: note: expanded from macro '___constant_swab64'
      31 |         (((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |   \
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:32:12: note: expanded from macro '___constant_swab64'
      32 |         (((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4242:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4242 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:133:12: note: expanded from macro '__swab64'
     133 |         __fswab64(x))
         |                   ^
>> drivers/infiniband/hw/mlx5/main.c:4243:6: error: use of undeclared identifier 'MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL'; did you mean 'MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER'?
    4243 |             MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |             MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER
   include/linux/mlx5/mlx5_ifc.h:12493:2: note: 'MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER' declared here
    12493 |         MLX5_HCA_CAP_GENERAL_OBJECT_TYPES_SAMPLER = BIT_ULL(0x20),
          |         ^
   drivers/infiniband/hw/mlx5/main.c:4296:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4296 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                        ~~~~~~
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:131:31: note: expanded from macro '__swab64'
     131 |         (__u64)(__builtin_constant_p(x) ?       \
         |                                      ^
   drivers/infiniband/hw/mlx5/main.c:4296:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4296 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:25:12: note: expanded from macro '___constant_swab64'
      25 |         (((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |   \
         |                   ^
   drivers/infiniband/hw/mlx5/main.c:4296:6: error: no member named 'general_obj_types_127_64' in 'mlx5_ifc_cmd_hca_cap_2_bits'
    4296 |         if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
         |             ^                            ~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mlx5/device.h:1299:2: note: expanded from macro 'MLX5_CAP_GEN_2_64'
    1299 |         MLX5_GET64(cmd_hca_cap_2, mdev->caps.hca[MLX5_CAP_GENERAL_2]->cur, cap)
         |         ^                                                                  ~~~
   include/linux/mlx5/device.h:121:63: note: expanded from macro 'MLX5_GET64'
     121 | #define MLX5_GET64(typ, p, fld) be64_to_cpu(*((__be64 *)(p) + __mlx5_64_off(typ, fld)))
         |                                                               ^                  ~~~
   include/linux/mlx5/device.h:55:34: note: expanded from macro '__mlx5_64_off'
      55 | #define __mlx5_64_off(typ, fld) (__mlx5_bit_off(typ, fld) / 64)
         |                                  ^                   ~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/uapi/linux/byteorder/little_endian.h:39:59: note: expanded from macro '__be64_to_cpu'
      39 | #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
         |                                                           ^
   include/uapi/linux/swab.h:132:21: note: expanded from macro '__swab64'
     132 |         ___constant_swab64(x) :                 \
         |                            ^
   include/uapi/linux/swab.h:26:12: note: expanded from macro '___constant_swab64'
      26 |         (((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |   \
         |                   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +4207 drivers/infiniband/hw/mlx5/main.c

  4204	
  4205	static void mlx5_ib_cleanup_ucaps(struct mlx5_ib_dev *dev)
  4206	{
> 4207		if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL)
  4208			ib_remove_ucap(RDMA_UCAP_MLX5_CTRL_LOCAL);
  4209	
  4210		if (MLX5_CAP_GEN(dev->mdev, uctx_cap) &
> 4211		    MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA)
  4212			ib_remove_ucap(RDMA_UCAP_MLX5_CTRL_OTHER_VHCA);
  4213	}
  4214	
  4215	static int mlx5_ib_init_ucaps(struct mlx5_ib_dev *dev)
  4216	{
  4217		int ret;
  4218	
  4219		if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL) {
  4220			ret = ib_create_ucap(RDMA_UCAP_MLX5_CTRL_LOCAL);
  4221			if (ret)
  4222				return ret;
  4223		}
  4224	
  4225		if (MLX5_CAP_GEN(dev->mdev, uctx_cap) &
  4226		    MLX5_UCTX_CAP_RDMA_CTRL_OTHER_VHCA) {
  4227			ret = ib_create_ucap(RDMA_UCAP_MLX5_CTRL_OTHER_VHCA);
  4228			if (ret)
  4229				goto remove_local;
  4230		}
  4231	
  4232		return 0;
  4233	
  4234	remove_local:
  4235		if (MLX5_CAP_GEN(dev->mdev, uctx_cap) & MLX5_UCTX_CAP_RDMA_CTRL)
  4236			ib_remove_ucap(RDMA_UCAP_MLX5_CTRL_LOCAL);
  4237		return ret;
  4238	}
  4239	
  4240	static void mlx5_ib_stage_caps_cleanup(struct mlx5_ib_dev *dev)
  4241	{
> 4242		if (MLX5_CAP_GEN_2_64(dev->mdev, general_obj_types_127_64) &
> 4243		    MLX5_HCA_CAP_2_GENERAL_OBJECT_TYPES_RDMA_CTRL)
  4244			mlx5_ib_cleanup_ucaps(dev);
  4245	
  4246		bitmap_free(dev->var_table.bitmap);
  4247	}
  4248	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
