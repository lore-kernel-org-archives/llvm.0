Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08619CD01;
	Sat, 12 Jul 2025 19:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752348620; cv=none; b=dFlOJ+8+cIWARr52frGrsmER29ulgLi4Z7Rv330nPb0mrqoyxiKKnZTXikdIbwuvoE42mOezXHN0btXCPoe05HLNjFKxE0lRlwd5ZMEoE4jiMpt0yElul9uMiuM+wrHiY6OB23g1hnQ0UULnayXet68lZxkQaeNr5nTLVgTknkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752348620; c=relaxed/simple;
	bh=BkD92R+b30Cd5TH19Otd+wkPVcL51o3v1DskctkW3tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j31TPbxKNcXA/zH7FucpkHMYawj+epkBbuiDh4IkpUom/VFQTE9ttstMxTa8TwWGsDTH1XRQ2zMJ+/qPKmHEp0MKde/7WtF+TnepuY08HwpQaWVCJ9EFvzzP+Gq0E2sctt9kJVV1eRrn6FYG6l2q0t5Vf0yQWwE4CnxBEHmhhdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSxiFHAq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSxiFHAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752348619; x=1783884619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkD92R+b30Cd5TH19Otd+wkPVcL51o3v1DskctkW3tw=;
  b=DSxiFHAqzFXDRcfZvkDxEeR1qYfYgnKuych74hOJTT1K9wtOdrLbyQFj
   l5LaglV2BJs36ekcMOhtwZ0vePmG5fnlN2XSJyUWucsA6vHjkDUN1RbLw
   E2oHEt4myWC+G+pmRH5kYAGobQAhi0PuuKgEnivm7e3ypTb9obmDCMQmn
   eKf2NXIsfWFFjznCufJHjB/rkMtB2IW11cPf+oEGZ0zvrDudDgBwbYKPI
   tqQyOhsKMopXwXRYstFSInJHwzMEynLuUf2BW1guweE4p2eU6LLUTAFyr
   TmBigvZ3+iiadWZcUohwKPoNHHUhs+DTtcyBXOspJpFsTCScaFq/YcrTX
   g==;
X-CSE-ConnectionGUID: 98AHc3npRk+EzdltPsIAMA==
X-CSE-MsgGUID: GdpP9uKbQFy3C2Sp7yJx4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54572513"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="54572513"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 12:30:18 -0700
X-CSE-ConnectionGUID: igAndG0vSlaY4gjrZTIw9Q==
X-CSE-MsgGUID: HY/Nf36BSt6s5k2JiBgM/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="160633219"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Jul 2025 12:30:16 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uafvK-0007e0-0C;
	Sat, 12 Jul 2025 19:30:14 +0000
Date: Sun, 13 Jul 2025 03:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>,
	Timothy Hayes <timothy.hayes@arm.com>
Subject: [linux-next:master 7731/9053]
 arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: warning: variable 'len' is used
 uninitialized whenever 'if' condition is false
Message-ID: <202507130334.ddFcXn4N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a62b7a37e6fcf4a675b1548e7c168b96ec836442
commit: c017e49ed1381001ba7a6521daae8f968b11cf09 [7731/9053] KVM: arm64: gic-v5: Support GICv3 compat
config: arm64-randconfig-004-20250713 (https://download.01.org/0day-ci/archive/20250713/202507130334.ddFcXn4N-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250713/202507130334.ddFcXn4N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507130334.ddFcXn4N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: warning: variable 'len' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1094 |                 BUG_ON(1);
         |                 ^~~~~~~~~
   include/asm-generic/bug.h:71:36: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:47:23: note: expanded from macro 'unlikely'
      47 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/vgic/vgic-mmio.c:1102:12: note: uninitialized use occurs here
    1102 |                                        len, &io_device->dev);
         |                                        ^~~
   arch/arm64/kvm/vgic/vgic-mmio.c:1094:3: note: remove the 'if' if its condition is always true
    1094 |                 BUG_ON(1);
         |                 ^
   include/asm-generic/bug.h:71:32: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                ^
   arch/arm64/kvm/vgic/vgic-mmio.c:1084:18: note: initialize the variable 'len' to silence this warning
    1084 |         unsigned int len;
         |                         ^
         |                          = 0
   1 warning generated.


vim +1094 arch/arm64/kvm/vgic/vgic-mmio.c

fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1079  
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1080  int vgic_register_dist_iodev(struct kvm *kvm, gpa_t dist_base_address,
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1081  			     enum vgic_type type)
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1082  {
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1083  	struct vgic_io_device *io_device = &kvm->arch.vgic.dist_iodev;
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1084  	unsigned int len;
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1085  
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1086  	switch (type) {
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1087  	case VGIC_V2:
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1088  		len = vgic_v2_init_dist_iodev(io_device);
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1089  		break;
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2015-12-01  1090  	case VGIC_V3:
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2015-12-01  1091  		len = vgic_v3_init_dist_iodev(io_device);
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2015-12-01  1092  		break;
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26  1093  	default:
fb848db39661a1 virt/kvm/arm/vgic/vgic-mmio.c Andre Przywara 2016-04-26 @1094  		BUG_ON(1);

:::::: The code at line 1094 was first introduced by commit
:::::: fb848db39661a1243f6ae939ef7e9251a765b972 KVM: arm/arm64: vgic-new: Add GICv2 MMIO handling framework

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
