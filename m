Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD252AF0E;
	Tue, 24 Jun 2025 14:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774830; cv=none; b=O6Q/6prYxOhqs+nsa641ydXtNEKwA9ZobUU7PEbioL2qhDb/nma8xzChcvgCVUJhQYjpJKzQKxnr9h17IH1wMZJJeFDeLl+GtLHITdT9ITOsvN77P0EFRdeemNXaQwYpG5QWPrgcTOJWoZrdqWNxHi2ZrPML3W5QOlSeKYlDonA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774830; c=relaxed/simple;
	bh=1qJA4Fzxs3g11+1goGb4DIt4JA3+GoidUeojZWlGriU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XvysQj8YglHiGD5T7LzM1vXAQQu2FfhE+lnUETwoLmP7wGALoww1IQpgCZOx5/PUfe9lYr2xt0sLDZeJqSEft2rWqPHIqD8HnvRiVCbxoFN/TSZLI2VGcWhoPYvodnLlehODdbPXW9L6j7o/M/Ouv1p59Ft3vhhyEewa2NMe7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVl1LXoz; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVl1LXoz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750774829; x=1782310829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1qJA4Fzxs3g11+1goGb4DIt4JA3+GoidUeojZWlGriU=;
  b=GVl1LXoz4wDax9obG3tXRDwj17pzxQ6WMACvq60mM3Zkl2YojVkotEwV
   iiuI62i9sOwIHO9Q8JuhpPrhC7kc9LyZkUne3m8LUNDcQDGZd68FncC0B
   ELD0LOM5yylZrIcIqqD6YNtrYEniyyzzsNdMiGbkw2bWmwrRTJw6YBhN8
   7BgY8MZNW+cawcKB7q3I13oOWnnoq5b1ZrEUh587oXw7F7PQr+8kSx87W
   O76RAFahMP2ynWn+V8NBsLiAurYz2JU9h0wmv29u/HlQJuEi1nxT7jCTn
   Mo0WLWpnkfzgl0hUWPQA9xqrCVXIRORYJFXrGgX7GPlOwvrmYJS8pCf7K
   A==;
X-CSE-ConnectionGUID: BW6epcUOSsGF/edqM8QjLA==
X-CSE-MsgGUID: iuKvA4k7TO2XkFipTGMGVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53151583"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="53151583"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 07:20:29 -0700
X-CSE-ConnectionGUID: +0lPmS7/TFuyZ1LxpCDtjw==
X-CSE-MsgGUID: DZvYguI9S8+ByUkUytuipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152094265"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2025 07:20:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU4Vd-000SDW-13;
	Tue, 24 Jun 2025 14:20:25 +0000
Date: Tue, 24 Jun 2025 22:19:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 17/17] ld.lld: error:
 lib/kunit/kunit-test.o <inline asm>:4:10: Could not find incbin file
 'kunit-test-uapi'
Message-ID: <202506242203.eVSpYiyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   ba83258f9706f2b3454de1dfdfe925d0b259e04f
commit: 12afddaa072f6acb896bf4a7ddb793048d7beaae [17/17] kunit: uapi: Validate usability of /proc
config: i386-buildonly-randconfig-004-20250624 (https://download.01.org/0day-ci/archive/20250624/202506242203.eVSpYiyQ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506242203.eVSpYiyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506242203.eVSpYiyQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: lib/kunit/kunit-test.o <inline asm>:4:10: Could not find incbin file 'kunit-test-uapi'
   .incbin "kunit-test-uapi"
   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
