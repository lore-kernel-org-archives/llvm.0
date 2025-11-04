Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02BB16DEB3;
	Tue,  4 Nov 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762245068; cv=none; b=Z+WPXHYnCszkZz2sYwz8V9LyBiqq7aI+TTuHExcjeaVClGcNucKyRk+2xeKDAXb33MOOFQRQQfmzLv25Dis2I5J7N+60d8HO6RsQrewdLBn1FdSvC6DOI0cR713tvuL3AFRqG8NY6w/9OmYG1qMt5UltGKYps5YSadEHrGdlC2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762245068; c=relaxed/simple;
	bh=EypfEFAYc649/NVySdfPsHyAltd6qd095Yf/CNmLrB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lbBXrt0Gm0vcZ1m5qTMAGgEdNuZpeDdGvH+jsz9P4aW9qvZan+RxcTHCYkLW6N/LhXwK/TLArTE4lp2KGDpaAvuMNyLxOCB7PQj9uQ2nDVHGqmeTFN1v8Sevli67FGB35wwakbGb+Qo+VG4jcPfb7/RyQFTEl/XGo7wtaFceh1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+YvR4S8; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+YvR4S8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762245067; x=1793781067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EypfEFAYc649/NVySdfPsHyAltd6qd095Yf/CNmLrB0=;
  b=a+YvR4S8BBQvWbK2Tippq1x9ALHQ0nXqIfO+lNUuEgJqigFnCR6r6UGI
   HyKVG2uPSTB+o4ca6Q5YX4JOtAILgyJJleLROd06eXpnTiaBlXOknAFoO
   2NmaUPbQzcXHkFOCgsKZnFTXLPBRibh1VFRu4sXnShXB3TlKGD6uQUeW5
   Dc1SxKCBlYohTGj8IzbRf8zNzJTDR7vNLNuavCUm70Wvx2URnB4aLcMn6
   el024oFkI2xwuSB1seFF/Wy1pKVLNz/YlioaUPuZx4XUc2CfQ/a1G2ydK
   VvB4V5REOCJe2YooaMGhUDLyV+q3qnr8sajPD5+wHCqRsNaoMKCv7E37D
   g==;
X-CSE-ConnectionGUID: G3HfNV7tTua60YvEzeoFEw==
X-CSE-MsgGUID: tw7L2ZFJRxCP2WIlwq944g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75683754"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="75683754"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 00:31:06 -0800
X-CSE-ConnectionGUID: P4LrSQ8BQCyLfWy1jaL/zA==
X-CSE-MsgGUID: NC3KhGXFTT2M8RqMjXUI4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="192265707"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2025 00:31:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGCRS-000R8L-2f;
	Tue, 04 Nov 2025 08:31:02 +0000
Date: Tue, 4 Nov 2025 16:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:master 710/710] ERROR: modpost:
 "bio_iov_bvec_set" [fs/bcachefs/bcachefs.ko] undefined!
Message-ID: <202511041628.iMALEmeG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs master
head:   63a915f62f282ce70aa88796a8a34cba43c84b51
commit: 63a915f62f282ce70aa88796a8a34cba43c84b51 [710/710] bcachefs: vendorize bio_iov_iter_get_pages()
config: arm-randconfig-003-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041628.iMALEmeG-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041628.iMALEmeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041628.iMALEmeG-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "bio_iov_bvec_set" [fs/bcachefs/bcachefs.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
