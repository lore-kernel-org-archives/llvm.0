Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1D01946C8;
	Thu, 29 Jan 2026 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769692739; cv=none; b=BjlN+YipRh7R0RMYyipFJuWDUIqLM++NGfFdQ5Ozo9xVUHF2DJDlR6y5QfwBO/UjifxVDu/a0sdBgYPVFh93QTc5HgX6y69HXN0ZoJFs627TY6fpDWIV0oGnnicvzDXU1QpUiypaEPOZp1vwYzlPl1Ss8Nqv8KnpVivW5CYxo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769692739; c=relaxed/simple;
	bh=THEofvebyW12X7QY78SkGUmYHvsBlYZENN2vUVjz8gM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ww4PayeCP+tA4mOmsOE5j2F9ECSppGc4VzRoTMo/6pz8gGCIzULjXSO1KIa9NzedRmenc/xjYRkGn1Xl6G7961xnURFnMBPHFR3Na9U1JGR1ZbHM59a+qwk1BNKxn09bhX6AiK1wtnHMHoeb7bv4A5F9W7L2RparswTOF/H0GRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSig/iYH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSig/iYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769692738; x=1801228738;
  h=date:from:to:cc:subject:message-id;
  bh=THEofvebyW12X7QY78SkGUmYHvsBlYZENN2vUVjz8gM=;
  b=cSig/iYHJ8p3KAMC/7aoBDDEinx5n0nq9F/3saCilx0rNXUBXmnapz8f
   xGxglEzm++N3oZyRheUHTA3/U52IHC9IPgQ7Wr3wjNxWVEcVpsn1uNI4+
   sW56aIMDHfakmnoSWGFyTYqPfFuNaVRISK2LkSTQdFQspQBTSDnplA0h2
   bJQXUQSU5+ZefYdm9qr7QhxsnCft93SCL7XaMtKr4+w1Y9BizAPIlc36n
   R1/U8x2919Ow1Yu23XgTRZ3+b+AiuHzELEDdvmTONEaAHW0u2he5Rjtc1
   ogrWr5OrfwgcEVRTNf4QajWYVgevUevcPpV9YLbHBFHQrqwdiv2wR9GNa
   A==;
X-CSE-ConnectionGUID: wEKAsJaSS6COuUhCenL0eg==
X-CSE-MsgGUID: ijhJbShAT7qptCbQDM0XUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="71095856"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="71095856"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 05:18:57 -0800
X-CSE-ConnectionGUID: jnBJ9gLDSWGkIRDUV2Adiw==
X-CSE-MsgGUID: j8kRbRCWTkmFwZak3g2lEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="207826257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Jan 2026 05:18:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlRvA-00000000bV4-34BJ;
	Thu, 29 Jan 2026 13:18:52 +0000
Date: Thu, 29 Jan 2026 21:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Kalyazin, Nikita" <kalyazin@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>, Nikita Kalyazin <kalyazin@amazon.com>
Subject: [rppt:uffd+guestmemfd/rfc1 15/17] ERROR: modpost:
 "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202601292155.Zc0CszAL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/rfc1
head:   c51586060fa31fe51e9cb6da461de308eb446c16
commit: 20d56f0fda9250ea67280d85dab67ef0cf883a99 [15/17] KVM: guest_memfd: implement userfaultfd missing mode
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260129/202601292155.Zc0CszAL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292155.Zc0CszAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601292155.Zc0CszAL-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "folio_alloc_mpol_noprof" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
