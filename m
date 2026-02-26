Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44CD39E6C1;
	Thu, 26 Feb 2026 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098205; cv=none; b=mskn+gta1WD4m07csmfrRf3BCIWqRKs6XZZYbStQCy9iR8bRZx15krvqToMxNYQ0c6B3IGFFVcwdjaSmFhHbZj0lw+R1PBebHH8YZ2m2cJkJ14VLGswGK+n0Tu40exEaedF81nzfcHv/IxRpj2YxByzvYerDXx0hlwG/bYG+N9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098205; c=relaxed/simple;
	bh=I1THosSkpmGZ0plKIi8mZWCZ66qmrtA125jucNQpsPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qNawG5e2XHycEpFmWGphyQT5Lp/6J3XTjDBG2rEjpcVs9LAA/MJ76VOlleRvzLaj2fnv1OBbeX0xAlQjeavGQc1SGkQJvTOozet3GuSammrCYzuipsNSS7f+jXYMJuQJgnMMgxnYHkG5BEVDeA86Thj+SBE6k3helJ0KUrjeLxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H9aB8jVG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H9aB8jVG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772098204; x=1803634204;
  h=date:from:to:cc:subject:message-id;
  bh=I1THosSkpmGZ0plKIi8mZWCZ66qmrtA125jucNQpsPU=;
  b=H9aB8jVGqfTpewWWqkLFXnoGfvPeru923fOr9/O2fJtKsyslUmOFaXhO
   s7j0TAEUpT4T1O5tD1QQNaBnyFr1SJXGCRdCcYg/1HsguuPQgPltUg+w8
   mf1HMXShO6yjESfSxRmSmSjK+11of26o1jaAS+/HKG/a3xXqNU+v4YTRP
   O7G1LQIDa4vyDL5Sy5HOXa98JHSGVnnret25VzkyxHHg/Yj+sfDKOQTFY
   p3yrJbqC7Cf9xFszIXRChjkImnin6ei7/jOaB2fQK9XJ2cLVCn77yhAVU
   ijulk/kajcQNgtY10twmj/jIm1H26r0IM9S/ZGTsJ3oGjcngNJHtwkvDT
   A==;
X-CSE-ConnectionGUID: qfjkiUPiQ5SKNqN2FB3leg==
X-CSE-MsgGUID: HES8MQLITxO0gtEFJQM6Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72365326"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72365326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 01:30:03 -0800
X-CSE-ConnectionGUID: YDM2amGET66hEJoUVfjTqQ==
X-CSE-MsgGUID: eYow2xhXTj2l2HbpGrAwGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="219849739"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2026 01:30:01 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvXh0-000000008n3-3N7i;
	Thu, 26 Feb 2026 09:29:58 +0000
Date: Thu, 26 Feb 2026 17:26:42 +0800
From: kernel test robot <lkp@intel.com>
To: YiPeng Chai <YiPeng.Chai@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Jinzhou Su <jinzhou.su@amd.com>
Subject: [agd5f:drm-next 80/95]
 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:522:2: error: static assertion
 failed due to requirement 'sizeof(struct amdsriov_ras_telemetry) <= 64 <<
 10': amdsriov_ras_telemetry must be 64 KB
Message-ID: <202602261700.rVOLIw4l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   9973e64bd6ee7642860a6f3b6958cbf14e89cabd
commit: cb48a6b2b61d7ebf2f1099041067800ffd8a5c2d [80/95] drm/amd/ras: use dedicated memory as vf ras command buffer
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260226/202602261700.rVOLIw4l-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261700.rVOLIw4l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261700.rVOLIw4l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:44:
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:86:
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h:27:
>> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:522:2: error: static assertion failed due to requirement 'sizeof(struct amdsriov_ras_telemetry) <= 64 << 10': amdsriov_ras_telemetry must be 64 KB
     522 |         sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:522:40: note: expression evaluates to '115616 <= 65536'
     522 |         sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:28:
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu.h:86:
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_virt.h:27:
>> drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:522:2: error: static assertion failed due to requirement 'sizeof(struct amdsriov_ras_telemetry) <= 64 << 10': amdsriov_ras_telemetry must be 64 KB
     522 |         sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:522:40: note: expression evaluates to '115616 <= 65536'
     522 |         sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_display.c:49:
   In file included from include/drm/drm_vblank.h:30:
   include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:12: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                          ^~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:135:23: warning: division by zero is undefined [-Wdivision-by-zero]
     135 |                 M(HUP) | M(RDHUP) | M(MSG);
         |                                     ^~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   4 warnings and 1 error generated.
--
   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/arcturus_ppt.c:27:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:86:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu_virt.h:27:
>> drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:522:2: error: static assertion failed due to requirement 'sizeof(struct amdsriov_ras_telemetry) <= 64 << 10': amdsriov_ras_telemetry must be 64 KB
     522 |         sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgv_sriovmsg.h:522:40: note: expression evaluates to '115616 <= 65536'
     522 |         sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +522 drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h

   506	
   507	_Static_assert(
   508		sizeof(struct amd_sriov_msg_vf2pf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
   509		"amd_sriov_msg_vf2pf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
   510	
   511	_Static_assert(
   512		sizeof(struct amd_sriov_msg_pf2vf_info) == AMD_SRIOV_MSG_SIZE_KB << 10,
   513		"amd_sriov_msg_pf2vf_info must be " stringification(AMD_SRIOV_MSG_SIZE_KB) " KB");
   514	
   515	_Static_assert(AMD_SRIOV_MSG_RESERVE_UCODE % 4 == 0,
   516		       "AMD_SRIOV_MSG_RESERVE_UCODE must be multiple of 4");
   517	
   518	_Static_assert(AMD_SRIOV_MSG_RESERVE_UCODE > AMD_SRIOV_UCODE_ID__MAX,
   519		       "AMD_SRIOV_MSG_RESERVE_UCODE must be bigger than AMD_SRIOV_UCODE_ID__MAX");
   520	
   521	_Static_assert(
 > 522		sizeof(struct amdsriov_ras_telemetry) <= AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1 << 10,
   523	"amdsriov_ras_telemetry must be " stringification(AMD_SRIOV_MSG_RAS_TELEMETRY_SIZE_KB_V1) " KB");
   524	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
