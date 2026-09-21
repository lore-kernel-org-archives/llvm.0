Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDF0318146;
	Mon, 21 Sep 2026 03:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789963116; cv=none; b=AbN0haD21EsVHOMtUUfA9S/H9g8iagOmWMrB9Vxvbd8wjd42OyCjr0Z5EE4dFvAHQ6DR5tZ4EDq3x7o2ZAYX/zt+WF+lghccHkkMa/sJ5Rj/tJVi9bj6PEt8e0Dwk7xGrpO8tpOPVAWWk3/4R3XNEEX2gG2iayt5LQS49qmnRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789963116; c=relaxed/simple;
	bh=V5Dz0iF0fLhKlPe9UXVkmYw6yu6lz1ZLz2hoieM5OkA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GB0FLWGsvAXfW9VpATni/IRMRuqcSKfGIZ2N9FqtGPnYvFp3pwHCba8Z1flkATo63WiwS6LeYbeXy1cvykJNNQdYdXg6EJl1CRzHvE7qqOAKx01rXS0jWFytuAk7fCwHKJWxSXJHK75r35oNFXcLmcr0kl9qIw9U8Vw3MQtXLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O11vjNRv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O11vjNRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789963113; x=1821499113;
  h=date:from:to:cc:subject:message-id;
  bh=V5Dz0iF0fLhKlPe9UXVkmYw6yu6lz1ZLz2hoieM5OkA=;
  b=O11vjNRvs/llRKUentjHRTk7z21LX6fFApLWE2DzvXHn9CHeekdv1b4d
   9HCehfRtpze777yNCSSv9SSwbWljDSwqgItJN/arAcjakENbp/0VAjfGd
   P39jhyT6hDBByJIWJpHWej5dz1cv936Xcv4wsCsKjynOTbM4Bpe4RFxvD
   iN0CH2SvKVv76SK6XFoAAzd14TfcbZkCTeqL+RwEvu8YkgGykmrHFJViA
   FRTnVm3y9U7Yerag/h25iaCqerzb/OIPhF1GsD7iR9KMni1SFGzRuMHlF
   K4om+p6Gfwwy373VfaHaNvl2BZpXmEr3S3NboQU0hdmVBCjrsPBaAxP3h
   w==;
X-CSE-ConnectionGUID: rgZpWVkeTNKneoN8fItNCw==
X-CSE-MsgGUID: /bUqACAgQHiKergT5tsPBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="78019460"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="78019460"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 20:58:33 -0700
X-CSE-ConnectionGUID: MVBhTT1tSDGS98EwSJKAbQ==
X-CSE-MsgGUID: DZ2vNYs0RbiHbtFzfhAyfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="280537178"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2026 20:58:31 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x8VAi-00000000DFo-3nYU;
	Mon, 21 Sep 2026 03:58:28 +0000
Date: Mon, 21 Sep 2026 11:57:40 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [linusw-nomadik:b4/ux500-audio-graph-card2 5/26] ld.lld:
 error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x734): unknown relocation
 (41) against symbol etrap_irq
Message-ID: <202609211120.1ric2KZz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Linus,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-audio-graph-card2
head:   ba26e4e9cae9a3e1c396d1f4a34970d7caa166b0
commit: bd19dc64243c585c8cb3c164b77a3f5d42b92771 [5/26] ASoC: ab8500: Remove the nonfunctional sidetone apply control
config: sparc64-randconfig-1001-20260921 (https://download.01.org/0day-ci/archive/20260921/202609211120.1ric2KZz-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260921/202609211120.1ric2KZz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609211120.1ric2KZz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x734): unknown relocation (41) against symbol etrap_irq
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd24): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0x8c): unknown relocation (41) against symbol rtrap
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x744): unknown relocation (8) against symbol rtrap_xcall
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd2c): unknown relocation (41) against symbol user_rtt_fill_fixup_common
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd34): unknown relocation (41) against symbol user_rtt_fill_fixup_common
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x9e8): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xc0): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xd4): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0xfc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/urtt_fill.o):(.text+0x10c): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xd9c): unknown relocation (41) against symbol rtrap
>> ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.text+0x9fc): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xe9c): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xeac): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/mm/ultra.o):(.kprobes.text+0x84): unknown relocation (40) against symbol __flush_icache_page
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfb4): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfc4): unknown relocation (41) against symbol rtrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0xfe4): unknown relocation (41) against symbol etrap
   ld.lld: error: vmlinux.a(arch/sparc/kernel/head_64.o):(.text+0x100c): unknown relocation (41) against symbol rtrap
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
