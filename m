Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5E32ED40;
	Mon, 15 Dec 2025 23:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765842929; cv=none; b=pbLeefhFdrhjk/5iF2G/DkvBalccflYo78W20+bnX3xSEGHPAJo74Gmu0aiY8OF/bqBg1B0xPK7rcWv8mih+lM1s6q13/C941Bz885ue4fz5q45ig5K22pV2ZNNfsRvgdBmcTQ9qQm0BX2/2Kc7k+ToDA0JWAW3Qt0uNdS34Q90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765842929; c=relaxed/simple;
	bh=BjvV+W+NnpMyMEpT0XXNXjftK0JuvfbiZBoT1H/uhOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bOiZg2OCpnBX1cIARSnzryw9ZDHdbvhAkuu2kmi6vBRHMeUV+x0UX9ve5XopbC+ykt6wqTYPLCjgCdUt3m0aUvDz8wxFdA/6RaGhy5ILDaP0MGwXcDCyCKWEIoXVs2fPnTbYEa/uYKcvqfL205cPnEaJHEch9dsxYDyDrs9mX8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXW1ga6m; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXW1ga6m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765842927; x=1797378927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjvV+W+NnpMyMEpT0XXNXjftK0JuvfbiZBoT1H/uhOI=;
  b=EXW1ga6mGYzTw2Ecran3X8VaX27bLLSsWRyjn64ejDpSgjm9zQrZSpcH
   FWsvAt0TmEY4bLz13TFpU+059k7HShANUlWk8wgr21NRkJZt2F2jl18up
   jx3vOJ6Y1ZVK5w1m2OwbN3I4C/GqeiF2GVqtAFpftCURLmg1aoSifKaRJ
   kWBjs9Ls8Dnxh6ZXUHK8bs2vSt3xhXhrgHP+6irnE/g19jsmNyk++2Q9t
   +ydoGZMfXSsKXSdlHXKtrE3eIvh2nvDxgLous8d1uHPDXgcoruH6JUyTu
   JCrdoUPiwoHUr/wHD1/i8crj98aWDPhdHfJjaGUHXSL2ogl534/6NQcTi
   Q==;
X-CSE-ConnectionGUID: a4oiol1OQpqd3KyD6m5bdg==
X-CSE-MsgGUID: t3Pp4ZK8Q56XAmKBA9X90g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="70336259"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="70336259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 15:55:27 -0800
X-CSE-ConnectionGUID: 1zk8O3ziRg6N25QfcsIgcg==
X-CSE-MsgGUID: j52csY6uTAqYxVVzZAJ2mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="197135639"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 15 Dec 2025 15:55:25 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVIPH-000000000wH-0EpJ;
	Mon, 15 Dec 2025 23:55:13 +0000
Date: Tue, 16 Dec 2025 07:54:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: WARNING: modpost: vmlinux: section mismatch in reference:
 __apply_fineibt+0x1a6 (section: .text) -> text_poke_early (section:
 .init.text)
Message-ID: <202512160706.tc6b0Ytj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 23ef9d439769d5f35353650e771c63d13824235b kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
date:   3 months ago
config: x86_64-buildonly-randconfig-001-20251216 (https://download.01.org/0day-ci/archive/20251216/202512160706.tc6b0Ytj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160706.tc6b0Ytj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160706.tc6b0Ytj-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x1a6 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x25a (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x381 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x45e (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x485 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x5cb (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x7b2 (section: .text) -> text_poke_early (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x83a (section: .text) -> text_poke_early (section: .init.text)
>> WARNING: modpost: vmlinux: section mismatch in reference: __apply_fineibt+0x8b1 (section: .text) -> poison_endbr (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
