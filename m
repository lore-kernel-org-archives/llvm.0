Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930BA3D8115;
	Tue, 15 Sep 2026 04:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448254; cv=none; b=tfydrgaSEOVw4bHmFtXZbaMgv551muye/7t/Bw4s7U14XWpLbGK0SI5o5CcNjDV4glnFz0k9gcXddpNtRuzvqI07HJi0M7b96eQyMref9F7EGyni/xqiEGM1RVbShb0MuwKB1853BmxvqaMhJAaZGj2/jWDGMGZ+csEv8Cx25Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448254; c=relaxed/simple;
	bh=Q9UITFlJXi0PtwndXc7HQFMPi6w6HLIYf1ZVZILckzo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=N8+9byHVPu2k/t1QW3QlY07gGHh+FmT/wwRPM8zWikyLELLFuardOx9kQ0omRD8d5dPx/6RYUSb0TgN/KD/e6Ft1H95a1UyfO8ZQE0FfDEy+MYdnqjoOx245Vam81PqwTc/vIP+XW6ga80Z9vZwvIOulNb3Qd/61o6H1alw89ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bU+7Ekhv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bU+7Ekhv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789448252; x=1820984252;
  h=date:from:to:cc:subject:message-id;
  bh=Q9UITFlJXi0PtwndXc7HQFMPi6w6HLIYf1ZVZILckzo=;
  b=bU+7Ekhvu5nXsw4SYtWNc7hGP+NRmYHmUN7R0yUuXJVIKm7xLZxLXWKU
   SKGtjsYDPqUjQLs2NABI6p1mf0e5y3BH0uz1aLoG8CWNyxGKVPosH1PAE
   5FODsPdQ33uxijvb0DZNwXBMMo0RxkyvrMtne50ra8y9hy0ScQW29tjAQ
   66uO9JJWy0jsw/gCAZthBCyqVLTwUwiqEKGhD8jlKe+YFyof8YrVEjEIu
   L4D7Eks8SD/cL/Ejtwf657nPoS+NFYnwPfnfiXjLG9p/ETk+U4F/Nxzqe
   FCxroxRO8WwOGIxujPpnQVMPnYg/ba6BFZwnDno3tOvHJmUBSGslyy73f
   w==;
X-CSE-ConnectionGUID: Zo/h2eeTTwmzAY/GM42Xxw==
X-CSE-MsgGUID: KMj+UPcHTQiv5RAHPh6GTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90009881"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90009881"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 21:57:32 -0700
X-CSE-ConnectionGUID: 8XHsV4PJSRKbwC2Z+aUzQw==
X-CSE-MsgGUID: fYsXnhe1S7CNXjTOJ1ZlAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270211492"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Sep 2026 21:57:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6LEV-0000000042s-1mDO;
	Tue, 15 Sep 2026 04:57:27 +0000
Date: Tue, 15 Sep 2026 12:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dakr:poc/vgpu 42/44] error[E0425]: cannot find value
 `VFIO_DEVICE_RESET` in crate `bindings`
Message-ID: <202609151201.FBKNjbSo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git poc/vgpu
head:   6292c1de7f0758dd31496a454b4034507f38bd40
commit: 484316d855e3d61873122c295feb9a7457eeca21 [42/44] POC: rust: vfio: add vfio/pci rust infrastructure
config: x86_64-buildonly-randconfig-002-20260914 (https://download.01.org/0day-ci/archive/20260915/202609151201.FBKNjbSo-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609151201.FBKNjbSo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151201.FBKNjbSo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `VFIO_DEVICE_RESET` in crate `bindings`
   --> rust/kernel/vfio.rs:18:41
   |
   18 | pub const DEVICE_RESET: u32 = bindings::VFIO_DEVICE_RESET;
   |                                         ^^^^^^^^^^^^^^^^^ not found in `bindings`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
