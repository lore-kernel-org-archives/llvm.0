Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794721111;
	b=MTJy6gpK+f4A55qOtFpOdAhKrtfsCvRSu3rEyYUuOh1HTlW0VIAbKk6u39rsAMCZyW9F
	 BbXFfArMn7ijoy7YcYI7EIP+FKfJQ7rRY+l1DRrjzqyDMIUER4cERv9zqMmJS8S7XMd9H
	 4/sEix0gWXUMsnBGCCNWbbL0V6RX56ab38aakrwBEj/1fZXQvXlXcHeSHt0hxMGeSo7So
	 7V8AmaE7aNEkqOFrU889aJ1QxbWJe0Fs1hwMf8KuGrV6yzGtQGbCiiRsK5Mjy2HQ+zpmg
	 8MQiem6VqddB0y+qpSVdhak1A09spr/cK//PQ9BSGNmyELw00jbsQw4cMkbitHN96Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794721111;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=iBc/N0te4uGl1upWmaerJ5EnmDnwWxf3GzS/WZ3t1BI=;
	b=3Xr5bD/Uf8BorDs8f90ZLbj3Fbm7EP65/3t0/MYmfNunizB89V3pztQ7pWEIv+rt7HtO
	 Zb8fYT2unEKjW1yh5VbYxatKWf0facMZvV2PTVGUH2u3CQp+kQGJ8JyXgQ5YlMzerQM8S
	 twPtQkBmPDIjw44Qwjsn77Bm3R0/gYe+OojhRWPaHBJytTTV2Nd4XG3/LFGfF7ZWnZ1sQ
	 Ac+7GH0Eq50p/aGgO/nAFxVk+5hbQRZB+RM22/5k5Pzep43kmoiAcxMUwv6Gemptn3HHf
	 UUid/mHxKFWtbfW+m4apZw7652IMK1S61Ig7wmXCXpcyaRAc/W6B66sB4qbnb1uq0fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnL4uGc8;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C59606A32C;
	Sun, 15 Nov 2026 05:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C59606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UnL4uGc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794721110; x=1826257110;
  h=date:from:to:cc:subject:message-id;
  bh=cN8VRjbFGf7EDKbHsGvoUKpkYVRXccny+OAbNUhv03E=;
  b=UnL4uGc8T9IQe0lMhd/nMLBiuOOSM+1F65fIyVWNDxZYtY419w0z1M0j
   slXjY4X57VwR3S+K0qrMhVflKyyk6H4adgG/bj7dcaUFQ6FzN8nMbzJ5X
   7YRQH5AwG0CWORfUPRVzwX2v8Z/iA2ziLg8CR1DGRShh+X3a7+HiDXhzK
   agVgXe4GUSS2LuaWQUgijdiwDHBC2ZuwoNAoM9We/3HfVThPIPtY7w9i1
   6jiXPFnp2M+bBtn/4Ecs8gw9+0MvKXcBlhdZNK1535NOeMOBk0mjJJjtg
   qX4KbFBnn7ckjRlTx6s2/Y1bwNtWhD+r636D1IZxOWQArgt1cWYr/yKS7
   Q==;
X-CSE-ConnectionGUID: YIMc1WN6Q9CDwmwS81i6vg==
X-CSE-MsgGUID: ZiJrjmiZTTycwSLzTgxj/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3514526"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3514526"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 21:38:29 -0800
X-CSE-ConnectionGUID: QmOuLtEtRyKr486EYTWzxw==
X-CSE-MsgGUID: c7Udr9iVQgegiML2BVCUEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="11043415"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 14 Nov 2026 21:38:28 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSSwb-000000016RA-1YT4;
	Sun, 15 Nov 2026 05:38:25 +0000
Date: Sun, 15 Nov 2026 13:37:48 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 26/68]
 drivers/attestation/core/ctlv.c:525:5: warning: stack frame size (1312)
 exceeds limit (1280) in 'ctlv_attestation_mr_log_get_query'
Message-ID: <202611151346.rHqtau4i-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 16f591ff3ae9d9236ce15a997eeaa3e037bde4a0 [26/68] attestation: Add the measurement register journal
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261115/202611151346.rHqtau4i-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5dabc01bba1df10de6fb3c32fcf9db4aafe78f38)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151346.rHqtau4i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611151346.rHqtau4i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/attestation/core/ctlv.c:525:5: warning: stack frame size (1312) exceeds limit (1280) in 'ctlv_attestation_mr_log_get_query' [-Wframe-larger-than]
     525 | int ctlv_attestation_mr_log_get_query(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
         |     ^
   1 warning generated.


vim +/ctlv_attestation_mr_log_get_query +525 drivers/attestation/core/ctlv.c

   524	
 > 525	int ctlv_attestation_mr_log_get_query(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
