Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B8D35A925;
	Fri,  6 Mar 2026 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772798380; cv=none; b=jLQfEOKmS2uK8fvK8tXo5/qI/0ViMQft7VrNJhmADBP2LRuJGdOWuUVFUxAzfbiUS2bIvYDzsGAynJYDLXXNeGwuwqJFVtAQmWPGIbPyomXxodcefO3HJ4xK7Yti7v5u/FrPCbthvlRV0/Dvbe7sFcwGHquTe+z8UahYmZDbNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772798380; c=relaxed/simple;
	bh=hD58Kz5W/qYCsmViCr+6L6YJ969I5pE8ce9q0lyL4d4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOxt6FNKPfABQ8sEreA157N470p7iTor7stmybhfxSnyKG1pL73LtNIQwiSHh09Nct8K2oRUSgFA1w4Rd4yqXIw1aUvFM2AZB4+9M4YTIVEomvZzpnAvWalJxHwu3EBWeLHuYa6I7DYQMoEGykDU5FJtA4DQnCc+AZf0WppfEpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bd/z+KVn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bd/z+KVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772798377; x=1804334377;
  h=date:from:to:cc:subject:message-id;
  bh=hD58Kz5W/qYCsmViCr+6L6YJ969I5pE8ce9q0lyL4d4=;
  b=bd/z+KVnPTNWxCsYbA/dkZYPwr6gmc+hR4Z2O6S04t6vr+1tEaw4uMnT
   +6L6nTfRYvsuNs7wXgIw1GvTJ/xso6cP/0NkqRPxoRC5Fg0zTf9Z3JTVY
   x4GfPvNHfMpuQteG5KiltyfLp8wbfTiDU/oYEUQ5sU3FBojaBwzsqM+Lc
   kXyiJOwuldKrU5Z7UFStp8rh4+KBeke/rcUcjj1e9qVPFDaQtm8ZHE8/m
   aRTw39pMi1WOeGEXxK+csmCEQpcJdL2GR93CoDgj4as/Z/XQynsM2DMF6
   zjq9UZNi1LvoTRuxG6EW+QRyBBCVbwGc2p4ife+aw4QIiDzfd4hak6ZTP
   w==;
X-CSE-ConnectionGUID: 2PllHGI8Q2iSxg+ofEy7Bg==
X-CSE-MsgGUID: aTkLbUOkRg+w9WMhDNK/JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73817429"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73817429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 03:59:36 -0800
X-CSE-ConnectionGUID: r5FwpC93SAOXLPbpG+uDDw==
X-CSE-MsgGUID: KddHo3qkS3m6yLaUo3ftbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="242001172"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2026 03:59:34 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyTq7-000000000oT-3Ngb;
	Fri, 06 Mar 2026 11:59:31 +0000
Date: Fri, 06 Mar 2026 19:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 3953/3989] WARNING: modpost: vmlinux:
 section mismatch in reference: get_tdx_sys_info_version+0x3e (section:
 .text.unlikely.) -> read_sys_metadata_field (section: .init.text)
Message-ID: <202603061933.R3ZgUU4I-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3f9cd19e764b782706dbaacc69e502099cb014ba
commit: 06c335a34d8f01bf287bdae7c6b931c7797d5785 [3953/3989] Merge branch 'next' of https://github.com/kvm-x86/linux.git
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603061933.R3ZgUU4I-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061933.R3ZgUU4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061933.R3ZgUU4I-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: get_tdx_sys_info_version+0x3e (section: .text.unlikely.) -> read_sys_metadata_field (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_tdx_sys_info_version+0x90 (section: .text.unlikely.) -> read_sys_metadata_field (section: .init.text)
WARNING: modpost: vmlinux: section mismatch in reference: get_tdx_sys_info_version+0xc0 (section: .text.unlikely.) -> read_sys_metadata_field (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
