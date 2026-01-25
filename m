Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668523B612;
	Sun, 25 Jan 2026 17:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361195; cv=none; b=BsP+PzvGI/9EUmr7ltCap5Ct7z/AjuPJJvFtWx6ipY2c7cQSKMBkAtAe1SXK214740/YDcq/joFpP9oqZhLoHY+f/X99GAUN8P7VOSy+OD6YQ+MRHqUXvAFvyohOaiNwJR/ZOevZ5Sn1C74QOg0G5gIFaFMEz4O1o+hqXOovGDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361195; c=relaxed/simple;
	bh=BND4Q+Xv8gCxONidUNXfeuZMMpUbjhu81HtjbO8A+0I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jCDQyDbf7Ztc5zp/+U2oWV4IqJ0bjt/LvdcfQy7+WqIM+xtiS47SJWw9KKXCIkcOLm1rBpyWHBT39KHI0mvaysW/Wj9URDqIv7h3qSqp7Cf3RmoFo15smQ76MsmDbaxQBGtkuvygCmMD1Vj0bbEIleoG6fGZXNQNGCitTDrimBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M8XAFkQL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M8XAFkQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769361194; x=1800897194;
  h=date:from:to:cc:subject:message-id;
  bh=BND4Q+Xv8gCxONidUNXfeuZMMpUbjhu81HtjbO8A+0I=;
  b=M8XAFkQLPGEEPqpVdeUaX3XEHwmvbKDoyAINB+XGKECOuEBfIUQK4hA7
   OwZba3ROaLH3GOAZOdaSaXgiC1vnkKEHckkl/kB6V7QFLPJNtZ1i/zKOb
   QgZMn+KuK416aG9V1TZoOQOt2Q7Q35vOHhEGyLBV6zeIE3H2wJjAkmHr0
   XRHFB4cWSOP42kXm4SCUn3gp4VoE4oGYtUPjd9VDg6m7vFcKnFgsE/l9n
   BcsNFiKRa9Jyd7i6hk97GD+p57g5Z1mMNZinZmPqGEO55irIERhZva8f3
   vbeXTHUrYGgdgDJz38YgJoNKwxg1EdVAKu0KC6ji5M6tcovsp+057QrbJ
   Q==;
X-CSE-ConnectionGUID: MnfDgeg7QGmjP5tmbVV3sQ==
X-CSE-MsgGUID: iyp+wV99RIaz42MULfVZmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="81985024"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="81985024"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:13:14 -0800
X-CSE-ConnectionGUID: GjhPIjbkTlWwWPLouZG/6Q==
X-CSE-MsgGUID: 6bNDYOFGTg60ahgHhPMcqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="238741302"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 25 Jan 2026 09:13:11 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3fh-000000001JZ-0aZ1;
	Sun, 25 Jan 2026 17:13:09 +0000
Date: Sun, 25 Jan 2026 18:12:31 +0100
From: kernel test robot <lkp@intel.com>
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>
Subject: [rppt:uffd+guestmemfd/missing/v0 15/17] ERROR: modpost:
 "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202601251802.vpflZwMk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/missing/v0
head:   4ef69952db49cd0d355a1485070765e8b7006397
commit: 6ae245b55ecaeb75e0cfd85588706057b3a699d3 [15/17] KVM: guest_memfd: implement UFFD missing
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260125/202601251802.vpflZwMk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251802.vpflZwMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251802.vpflZwMk-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "filemap_get_entry" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "folio_alloc_mpol_noprof" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
