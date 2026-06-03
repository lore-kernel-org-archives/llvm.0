Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789A3B27E2;
	Wed,  3 Jun 2026 23:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780529373; cv=none; b=kwra1+OwoqsL+oweLlwRhSfvNZgC6RzZ4syS8T0GtcRGZXb9mKSaEyuabxy6pxhuZnB9nee0vGU5KOaUTIIadejfVhXAf73ZfSUAE5EAK5wYZk9Eki0U27rNwuIxTrhzmVfGLoU7T/eYZfl2jACAu4h0Ddi+ltAWnD4pIarkogw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780529373; c=relaxed/simple;
	bh=Ha4oADRXq1PYWtCJBMnXq0kpE6mHWtuzSC7B8v/poo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nhGNwC8wXliEBaD0+pygVXmuY6pCvC3pG0Y+BMvEP34BwDByYth7ubDotYjdDKOMIlU0utipdxgxnOOBW/Ni56Hc6ue52eOUBoxuQExUqe5e8Y98pinGqK6mOpb2/Q65jF5+Fr5oA5vC2eHppuh5HJCiLHKqnu2aG9OZmL/uwTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRHhIEFL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRHhIEFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780529372; x=1812065372;
  h=date:from:to:cc:subject:message-id;
  bh=Ha4oADRXq1PYWtCJBMnXq0kpE6mHWtuzSC7B8v/poo4=;
  b=bRHhIEFL4bNiEelZw2C+oitv2AqcK6SBQk8mneNtWccRFmJwqU0Apcxj
   TOU7F4GWiyk2YFLuZ7Da9EXuyQQSfDLjedEwck4go/dEEm6wW0Wnd1zBk
   ydL+jA/G9czjLJtVkFQ5dRlXVzGRiHgF2vtMEPZ0JwGa6nBqSoLzRpjlT
   9sihQT12smIgnUUshwijeyxy30gbzVt8If+F7SVCEWYyUZHhd9sl9Aro2
   ukAh/tHUgzesVbRqTVDzNDAPSqbZr5Mvv856wjnfiqo3qXyCCLqNOeIt1
   GwfQgpCTve6rdpE1WyKS/jRsIcUWQ62Y3LpnxyqbYe+/jgju7UsIjYZCE
   Q==;
X-CSE-ConnectionGUID: +aYOM08YT26uKaZSMBwSOg==
X-CSE-MsgGUID: xw34qsZvQ6G8mpcEEW/DaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="84974564"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="84974564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 16:29:31 -0700
X-CSE-ConnectionGUID: bp+4zMZzSXuPfJ7utyxZlw==
X-CSE-MsgGUID: 7hgxRcjqQSCaGGNwFXt6Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="274613151"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jun 2026 16:29:30 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUv1b-00000000E00-2bQu;
	Wed, 03 Jun 2026 23:29:27 +0000
Date: Thu, 04 Jun 2026 07:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Joerg Roedel <joerg.roedel@amd.com>
Subject: [joro:kvm-planes-v7.1 59/60] arch/x86/kvm/svm/svm.c:5326:6:
 error: call to undeclared function '____sev_snp_guest'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202606040736.ebDQao8C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.1
head:   02b786614480597a489766ec45b0ec286a3301a0
commit: a476e7f4b75733365b448899e65f4326eaebf9e3 [59/60] kvm: svm: Implement max_planes x86 operation
config: x86_64-randconfig-016-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040736.ebDQao8C-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040736.ebDQao8C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040736.ebDQao8C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/svm/svm.c:5326:6: error: call to undeclared function '____sev_snp_guest'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5326 |         if (____sev_snp_guest(kvm))
         |             ^
   arch/x86/kvm/svm/svm.c:5326:6: note: did you mean 'is_sev_snp_guest'?
   arch/x86/kvm/svm/svm.h:461:29: note: 'is_sev_snp_guest' declared here
     461 | static __always_inline bool is_sev_snp_guest(struct kvm_vcpu *vcpu)
         |                             ^
   1 error generated.


vim +/____sev_snp_guest +5326 arch/x86/kvm/svm/svm.c

  5323	
  5324	static unsigned svm_max_planes(struct kvm *kvm)
  5325	{
> 5326		if (____sev_snp_guest(kvm))
  5327			return sev_snp_max_planes(kvm);
  5328	
  5329		return kvm_x86_default_max_planes(kvm);
  5330	}
  5331	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
