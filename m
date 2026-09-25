Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B837B010;
	Fri, 25 Sep 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349928; cv=none; b=aUZURXCyxeeqYgJVVRMawlg4gxNCaq2hRxKWXroOpTqBlaMz7tGkW+MhbZSRm8gmmmB65Nh1qRb2Wkkw8+V+bSieAdrAKU2qS/sikpjrAbM3tsyZiPm06ef02lY3VIspuqeOYJkfTJuVwvnFoTxb6JV/J4dqxnq4MEPaSCj9kUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349928; c=relaxed/simple;
	bh=q3X2P4WMDh6Ao+dyfL77r71gHFNOtCFZtV6OiZrXnGE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VXB80eFd15j4NUhvIVhM3yIff+KeKYUa0xKzlWwlj0pVhPjuglJFRVZgIA6FraYi52O6a+07baEaKT/CjiHhn/WdhWvj8/r8iNr2yUsaCHRG6Ufq/FWn/w3NyKIZ5uu27aZH+oEndSipACIrm9FaENvlYpp2tQ/Om3AMi8wbe84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcIMWr5u; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcIMWr5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790349927; x=1821885927;
  h=date:from:to:cc:subject:message-id;
  bh=q3X2P4WMDh6Ao+dyfL77r71gHFNOtCFZtV6OiZrXnGE=;
  b=mcIMWr5upyN81qjLDJi66kOBgl3iGKlkLS3CV+MVrVKl5HYRKHkoU5y9
   0VrPNduzhHjDlQKpgqaCJ6pCXM5cVHGtIXC/bE440yBTnZHoivlk9oYVh
   GXFxQ1FwWCSdxcg/5yPenkLUDG/G1gjE+w5yUVigN46IqkNX7+qCkeGbq
   xAvWKsjPWnIPvlKGpJ24hKSdod0943vpsv5FZ8VsNMkLfEn84XCVzdj5v
   TNy+v1ICrgQvvLOgd9hGsfGqutCRfOJN3SCFMy/VAfKUmZYjJ0FC7Dqzs
   PiczQbMu+DRAVK8DqsjZr2F/Z4+/EQFqLpUlfrlVMGzbbQQ99DDVj4rBE
   A==;
X-CSE-ConnectionGUID: n4IRGXnwSXqjWCnvty531A==
X-CSE-MsgGUID: PDghPj8BQ16+ukNnvri8Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="100470348"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="100470348"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 08:25:27 -0700
X-CSE-ConnectionGUID: nIbuaHDoQQWbEn7ZfrqIYQ==
X-CSE-MsgGUID: /E0OV6qhRT67KjIhKlm/4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272500311"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 25 Sep 2026 08:25:25 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA7nc-000000000nU-3P4s;
	Fri, 25 Sep 2026 15:25:20 +0000
Date: Fri, 25 Sep 2026 17:25:13 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:tdx/triple_fault_on_pending_sept 93/95]
 include/linux/kvm_host.h:2529:8: error: no member named 'mmio_needed' in
 'struct kvm_vcpu'
Message-ID: <202609251734.J8cFxevw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux tdx/triple_fault_on_pending_sept
head:   bdd6b6c0176b2b8645c34a3326f6aa5b9cb66d14
commit: c238f70d432aeea545b2d74b7d9815386530474d [93/95] KVM: x86: Add a helper to prepare vcpu->run for a SHUTDOWN exit to userspace
config: s390-randconfig-2001-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251734.J8cFxevw-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7e4b8ae111298941e0c31052a7124ab36f5365b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251734.J8cFxevw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251734.J8cFxevw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/nmi.c:24:
>> include/linux/kvm_host.h:2529:8: error: no member named 'mmio_needed' in 'struct kvm_vcpu'
    2529 |         vcpu->mmio_needed = 0;
         |         ~~~~  ^
   1 error generated.


vim +2529 include/linux/kvm_host.h

  2525	
  2526	static inline void kvm_prepare_shutdown_exit(struct kvm_vcpu *vcpu)
  2527	{
  2528		vcpu->run->exit_reason = KVM_EXIT_SHUTDOWN;
> 2529		vcpu->mmio_needed = 0;
  2530	}
  2531	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
