Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3838F22F388;
	Thu,  4 Jun 2026 04:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780546127; cv=none; b=KX0kxQtYBYmqu7ZQz9vNdolmH8z4EKfynvEoLyxKi9HK4uc30AZ5Ng7/hMeN2+BDn2pYn6t/OL+i1rS1eB6P35XcbuRA4jmLA9Jc6g9JlMp1g6WgJnTOHUEJFDyfwsPbqIiYvda0b8b3iMG9hfx/WcDr6amAQUaPkOXFTQnYUzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780546127; c=relaxed/simple;
	bh=hGtcF0y+cfmYVG4YwlbpfwMzY3HVoQu1YfO6blO1Wx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mi4STLrYWfsvZwUj23JJ/jPlbhRnCMX0Hxrk7aqgKMDwv216l1w39h55both25hyYVHk+J/WGL/r7Ik9mLBG6GU6INvceRqCGt9+zV/LokSSefjbGRUifzXmzhNvs8k1AWZmzNHjysPP1Jmg08CP3L4l2tXqFzBaG+9srF91EBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACEBPL3W; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACEBPL3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780546124; x=1812082124;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hGtcF0y+cfmYVG4YwlbpfwMzY3HVoQu1YfO6blO1Wx0=;
  b=ACEBPL3W0pYInds0wIMvtaQy1dzykk1E/tH9SUEx2TPbl9dPqcsnNxoU
   s4jS8t6ZlhQhCy2tFTtwHeaPJjJyu/KnhylhcZYuZYDyAjynM16RFsyqr
   ud3OTz2HURU9R08djOP8/6iNpbKqIp8VbfROrQVVh2b5XoOHr1ji6KfXF
   TjxOtEPiyXBuP45nM38nPL5mezwgxLLsXSEdlEI8/5VCUNmURFSxOwcP1
   4yVNW6mxgNDdkBNKEmctwHcKHvHJjm5+464cFKHGSYuMXifnkyt9LoJqA
   1gQwISBaRdM6GJckNFC4HySgbcjHVxx0I/Xxh6SRk8a+0yk6ttoL+t5a2
   g==;
X-CSE-ConnectionGUID: 2J1P4nf/Tb+S4lScXYtVWw==
X-CSE-MsgGUID: mYVafj+JR6aO6mtK7ohXHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="68904915"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="68904915"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 21:08:43 -0700
X-CSE-ConnectionGUID: 8pshppGETTaKV5TLpuwjPg==
X-CSE-MsgGUID: qOosf5puTkmZ0b/Ijqyfyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="239957723"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jun 2026 21:08:41 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUzNm-00000000EGI-3vUI;
	Thu, 04 Jun 2026 04:08:38 +0000
Date: Thu, 04 Jun 2026 12:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Violet Monti <violet.monti@intel.com>
Subject: [drm-xe:drm-xe-next 1/4]
 drivers/gpu/drm/xe/xe_hw_engine.c:361:6: error: initializer element is not a
 compile-time constant
Message-ID: <202606041255.dGo9lFkh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
head:   b7fb55cc3364ca128cfff9d50649ffd4327cd01e
commit: 5ff004fdc7377905f2fe5264b8829d35e14608b8 [1/4] drm/xe/rtp: Add stru=
ct types for RTP tables
config: s390-randconfig-002-20260604 (https://download.01.org/0day-ci/archi=
ve/20260604/202606041255.dGo9lFkh-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260604/202606041255.dGo9lFkh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041255.dGo9lFkh-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_hw_engine.c:361:6: error: initializer element is n=
ot a compile-time constant
     361 |                                  blit_cctl_val,
         |                                  ^~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_rtp.h:461:41: note: expanded from macro 'XE_RTP_AC=
TIONS'
     461 |                 XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS_=
_))     \
         |                                                       ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_rtp_helpers.h:56:108: note: expanded from macro 'X=
E_RTP_PASTE_FOREACH'
      56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCA=
T(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
         |                                                                 =
                                           ^~~~~
   drivers/gpu/drm/xe/xe_rtp_helpers.h:57:80: note: expanded from macro 'XE=
_RTP_PASTE_1'
      57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(pref=
ix_, FIRST_ARG args_)
         |                                                                 =
               ^~~~~
   note: (skipping 11 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:204:39: note: expanded from macro '__is_array'
     204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                                ^
   include/linux/compiler_types.h:610:63: note: expanded from macro '__same=
_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                               ^
   include/linux/compiler.h:200:84: note: expanded from macro '__BUILD_BUG_=
ON_ZERO_MSG'
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct=
 {_Static_assert(!(e), msg);}))
         |                                                                 =
                   ^
   drivers/gpu/drm/xe/xe_hw_engine.c:416:9: error: initializer element is n=
ot a compile-time constant
     416 |                                            ring_cmd_cctl_val,
         |                                            ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_rtp.h:461:41: note: expanded from macro 'XE_RTP_AC=
TIONS'
     461 |                 XE_RTP_PASTE_FOREACH(ACTION_, COMMA, (__VA_ARGS_=
_))     \
         |                                                       ^~~~~~~~~~~
   drivers/gpu/drm/xe/xe_rtp_helpers.h:56:108: note: expanded from macro 'X=
