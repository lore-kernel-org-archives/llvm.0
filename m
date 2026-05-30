Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BA1C15C;
	Sat, 30 May 2026 14:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780151500; cv=none; b=C7K1TIgq3jcmNYYpmJvRqzgUPAGrli1yX4cS9OiY5Aa5Inz9VKS8hOWBrhwXgGEqpCaEd2NSm+xNnzGVPFg7C7g7xxVHys8To4t8afBAIEUV/CKk7vt/mZ/iIKzFr/wWtfiVV9MRxZYZMTVfjXBjUmPoIL5251rNTuO+NBmrdvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780151500; c=relaxed/simple;
	bh=mwBL4XRGDFZHD1K3DQl7mrpAuN+AOIF0uT314HThnQc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C516d0ca/Mvb+DCmb+FlJNTOvMHZYVpFzeSlalrNN2mKVa3e+ez8xwoyyNLBZlQjdBEpw6xX1pTItibO74JypFJdQZ53PTAUjKzILGyZQ0DzzTBvAzms30MbwHCjVWLRZfkvBcjzZBiTJNSdOiUmJj0g8G0iAbKTVephGRlFgl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JgPnONeh; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JgPnONeh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780151499; x=1811687499;
  h=date:from:to:cc:subject:message-id;
  bh=mwBL4XRGDFZHD1K3DQl7mrpAuN+AOIF0uT314HThnQc=;
  b=JgPnONehnT+dzj3ELoij2w+jIDwJWIX6YfwbQu19VO373TsKZ9di0dtH
   bO9wOvRaNu7nnyhavyjBWY8foBRTVoIM+HEir9BscHWkIP7ooVXxonhK8
   Xp7PYKKsgt40rHe/DwVmLoWrBoitvA5jRCaV5QqzvVO/NSFNuRZ4SqJgA
   +TgEx9jjsC8YL7so1cpktdvuvALzjtkHTPrbtXmjbc6scjGvgZPIb1Cb/
   wXkaWq+p4OoFe+xCgoAt4dOOUc3UifLXEqb6meG6U+KXB45ejqHIZpaAi
   FndjF61S5NqV3wnYClqtHL9ulXbuaAEvLstrKS6yZIfJdItbR5SeVFkNv
   w==;
X-CSE-ConnectionGUID: 8wP8K8Y7SwipVCOnMlUbOA==
X-CSE-MsgGUID: R3BlNQa4TX2nR4jjKprR1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11802"; a="92448821"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="92448821"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 07:31:38 -0700
X-CSE-ConnectionGUID: t+IAWngxRK6Xvx9jQ44hTQ==
X-CSE-MsgGUID: 6VS1NdpHTvGyqMPlcFPBaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="236775183"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 May 2026 07:31:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTKis-000000008X0-19Qx;
	Sat, 30 May 2026 14:31:34 +0000
Date: Sat, 30 May 2026 22:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [joro:kvm-planes-v7.0 38/62]
 arch/loongarch/kvm/intc/pch_pic.c:415:47: error: too few arguments to
 function call, expected 5, have 4
Message-ID: <202605302249.HthX4NOy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git kvm-planes-v7.0
head:   dbb5c2770eccdd9477ce812561c61d49ef7891ab
commit: 02ee2b16b2c3d162c0bfe4315ef1fd6a1a2836fa [38/62] kvm: Make KVM_SET_GSI_ROUTING per plane
config: loongarch-randconfig-001-20260530 (https://download.01.org/0day-ci/archive/20260530/202605302249.HthX4NOy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9409c07de6378507397ecdb6f05f628f58110112)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605302249.HthX4NOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605302249.HthX4NOy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kvm/intc/pch_pic.c:415:47: error: too few arguments to function call, expected 5, have 4
     415 |         ret = kvm_set_irq_routing(kvm, entries, nr, 0);
         |               ~~~~~~~~~~~~~~~~~~~                    ^
   include/linux/kvm_host.h:2331:5: note: 'kvm_set_irq_routing' declared here
    2331 | int kvm_set_irq_routing(struct kvm *kvm,
         |     ^                   ~~~~~~~~~~~~~~~~
    2332 |                         const struct kvm_irq_routing_entry *entries,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2333 |                         unsigned nr,
         |                         ~~~~~~~~~~~~
    2334 |                         unsigned flags,
         |                         ~~~~~~~~~~~~~~~
    2335 |                         unsigned plane_level);
         |                         ~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +415 arch/loongarch/kvm/intc/pch_pic.c

e785dfacf7e7fe Xianglai Li    2024-11-13  398  
1928254c5ccb7b Xianglai Li    2024-11-13  399  static int kvm_setup_default_irq_routing(struct kvm *kvm)
1928254c5ccb7b Xianglai Li    2024-11-13  400  {
1928254c5ccb7b Xianglai Li    2024-11-13  401  	int i, ret;
1928254c5ccb7b Xianglai Li    2024-11-13  402  	u32 nr = KVM_IRQCHIP_NUM_PINS;
1928254c5ccb7b Xianglai Li    2024-11-13  403  	struct kvm_irq_routing_entry *entries;
1928254c5ccb7b Xianglai Li    2024-11-13  404  
bf4afc53b77aea Linus Torvalds 2026-02-21  405  	entries = kzalloc_objs(*entries, nr);
1928254c5ccb7b Xianglai Li    2024-11-13  406  	if (!entries)
1928254c5ccb7b Xianglai Li    2024-11-13  407  		return -ENOMEM;
1928254c5ccb7b Xianglai Li    2024-11-13  408  
1928254c5ccb7b Xianglai Li    2024-11-13  409  	for (i = 0; i < nr; i++) {
1928254c5ccb7b Xianglai Li    2024-11-13  410  		entries[i].gsi = i;
1928254c5ccb7b Xianglai Li    2024-11-13  411  		entries[i].type = KVM_IRQ_ROUTING_IRQCHIP;
1928254c5ccb7b Xianglai Li    2024-11-13  412  		entries[i].u.irqchip.irqchip = 0;
1928254c5ccb7b Xianglai Li    2024-11-13  413  		entries[i].u.irqchip.pin = i;
1928254c5ccb7b Xianglai Li    2024-11-13  414  	}
1928254c5ccb7b Xianglai Li    2024-11-13 @415  	ret = kvm_set_irq_routing(kvm, entries, nr, 0);
1928254c5ccb7b Xianglai Li    2024-11-13  416  	kfree(entries);
1928254c5ccb7b Xianglai Li    2024-11-13  417  
1928254c5ccb7b Xianglai Li    2024-11-13  418  	return ret;
1928254c5ccb7b Xianglai Li    2024-11-13  419  }
1928254c5ccb7b Xianglai Li    2024-11-13  420  

:::::: The code at line 415 was first introduced by commit
:::::: 1928254c5ccb7bdffd7f0334e1ce250e9ce4de94 LoongArch: KVM: Add irqfd support

:::::: TO: Xianglai Li <lixianglai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
