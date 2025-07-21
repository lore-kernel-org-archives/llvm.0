Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896423B61C;
	Mon, 21 Jul 2025 23:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753140953; cv=none; b=kHvXiuGYAXXZCsSq2R7RJ38DagTHl8mWyKZBtUkp1M80brmH8k2Wk/uDLJO7ZXIGcG2lTBLW2iey3nzCN3pPagyfHhj8/zpxBqpCqZoShbP7g0/p7aS0+K5qLJcf5MtvrKY5Y6apuRHpiZ+n3upyEXJZXvnmdOAUfSyT8w9wT6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753140953; c=relaxed/simple;
	bh=NW4Unwca7T9XNtPkU+wIBVNtRl9UelQDNvK6ac/+8ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SjXsAAMxBPBf1BHpRLYsvj2FvuCTOdpGL1bdjhlw1LS1yp9vPeQOV7iivk0MqN4XwXZKrjxc+OAPCY/UcEixj0A78Fy85G9OFc4rGUeFl3plZv/CR2SnOlfjmmTilYwEMZiIZ/i6pQ3Q6HiqvapjL5fKKNxsCjL9gid2NAEk+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuLP0yCB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuLP0yCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753140952; x=1784676952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NW4Unwca7T9XNtPkU+wIBVNtRl9UelQDNvK6ac/+8ZA=;
  b=OuLP0yCBzbxftfgSuVgkjLfM+yISk1KeT6vXWplxLclXxLHdfVpDtRGS
   uDid9IZbvfLLbDDV5BHAwaEGK9Dkkxso+CGbslYIPJxPZKYIaSAtP1jEj
   XrB99ZHSz1V6rWqaHCTC8kokHdO/e8HGoDWTP6Pa/Nxpn9olTIOX5f71S
   /pVafVp6PiXBd4GZ7I6ukgflSMSINaNoZ/GcUQyezdG4qY6SeWGqA4sHM
   nYtrawirma6oKTdfZ+vtM5YE+kOk8tpocj9IaOUL5GNbC42fPnWQGu330
   JD00S4hTowcs4/z/SYGXdSgnRAohnuLM9/cvD6yaFCrrkwgTbQpZCzLSX
   w==;
X-CSE-ConnectionGUID: KhB1UOTVQBWozAE+8MtEtw==
X-CSE-MsgGUID: 1PQY7KygRi21n9zf5xZ4XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="80818297"
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="80818297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 16:35:51 -0700
X-CSE-ConnectionGUID: hl7EsbRcSIeGITADsVfQ6w==
X-CSE-MsgGUID: 7RlkqxvVRFuJyRCy51rq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,330,1744095600"; 
   d="scan'208";a="182689302"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 21 Jul 2025 16:35:50 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue02u-0001Rd-0g;
	Mon, 21 Jul 2025 23:35:48 +0000
Date: Tue, 22 Jul 2025 01:34:59 +0200
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt_all 54/58]
 drivers/iommu/generic_pt/.kunitconfig_perf: warning: ignored by one of the
 .gitignore files
Message-ID: <202507220140.DcNF28E5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_all
head:   8b3963c16977890f20ed515989f1a22644c24820
commit: 3475b69ff5a2fdb2d33a5393114ca5d3d83e4a4a [54/58] iommupt: Add kunit test to benchmark page table operations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250722/202507220140.DcNF28E5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220140.DcNF28E5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220140.DcNF28E5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   .pylintrc: warning: ignored by one of the .gitignore files
>> drivers/iommu/generic_pt/.kunitconfig_perf: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
