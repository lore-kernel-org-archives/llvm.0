Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DE538E8D2;
	Sun, 24 May 2026 08:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779611227; cv=none; b=ChDo5KNnpSyGIJzBIxa/ocdJem09f1zElsJfmcKvSVIyXNEuad54eO57jIKMrAYAAI3FZrP+t71H3Cr7JlKUe+kGcbOlAxvswL9lesoFiALzXUoUrTDKn1NF/2yaZC4SLWLbKw6s6jMFwb4IQ+k8LrP5aGBaKYGX19M6l+OdZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779611227; c=relaxed/simple;
	bh=X3UIgAgbkYuu0dKgMQTl+MfRhWvhGJWNGTNYNF3VZqM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bC3xn29BNi2YRRRGX7P8nSpgv7q8f7E7Ah1Ns/bX1OXQHrVTXKy3ycHty9K7HSY8nFqGfLRI0/JR/j2/Vwy2YIEwyhKWfEW13x04F/dRug++n/Pg1YfTQriOPHLc5cV4TgzKg1vIssgL89svVlel6xyuroZ6JUi4iwlXDUd8O2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npdJtL0O; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npdJtL0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779611226; x=1811147226;
  h=date:from:to:cc:subject:message-id;
  bh=X3UIgAgbkYuu0dKgMQTl+MfRhWvhGJWNGTNYNF3VZqM=;
  b=npdJtL0OKyGmhgrDHe31gNCPrkKTu+Tq8S/jjMwKVq3vRcktfeAiU2TU
   2qTFP2tAxmhcsqiYMxVSty631Qyh79Z75ldr6NC4H0Rq6L5lbbXBK1RcF
   varzCMjRLilxNnvwW014TuFgIDxgq0MJfvpMP0HGFsHwGI1MwccZv6bvD
   LYcTEZTz/fxoIE0oR/fZse7UgQW6iTZ/oFWNQbAtuY+DMx0WTQWMG+GQg
   UghenTYdjXO2bBtBdywxg1JUAU+OJG5fdy2Z6gaB7l1zaLU/2ezmRoy1A
   eP6/5UsDdxnQ/7wA/4aLMtXdLTJpUEJug4PF+OXeONTOj06n7CwIyPZnd
   g==;
X-CSE-ConnectionGUID: psJ0UOO4RfizSZ4LjjennQ==
X-CSE-MsgGUID: OFSje/D7R8Sp7V2uDVP8zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91859875"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91859875"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2026 01:27:04 -0700
X-CSE-ConnectionGUID: YNm0RbDrRDyQyPLteaAelQ==
X-CSE-MsgGUID: hPMFnO+kTQeqT4mKWQHtqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="238750126"
Received: from lkp-server01.sh.intel.com (HELO faed47fea055) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 May 2026 01:27:02 -0700
Received: from kbuild by faed47fea055 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wR4Al-0000000003J-3NB4;
	Sun, 24 May 2026 08:26:59 +0000
Date: Sun, 24 May 2026 16:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Gustavo Sousa <gustavo.sousa@intel.com>
Subject: ld.lld: error: undefined symbol:
 xe_configfs_primary_gt_allowed
Message-ID: <202605241659.hy0SxJCR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Matt,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4cbfe4502e3d4bda48eb4b83dfad8d7da3b22e90
commit: 7abd69278bb53ab6b43f9650daba550cc7624858 drm/xe/configfs: Add attribute to disable GT types
date:   7 months ago
config: x86_64-randconfig-016-20260519 (https://download.01.org/0day-ci/archive/20260524/202605241659.hy0SxJCR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241659.hy0SxJCR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7abd69278bb5 ("drm/xe/configfs: Add attribute to disable GT types")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241659.hy0SxJCR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: xe_configfs_primary_gt_allowed
   >>> referenced by xe_pci.c:700 (drivers/gpu/drm/xe/xe_pci.c:700)
   >>>               vmlinux.o:(xe_info_init)
--
>> ld.lld: error: undefined symbol: xe_configfs_media_gt_allowed
   >>> referenced by xe_pci.c:730 (drivers/gpu/drm/xe/xe_pci.c:730)
   >>>               vmlinux.o:(xe_info_init)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
