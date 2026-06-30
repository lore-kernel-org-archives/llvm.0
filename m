Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3884779B3;
	Tue, 30 Jun 2026 17:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840593; cv=none; b=A/7zZRtwm3n6nIbAnQVIKlVgbtBpgN2HVM2hoTf00wB1l/UL4QWyIHxLyKylIKniRQQIIE1Qo/YchtoNREMd62qtHzY8DwQjh5A5Jt/c3BirVZpPMiJLC4kRWlB5ByntXGqZ2mIq8Si+grKymlx8ePt8ZjGrlkFdkMRrWGkjYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840593; c=relaxed/simple;
	bh=bEIDIAFFg6IQ+N9z/F0cQUTYMpBomQWn0Kkp9hGjAok=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mImdpsmtakZw9CXfOHgrhhGnVUwnCrX0t+BjRRd7tEJiCNpd8PpFJ0jVPWlVAuDoCEDivLDs+2AjsVvmekZ9UkU6OR+UPffj+SJdboUpUBidvuNBVj7THf0PxAdEnaG+pHDypTOs8Td3UJlzfdLIHp9RXyXsJRfez9MzsdCJrUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kyKDf5vh; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kyKDf5vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782840591; x=1814376591;
  h=date:from:to:cc:subject:message-id;
  bh=bEIDIAFFg6IQ+N9z/F0cQUTYMpBomQWn0Kkp9hGjAok=;
  b=kyKDf5vhVKl+cICKNyLAL3SL4LIYch9motp9+JVUPCqA1bVjeNqsNxL6
   8yducx89MN6nBp6/imvFHLknvv2jVup/2axxC2KGgJhEssO9B7vGhZCKw
   zoO4s/dQX6MRTt+9lOUnIt37rPywKwuT2rFlPdkz8KhU/dhkSdQEp3Eep
   Dz7ObeP6OTjNBhXwiEJbOY5RoqhZwkBXQcnMUc3VZqxsLdaPz4k6F2poP
   qVxlDrwgqeTarTbTf8hdxwev1TyrK+Lc4XR53ad/5LieCp98EwB/exIEs
   qGtbqQJRyw7IIDpiEXXyuX8EBtFMkncEg1ymW6Z3LowcBhXy87/Udf0Qr
   Q==;
X-CSE-ConnectionGUID: 23v1CDfHRb+JP02RzTpyjg==
X-CSE-MsgGUID: pwgGFrJaRJKDpSABvMt+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83559323"
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="83559323"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 10:29:51 -0700
X-CSE-ConnectionGUID: mqW3ITErT8yWjAEFo1UL8Q==
X-CSE-MsgGUID: Z2eCMeV0S+iyH6XhLirGow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,234,1774335600"; 
   d="scan'208";a="256231481"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Jun 2026 10:29:50 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wecHL-000000000W5-48m0;
	Tue, 30 Jun 2026 17:29:47 +0000
Date: Tue, 30 Jun 2026 19:29:07 +0200
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/pci/pci-driver.c:137 function parameter
 'match_override_only' not described in 'do_pci_match_id'
Message-ID: <202606301951.I00g8xAr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/ata-don-t-keep-pci_device_id/20260630-191631
head:   796a9ccc38d8357e77d60bf0af9eb426671c2be5
commit: b3e25088daea19c62315c19031e5f89d0ee18074 pci: fix dyn_id add TOCTOU
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260630/202606301951.I00g8xAr-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606301951.I00g8xAr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606301951.I00g8xAr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pci-driver.c:137 function parameter 'match_override_only' not described in 'do_pci_match_id'
>> Warning: drivers/pci/pci-driver.c:137 function parameter 'match_override_only' not described in 'do_pci_match_id'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
