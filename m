Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2579A1DE8B4;
	Mon, 23 Jun 2025 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750678065; cv=none; b=TTnsEaO8MYiee9q32tYoQeV+4CUOQ1BSDZcT8BB+h+RX2bP7Q6eIO2VRZL/+yZ83xZl+UxwpMYDTvOV5neP29nYrX4Jt9q7DfGPLreSsC+S5gSrk/mDLzvneAhYGYvrGofjepa3R6m2Y58AvLl75SzzHMOj430DXr94X4HRT9WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750678065; c=relaxed/simple;
	bh=s8Ecc5s+QafLpFkrVXrrXSU9DZvSL/5s9UMnAaJKnX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Re8SssiF5KQisL82H+q52piBm08DHLXUAN52xtCLCY+c9HIrKB2W3aOs18RgFim3Pr06YKtt1qtnhNdNNxOxLLH+F1CW6MNHufu6SNBK4yX0fkYx8qZSQalML1bMTDtb7IR2UfAfWLf0xdeIccnhQgcsELHTKwdhdhtJwIum4Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NMzKnapj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NMzKnapj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750678065; x=1782214065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s8Ecc5s+QafLpFkrVXrrXSU9DZvSL/5s9UMnAaJKnX0=;
  b=NMzKnapj49lCqcrwmex0+VPNpF+dHxWjSc/evIVasewHlMxM7Guf5Mpo
   PgUzDxnXcStWzZfyf2PCr2RuuSM9wDoIeBuTik72AF3wONXpCXvFCfk3C
   ymuXkmTCQZfmOFocNuWIQ8zW50fHI9/BMgTbhkxlWKdy3MDEbFQRiIZet
   OW6NcbRBVnJrDxhATm5zdjqCYhg2qaKV7t4KcsfJiYq+mFRnfydok+wym
   YmMATsigj4wX1K4Gy/noSzvoxBSjwwD5rdZmv/aI1WklQLXhe057qj2kG
   ukkcnwyty2n3/OjpMELBNm9u6XacsnnUxXHfbBpoypbo1FhZWYYjl4cb+
   g==;
X-CSE-ConnectionGUID: llBL6pSaQ+OC/9gS3IhpUQ==
X-CSE-MsgGUID: RFJb08dgSayNUp7AJDWZNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="56553234"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="56553234"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 04:27:44 -0700
X-CSE-ConnectionGUID: 5DGDbiV3T3uYbtzYYWz+GQ==
X-CSE-MsgGUID: iO4Q3w3aSOKcjaQr1K7xrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="151047850"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Jun 2025 04:27:43 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTfKu-000O0G-1m;
	Mon, 23 Jun 2025 11:27:40 +0000
Date: Mon, 23 Jun 2025 19:27:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvm_exports_for_kvm 1/3] ERROR: modpost: "kvm_put_kvm"
 [drivers/s390/crypto/vfio_ap.ko] undefined!
Message-ID: <202506231920.Q5c3V3ZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/kvm_exports_for_kvm
head:   66216b2b147f76a917fa9ae28d99d81454d96a59
commit: fc9444e0a8a70e7e6077dbb82cd416a8848acacd [1/3] KVM: Export KVM-internal symbols for sub-modules only
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250623/202506231920.Q5c3V3ZF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231920.Q5c3V3ZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231920.Q5c3V3ZF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kvm_put_kvm" [drivers/s390/crypto/vfio_ap.ko] undefined!
>> ERROR: modpost: "gfn_to_hva" [drivers/s390/crypto/vfio_ap.ko] undefined!
>> ERROR: modpost: "kvm_get_kvm" [drivers/s390/crypto/vfio_ap.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
