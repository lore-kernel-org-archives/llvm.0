Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8847049659;
	Sun, 13 Apr 2025 05:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744523276; cv=none; b=duo0HKrKcRQYxJKpN72QCov8Fa16LeJZ6OAN2Ebzp66N+GfQr6DSLpe3m9k138tytReDMpXc87k5vg2bHwccKxWL9uuuvz9QQJ9pEfM2izIeB7/JEuHTu1uKk9fgShGUG+b3ZGF+g3jNXrO3kM6wxUb+lzrLFgrbRE+kFU1K6Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744523276; c=relaxed/simple;
	bh=8W4AHi63mRxsRLOyeJuMgkUF3IpcX8z10IvrCbKLTVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eivsG5HjntHwBBZCWUSG8OA1wHJg3K8uVFtbM27ZAeZXhaRKl5B0/HCfBnJXkAZ6zzApgQ7eLfuLj+YH4GoAqCMvxBDuzUkd69tueAKnBX8yuBqZzufZDyQKVVg5BgMNn1p/MRhTsIPulGwErvUO7IarL6blzhhK6w1RJS9hDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkL0Q0BJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkL0Q0BJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744523275; x=1776059275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8W4AHi63mRxsRLOyeJuMgkUF3IpcX8z10IvrCbKLTVs=;
  b=RkL0Q0BJvV/O2jmnSy9jMpTj9hUVIWSgz7QGymTh/lAEDLv+6OQ8Iz+D
   5n2OIj0Eh8d5L0h5Lco18rlegwfddbnD2nebvgHdA5o7RDS4sUN2eO0C/
   mjBxLbcx52RAYxCOuzsbwdio8Aul7tz4cJe1z2KVTBSBpoFTdpC05rEjc
   7ofXd9luGotPMqNfRuQR02NVoxg+wsGO4slk9o4YpTF4NRmP6gGqAoHEM
   cJgN9sjYcn+ZDhpM5/FreGPJetScsWuJp16Q4Zl9TE4W+6uCdRyvOd6jX
   FnyLQNLb5EvBJ2vyZ00h2dXeLpED4JjvNBYCdSyr8u7Kh1q97phjv5nxt
   A==;
X-CSE-ConnectionGUID: KYci6IKGSaCuK27wsZytyw==
X-CSE-MsgGUID: tVV/kKuzTzC5KZwMPskfAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45258517"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="45258517"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 22:47:54 -0700
X-CSE-ConnectionGUID: gr+gBrD7TvGraHuFh/dXKQ==
X-CSE-MsgGUID: spZ9LK3QSSmV4ksBER/bAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="160520207"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Apr 2025 22:47:53 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3qC6-000CPy-2i;
	Sun, 13 Apr 2025 05:47:50 +0000
Date: Sun, 13 Apr 2025 13:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/stale_mmio_cleanup 75/77] vmlinux.o: warning: objtool:
 vmx_vcpu_enter_exit+0x1dd: call to kvm_vcpu_can_access_host_mmio() leaves
 .noinstr.text section
Message-ID: <202504131340.CpobMDjX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/stale_mmio_cleanup
head:   b7b72407847dc2556f98ece1383688bcb9cfb4c2
commit: e2be948cc4686ec2476badfb082a2bb4dd869506 [75/77] KVM: VMX: Apply MMIO Stale Data mitigation if KVM maps MMIO into the guest
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250413/202504131340.CpobMDjX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504131340.CpobMDjX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131340.CpobMDjX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x1dd: call to kvm_vcpu_can_access_host_mmio() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
