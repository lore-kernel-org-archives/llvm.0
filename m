Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D073590B7;
	Thu, 22 Jan 2026 03:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769052999; cv=none; b=cw8M31IhUQEKmubaEYUPsaCll7A37wmsXkJ9niJ3WwGebmN+AbvAEwZ+OQ3En5rg/H5A6OkUhlIj7CeBKXRYSOnux+dPtiEcGGsraIZQEb4ostYgUJmq7lyDA9/kR8asqe5Woq9ZDRb4MMY2IjFEaSzWCL530Ey0uFpPRyMslFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769052999; c=relaxed/simple;
	bh=gRukf7U5maY9YwR2RtcB+GWVSFPwW5Nu3+pY8basyPc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QO663G0DzJtI3XN/GkqT116StPLvkJrQ4ZICfelUOtxGMOIf8qkSmJDwG6moFzXrSitz3MOEJCPxFbk1I5Pk+EHLyiCx0ITkB4QMnQrohRFAJPqo9lwN+yoqF/v3EPtrnzKMDuu5C9gYOG/F/MVsBIDTVDTAWQPb9NCAgK/UqNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hi/vb5PY; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hi/vb5PY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769052998; x=1800588998;
  h=date:from:to:cc:subject:message-id;
  bh=gRukf7U5maY9YwR2RtcB+GWVSFPwW5Nu3+pY8basyPc=;
  b=Hi/vb5PYyiQMLqvQhzg78dMp7rSc7mvkLkHQM62qtXhYizpM1QClq344
   QyLICpnFN65igbhE3nKdeUJtAEcu/HhhUQNLwuU5MntV2yZPkBASKkF8J
   xmqaNZjbS9qCirE7j2sWMSxfLMxutANlqrDyPIE1L9hggP6rfxzp9L823
   T/pP9YaccXxKvLPEu2A4VRh5x66fBEm3kab+DRtRJRrFxfbsEeX0gPiOo
   NMOU71bfBwiaXnVd4eAr+BXk2VwPZXyfbSsVOCQqQf1eOelquFQiWSM09
   nR4q7ALNA5R5Wm8KRYd+Xicj7CozOodr3BmW2YMJvTSRKGy+70lyTTzdQ
   w==;
X-CSE-ConnectionGUID: nz/Hg3DwSO+yCbj3NhcYUA==
X-CSE-MsgGUID: qgn80eSWTTWe4xbYhjDq5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81007742"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="81007742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 19:36:33 -0800
X-CSE-ConnectionGUID: Kk/IRuH5TIS16jtyHza/XQ==
X-CSE-MsgGUID: BZfX0SsiQDO/P0BcE0+7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="237294439"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2026 19:36:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vilUj-00000000SNz-15aT;
	Thu, 22 Jan 2026 03:36:29 +0000
Date: Thu, 22 Jan 2026 11:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 51/79] Warning:
 arch/x86/kvm/mmu/tdp_mmu.c:543 function parameter 'sptep' not described in
 'handle_changed_spte'
Message-ID: <202601221114.ft78UoiN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   491d01f5d2ac33f4da9d302ff18cdcb57c0d967b
commit: af111245b7f1b0948e7677d96ff459953fdfc7ac [51/79] KVM: x86/mmu: Plumb the SPTE _pointer_ into the TDP MMU's handle_changed_spte()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260122/202601221114.ft78UoiN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221114.ft78UoiN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221114.ft78UoiN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kvm/mmu/tdp_mmu.c:543 function parameter 'sptep' not described in 'handle_changed_spte'
>> Warning: arch/x86/kvm/mmu/tdp_mmu.c:543 function parameter 'sptep' not described in 'handle_changed_spte'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
