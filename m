Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C2A28C874;
	Fri,  9 Jan 2026 13:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767964260; cv=none; b=WpO0R2jcv1AEdqBFl81/IP93UrQwGsInMKuN4v2ku0V5TF052Xcsm5LO3GjmCDajqCWQQRPlTpwcAlkv3tFA+pBUle4b/34/zztA+LCCRrC/+u+ZnyRjqnOYc1KDpoVoNqQ3wwcJCeP5wAz4xJJ8+lwEn0JAjXGvSbPrbpdrv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767964260; c=relaxed/simple;
	bh=IVgoWbN08ZTEqqOJKs7rdTX+7uSlkdgwUugd4Fr9sXE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pYriM4VlcnAtj/k6Tgye/sDxX7LjmeP8e9l/OmZjz7Nsn5Dqik6DTUrCxS5b2kwKdE1hJH58JYVg+HXOb0FgneFSQlWjCrUYUoUTSZdTbKZGiNAF44+lBZBPgYgw0HK0MXObwbTJJpFX7eCIZVQXD9vv2+FGr4yMkjmsgRu2Iq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6S/pt1f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6S/pt1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767964258; x=1799500258;
  h=date:from:to:cc:subject:message-id;
  bh=IVgoWbN08ZTEqqOJKs7rdTX+7uSlkdgwUugd4Fr9sXE=;
  b=H6S/pt1fF5IGMQt3AV5byXIiPMAoCcgger9VtnZU4g9MDMbFDQWUIp7P
   leydspUX640JKkmynTR5KC45QaICU9ycL0TMB7WHCrrGtVn0ZvsQCDTH0
   2xKZJQLw7vLj6dhSEhc1xeD5oFIsbDZeuXgqM0H6N3eidOlTf6fIDRQDI
   HQLEqON928O+AfASA5FbaH9ce78ffFYSDMKHrMBYWnJyzyRZ+dsjKaKVP
   foUk5a4rYVT3nssSPcMTeZWgyq37vKo27DreLWBYa8UGSwJB7i0Qpdc1w
   oRsmozIZCZS1PnzumCHUT2QjIKtK/fwap7OerqbOCPA0/jgR3X9teVmph
   A==;
X-CSE-ConnectionGUID: Y9F4ee6BT7O9Y5mlaXWOOA==
X-CSE-MsgGUID: SsKioAZOQ+GqK50h2iORLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94815989"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="94815989"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 05:10:58 -0800
X-CSE-ConnectionGUID: Gm6tHD11Treo+AXheOLLGA==
X-CSE-MsgGUID: o8Oe59NIR1+e3Xib43BQhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="234663975"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Jan 2026 05:10:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veCGU-000000007EB-1HGz;
	Fri, 09 Jan 2026 13:10:54 +0000
Date: Fri, 09 Jan 2026 21:10:03 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v7 4/8] Warning:
 kernel/cgroup/cpuset.c:4487 expecting prototype for cpuset_nodes_allowed().
 Prototype was for cpuset_sysram_nodes_allowed() instead
Message-ID: <202601092159.ZH8Q35b4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v7
head:   354a292e4159ea3350cbb9653e8a16b0e34d04df
commit: 8e120b8da3a1fe6cd7d3321c333cba6b21d09601 [4/8] cpuset: introduce cpuset.mems.sysram
config: s390-randconfig-002-20260109 (https://download.01.org/0day-ci/archive/20260109/202601092159.ZH8Q35b4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601092159.ZH8Q35b4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601092159.ZH8Q35b4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/cgroup/cpuset.c:4487 expecting prototype for cpuset_nodes_allowed(). Prototype was for cpuset_sysram_nodes_allowed() instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
