Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA076189906;
	Thu, 20 Nov 2025 20:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763671399; cv=none; b=Iu5xYAezYTehxmkMvF7KKxrpPXFb0OBt/EkgiXe1JK0qCPVRd9nE3aUFggGM/LQfNj+w7I0FH2DEQh+oMrUrv8DS/c5IbuXQuI486pgAgWC3u4b6z8cod3bDbTOKV/8hjzjBLxFBJiitHqmFn1I7QDXYWVqjuWk3E346mWcCmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763671399; c=relaxed/simple;
	bh=RmDm6iWSNo4JUfjNmPGJ5J8hTvB99fOJwT+n+YKiTfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSfY9CWp7oTV4CzwjFVxN6w+TtiBSdvOds410pYqqmiWk6HuEO2j/PeFCKCkUenTssVAso88hT0Bqsqc3nc06KtqlQhvn6CeSXaY/XfCEAUYyc/Q14m0XyM+r6/cMazqFS6tSPsVV7UfKzELSKGuloKvFU7TxNOQ3xBCL2QW0c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRPtC0ae; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRPtC0ae"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763671398; x=1795207398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmDm6iWSNo4JUfjNmPGJ5J8hTvB99fOJwT+n+YKiTfI=;
  b=gRPtC0ae9rlYGDDxuWYdHUX9WEw0kuUdkobP0T6I/58657PQo/yLMaRz
   Vn0S0T3t08tM7j7IWT3KNdcJfZ2rg9lqP+7HHyHfqKMyZEjuMbgAF+PGJ
   O3wmzrWLVJyb4tCkzHlOtTows3lszx/bfmbtSMODVs+FU1cN64vhbCZAK
   szoAck/FcxUlI56+LyuFAnaiBLNDAa0FYIFORGHkU5HzdB/KoJB6Cr8Ag
   GGWFHmCVK/0oougl0nbaqEautKinhb8cBcV+/yQkYXyZFHTnRH3D7ulu3
   eV+VwGPum4HkXlDXrePUEnQk3CIMLZMdfT2miwcdeVugCRNMPF1ePd4mR
   w==;
X-CSE-ConnectionGUID: EQyaFzT1TjSclP1nJTZK0Q==
X-CSE-MsgGUID: Mhdjrk2bSlqwN8F0pdomzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65634620"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="65634620"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 12:43:17 -0800
X-CSE-ConnectionGUID: fXbEA3yVQ1ex15latgha4g==
X-CSE-MsgGUID: Hsvy9S5sTdiTo++VH43Oqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191732008"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 12:43:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMBUn-0004YL-2i;
	Thu, 20 Nov 2025 20:43:13 +0000
Date: Fri, 21 Nov 2025 04:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [linux-next:master 1226/10599] error[E0425]: cannot find function
 `pci_alloc_irq_vectors` in crate `bindings`
Message-ID: <202511210419.Kj66Tysq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
commit: 340ccc973544a6e7e331729bc4944603085cafab [1226/10599] rust: pci: Allocate and manage PCI interrupt vectors
config: x86_64-randconfig-074-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210419.Kj66Tysq-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210419.Kj66Tysq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511210419.Kj66Tysq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `pci_alloc_irq_vectors` in crate `bindings`
   --> rust/kernel/pci.rs:628:23
   |
   628  |             bindings::pci_alloc_irq_vectors(dev.as_raw(), min_vecs, max_vecs, irq_types.as_raw())
   |                       ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `pci_irq_vector`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1225:5
   |
   1225 |     pub fn pci_irq_vector(pdev: *mut pci_dev, nvec: ffi::c_uint) -> ffi::c_int;
   |     --------------------------------------------------------------------------- similarly named function `pci_irq_vector` defined here
--
>> error[E0425]: cannot find function `pci_free_irq_vectors` in crate `bindings`
   --> rust/kernel/pci.rs:654:28
   |
   654  |         unsafe { bindings::pci_free_irq_vectors(self.dev.as_raw()) };
   |                            ^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `pci_irq_vector`
   |
   ::: rust/bindings/bindings_helpers_generated.rs:1225:5
   |
   1225 |     pub fn pci_irq_vector(pdev: *mut pci_dev, nvec: ffi::c_uint) -> ffi::c_int;
   |     --------------------------------------------------------------------------- similarly named function `pci_irq_vector` defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