E_RTP_PASTE_FOREACH'
      56 | #define XE_RTP_PASTE_FOREACH(prefix_, sep_, args_) _XE_RTP_CONCA=
T(PASTE_, COUNT_ARGS args_)(prefix_, sep_, args_)
         |                                                                 =
                                           ^~~~~
   drivers/gpu/drm/xe/xe_rtp_helpers.h:57:80: note: expanded from macro 'XE=
_RTP_PASTE_1'
      57 | #define XE_RTP_PASTE_1(prefix_, sep_, args_) _XE_RTP_CONCAT(pref=
ix_, FIRST_ARG args_)
         |                                                                 =
               ^~~~~
   note: (skipping 11 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler.h:204:39: note: expanded from macro '__is_array'
     204 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                                ^
   include/linux/compiler_types.h:610:63: note: expanded from macro '__same=
_type'
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a)=
, typeof(b))
         |                                                               ^
   include/linux/compiler.h:200:84: note: expanded from macro '__BUILD_BUG_=
ON_ZERO_MSG'
     200 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...) ((int)sizeof(struct=
 {_Static_assert(!(e), msg);}))
         |                                                                 =
                   ^
   2 errors generated.


vim +361 drivers/gpu/drm/xe/xe_hw_engine.c

ddb5bade29de7a Nirmoy Das            2024-01-04  339 =20
94069111b86201 Gustavo Sousa         2026-05-14  340  static void
94069111b86201 Gustavo Sousa         2026-05-14  341  hw_engine_setup_defau=
lt_lrc_state(struct xe_hw_engine *hwe)
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  342  {
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  343  	struct xe_gt *g=
t =3D hwe->gt;
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  344  	const u8 mocs_w=
rite_idx =3D gt->mocs.uc_index;
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  345  	const u8 mocs_r=
ead_idx =3D gt->mocs.uc_index;
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  346  	u32 blit_cctl_v=
al =3D REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write_idx) |
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  347  			    REG_FIELD=
_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
72906d340b60f3 Lucas De Marchi       2023-05-26  348  	struct xe_rtp_proces=
s_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
5ff004fdc73779 Gustavo Sousa         2026-06-01  349  	const struct xe_rtp_=
table_sr lrc_setup =3D XE_RTP_TABLE_SR(
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  350  		/*
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  351  		 * Some blitte=
r commands do not have a field for MOCS, those
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  352  		 * commands wi=
ll use MOCS index pointed by BLIT_CCTL.
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  353  		 * BLIT_CCTL r=
egisters are needed to be programmed to un-cached.
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  354  		 */
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  355  		{ XE_RTP_NAME(=
"BLIT_CCTL_default_MOCS"),
cdf9781025b3ed Matt Roper            2026-04-24  356  		  XE_RTP_RULES(GRAP=
HICS_VERSION_RANGE(1200, 1274),
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  357  			       ENGINE=
_CLASS(COPY)),
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  358  		  XE_RTP_ACTIO=
NS(FIELD_SET(BLIT_CCTL(0),
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  359  				 BLIT_CCTL_D=
ST_MOCS_MASK |
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  360  				 BLIT_CCTL_S=
RC_MOCS_MASK,
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14 @361  				 blit_cctl_v=
al,
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  362  				 XE_RTP_ACTI=
ON_FLAG(ENGINE_BASE)))
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  363  		},
ddb5bade29de7a Nirmoy Das            2024-01-04  364  		/* Disable WMTP if =
HW doesn't support it */
ddb5bade29de7a Nirmoy Das            2024-01-04  365  		{ XE_RTP_NAME("DISA=
BLE_WMTP_ON_UNSUPPORTED_HW"),
ddb5bade29de7a Nirmoy Das            2024-01-04  366  		  XE_RTP_RULES(FUNC=
(xe_rtp_cfeg_wmtp_disabled)),
ddb5bade29de7a Nirmoy Das            2024-01-04  367  		  XE_RTP_ACTIONS(FI=
ELD_SET(CS_CHICKEN1(0),
ddb5bade29de7a Nirmoy Das            2024-01-04  368  					   PREEMPT_GPGPU=
_LEVEL_MASK,
ddb5bade29de7a Nirmoy Das            2024-01-04  369  					   PREEMPT_GPGPU=
_THREAD_GROUP_LEVEL)),
ddb5bade29de7a Nirmoy Das            2024-01-04  370  		  XE_RTP_ENTRY_FLAG=
(FOREACH_ENGINE)
ddb5bade29de7a Nirmoy Das            2024-01-04  371  		},
5ff004fdc73779 Gustavo Sousa         2026-06-01  372  	);
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  373 =20
5ff004fdc73779 Gustavo Sousa         2026-06-01  374  	xe_rtp_process_to_sr=
(&ctx, &lrc_setup, &hwe->reg_lrc, true);
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  375  }
bb95a4f9f5c2e9 Jos=C3=A9 Roberto de Souza 2023-04-14  376 =20

:::::: The code at line 361 was first introduced by commit
:::::: bb95a4f9f5c2e9b0a43590958ba1430519592909 drm/xe: Set default MOCS va=
lue for copy cs instructions

:::::: TO: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
