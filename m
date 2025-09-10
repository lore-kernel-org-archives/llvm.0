Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30D923CB;
	Wed, 10 Sep 2025 02:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469613; cv=none; b=IrVs2TtvhpMV9xHSQCsNE7zxpMrcl/Y5c2xTtyiPfR/pKA4bqGVu6PLLK26hTehWGo9M1bg7RZTpF46j5Idettwh0PYX5V6flWno/gZiVodXrXyYu38CFV4AI/ZTxWCq1eEc9XOWI6sw4zFvnY9Sy/JmqYa0y8v+99abegxbcfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469613; c=relaxed/simple;
	bh=9uNVYA6bQsLeIlcSriXDNODrgpeX3pRRWc2jn9rLPSU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f+/Cp/jmHGiNaocJJKOcpaCIPVW6ZZIZoyd3WVAitimf2yTsmwX8/tX+JxnhAYe1+wS75MNolsd9QbWBUWPVs24ZU6IyfY4tfGy1s0n32pM03WlcMr5Pq4G36N/HtrkirO4A8kGLPan9QND2gmkLqkCQS4EOsPtaNXmYe7HcKWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7Wv9x/N; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7Wv9x/N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757469612; x=1789005612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9uNVYA6bQsLeIlcSriXDNODrgpeX3pRRWc2jn9rLPSU=;
  b=e7Wv9x/NLAcgFGUoX1iJrn85RILxBV2h6ezJyoR2Ktn/PDARU2V4zleq
   ZfVbVBThdbD+XYpGVo3g+N8PLzwaLYlYT/DHAN3aCl/lbdUBNq1banubw
   cjVlP7VRPtQYj5Ljvz4aJ/QJz0pKx+byIke/CRHapglnAA4cqjdrmPTWA
   YWlCdWPFiJX1rqz41P1tvR8J0Ij+2gPKixH+8BKjzXHjNIyL3BRjUEfUy
   v4BILsVp1oIBGMGkws4LqMCYuFqjqcHjyfgeMjWQDpMo5ulsuH4739/mo
   ZMC1sXCZQlOG6qC0uTgirN79LCvEHgpHljEAXCSHCa/21rpajtIQh+tI7
   A==;
X-CSE-ConnectionGUID: FbOEwhDzR8W/SmmVO3hKxA==
X-CSE-MsgGUID: guFUfhhzRd+E0HFkx8upPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63400527"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="63400527"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 19:00:11 -0700
X-CSE-ConnectionGUID: V1Afd34XTMGXbIWsJ7e28Q==
X-CSE-MsgGUID: 9ShEx5tATNSpS64+7z2MSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; 
   d="scan'208";a="173105084"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2025 19:00:10 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwA7z-0005RH-2S;
	Wed, 10 Sep 2025 02:00:07 +0000
Date: Wed, 10 Sep 2025 09:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/dev-bitstruct 21/21] error: cannot find macro `bitfield`
 in this scope
Message-ID: <202509100920.CWJrFk1g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/dev-bitstruct
head:   6057391d7392c11cd5f8c33c41a5704e68504ab7
commit: 354bc8b929b01ff2c5a095d0599346743c5cfa2d [21/21] rust: Move register and bitfield macros out of Nova
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250910/202509100920.CWJrFk1g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509100920.CWJrFk1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509100920.CWJrFk1g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: cannot find macro `bitfield` in this scope
   --> rust/doctests_kernel_generated.rs:2570:1
   |
   2570 | bitfield! {
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::bitfield;
   |
--
>> error: cannot find macro `register` in this scope
   --> rust/doctests_kernel_generated.rs:6194:1
   |
   6194 | register!(CPU_CTL @ CpuCtlBase[0x10], "CPU core control" {
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::register;
   |
--
>> error: cannot find macro `register` in this scope
   --> rust/doctests_kernel_generated.rs:6408:1
   |
   6408 | register!(CPU_SCRATCH_INTERLEAVED_1 @ CpuCtlBase[0x00000d04[16 ; 8]],
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::register;
   |
--
>> error: cannot find macro `register` in this scope
   --> rust/doctests_kernel_generated.rs:6463:1
   |
   6463 | register!(BOOT_0 @ 0x00000100, "Basic revision information about the GPU" {
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::register;
   |
--
>> error: cannot find macro `register` in this scope
   --> rust/doctests_kernel_generated.rs:6579:1
   |
   6579 | register!(SCRATCH @ 0x00000200, "Scratch register" {
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::register;
   |
--
>> error: cannot find macro `register` in this scope
   --> rust/doctests_kernel_generated.rs:6583:1
   |
   6583 | register!(SCRATCH_BOOT_STATUS => SCRATCH, "Boot status of the firmware" {
   | ^^^^^^^^
   |
   help: consider importing this macro
   |
   3    + use kernel::register;
   |
--
>> error[E0405]: cannot find trait `RegisterBase` in this scope
   --> rust/doctests_kernel_generated.rs:6179:6
   |
   6179 | impl RegisterBase<CpuCtlBase> for Cpu0 {
   |      ^^^^^^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   3    + use kernel::io::register::RegisterBase;
   |
--
>> error[E0405]: cannot find trait `RegisterBase` in this scope
   --> rust/doctests_kernel_generated.rs:6187:6
   |
   6187 | impl RegisterBase<CpuCtlBase> for Cpu1 {
   |      ^^^^^^^^^^^^ not found in this scope
   |
   help: consider importing this trait
   |
   3    + use kernel::io::register::RegisterBase;
   |
--
>> error[E0425]: cannot find value `bar` in this scope
   --> rust/doctests_kernel_generated.rs:6203:16
   |
   6203 | CPU_CTL::alter(bar, &CPU0, |r| r.set_start(true));
   |                ^^^ not found in this scope
--
>> error[E0425]: cannot find value `bar` in this scope
   --> rust/doctests_kernel_generated.rs:6206:16
   |
   6206 | CPU_CTL::alter(bar, &CPU1, |r| r.set_start(true));
   |                ^^^ not found in this scope
--
>> error[E0425]: cannot find value `bar` in this scope
   --> rust/doctests_kernel_generated.rs:6214:22
   |
   6214 | CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
   |                      ^^^ not found in this scope
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
