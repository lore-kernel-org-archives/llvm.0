Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372412FB6;
	Sun, 15 Dec 2024 13:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734269444; cv=none; b=liuvcU3jEFhrMFqL7Kut63H1SpDxH7MsWF7Iy0vESgK5gBmqwbsjeuLCh6OSqKfMAgROsCtYldzLzvYOy6gLpk3XnwXrRF5Rzm7o29E/J6MfYzelWAWfnCfkq+5IxK60zqlxaemg+B69W3TB3f1N1z5aXbAF4KkxecYAaWSehuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734269444; c=relaxed/simple;
	bh=6cxYTr7imZ3Ti5WL+RygQOLamRFVZHcBTlOdk4tEH20=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a5ZDbgKreyxqc08/b3NeBcyB6LasX0DBHstEkVLPK0MjXsR571a+dkC8hkXRWMjHBeV9Ym719RMMKgsMu9XSDySg3ICY4oPF/bTU09MdstlrkkSd2HNs4pvfjQZeJ1AuUgF3LT4XGnTiwEJvjML2sm12KQUbe6s0GXk1K1sGivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HslJI1Yv; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HslJI1Yv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734269442; x=1765805442;
  h=date:from:cc:subject:message-id:mime-version;
  bh=6cxYTr7imZ3Ti5WL+RygQOLamRFVZHcBTlOdk4tEH20=;
  b=HslJI1YvEDgE+gkGegxzjNY/p2JthBKuundTYJcpMz42GyJPd2sD4TqB
   E+Esbvrt8EFmSfDVAdh6GxEQ+sTNd+o5oddqT/jFHllYgFH1eZPGXTavH
   HOH0Cv441xeKnO8BMSQgVDG2okx/bxyIrkw1TgFc+PKnvO80Hox1AMK7R
   J9gcSlSRXxVLWCWmFXB22e6dWSH3t8WXZBPA6tQBLKUXcmwTPkqJVfWH9
   qqKSGaf16qyYlfLCcZ2ctq+WCrTZmHU3Q359CKXgJxfEvUqzKjERtDovU
   jwgJneVMe6UBPWOSqirZeMIBxxKIX6snb1PNhiMMD+XXh9qV3ORt/E7h+
   Q==;
X-CSE-ConnectionGUID: iakEak+eQXCsDH2P30g83A==
X-CSE-MsgGUID: 1ZtWkeqiT6SAh715vbjJNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="45268868"
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="45268868"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 05:30:41 -0800
X-CSE-ConnectionGUID: mHeCiOgNQGyQgaEevaZLvw==
X-CSE-MsgGUID: aBOcylA/Th+j49L9zz95Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,236,1728975600"; 
   d="scan'208";a="96869889"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Dec 2024 05:30:41 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMohi-000Dda-0z;
	Sun, 15 Dec 2024 13:30:38 +0000
Date: Sun, 15 Dec 2024 21:29:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 10/232] fs/bcachefs/bcachefs.o: warning:
 objtool: bch2_check_alloc_hole_bucket_gens+0x507: unreachable instruction
Message-ID: <202412152159.246eypZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Alan Huang <mmpgouride@gmail.com>
CC: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   ea71d92584522ac4a7b66ee9945556118b928ab9
commit: 6952c5b0d70b70638a070f50668a614235a11175 [10/232] bcachefs: Delete dead code
config: x86_64-randconfig-008-20241215 (https://download.01.org/0day-ci/archive/20241215/202412152159.246eypZR-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412152159.246eypZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412152159.246eypZR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/bcachefs/bcachefs.o: warning: objtool: bch2_check_alloc_hole_bucket_gens+0x507: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
