Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18F5481243;
	Wed,  1 Jul 2026 12:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910333; cv=none; b=eXKMsRQs9mm9Wqq7Ls2tBSSHPEJ5kAQQK1IvwxkHkMRkd6KuqbCZvEzHUQTmCpN9C7sbBEraHQQF42ZovZ+L/kxyuo+E8jc4QXBOEPxytylgrfW/Dac9Y1e6putIA1fztBB0R26gKSsD1KeJOfmLBPWHZuK02EPPKXFzi9XSyiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910333; c=relaxed/simple;
	bh=PRs2/6MVKkKaZ+0/uCaWVbk8BEdGOjCQX+es8MGsD0k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dCJ7CRTvbb1h8rB31y68bYKdPShDBlib62z60r0Sqf3UN63BPpiM34E4QS/F1HxTStXvZSM9X/wxRdYRAWTKKRAJDxIUbQUZNeSB+bUi+EykGR3PBdGmohmq3VOtYGzMjDTID9keDDavG5r9NLudKmygolum2uA/WsSr45rLnrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lh24j8Oz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lh24j8Oz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782910332; x=1814446332;
  h=date:from:to:cc:subject:message-id;
  bh=PRs2/6MVKkKaZ+0/uCaWVbk8BEdGOjCQX+es8MGsD0k=;
  b=Lh24j8OzYew/pAsCDYIGCU9y89vz5t2QZZH7uWItP46SwcM8Ni1qE7qs
   KHGSRAk/zxqrZijGvwI9azGBXZb2H5lSl314D5RpXlIkgLn/cHGA5DQ9x
   B/nMUediHM2bN5l3+hhqOsLm25WB+OZBo58o+KqKuMBSssQLdMdyHqdd0
   GXUkiJEeHGXHzunaXMKzUHJQwZNGbuA2ltyFFktAmrjUuQRX/4AX44prM
   EmVa6pPuRfG1hlIPMfaL6hYo2bQwespeYuopGP4ZX51dZS4HQpS3txkXx
   C9SNv03ynl1FXprAxeFI9LtOBApPBeD+nQLejw6VvDY5emg/tmipCJfJF
   g==;
X-CSE-ConnectionGUID: Jj3PfDm2TqK742ZfC0Rwtw==
X-CSE-MsgGUID: SIijHS9dTbeA+Zg/x7y5Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83671786"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="83671786"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 05:52:12 -0700
X-CSE-ConnectionGUID: NmuwFb69QfSt4dBm2Tliyw==
X-CSE-MsgGUID: BlEdZqzKQGWxMI6FSKzVtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="251520080"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 05:52:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weuPR-000000009IB-26s3;
	Wed, 01 Jul 2026 12:51:29 +0000
Date: Wed, 01 Jul 2026 20:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@do-not-panic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mcgrof:blk-iobuf-pool-v2 11/13] ld.lld: error: undefined
 symbol: __hexagon_udivdi3
Message-ID: <202607012001.YnzbgJle-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v2
head:   da75cc2253180af718ba0b7b3684a091b16b14fb
commit: 83df08bcb3ef8910445506a7f1e4214a12c4ead6 [11/13] io_uring: add IORING_REGISTER_BUFFERS_ALLOC_FOR_FILE (opcode 38)
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260701/202607012001.YnzbgJle-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012001.YnzbgJle-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012001.YnzbgJle-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __hexagon_udivdi3
   >>> referenced by rsrc.c:1505 (io_uring/rsrc.c:1505)
   >>>               io_uring/rsrc.o:(io_register_buffers_alloc_for_file) in archive vmlinux.a
   >>> referenced by rsrc.c:1505 (io_uring/rsrc.c:1505)
   >>>               io_uring/rsrc.o:(io_register_buffers_alloc_for_file) in archive vmlinux.a
   >>> did you mean: __hexagon_udivsi3
   >>> defined in: vmlinux.a(arch/hexagon/lib/udivsi3.o)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
