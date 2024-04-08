Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BC413CFAF;
	Mon,  8 Apr 2024 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712587210; cv=none; b=L0Y3aS8foXL/yG7m6zCbCWkkJtHkTjjw+nKMmT1Roe83pBlc9wneoM0Ldq18JZDaZIAIQZOVC50afAqQlIX1bhkPHRUGQ3VKJB5gxgbByuoOfXV/7Rx9zeN8xdbgR3UtO2byKuNuakSJYyHhgCvGFlULWF5gHvqCl39wlcfOIbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712587210; c=relaxed/simple;
	bh=DvMhF1yslH5IyHI9GHM4NYFXx1uLE/M5uoaL8R8aVGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lvHTB364l6iIkySo7ERkBO/2414eEESlBhPw1Rd2OA9eiJE8glQbJrXSTsZxSZn3vw7Updh84Ntkuy7HS/k93uGlkon0JU3zr8dvPvmjga9QK/25yuhHpw50b1uLqEHQqS4jjts2buOi2iLeVus7q8UtIpfU2/dzv6/y5jLyTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUztnqor; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUztnqor"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712587207; x=1744123207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DvMhF1yslH5IyHI9GHM4NYFXx1uLE/M5uoaL8R8aVGQ=;
  b=XUztnqortzLFnGWy+iMGU4n3vOsRSAmDY9AtgES/9dkm5J+uLfhm/bIR
   J3pnrMVxB1AJYr9rJALs3vriuI0NnsDp6lKWM9HRprs94IFUFiLoYduYU
   wiIRGKxYzNf403KfYcD+qDbiiGeHZviFmTjCnkiZJmeQQQ6XoN9bi1grw
   zRiBYpfYkudM/zIezb5fAQKFB30kkqGJcmZDHCQx0QqopOjp07SZp9F6m
   QRCwKeTPlFNUOXM5FSZgb6wQekztScadu031dyhdeaGOXvyC/g1Per+r+
   92ZYJFpoTDoIIoEKtUpd/06yc1hYY2SY7VTJoT8NvfJTg+7QVk/khodeR
   w==;
X-CSE-ConnectionGUID: pYB55CHvQQqYhtufVYmDsQ==
X-CSE-MsgGUID: cMBs2+MtQpmrlivLPwEUlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25314329"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25314329"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 07:40:07 -0700
X-CSE-ConnectionGUID: 61MtbTnET6CCTUv+ySN76g==
X-CSE-MsgGUID: RG/f7RQOQAq6QJJdUE7BCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24647236"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Apr 2024 07:40:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtqAF-0005Gg-1x;
	Mon, 08 Apr 2024 14:40:03 +0000
Date: Mon, 8 Apr 2024 22:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [alobakin:idpf-libie-new 56/74] include/net/xdp_sock_drv.h:411:1:
 error: incomplete result type 'struct xdp_desc_info' in function definition
Message-ID: <202404082206.yUW7TdGt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alobakin/linux idpf-libie-new
head:   7ffc46cff5837ead6684e7960ca6d511ab2fdf26
commit: 1688bdb026668aac13f19cc613b42bfe575ca569 [56/74] xsk: add helper to get &xdp_desc's DMA and meta pointer in one go
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240408/202404082206.yUW7TdGt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 73ddb2a7471986a7ed600dbea14efc60f0d0db47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240408/202404082206.yUW7TdGt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404082206.yUW7TdGt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/filter.c:21:
   In file included from include/linux/bpf_verifier.h:7:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/filter.c:86:
>> include/net/xdp_sock_drv.h:411:1: error: incomplete result type 'struct xdp_desc_info' in function definition
     411 | xsk_buff_raw_get_info(const struct xsk_buff_pool *pool, u64 addr)
         | ^
   include/net/xdp_sock_drv.h:410:22: note: forward declaration of 'struct xdp_desc_info'
     410 | static inline struct xdp_desc_info
         |                      ^
>> include/net/xdp_sock_drv.h:413:9: error: variable has incomplete type 'struct xdp_desc_info'
     413 |         return (struct xdp_desc_info){ };
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/xdp_sock_drv.h:410:22: note: forward declaration of 'struct xdp_desc_info'
     410 | static inline struct xdp_desc_info
         |                      ^
   net/core/filter.c:1726:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1726 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:2042:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2042 |         .arg1_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:2044:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2044 |         .arg3_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:2583:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    2583 |         .arg2_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:4602:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4602 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4616:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4616 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4816:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4816 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:4844:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    4844 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5016:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5016 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5030:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5030 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5079:45: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5079 |         .arg1_type      = ARG_PTR_TO_BTF_ID_SOCK_COMMON | PTR_MAYBE_NULL,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   net/core/filter.c:5487:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5487 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5521:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5521 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5555:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5555 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5589:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5589 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:5764:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    5764 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6401:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6401 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6411:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6411 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6789:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6789 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6808:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6808 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6827:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6827 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6851:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6851 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6875:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6875 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6899:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6899 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6916:45: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6916 |         .arg1_type      = ARG_PTR_TO_BTF_ID_SOCK_COMMON | OBJ_RELEASE,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   net/core/filter.c:6937:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6937 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6961:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6961 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:6985:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    6985 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:7005:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7005 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:7024:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7024 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:7043:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7043 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   net/core/filter.c:7361:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    7361 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
--
   In file included from net/core/xdp.c:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from net/core/xdp.c:23:
>> include/net/xdp_sock_drv.h:411:1: error: incomplete result type 'struct xdp_desc_info' in function definition
     411 | xsk_buff_raw_get_info(const struct xsk_buff_pool *pool, u64 addr)
         | ^
   include/net/xdp_sock_drv.h:410:22: note: forward declaration of 'struct xdp_desc_info'
     410 | static inline struct xdp_desc_info
         |                      ^
>> include/net/xdp_sock_drv.h:413:9: error: variable has incomplete type 'struct xdp_desc_info'
     413 |         return (struct xdp_desc_info){ };
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/xdp_sock_drv.h:410:22: note: forward declaration of 'struct xdp_desc_info'
     410 | static inline struct xdp_desc_info
         |                      ^
   1 warning and 2 errors generated.


vim +411 include/net/xdp_sock_drv.h

   409	
   410	static inline struct xdp_desc_info
 > 411	xsk_buff_raw_get_info(const struct xsk_buff_pool *pool, u64 addr)
   412	{
 > 413		return (struct xdp_desc_info){ };
   414	}
   415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
