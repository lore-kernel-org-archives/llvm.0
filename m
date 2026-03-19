Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628D33D333A;
	Thu, 19 Mar 2026 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936844; cv=none; b=e3Kc4eFZxEeMcX4I5ngvZ7vpnpP5nH5QIiu3uXibVUTVGEPAEqYv5JNDBiAuPR5Z+hccq3/RjjLxCKviqLV01FAcmTN6DHowgesWmO96fQlCHEFCUVsHK3W360DLJC+wdE6/3/i67lxZqoROYkve2zUZq8xbzFyaa1HH1KKfaYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936844; c=relaxed/simple;
	bh=ELh+z6Qiq5LXjCIK9pOxC42aaf6+LaZ/XtxLtDT53WM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=plf3eO6cuy7bDQH5CKlFmilFeVDMNajGIiJgQNj/5mdcp235uTMzThfP6F325+VAeZEZwLJ5s0O/6qoCXhHxm7F4QDNFC1zThOmT5jnBOLtB8Xd3N3Ye7DkpvPCBaIp1v8aar9bi1Flf5i6g1Oxz3FjbXeqXHjeerDFxf/oIOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXEZ5Aaa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXEZ5Aaa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773936841; x=1805472841;
  h=date:from:to:cc:subject:message-id;
  bh=ELh+z6Qiq5LXjCIK9pOxC42aaf6+LaZ/XtxLtDT53WM=;
  b=HXEZ5AaaF6IB8+ixIMCysCuyA3y6tkV3/BvwDcZYMMYJudZz0QanbraE
   ZlYp8xZwuWdaLvn08fV5Rf+SfhT+SezhfEl5lPYyhLmb/sBrwlYvgv6Uz
   OlSqqGjKbz7Oklk+PFc8Ci8Tg0ZP6QeCc+xuWlmYtk//vX7QanOXXRdae
   ynv13agmakQxOutsNEiEj+9jQ2UKMpKp0q6vyg8/9FDAJ4Psvggso8q97
   IFKKHcA8c195BkTrJFC5li03IoGQl2+jyreeS+CQMRP8fBXuq/pEf4MH7
   JLlNjiU/1u/EFiYqUQJ7yoID2oYLKXcdNZf8GJiYnWqeLAxA/8iItEGzl
   w==;
X-CSE-ConnectionGUID: LTzn4TxCRZ2qm3N4ybKgdg==
X-CSE-MsgGUID: Arnj3h/hTFau5z0/b0xj2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74901714"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74901714"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 09:14:00 -0700
X-CSE-ConnectionGUID: dGkVihwxQI6DnYvwgjRKeQ==
X-CSE-MsgGUID: h8l2qSjeSgiW0qt6rGcDDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="222990633"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 Mar 2026 09:13:57 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Fzb-000000001HE-25sN;
	Thu, 19 Mar 2026 16:13:23 +0000
Date: Fri, 20 Mar 2026 00:08:51 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Francois Dugast <francois.dugast@intel.com>,
 Balbir Singh <balbirs@nvidia.com>
Subject: [linux-next:master 5190/7246] ld.lld: error: call to
 __compiletime_assert_777 marked "dontcall-error": BUILD_BUG failed
Message-ID: <202603200014.NEvpT1oW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
commit: 139ab31aea8a9436460568d556b432bb7e9311f7 [5190/7246] drm/pagemap: Correct cpages calculation for migrate_vma_setup
config: x86_64-randconfig-074-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200014.NEvpT1oW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200014.NEvpT1oW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200014.NEvpT1oW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_777 marked "dontcall-error": BUILD_BUG failed

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
