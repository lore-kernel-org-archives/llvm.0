Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F112980DE;
	Thu, 22 May 2025 15:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747928284; cv=none; b=NaU5GvlRZaOMnIP2Vkd5ZcxEDlrlYXShFIvSRvYdmNz5NwGgfRUN7IxBHChSj3uem+x/a488wpKiauIjsS0m1BjtzvqlqJ0oxsLeHMIfDggoYJRtnglbh9mF4YW9BGTUrcHU9v2BymxpvlSsV7W7MuhXV1zahwfCX0n5V98JfIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747928284; c=relaxed/simple;
	bh=S621Dd+wr4Q2NWYBBd+CkxpvXkKDFgCtDP7LK4zZ/mo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EMwVm9UjabzpTrtFF9LS55IZt7gyLFHcMUz4IbAjCanldrAEL7zQyvTwPNQumuGHz5U58/aDYmzRgF5ENZgzZ3YL7QbBdywMoea+d7KaGH3g1Ubz+oXjYB+mpa9ozwmsAVe+cbwQznGQ290bzsdQS2LJJZo9QelOs1nxfJ9MxFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eWos/Ppt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eWos/Ppt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747928282; x=1779464282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S621Dd+wr4Q2NWYBBd+CkxpvXkKDFgCtDP7LK4zZ/mo=;
  b=eWos/PptIPrszc6JYyUlEJXzPTeMm14g6EpmWL0GSfybdzvEZ3OLT6oF
   TljJ9Xd32rt5Kn9ZBnW5Tzd5EK68ZTXqxZbYGNNum/rSehB4Vcry/mWwQ
   mZe+eAWfS3qTzYVuzIy+gVUwSgrlqV/xXA/t2D7z+wq6Z+wNU43BdTIaY
   0Nn5yPG1Uu8+/48hoDsPgyGPDfx1DK1A5die4dsPi9dfWklCrAMgV0DE5
   hq92npaoTo8o/CPhE2nldrA6FLQxVQyF2dHrTBBFWjoGtDBCPmQujikMT
   RWS4w6Nuh6So5RWcjVU/fPGjTpzy7t32oScshEPcU3TmkgQvzS5KxQLHK
   A==;
X-CSE-ConnectionGUID: vOnSjEevR1SSWzqWwEa0Jg==
X-CSE-MsgGUID: 8pK5oB8bQtazIE5Ymcw65Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75359790"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75359790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 08:38:00 -0700
X-CSE-ConnectionGUID: vyfXKFA7Ria51LEhMExPIw==
X-CSE-MsgGUID: rrXEpUCTTeutGVDgYtphkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145894494"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 May 2025 08:37:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI7zZ-000PT4-0W;
	Thu, 22 May 2025 15:37:57 +0000
Date: Thu, 22 May 2025 23:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:sink 112/113] ERROR: modpost: "amd_iommu_fake_irte"
 [arch/x86/kvm/kvm-amd.ko] undefined!
Message-ID: <202505222334.WATkycSU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux sink
head:   d880620c1db25612ee353604c1863b32e5010863
commit: 568b7572008b4b50f437eb8a6ac44842cdfd5b9a [112/113] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: x86_64-buildonly-randconfig-001-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222334.WATkycSU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505222334.WATkycSU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222334.WATkycSU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "amd_iommu_fake_irte" [arch/x86/kvm/kvm-amd.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
