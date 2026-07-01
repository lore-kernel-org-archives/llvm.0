Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05525369D55;
	Wed,  1 Jul 2026 03:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782877430; cv=none; b=MenzS77rCt/KR1kFiQ0YkPBa2xMGfOGgj2BGdvLxfbVnLofIRbMEKHHRqF9Y9l7qzFzwKreldl5SKHKrr+xAhpQ/8Aa48L4YwYcOA3M13HXpIXNDOFsOGULwBREba1slhx2by9324AAX6YMB7gizi1MWCNBp3wsglFadmL8nk94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782877430; c=relaxed/simple;
	bh=BG/GXrEyXRBtCC8OAUKR4tOupbX9TRXqAQVDgmClmIA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jk+YKEQwxWe54Tyz2remL6va+AFb9YTT5UxN4R7Rn9bc9sHCdzWm8JoWOqcfVott8urXeiagwFpV8KrROcpGIw1Y8XBwRmlnifeLpD/rya14YxY50eX7sAuTNmOVm68NNkHgxK6WDQk2uPLlAjvPLCwR49uX9NF2VRB70GjUeH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEAdpCFn; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEAdpCFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782877428; x=1814413428;
  h=date:from:to:cc:subject:message-id;
  bh=BG/GXrEyXRBtCC8OAUKR4tOupbX9TRXqAQVDgmClmIA=;
  b=QEAdpCFnb1q5h9/UT28MchhZoNItS1gx9+qlA/po+2iEMDCQHkuYGK/y
   5ThTCrkDBqm2Q6YVIuunIkeNXver4dz6ZKubf+BQTgsJ3hNcOqg0jCYI/
   OgvBgsLFI2X463nD7SZddkwb1fHqxvcnAwiDC7IQB0cXB1YmBrNYQ57O4
   ODoLDEXa/XxuP+qyN2MDwLKyK9uOeCDEIbD7fJnhuWwdCqf536K33Kl/f
   4on0DRLCstti+/9iKJqVqDaBuPbSb+00pdS8xc1lyjHUuHL5hSdsXXV22
   E8Yj8NR56h5zEuI488UsJhNjtx5N4DW0RfMhk4OAgEe97LmXdS0qbWr7z
   Q==;
X-CSE-ConnectionGUID: AKdpFmIdR5GhQcScZZqoQg==
X-CSE-MsgGUID: xLUaCul9R1mNkJ5VByHLMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="87283001"
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="87283001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 20:43:47 -0700
X-CSE-ConnectionGUID: QQuzGs/8QEOzAiFkHGpc6Q==
X-CSE-MsgGUID: FIro00wDRH6OqGximCgG7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,235,1774335600"; 
   d="scan'208";a="282507545"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 30 Jun 2026 20:43:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1welrS-000000008u7-1Pda;
	Wed, 01 Jul 2026 03:43:42 +0000
Date: Wed, 01 Jul 2026 11:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:rxrpc-fixes 2/2] ERROR: modpost:
 "rxrpc_kernel_query_key" [fs/afs/kafs.ko] undefined!
Message-ID: <202607011115.VMRP2Pgr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git rxrpc-fixes
head:   04aa4e35487222cfa66543ecfff71cce71aceda8
commit: 04aa4e35487222cfa66543ecfff71cce71aceda8 [2/2] rxrpc: Fix CHALLENGE packet overqueuing and simplify RESPONSE generation
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260701/202607011115.VMRP2Pgr-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011115.VMRP2Pgr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011115.VMRP2Pgr-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "rxrpc_kernel_query_key" [fs/afs/kafs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
