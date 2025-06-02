Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491F723CE;
	Mon,  2 Jun 2025 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748895849; cv=none; b=MZyuatEk3Pn8FJde51OIc8u5ITCkb4E595v4uRNGdp/avAuWW7G7+Hb9MskbQTDqUiK1IOV3NTmmHk/ZOR4CwRzyDS8IOWKll+dgWJ6PgtFGOmHGgYtDD1FSuYKV++7IPo/pE/Zqd5YNUb+28i0LYCN/reeT5Z9easUmGrWfapY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748895849; c=relaxed/simple;
	bh=ef3gqixDWNUyIQJm6UsN0LSjalroDiusHsm9Z2AkqM4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOKvjuO/xTMJlXWkgtFQoRD1Wlb3T4Qf8KPzyyH/M8qAvcNO3AsFvmF+tEN6NfweCPx32zQU9tKWXMjrlXCKFLw+3/bL4ifhiLxJy2A5sYHJqieIDnUiNPnmnLjI3pPYefvo7qbBUpr2eAbm59DGQ6uqSHTnWMJeoz3E0hLYZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAx6kzK2; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAx6kzK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748895847; x=1780431847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ef3gqixDWNUyIQJm6UsN0LSjalroDiusHsm9Z2AkqM4=;
  b=IAx6kzK2ArZH3G/X1rVZY5u+QhAvNQpBUZWRp/44ApIVgGrX530WZs5L
   eKJdZI+MhMo+NEePaWm36ssq3bH/AQgKhioDfvgGto4C/besGbPc0WK6N
   Nk/jxIO8GpPANgPdAxth4WoR16XLWFPvDFHAKdbyJ57FQoSjJLG1CYnOu
   mjn3oM3HN+OVg+QslTYsTTBO/WSG4qa0TBfxHvm2PO4az5wYNkqIJGcXb
   5k9Jtp9FPGwWGKWaRgqA5YjUJ1sn9z3Xr+xud3AVSvudlHcw1r9yU8OCj
   du562iOkbWLCb8EAlAe5o71X535mr1WpW9V3w4x6IE6luABbBqiyT3aHs
   Q==;
X-CSE-ConnectionGUID: 3dfjWyCrStqCOcZ7A7Ap8A==
X-CSE-MsgGUID: 3fRQHQzFR+OdVdASo5Vzaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54709778"
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="54709778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 13:24:06 -0700
X-CSE-ConnectionGUID: jXm1+jlpT4yH+8tBwQCZFQ==
X-CSE-MsgGUID: PjKgr8sPRy2OACe/ZpQIKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,204,1744095600"; 
   d="scan'208";a="167805547"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Jun 2025 13:23:42 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMBh6-0001Mk-1X;
	Mon, 02 Jun 2025 20:23:40 +0000
Date: Tue, 3 Jun 2025 04:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Joel Fernandes <joelagnelf@nvidia.com>
Subject: [jfern:nova/sequencer 24/47] warning: missing documentation for a
 method
Message-ID: <202506030428.EuaZMn1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/sequencer
head:   29f49c4178307cb46780fb8c476783697ed3b99d
commit: 2c752f25ad15c79030476efb64f929d31a2515ef [24/47] Add dma_set_mask() bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250603/202506030428.EuaZMn1x-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506030428.EuaZMn1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506030428.EuaZMn1x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: missing documentation for a method
   --> rust/kernel/pci.rs:394:5
   |
   394 |     pub fn dma_set_mask(&self, mask: u64) -> Result {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = note: requested on the command line with `-W missing-docs`
--
>> warning: missing documentation for a method
   --> rust/kernel/pci.rs:405:5
   |
   405 |     pub fn dma_set_coherent_mask(&self, mask: u64) -> Result {
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
