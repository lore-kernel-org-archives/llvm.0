Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD81F12F8;
	Mon,  8 Dec 2025 23:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765235058; cv=none; b=VTU9wLcuC9hgShiXpTaffjsSsksbMHOS6n2TmTWoXhW1S3Ya2ULeD3qFNsSfDcIYb2BHbbtuHqlX7SDXl/Q7jXaMjeEotd5bMquY/v+DBa7Tg/NRCmFh2AYuFD4k60ioJnF7fQP52nObAS6E7xc9mt9QlHvYZpx8ICsJ42L1bCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765235058; c=relaxed/simple;
	bh=twmu3DBnHCq9oH8SggSRJKGeIZH5H/qIA7YBYwzNFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rCUGYRKp+kYCfCpy1OOYduu+sdDM3RwyGRttaNK4f3+03IhK7z7BhrAej5brH+Sqn1E8E9pviwbW+QVCpOl13vaJVjcVjQfdz7m2ccAs7jfaI3O5aWs8GNHPXieHZmylPmuLBoJRNoltYV96sMDFF+STmicHBuj4QrXElfdqIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCskLMq0; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCskLMq0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765235057; x=1796771057;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=twmu3DBnHCq9oH8SggSRJKGeIZH5H/qIA7YBYwzNFuI=;
  b=FCskLMq04h7JaiBpX4deqltDtzRDlatg5PpzTDiWrqJg72i/w5WBdB3F
   +8i7sM62gBceTKwxpxUTxsQpQi7Mth+GqhB2Q8Y8t+iufz3uULM0ShDBX
   3estjgBNJQGd5SCmyr1+rKpnfF+VCXJHd8fhjj9Lf2X2TVY8UQC82GTlQ
   NKaPTqUOYa7VzyFoYkq0zifNkE/Ye0FGCfu485s7C5Kg60P+MaMH05kjI
   oHlzPcac/Ph7bbZZb5bd/a3tZOX428+HRuF4oXUnDuPaktyFScA0gELQH
   ZOC9RKLw0t+WOsr6kP49vFkNc5sJSiu40VjeOz7PM89+qvh7ydnonKu1v
   Q==;
X-CSE-ConnectionGUID: vPTX7e4eS82jcGfykESNGg==
X-CSE-MsgGUID: 5clOCSPRQ8OXz0dZGncr7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="89838913"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="89838913"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 15:04:17 -0800
X-CSE-ConnectionGUID: ObTr+tRgRR64+lm5qeP5YQ==
X-CSE-MsgGUID: Gzemix78TlqAbMTfN+f1NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="200234056"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Dec 2025 15:04:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSkH6-000000000xR-3ikY;
	Mon, 08 Dec 2025 23:04:12 +0000
Date: Tue, 9 Dec 2025 07:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-nh-lib 14/20] ld.lld: error: undefined symbol:
 __kcfi_typeid_nh_neon
Message-ID: <202512090620.MXZhspbo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
head:   d471b579f29c765ebaeba7a3b653052f029dc550
commit: 7f1c9dc7e0f3540a978f65f4d2d48ea1cd475a3e [14/20] crypto: adiantum - Convert to use NH library
config: arm64-randconfig-002-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090620.MXZhspbo-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090620.MXZhspbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090620.MXZhspbo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __kcfi_typeid_nh_neon
   >>> referenced by lib/crypto/arm64/nh-neon-core.o:(.text+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
