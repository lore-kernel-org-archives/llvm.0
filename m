Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CCA29B205;
	Tue,  5 Aug 2025 22:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754434496; cv=none; b=GgqKJcuHtNiElTD59v5XCHS+bfms4X+Q8hdDz7lwiPR2rYau9Ejigrkq62BWHNQAVVtVavcTKLOY6YYR21jNsgeW2XIjh2ul5K640vIhDRVC4WaR4Lxd98N8+HJWclZLveoHQp3QlIWBXHbyhYJs+A5BulBcrbqI/r/+4WwMDUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754434496; c=relaxed/simple;
	bh=fcNqRjFt4n9TAY+e9myyCi+9b5Ecwj6LAM8b65pleFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlbCQYECjR05oxKV7V/BD9ET/xN9q8LLR15N5Tn4UXVtzi7WRCn0dbQpT7X1uxIs4XFkvN0iFWbA8CAANYV/XrMEDimTIuTHfs0zU5iuXiieA/y5yT8+z5HntVHraEecM/RNLFY55nv7wihuxBuoEtPHQBxgh6PGtVGjVkqXdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cu3+a+Jl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cu3+a+Jl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754434495; x=1785970495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcNqRjFt4n9TAY+e9myyCi+9b5Ecwj6LAM8b65pleFA=;
  b=cu3+a+JllMjBzJaZzaUfF+BnTfD8fK1gXw+LB2SynWnOCNX4oHNAeTu3
   +o711M+Zm6IGJSrWR2GYjPEzhoN3TF/juJ4vkCn+u7KBSffDIS7+MphGx
   k8CB4YA//Au/0cGU/oSdL7sxkJad5g5flmLnGm1aunRd3PYWAWUx4cUan
   iQMe+MPnLYC/iWo8BnxxD1JySJTMai31VLnfY/SpawPWH6Uy/P487OV0l
   vh+G2wpXHu1m6/IzTeZ4u9URaUs1VG+Mrw6KTWfO/o0LOW8ECRnc62nUL
   OFYwdxD6zW2CzNw/5ANztYC/UovAz4Py45ObITdwVQMxwnNBRNhoCyGOv
   A==;
X-CSE-ConnectionGUID: OHg6auxlSw6H+hFs13GpnQ==
X-CSE-MsgGUID: EHnQyVdJQRqNsOYtSmPZpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="68198224"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="68198224"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 15:54:53 -0700
X-CSE-ConnectionGUID: 3Cj2s2vJRaiiRR0zaOQDsA==
X-CSE-MsgGUID: GBTDJAIwRXyEIWjEONA+XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164282554"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 05 Aug 2025 15:54:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujQYT-0000pC-1o;
	Tue, 05 Aug 2025 22:54:49 +0000
Date: Wed, 6 Aug 2025 06:54:31 +0800
From: kernel test robot <lkp@intel.com>
To: Lyude Paul <lyude@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip 851/987] warning: associated items `as_ref`
 and `as_raw` are never used
Message-ID: <202508060607.YkwmreFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   0fcda52c969c6fe276e3f63f02438233ca592077
commit: 835791f8b49eaf3179ed9d8dd51f0efd00ab0648 [851/987] rust: Add dma_buf stub bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250806/202508060607.YkwmreFY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508060607.YkwmreFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508060607.YkwmreFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: associated items `as_ref` and `as_raw` are never used
   --> rust/kernel/dma_buf.rs:31:26
   |
   23 | impl DmaBuf {
   | ----------- associated items in this implementation
   ...
   31 |     pub(crate) unsafe fn as_ref<'a>(self_ptr: *mut bindings::dma_buf) -> &'a Self {
   |                          ^^^^^^
   ...
   36 |     pub(crate) fn as_raw(&self) -> *mut bindings::dma_buf {
   |                   ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
