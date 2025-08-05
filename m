Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AA7341AA;
	Tue,  5 Aug 2025 01:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754356228; cv=none; b=DIinQ90AphlN+QXb0/fRxQogu6V/8P501SHtiZDapGs5+Lpzos1Rx+A9xIaWkAmcedmKYbWRgBSCQSgoOcsbDL2YfyObRkw+vzhyHRhhllJgDQ8gnfiTfbQbZf3MSX/IiL6qwVb9LJOCgxDamN136cQVPCCFszfgeajFSWy2G5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754356228; c=relaxed/simple;
	bh=hsXhWSF9F6gBHRSXzVpvZW+GEl/sqhubQuPplAIQIKM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGfVVsSyw8mw46e+cC4AnOt7/m8OYhAHaQkL2Ve+Oq8uz+CHa/yausFNAiafLbW4lI6bPEgXCylgU8F5BiAIaDka0GSmPpwD0lu4DoAjOG4qz2tvgSVbwUt1hui8SazKvu3ifhTKJByHTitjdgRicgBgt5U4DNVI1oE6VC3JIv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IPVkURB2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IPVkURB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754356227; x=1785892227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsXhWSF9F6gBHRSXzVpvZW+GEl/sqhubQuPplAIQIKM=;
  b=IPVkURB2veaKyiiAkMmXoTFfQ6ZchAUmbTensGV4CLFJqT00MOQth6gj
   JaCFwgna0yVr4BE3ZV533DCRx9EsZ+tSgm2vWxCbQwFzTi87nhDqg0q2V
   ZaO13ChUnd7DGwGrrN8An4fM9FEh6UaqcKV5IgbBPSg+rwlrduFfr3DOm
   PGeSS6MW+BQ/AdQR7YjiXLzzQah1Cmm6MX2W6dWtNfz7jTEtOQRjiOeaK
   cgQYkUzLDABN1lZYrkD8ZseKH93T4dRkyGEEBnwCRf1H9FMA0aUlBfjTh
   avwFoDDWHDFTNJSZGkcVEtp9AKPMSeL7Cgjs+X+NdgSYqj/LzT0CSIfhZ
   Q==;
X-CSE-ConnectionGUID: glMCluWEQkWKRgX9vkV09Q==
X-CSE-MsgGUID: kszilrEfSYO1ZBbG7FCApA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="82086398"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="82086398"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 18:10:26 -0700
X-CSE-ConnectionGUID: SodhuPYhQ+WxV+V9ppXYew==
X-CSE-MsgGUID: gNM0SWe9Quirf8ZJ5Bfi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="163562216"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Aug 2025 18:10:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uj6C6-0000MF-2F;
	Tue, 05 Aug 2025 01:10:22 +0000
Date: Tue, 5 Aug 2025 09:09:44 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:asahi-wip 824/987] warning: method `into_raw` is never
 used
Message-ID: <202508050918.u49nln1Z-lkp@intel.com>
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
commit: 0478f42cdb343787e247a07f23e58ec516f8dacf [824/987] rust: dma_fence: Add DMA Fence abstraction
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250805/202508050918.u49nln1Z-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508050918.u49nln1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508050918.u49nln1Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: method `into_raw` is never used
   --> rust/kernel/dma_fence.rs:470:19
   |
   454 | impl FenceChain {
   | --------------- method in this implementation
   ...
   470 |     pub(crate) fn into_raw(self) -> *mut bindings::dma_fence_chain {
   |                   ^^^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
