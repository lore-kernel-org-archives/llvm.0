Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F142A93;
	Sun,  9 Mar 2025 23:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741561661; cv=none; b=e8jsg3+saBIAUx6C3vGWBzvSv+/uHZfl9fnomTetSyu6byfSh1s70BozP26qXAim3jSsFBkLVXPh/T/s4DDaAY7ANeJp/KpIAhDKPglLbMFT6TLP5SJpsC+L2cM7s47ps2SLp+yys6NKVnKzaU3KDu/KIyl6WI0ZY5b9Bo7lxvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741561661; c=relaxed/simple;
	bh=rEpLhqk869lzpeJWsvwak4s091NymFp9e+YIu4RYSQw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QHvwtJSGySbtSNeEZbiYPlocEnRhl5P1nuXL5skmOzX4+6i1GhaoGcHWq7pbGp+vOeQ8s7d1k4Xh0DLaXo11mFSDyxFI2HckwiwkvXqbOH6fYJFOCqY2UtEtADYyQu7MHc3c7yu6fLxv8uOkXkWJQdpHUxGM/LnrUtdLNfysfnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lHvMBow1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lHvMBow1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741561659; x=1773097659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rEpLhqk869lzpeJWsvwak4s091NymFp9e+YIu4RYSQw=;
  b=lHvMBow1GucFeZV/yPXwucCql0dSNheawkJVdFHC8fL5zzCH9f231NJt
   s9Lhw4ANeLTlzefgLSS6saDdBx5WTSphpoyhPeJc41X0TF68VWY95i3W2
   Jr0dvxUowpENT/xfii+bXJupvq3EMvUMWF74dYt8r5XD4uvImgs+88eAJ
   x5eYhu1rFVOWiCTJs20PHgLjKkRbO6L6yJF/GU9nID/g6l+Lylpu/GDRi
   O21fbhDOS4fzaetlBu1zXMUE6nJssSJCYaMAEMmAjVmsdidtzawIU/1+U
   dKZ49ZN6Q8kptW6Y90PVOkATFiTfSQPzCVKPqA70nZCuxv2ZIMkPzsz1h
   g==;
X-CSE-ConnectionGUID: IsA2YDIeSjCn2Rs/n4gR+g==
X-CSE-MsgGUID: NRYg42VmSTCvgR3fh65lUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42685484"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="42685484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 16:07:39 -0700
X-CSE-ConnectionGUID: Z6ffD1W3Q3GhJjPAD48KCg==
X-CSE-MsgGUID: 3oWfzfJAR7mFxHTCIGE9Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; 
   d="scan'208";a="119995845"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2025 16:07:37 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trPk7-0003Xc-0i;
	Sun, 09 Mar 2025 23:07:35 +0000
Date: Mon, 10 Mar 2025 07:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [asahilinux:rust/drm-gem-shmem 7/15] ld.lld: error: undefined
 symbol: drm_gem_object_free
Message-ID: <202503100748.2SEJgriN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux rust/drm-gem-shmem
head:   339fbb10e073c12025d871fe8e23c665c28767c4
commit: d7e517875764fee099f293a0d6642a840929d5db [7/15] rust: drm: gem: Add GEM object abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250310/202503100748.2SEJgriN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250310/202503100748.2SEJgriN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503100748.2SEJgriN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_gem_object_free
   >>> referenced by kref.h:65 (include/linux/kref.h:65)
   >>>               rust/helpers/helpers.o:(rust_helper_drm_gem_object_put) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
