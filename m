Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B269C481D7;
	Fri, 28 Jun 2024 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719571107; cv=none; b=FKHoKbh2Wlee+tVqExdMk/ffeTV70b+4GDKoRc2pJb96Xgi1LaQi8hBkpmwa19kSNuMfckxfvy/hdzYNJ9DZCMr+yGlVRO1ZvKfLgDnqAVizoK4cgy3S/XtAZ/D+GEu4FiKaQoK3t/RAfIPzP+QtTaXnyFZfeIGnJIIeJBG7Rw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719571107; c=relaxed/simple;
	bh=txHEnCfCJpHuS3Xiagch3AWe5OLvDgaLejgE+yxFh6A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3TTQYOpzDATccxeVwySxTo3crlUstCZg3ml2oLyil2enSfaZbX0m7xTw4Ym+cF183RWTh9x6HipkfWMI5EgjT/9k/wRRHyRXCyyivcFhnYTSkprm5QEiiwmn464wb1rD+SFdXOoqJJVL2EkLsWkzi1L2Q8vMl2uUv8Q4HrLeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YsUSxp7r; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YsUSxp7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719571106; x=1751107106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txHEnCfCJpHuS3Xiagch3AWe5OLvDgaLejgE+yxFh6A=;
  b=YsUSxp7rWeZq5NymDQ2W30jHHBmVw1L/o3uCb/R3WHRyDjHcTktCROnI
   NXS8H4MF2DNRSn0Fu0TT4dn0YdiJKxo2jecvEe85AY2VekjA55EymCgdH
   9YIf29YW3DBHit1m2ZDUAMdODdGgRwJIJlU2XzaP/H3TS0qFHAcuKls2e
   Zn/CJk5SGo7px3t3cscIA7x5gDq0os4A+m4+wCcdpW2zHf2JICPz9przh
   kjO415QQ6taIzXO6XUyzvGsD5GpJ+RWgUUzIyVHfXsy/sPZJPGGmhnbJF
   4INwLkg/pGMocCv0FK3ygg2FkG8cjUdP5tSmJAT2cKKa0weuM515p7Q+x
   g==;
X-CSE-ConnectionGUID: nfYRROlTTAauuxD4NoXgPw==
X-CSE-MsgGUID: lkaQV2DTTVaGZpDuD8EWPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11116"; a="20564384"
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="20564384"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 03:38:25 -0700
X-CSE-ConnectionGUID: 8MNKNpggS9ewswlUQWQ7Lw==
X-CSE-MsgGUID: hpmkFST4Sme2NxvqIHUh1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,168,1716274800"; 
   d="scan'208";a="49878854"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jun 2024 03:38:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sN8zl-000H0C-1r;
	Fri, 28 Jun 2024 10:38:21 +0000
Date: Fri, 28 Jun 2024 18:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>
Subject: [axboe-block:for-next 99/111] error[E0425]: cannot find value
 `BLK_FEAT_ROTATIONAL` in crate `bindings`
Message-ID: <202406281812.yXvA6FSP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
head:   bc512ae8cb934ac31470bc825fa25f9f5f99a720
commit: fcf865e357f80285af12c0c9a49f89d71acb7f4b [99/111] block: convert features and flags to __bitwise types
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240628/202406281812.yXvA6FSP-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240628/202406281812.yXvA6FSP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406281812.yXvA6FSP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find value `BLK_FEAT_ROTATIONAL` in crate `bindings`
   --> rust/kernel/block/mq/gen_disk.rs:104:38
   |
   104 |             lim.features = bindings::BLK_FEAT_ROTATIONAL;
   |                                      ^^^^^^^^^^^^^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
