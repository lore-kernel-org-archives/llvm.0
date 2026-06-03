Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4091025B0A3;
	Wed,  3 Jun 2026 11:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487386; cv=none; b=CtAOsFCRhE4HK/sdBbKTw53a1jTayosc0YX8tr47hzNy5MjCSaqZ+q4yqmx7WKx6/Dd/T+EdlRJlROGvjCxdBHkkSBfdZopDBATsDZRI2kEta9RKgEasRPDdK9Ljy7RqRuYVA94Sed6xwLNRH8yDt5lbmyoEmACPbegCDJ00Ezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487386; c=relaxed/simple;
	bh=drZBsPwx6+GpDkzr4elJUMEzRDtWFJ72EWCZeqTMNeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sDWXHvqDlltOsDbGzIPkdYjSAPnBNphUfpFN+tZbjV3L2fZbQ8A8CWzvz7K9swdI2c1exb8Ar7b47e+AcAVzpY04v9ZerH7HwLbMPb3kzLInvU7AsnyWh7baqt11DpG7ua+Y2sM1FYK2/h4b1BTUanHnS00z6EUXQD8BZZzstJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCYwqClJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCYwqClJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780487386; x=1812023386;
  h=date:from:to:cc:subject:message-id;
  bh=drZBsPwx6+GpDkzr4elJUMEzRDtWFJ72EWCZeqTMNeA=;
  b=NCYwqClJ4yrtKwMFnxUfMW4JyPvaLyTSt5gMvb4xr+AWynpSEcRpzo8S
   GNfkJrmXcJGKlw/ZucCadIejBQQhE4wR8fUa4JEUMBRQ3qEYXwhyiCQGp
   SEyPIrbbNKW2f3cB6vLdxVIGKEn90iKpeIHQpr9BwFOCLxNTlzxFqLaV2
   y8XkAePrwtIDxuq58DNcc4fW0v/7lTonvVpA+NxYYYdPrwfM90c3BqJc6
   MRME9mBtK8kcPqNaFypP/DcMraR1yODKLR9ulNTWjP8adeQT2e1akBjkv
   dkh6GaTk2mGFieDcNY1ogjJc6yC2tGvqw24NNUT2/HW4RggFtHTUDwOYM
   Q==;
X-CSE-ConnectionGUID: AnHe9lRSTZSv4I/izFGAEg==
X-CSE-MsgGUID: m/QdxDERSWWkrHMpkhhfgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81287321"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81287321"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 04:49:45 -0700
X-CSE-ConnectionGUID: zkfDu55rQy6d2dkk60xQNA==
X-CSE-MsgGUID: wl+d5X+wQ8+7rt0zVYmrng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="267854380"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 03 Jun 2026 04:49:43 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUk6O-0000000023F-0xcG;
	Wed, 03 Jun 2026 11:49:40 +0000
Date: Wed, 03 Jun 2026 13:49:17 +0200
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: fs/nfs/pagelist.c:478 function parameter 'pinned'
 not described in 'nfs_page_create_from_folio'
Message-ID: <202606031311.0vTqyPGz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/nfs-make-nfs_page-pin-aware/20260603-133419
head:   51c6eda8fc66ee56e3e2f4079ad6ab86d457213a
commit: 15061ec64dc3144340b3ba2857700c9622c38dd6 nfs: make nfs_page pin-aware
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260603/202606031311.0vTqyPGz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260603/202606031311.0vTqyPGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606031311.0vTqyPGz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: fs/nfs/pagelist.c:446 function parameter 'pinned' not described in 'nfs_page_create_from_page'
>> Warning: fs/nfs/pagelist.c:478 function parameter 'pinned' not described in 'nfs_page_create_from_folio'
   Warning: fs/nfs/pagelist.c:446 function parameter 'pinned' not described in 'nfs_page_create_from_page'
>> Warning: fs/nfs/pagelist.c:478 function parameter 'pinned' not described in 'nfs_page_create_from_folio'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
