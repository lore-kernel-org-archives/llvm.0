Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5996E224FD;
	Thu,  6 Jun 2024 07:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717657725; cv=none; b=FchV6v9BZHcJSqfF0ucEY+KjXX+4Pk/uzjKYfAlZ10/jbDrAuf2L8OMNBaZU4C3qr9xssQ2X0r6/zdTDSZOJ3CU2Q46Wso9JwRCq8Q6IduKQdq/4YPwBekpnLgbwBcCrlNmXY1QtI7l94A6d0njLzsZYXJY5I/6Nfrh0DpgsjOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717657725; c=relaxed/simple;
	bh=59osReNRkAApXz+/16DhFsD69yI7ZX2LONfiaAiTg98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2lNJ01gsdfbbTEs4SDV86Lf0Reh/N0/gHhlhKbPZjZbrvAgRQW9A43DjvMW0DizTWGj8YMdVOYsubyPKO3JjTXKm7KcXO6nuK6qHpMIy3hM56NApv/QkwV7GPWQCcH+e4qt3zAO6L7zUck6Uv+C/cblyrJb3cOIIgUik9HIX1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MhmQTWOW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MhmQTWOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717657725; x=1749193725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=59osReNRkAApXz+/16DhFsD69yI7ZX2LONfiaAiTg98=;
  b=MhmQTWOW/Bd9q/6SCOwCqS4zGqLs6Q494ZJHtYraZg+73Za+xkE+pcGo
   /+we1ZmUIw/OAjhoNZJAptEOA/KYzMhjxraKpGBMKhVUtsznXuaAQdGU1
   3vi09Qwq99rcs/OVZ4eQTRF2sPYVNvxOxhOKDlBttPPhBU2nFvbPk/Efq
   GsQsXqV3ZdCAwqOPiMc+/1XEXyE2njLw68elPVvCEtHrhs3hLzxdwreTv
   8D3ciBwadq7JLS+whvgZsKY1PhZg3UVOUGGxN4tPQXoxE8SXHMJmtEKIa
   euCtjV+CzBTjSO5oSH3p8s4hu6sys19vQ5FvsRLpQK+UbFEDXNmD2IDxL
   A==;
X-CSE-ConnectionGUID: dK/qg8RAQ6SRJhWQvO92Mw==
X-CSE-MsgGUID: 3S/g2s0tTeer2gIAWP3+yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14459171"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14459171"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 00:08:44 -0700
X-CSE-ConnectionGUID: RD+fC05pRL242Q2Y8VTsXw==
X-CSE-MsgGUID: idfXHeidR12AjRHKQ9S7EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="38318468"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 00:08:42 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF7Em-0002mK-0p;
	Thu, 06 Jun 2024 07:08:40 +0000
Date: Thu, 6 Jun 2024 15:08:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Snitzer <snitzer@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [snitzer:nfs-localio-for-6.11 21/29] ld.lld: error: undefined
 symbol: nfs_local_probe
Message-ID: <202406061534.LweJ6s22-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   252b0c685ae2eafa0ced0682a496e9eecf23d1ff
commit: 2a1ae8c2fc5b31814d28cc0be9e4843b07d2acfc [21/29] nfs_common: add NFS v3 LOCALIO protocol extension enablement
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240606/202406061534.LweJ6s22-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061534.LweJ6s22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061534.LweJ6s22-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nfs_local_probe
   >>> referenced by flexfilelayoutdev.c
   >>>               fs/nfs/flexfilelayout/flexfilelayoutdev.o:(nfs4_ff_layout_prepare_ds) in archive vmlinux.a
   >>> referenced by client.c
   >>>               fs/nfs/client.o:(nfs_get_client) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nfs_server_is_local
   >>> referenced by flexfilelayout.c
   >>>               fs/nfs/flexfilelayout/flexfilelayout.o:(ff_local_open_fh) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nfs_local_open_fh
   >>> referenced by flexfilelayout.c
   >>>               fs/nfs/flexfilelayout/flexfilelayout.o:(ff_local_open_fh) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nfs_local_commit
   >>> referenced by write.c
   >>>               fs/nfs/write.o:(nfs_initiate_commit) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nfs_local_file_open
   >>> referenced by write.c
   >>>               fs/nfs/write.o:(nfs_generic_commit_list) in archive vmlinux.a
   >>> referenced by pagelist.c
   >>>               fs/nfs/pagelist.o:(nfs_generic_pg_pgios) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nfs_local_doio
   >>> referenced by pagelist.c
   >>>               fs/nfs/pagelist.o:(nfs_initiate_pgio) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: nfs_local_disable
   >>> referenced by client.c
   >>>               fs/nfs/client.o:(nfs_free_client) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
