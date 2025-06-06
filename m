Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FBA1311AC;
	Fri,  6 Jun 2025 18:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749236121; cv=none; b=Qk9xaMuqukBnnn5Xbmbp9uDGUdxRGHBMpHMkfG4k5tOAXvF6aMKnZSyT+oLta4VYLHHHhA48QqZfX4XGK6+EGDCktgvsUTCqI+ltMKGf9oeBYFlRe3um/zm4Gmas9M6ujqzFejpZx1//aabKRhmhwsB/TpsiZTqDu/g26JyvWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749236121; c=relaxed/simple;
	bh=1IMoyRzLGzbb04P9DNLNBD4tHsslCbUQNRADFJ1YlWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N24LX1C6z5AEP+xTTEIeL2Ehyrj3lfbx7mli+Dk4nrDEYhRj/KmzkJ26wV0qsVfh13X1awokIzJ3o7M8HMix2vCoSK/1QEFJ0z4vjR1RqlBcUb2vPHOnM28VHhycCq0PweJgKLDXu2ONLNSHqEpDijMS3HEq0XXQWnmcE8fQ4Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gF7jHHIs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gF7jHHIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749236119; x=1780772119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IMoyRzLGzbb04P9DNLNBD4tHsslCbUQNRADFJ1YlWg=;
  b=gF7jHHIsyCA/kQFU+mf6welTlnisGNQSrPJFAeFqj9y/btb7MAxrdUdd
   A4flR/1vkUg7Q8bg5iAXT8ZIiU+mmAMkLX6/EsYTDEaNxXo3gQOXHtxrH
   +kYcOfrYsBEIfuawKt689J9J4gkGAsx2z9XIkvpaoC8Q/PNkW/5xORB4P
   bP077l/Jo6ohAGJUx9ZRx8cXm3DEBDFBRL6aJvV62MCaIUjpFnJwpj8qV
   5MRp/K7zo6ce39MIGxOjh4KkgVIFlxSjy7ybO3jxuj9vRFOhtLPYYYHuq
   ZatQoPXZoG4p3a8zX/A26hdWZCDpwkyqF/yjNSKCKuh5WnSvRM1zCBJCb
   w==;
X-CSE-ConnectionGUID: r3L8tto7QVKdliMQu9Kuug==
X-CSE-MsgGUID: YtD36K48S2q/xqujtzTFCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51303636"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51303636"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 11:55:19 -0700
X-CSE-ConnectionGUID: 1qrPTeL/RJ+GINH1BawHeg==
X-CSE-MsgGUID: HSn89/1dQ8+oQ8AkF/IL2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="145797818"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2025 11:55:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNcDj-0005DP-1t;
	Fri, 06 Jun 2025 18:55:15 +0000
Date: Sat, 7 Jun 2025 02:55:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:sink 118/119] ld.lld: error: undefined symbol:
 amd_iommu_fake_irte
Message-ID: <202506070221.yxM0Cj4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux sink
head:   da3200e59044a5d92a82cc535b7f3ad95fde9af4
commit: 6721af488c95e838ad32a3b0286b39a23d0ae9e4 [118/119] *** DO NOT MERGE *** iommu/amd: Hack to fake IRQ posting support
config: x86_64-randconfig-005-20250606 (https://download.01.org/0day-ci/archive/20250607/202506070221.yxM0Cj4z-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250607/202506070221.yxM0Cj4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506070221.yxM0Cj4z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: amd_iommu_fake_irte
   >>> referenced by avic.c:1108 (arch/x86/kvm/svm/avic.c:1108)
   >>>               vmlinux.o:(avic_pi_handler)
   >>> referenced by spinlock.h:0 (include/linux/spinlock.h:0)
   >>>               vmlinux.o:(avic_pi_handler)
   >>> referenced by avic.c:1130 (arch/x86/kvm/svm/avic.c:1130)
   >>>               vmlinux.o:(avic_pi_handler)
   >>> referenced 7 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
