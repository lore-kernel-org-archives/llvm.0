Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5942F253B42;
	Mon, 30 Mar 2026 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834162; cv=none; b=WyhHHniZ9mm0Ae8xNs8y3kmXQfcJoO5lghFSStdBvYuPYMI9vagCtC/xeWHDlnj8FkFA14FHyzMbDLQ5uV3K3/fwA2ucitQ1kkK/4XBfqb/4S++WFmapXHbJt0DIkwKb8A1f/M/cA9SKzfd3Izm9szuVIe+8XpFvqiIso4figwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834162; c=relaxed/simple;
	bh=bKGWYwf86m45dai55uIyRrW9mSyX7vC35PXd0Uh15Mw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o7YBE52ZKxAcQ5nblNOOvAeSbb3KkSJrwz01z5/+HBom+kUByF/z0kmeMpUg/R32QqNjwiTMQg8519uTBU39gY7L6oqqt1aKsohmsR75J2JWodP4U5LycHpMEzYVafMiouxlROS0kOgoqwUxgkAX4ocMZAoAo62OXOdnoEEwOKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y2QVheKI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y2QVheKI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774834161; x=1806370161;
  h=date:from:to:cc:subject:message-id;
  bh=bKGWYwf86m45dai55uIyRrW9mSyX7vC35PXd0Uh15Mw=;
  b=Y2QVheKI3m9bVSEKp4OX0+uZ0S/bwbgjM2nFZJZkxu7xD5Jh9gEXDxy0
   kjyz6i/dWnHTpe+gMGTWymeV1Fgd1a4mThRmxW5UiIsWj3jHAE/Ohl7Be
   +ywqIngf/cKQ3L0rdYPljoEmA5pDPcaktxS5OrjP+w2Ns5l/Xt9BoIS0U
   NCoUcdjEj1EINHil20G1OnpMi0h6AcszlrRqfCv9QUOgO37Ux+ubJy2Q9
   +o58DtJUrskWRquOLvoWRD83Yp0rlpGnd9pNSLwwMF77Ynv+il3v6Lrlm
   ZTg2S3uw/budjEkSwGLSy1919UN7s8+/E7Y1AwRuMDdkWxvEyqMJCGtlr
   Q==;
X-CSE-ConnectionGUID: mXQaRlDcQjKe3BWeVyBAwQ==
X-CSE-MsgGUID: vYLubPIZRVS4aSwrjz+NwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="76012707"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="76012707"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 18:29:18 -0700
X-CSE-ConnectionGUID: LGCdOfHiTNikM3JAxBM3BQ==
X-CSE-MsgGUID: ofUwcFLiTvyIJZlnw+D22Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="221504061"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 18:29:16 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w71RJ-000000000Vt-1bnh;
	Mon, 30 Mar 2026 01:29:13 +0000
Date: Mon, 30 Mar 2026 09:28:25 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alexey Kardashevskiy <aik@amd.com>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: drivers/pci/tsm.c:31:12: warning: variable
 'pci_tsm_devsec_count' set but not used
Message-ID: <202603300952.ekhJSBmW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 3225f52cde56f46789a4972d3c54df8a4d75f022 PCI/TSM: Establish Secure Sessions and Link Encryption
date:   5 months ago
config: loongarch-randconfig-001-20260330 (https://download.01.org/0day-ci/archive/20260330/202603300952.ekhJSBmW-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300952.ekhJSBmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300952.ekhJSBmW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/tsm.c:31:12: warning: variable 'pci_tsm_devsec_count' set but not used [-Wunused-but-set-global]
      31 | static int pci_tsm_devsec_count;
         |            ^
   1 warning generated.


vim +/pci_tsm_devsec_count +31 drivers/pci/tsm.c

    25	
    26	/*
    27	 * Count of TSMs registered that support physical link operations vs device
    28	 * security state management.
    29	 */
    30	static int pci_tsm_link_count;
  > 31	static int pci_tsm_devsec_count;
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
