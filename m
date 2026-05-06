Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7728930B50C;
	Wed,  6 May 2026 19:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778095949; cv=none; b=ieSBNV6tRYO+vkgDqgXUtzMv/lo7giBLwmPij4gk6e/KzrLVnri4reymsZgp1UUxWX3oxACLn1VZ84kwsLyzRXTJWiLXrp3MxXy02Px0KgLrkqOQZwJHLV3CjAb0020LBxOhl6RllU8unNRIdOZkqE1VGviUQlRsZMK9+H0l7U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778095949; c=relaxed/simple;
	bh=oDnT+F6BEDnRN2A5NbyVR2EWXG7lSjWEspr8dAlDJRI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PNuhSB/t9IHNkr5+gT3sZ/mkIIqbhUscZpHmaEtw2idngyAg6J8mLufPCEkGWpH4+r8QqUFmmexs0+qFy8KnkVTdmC9Hf7inYo0QRkHGkLgibUVpLf9sP9Fa3W0/m/X/WxhzQjVO3gpcygELSZIApR0yXCkHPmCfDCcODb+Rpaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWSwXBdk; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWSwXBdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778095948; x=1809631948;
  h=date:from:to:cc:subject:message-id;
  bh=oDnT+F6BEDnRN2A5NbyVR2EWXG7lSjWEspr8dAlDJRI=;
  b=TWSwXBdkF5B6lRzzl2JNeQ/CjYVE+a+7QX9nklUKhqt/T/Qp011K+nNJ
   AMmakMAsvzt2O6/uz+yY3G1qtcbsMlyQdK0AyQK/bSPE5KBe3IC+7kBjV
   VululIBXwHwMb+N3b97q9iJmTUBqmH8+gzxAbYnpQDyoSdpbS95If0sFU
   Xx0yCo5shkbKxF3HTLlZQ1VZjwfcgbauUYI0huhFfP7ZBFc/fG50H1QmS
   MDXSL/lN6oDKaMzEYlIEtJ0taYg3wW1ocwjDdFWg6gJbB+2YhTJnsAIHV
   3ZBoEmM7mjdIlaWV6VM5D/yZ4Byy6O7/zDezaW5e+vWIb7Qms+XXixJSc
   g==;
X-CSE-ConnectionGUID: ++iDZRjXScqLVapDfixfdQ==
X-CSE-MsgGUID: NUWK1SzKRzSWiKtMf+cidg==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79217922"
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="79217922"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2026 12:32:28 -0700
X-CSE-ConnectionGUID: X86I+fVdRh+WYWFU3E4oGA==
X-CSE-MsgGUID: N1N6dc9uReCMp8YAp6qfBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,220,1770624000"; 
   d="scan'208";a="259933041"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 May 2026 12:32:26 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKhyp-000000001Ar-3ImU;
	Wed, 06 May 2026 19:32:23 +0000
Date: Thu, 07 May 2026 03:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Anuj Gupta <anuj20.g@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jens Axboe <axboe@kernel.dk>, Kanchan Joshi <joshi.k@samsung.com>
Subject: [axboe:nvme-raw-queues 8/16] error[E0063]: missing fields
 `poll_uring_cmd`, `queue_uring_cmd`, `register_queue` and 1 other field in
 initializer of `blk_mq_ops`
Message-ID: <202605070340.Eyyi87gy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git nvme-raw-queues
head:   38cfa7887dc8d403af2baa576d06c438408a192c
commit: baa3150843ddf26bb83bff0a7e87b22d60a4bb70 [8/16] block: add mq_ops to submit and complete commands from raw-queue
config: x86_64-randconfig-002-20260506 (https://download.01.org/0day-ci/archive/20260507/202605070340.Eyyi87gy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605070340.Eyyi87gy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605070340.Eyyi87gy-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0063]: missing fields `poll_uring_cmd`, `queue_uring_cmd`, `register_queue` and 1 other field in initializer of `blk_mq_ops`
   --> rust/kernel/block/mq/operations.rs:257:42
   |
   257 |     const VTABLE: bindings::blk_mq_ops = bindings::blk_mq_ops {
   |                                          ^^^^^^^^^^^^^^^^^^^^ missing `poll_uring_cmd`, `queue_uring_cmd`, `register_queue` and 1 other field

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
