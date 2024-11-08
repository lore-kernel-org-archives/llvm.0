Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1272EB02;
	Fri,  8 Nov 2024 16:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731081853; cv=none; b=VhXuO5fpwD5zqLdgqWRR8ULj+vgj3kQEC91AXbSl/eVtMTdytOo5ozawJfHyCt8SKzOj+gvUilZfRiD7C59hz9rWYJhgHY4RPE1RHOffzHyNowsbGyee5DH9CY6hgo1yPed4CdIgV4RhjvosabWpHfLpT+rmoFt+AqaKSjh54Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731081853; c=relaxed/simple;
	bh=+BZtr2VBdD5Kt6Ppb16X8oF0+BpBNhWg16/rXkYojYk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VUja3FB062kJotGCv1yl2Ks/EW4CBUDhW05oVzHTiCiDwqkJiqq8VtjqEbQsBg0IKTj/dUJO5NC/iIdQLWXMmEXbdY2oVbdDLRvT9F9Po9ROEl87BYRbOME4eUg3R5QXSKYLm3XldNggXmd84AghRRZV9CwADw9dJDJz1C7utw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0e8UjJT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0e8UjJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731081851; x=1762617851;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+BZtr2VBdD5Kt6Ppb16X8oF0+BpBNhWg16/rXkYojYk=;
  b=T0e8UjJTZsDESR9jJAymoLBtct6lvS2taQlB+dh8//hEVZFFMqAKAr0u
   4GXjh//8uFq0wW2Bp+rg6liaK/p2hWP2uR4NIZY67Zy+i3uaqr5iJC0Xb
   WrK1j27V/yERNh2lPZRXmOWLXowE7F4qzzmRbKeoOMeROO/uZxfx0qmR7
   5vDP7H5OD6aWFQ72MhdLNR6KAMqnhr6d4Ch3CkH1fC3R01voN1RvjfIdo
   Zo9hU+kg7tqgsFFmOiVXJYVkoZC+5WmGyyziAScH4HLBvaZqog/a2QsOL
   ArgU0H6AJUew+ku1XhAR1gW0bgCqvATUNA3wl6ewSJ7eYJadDirAvaF+F
   A==;
X-CSE-ConnectionGUID: 81N69O0dSSCCiO/xX/CRcw==
X-CSE-MsgGUID: uYy7EGSaROupP5NQpaVbog==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42070784"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="42070784"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 08:04:11 -0800
X-CSE-ConnectionGUID: IxmnXKfoQH+tMeT+T4DjKQ==
X-CSE-MsgGUID: FZkbE4S6RZm3b99k2kquJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="90738650"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2024 08:04:10 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9RSx-000rZc-0d;
	Fri, 08 Nov 2024 16:04:07 +0000
Date: Sat, 9 Nov 2024 00:03:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-11-08 42/70] ld.lld: error:
 vmlinux.a(io_uring/tctx.o):(function __io_uring_add_tctx_node: .text+0x8e):
 relocation R_RISCV_HI20 out of range: 527995 is not in [-524288, 524287];
 references 'random_kmalloc_seed'
Message-ID: <202411082328.HX2SQZ3b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-cleanup-2024-11-08
head:   e9ab69de24b2818ae26f88e606ccea272bfa1705
commit: c26577ac5a361528b1ede028fa047bc10fa62274 [42/70] ASoC: sdw_utils: don't indicate duplicate error message
config: riscv-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241108/202411082328.HX2SQZ3b-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411082328.HX2SQZ3b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411082328.HX2SQZ3b-lkp@intel.com/

Note: the morimoto/sound-cleanup-2024-11-08 HEAD e9ab69de24b2818ae26f88e606ccea272bfa1705 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(io_uring/tctx.o):(function __io_uring_add_tctx_node: .text+0x8e): relocation R_RISCV_HI20 out of range: 527995 is not in [-524288, 524287]; references 'random_kmalloc_seed'
   >>> referenced by tctx.c:53 (io_uring/tctx.c:53)
   >>> defined in vmlinux.a(mm/slab_common.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
