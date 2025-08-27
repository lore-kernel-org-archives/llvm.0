Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D7B220F37;
	Wed, 27 Aug 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756311609; cv=none; b=riF3ThvaXqJEqsLlspEi2grjEoOTmg7cDvj1K/gN+3aaiOGTGneezTCa6xBBqNEhxTXbQRlQnvQw4HGX/JL5vSHKo6yK3ZUm61ma9wvX750Or7kzAVXOixA7i3z83a5syM6L2JfUu3tjbrK44MwDmh0NQ68H+oG3IDOdvkA+zho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756311609; c=relaxed/simple;
	bh=kyk6kTq2qcFyp5bx0VIZv44pposRSgOMF9MPKN02490=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRUfl5+mL1b1tmgu55aB1sW9mptViprWbCTuVZcPDGH3GKSziaJk+kYapFEnd2hyHIxC4nrL+kTYw0PsxaimmMVZdcsxCxwFo4PFxQhdmG86WiV+iD8c6HAm+OQcs7tYRzxdrW9FyiIDecGv4Of+k9Erj5uGu/GxJ6LLuVkTQaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izYLA5U8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izYLA5U8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756311607; x=1787847607;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kyk6kTq2qcFyp5bx0VIZv44pposRSgOMF9MPKN02490=;
  b=izYLA5U8DhMfMoU/BOK95mbj+RXNFDyKavTC/+Ce6GQQ4Gyc+Tjp5pkP
   8jZUC70SA6PRR9gK29lejmMNUWlnCUiXIhI40kI7JXxA114yXDRUkaqA6
   03oBRsTuPocJKrXRA1Rvy6l323qYLJMpf4+nk+6otWeJWxS6K6Q/tuKXF
   IgwUVwMOWQammFKWGNqhGUK7Pp69dkjYzINuq2+7HZW3qmkqH1ssDObMf
   6bd/b7Qnu5rNftjPIUiVB0y8xJs/Gq3tL/V7Fgh5oa8SrGTfdM5lmiJa6
   AgBPCU+V1Qc9YsPnImvo+K/UMyHJ2JYQqCD5YRepGDkamhDmKqeln5Jp1
   A==;
X-CSE-ConnectionGUID: v71i86OcSkO5jkUj8CYXIw==
X-CSE-MsgGUID: A2J4clpsRlqVO0oza8VlXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="69938438"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69938438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2025 09:20:00 -0700
X-CSE-ConnectionGUID: 0cl/YjwWSnScDpHL3oSYtg==
X-CSE-MsgGUID: 9EUoQQhRSMy8O0si23VIZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="175180379"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 27 Aug 2025 09:19:58 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1urIsO-0002fb-1z;
	Wed, 27 Aug 2025 16:19:56 +0000
Date: Wed, 27 Aug 2025 18:18:58 +0200
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt_all 55/56]
 drivers/iommu/generic_pt/.kunitconfig_perf: warning: ignored by one of the
 .gitignore files
Message-ID: <202508271842.v7wXoklG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   451e6e58d3fc7e3c1eb9a6d5bfb5d5da4b088133
commit: 3670dde0678ed27cfbdd610ad61cc5791894176e [55/56] iommupt: Add kunit test to benchmark page table operations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250827/202508271842.v7wXoklG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250827/202508271842.v7wXoklG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508271842.v7wXoklG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/generic_pt/.kunitconfig_perf: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
