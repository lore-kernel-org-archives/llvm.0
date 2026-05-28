Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC4176238;
	Thu, 28 May 2026 15:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982161; cv=none; b=i/+URackb+DVEwWDomZ0EOFZ+K6HxpkMM+20U/P+HvaRMdQevtUCs9m2C7KuG6wY52qFQoivU2dl8iKPThkTbCTLhHOjXdPoWHdVaBsJwvch9pfGB2PMFxd39PGqS4y5Gm8B6n8txHzcZ/6FHO5uIKbc/GFTikYbYT1lL8tAuZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982161; c=relaxed/simple;
	bh=5kA2Au7z//leYylfBmiJi6Pxa8dpAPp025Zec2cefEI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rBvk6SP/S1v4jA9LNiwQVloa/RHj9MPgktrNZb9F7nWih3KQ4ME1tZYl9s/1PlkBgW+YGPkkrKTrfEIMeYzKj1t4lnac5u7iL/KYm5qh+hylozt1ARcANDKyIIzcKycNFxgLIWCPBv/U6atwnLANFDaHgAIAyL42N3Ur6lPebDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXPsHjxB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXPsHjxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779982161; x=1811518161;
  h=date:from:to:cc:subject:message-id;
  bh=5kA2Au7z//leYylfBmiJi6Pxa8dpAPp025Zec2cefEI=;
  b=MXPsHjxBsjyVln+bRee2qZwzo9NdK+z1pWhlOar0UyA8TVGtttPm6Myy
   CaYVQRMY+dilR5Sh4K97Q2TxrQy3ZuYezgxk+wrC6Pv3l3VPPZkWQfWr0
   k1YgoV5VqtryBPDXklT+jSsDW67XJ7Jj02LiLsDiz/U2e5gWZynIMGmj8
   Jpzy94WUxUCvkIXeN6yddStpxcyMebsvr6ZnJfRoB0jtuEIwSs3gZXMZx
   F886Ey9nHQ99kE3WfLqtiHZbv4nmMNkqpsFc5jiq4J+MRPBhGTDeLw0P+
   ZiVbwcTmSU4jcQiCtmS+ZMiPhx7aLcQvrbTsdjaYSHR/hqXxc+P1BO1Nn
   Q==;
X-CSE-ConnectionGUID: 7si4cZEEQLWQWDeKjEjPzA==
X-CSE-MsgGUID: LqLe6JIsS7+MC5DtsLSHkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80939922"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="80939922"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 08:29:20 -0700
X-CSE-ConnectionGUID: mBgCdB9vQqixzQSraNRdEg==
X-CSE-MsgGUID: T7BnWVHJTX6tg7u3v6Csrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
   d="scan'208";a="280691405"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 May 2026 08:29:19 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wScfc-000000000XF-3Bix;
	Thu, 28 May 2026 15:29:16 +0000
Date: Thu, 28 May 2026 17:28:51 +0200
From: kernel test robot <lkp@intel.com>
To: Li Chen <me@linux.beauty>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: fs/file.c:819 expecting prototype for
 sys_close_range(). Prototype was for do_close_range() instead
Message-ID: <202605281747.yadMYCxP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Li-Chen/exec-factor-argument-setup-out-of-do_execveat_common/20260528-180137
head:   2b6f0aa717fe21307563094c88a5b38825a40ed8
commit: 64909eca9a8dddc4347ee5d3861a9054b9694b59 file: expose helpers for in-kernel fd actions
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260528/202605281747.yadMYCxP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281747.yadMYCxP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605281747.yadMYCxP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/file.c:819 expecting prototype for sys_close_range(). Prototype was for do_close_range() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
