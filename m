Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFD918E35D;
	Tue, 26 Nov 2024 09:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612815; cv=none; b=FoJzXZ2puqyOuYJUPhcgEMr9ImMMDRcSF0PSt8vhMnw0hLiSw2rwoy6wmpeZirSmta7N1QZu7swT0xlL2OqnCR/A4+R9U4HzyJ6BkFQdUi+KNzsfj3R/3JuK/YkJAFOZcG8SROUHkr0gOaQ2/8exQIRmUyZLvjkf/wZa6DNHhf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612815; c=relaxed/simple;
	bh=1OaH6f0RcPDVtg2LZ5ET7Ci+rmU1mbihgC+v4df+3oo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qErqO3agStMTCPM4SKqVTKK/d1wS9l2hAkUTFzzavf4Jm1bJEp7QpZtpyjPTIP7KS6ZIC5XbBFiYad9eysVsfrTrhog84LdTl+iuUgu3RBBg1SzKWlGDDe2RYxfpCQ54xtou9nDznngLzjCPmiXyJU7gAq823RL6U5jLSq/alDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QM3jv2cc; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QM3jv2cc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732612813; x=1764148813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1OaH6f0RcPDVtg2LZ5ET7Ci+rmU1mbihgC+v4df+3oo=;
  b=QM3jv2ccRWxdr0dD71E7q28lZff5fJxWJRa9mCFS2cPiSDxkzuuJRtGM
   0TZOeGaaVMpyS+XXCDAJUgzOqqSEff2zTsNSiwV3Tn4DBoHUu6IjZc3xW
   0ButQq58WioqTHQZuaDua52iey4ha16YP1VVDol9c+JVw/xFnV6rzPJ6o
   KzR7XWheZB5ag7+cWYTUHsRIr3sWBBWSwD4DJY51Fanwvc7Ui784nGCcB
   p6QyOXB2XFbccUFRT6UUkSaVKqDB4qkW+lcIB4Idj0s63Nq3FGNMGrkC7
   8sveWjUnZGrU7I7tmFEvC3qJIvXR60RZLZHducwXzgkyiWxlNGF6ln+1k
   Q==;
X-CSE-ConnectionGUID: y9UiP5F6S3uk1hqqJ0wm3g==
X-CSE-MsgGUID: h275kwPdT6SpSs3CcQwM3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36548576"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="36548576"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 01:20:12 -0800
X-CSE-ConnectionGUID: yFN4Ji3bRvOElHHs9ALRgQ==
X-CSE-MsgGUID: nYFRu6pFTcmBJ/xYt0n+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; 
   d="scan'208";a="92022093"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Nov 2024 01:20:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFrjt-0007Bz-0v;
	Tue, 26 Nov 2024 09:20:09 +0000
Date: Tue, 26 Nov 2024 17:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guest_cpufeatures 59/60] ERROR: modpost:
 "__start___kvm_used_f" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202411261759.XcrErnXo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/guest_cpufeatures
head:   1bc43ac6e3ebb05bb7cf78e0da5ea9009c9d963f
commit: 102f562cbc40305a42256e95c09e00d598e96204 [59/60] *** DO NOT APPLY *** KVM: x86: Verify KVM initializes all consumed guest caps
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241126/202411261759.XcrErnXo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411261759.XcrErnXo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261759.XcrErnXo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__start___kvm_used_f" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__stop___kvm_used_f" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__start___kvm_known_f" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "__stop___kvm_known_f" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
