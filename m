Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E93368AE;
	Thu,  5 Mar 2026 02:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772677048; cv=none; b=Y173zNRUpKwwLhRZBCZIZy/CAGhp+45507kKLrw7bgwT9GiYL+cmJmq9OwQNEqvZFvuIL5wDVxX5Q8xpt5KeOa+SeRMxy4VEiOPu37D6PZwmGy9qBD01b5K9dR70JIa68IFbZzxugAHMxH0GcV+RyJ0v1dOrDgT2+3OAbYoE3vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772677048; c=relaxed/simple;
	bh=zZ8A2r2iPohKMdCHLqu2qyEtBml6tLz0/thgm0qkTpk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EGtFYjZOPh/8uKhfj8F0TBYbGiBZ6q8EsYT0wTkYOpracnA/K3NizRmOjhC3ofqteYfka27LuycBmsoHZhLTvpiA3y7AVqsPO6YQlVHm+NF3tDP3cu5k+3kk5TWYRoVFZojgXiB3I+Q3mKcfEjcl9zH/NxfS0DFaMDszMfZ+SXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDdU9ORe; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDdU9ORe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772677046; x=1804213046;
  h=date:from:to:cc:subject:message-id;
  bh=zZ8A2r2iPohKMdCHLqu2qyEtBml6tLz0/thgm0qkTpk=;
  b=iDdU9OReRsYkodLw8g6hZqSQkAIye4k5QKi93k/5E+hb96std0Yw5MVw
   GhcfQb5m0HSE+7yr8Bv6QiRxgrWHzJKRZdsG+2/Xz2aQAFBaNfuBhmHXP
   0VExCkJ5T6f7yYVY2dNbunrQx9IdQZVaUIwMVH+3+I55Vj7uC6eXFk1DS
   /vBuOpFdfdjW13gDjusdXYvL2l7NOkd5rrk93MSNKC09nNiueR+nbY1oH
   KJnffX+VJeAiUJHLEE/a0IJUynKSDR86M395zDVo7mDOE/rFaQVGleuxY
   W6OY85006UHWaRVH6ty6wICCUUC/z6MoratrdY5mkXdYR/mFJ2LE4oojG
   g==;
X-CSE-ConnectionGUID: UApt6XRkQ6eJcCNg+XQ14Q==
X-CSE-MsgGUID: rzO1YXt7QuaI4LAFwukqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73822726"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73822726"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 18:17:25 -0800
X-CSE-ConnectionGUID: kCdJC8dIRKq2+a8Ai7UZVg==
X-CSE-MsgGUID: jrxQLOmBSm+VkR0xBhrAxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="218650368"
Received: from lkp-server01.sh.intel.com (HELO 732d64e62a3e) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Mar 2026 18:17:23 -0800
Received: from kbuild by 732d64e62a3e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxyHA-0000000001x-1lPE;
	Thu, 05 Mar 2026 02:17:20 +0000
Date: Thu, 05 Mar 2026 10:17:06 +0800
From: kernel test robot <lkp@intel.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:hotplug_vmemmap 14/14] WARNING: modpost:
 vmlinux: section mismatch in reference: vmemmap_alloc_block+0xc3 (section:
 .text) -> memmap_alloc (section: .init.text)
Message-ID: <202603051050.K6a0rLiX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/davidhildenbrand/linux hotplug_vmemmap
head:   477d3b2da9f8d7d098328023598f9403fba2d478
commit: 477d3b2da9f8d7d098328023598f9403fba2d478 [14/14] mm/sparse-vmemmap: inline __earlyonly_bootmem_alloc()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260305/202603051050.K6a0rLiX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603051050.K6a0rLiX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603051050.K6a0rLiX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: vmemmap_alloc_block+0xc3 (section: .text) -> memmap_alloc (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
