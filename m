Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D1526F443;
	Thu, 20 Nov 2025 09:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629970; cv=none; b=AGc/Yf3opjmlpNI38kd0BrOCv1m9r5eh6kezSz2lYtUNpnPpCN4J7oKZ4KKUDLH0nuJxGugA4fBogesr9mp99ifSmNI/48JfER0p+lQCBBXCtk+/hbU9nsjW0GDyIblhs998XgSZCParvQ71VVfsTku6RBUVyvshhB9DxESqAiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629970; c=relaxed/simple;
	bh=k/OsCn+VKOProOq6S3OuhfgntVL41+mM/PisTG2nLIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dq7ci9L8nIQpHHKcizWYhW8dPR4nF8liMRVs6/BiCfck2PbRbmSvchDj+L4Rgc+GgmEjZtmuvExTKoIYyU3OF7hdGdkJ1DolquYLYVESAL+Trs0TUhCuR+fcCU/PX3yW0m9KGybiVcAI1UdeyZ8DnhsFlEm9vs0nIz1ARqrwLKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnqXo6iT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnqXo6iT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763629969; x=1795165969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/OsCn+VKOProOq6S3OuhfgntVL41+mM/PisTG2nLIs=;
  b=FnqXo6iT6YNQ55F4kmXZ1pUCzTgrBN3t0hSDDVX/yDgGQGdPFv78JoT2
   9NWCeuQVpyUigff/A7k3KHQvVMfes13VpKsYQJV3+QyLvk+9ffTyREbt+
   DKPQ4XyYFshfSiFMJcjfPIGOTbd/xrMhEdGA7T2cGRmBp27dRGLUtPBTA
   xaB2WdQ+GEkiJU1BpIz/oQlybwAE8aJHnB/DT6pB8Z3I2DkCExMabCLaP
   BDLWudl3QbaNl9JY9KxfLO62Ozx7yCHbvMpRkkXC01dkue+St5w4aM9jq
   tpwFChTvcEfY1L29SS4aHUmzCMjM3MOdMX22Jmd/kMWSfO0zEWZHAMLdM
   g==;
X-CSE-ConnectionGUID: gVz/swO5QmenBL9W7cNrIw==
X-CSE-MsgGUID: VkHQ9duZTtWY97srNN5MRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="65570882"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="65570882"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 01:12:49 -0800
X-CSE-ConnectionGUID: ZuF1wavUSGW9CV2GS3hVnQ==
X-CSE-MsgGUID: jUYh+RrWR3u8y3enrHcsXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="221955192"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 01:12:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vM0ia-0003nj-2r;
	Thu, 20 Nov 2025 09:12:44 +0000
Date: Thu, 20 Nov 2025 17:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Matt Gilbride <mattgilbride@google.com>
Subject: Warning: drivers/android/binder/rust_binderfs.c:229 function
 parameter 'file' not described in 'binder_ctl_ioctl'
Message-ID: <202511201725.ni2HZ2PP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23cb64fb76257309e396ea4cec8396d4a1dbae68
commit: eafedbc7c050c44744fbdf80bdf3315e860b7513 rust_binder: add Rust Binder driver
date:   9 weeks ago
config: loongarch-randconfig-6002-20251120 (https://download.01.org/0day-ci/archive/20251120/202511201725.ni2HZ2PP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511201725.ni2HZ2PP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511201725.ni2HZ2PP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/android/binder/rust_binderfs.c:229 function parameter 'file' not described in 'binder_ctl_ioctl'
>> Warning: drivers/android/binder/rust_binderfs.c:229 function parameter 'cmd' not described in 'binder_ctl_ioctl'
>> Warning: drivers/android/binder/rust_binderfs.c:229 function parameter 'arg' not described in 'binder_ctl_ioctl'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
