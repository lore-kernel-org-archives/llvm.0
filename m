Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787C143722;
	Mon, 14 Oct 2024 22:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728943809; cv=none; b=GKDlyq/x7k1IYr5lqyeb3qhIQRaitXQcjaHQ97JuQPTNAZhWz6slJccCwL16LtEIIJ9b6i108ic+5e/8E6wDqDow+P3F9Zc1qFixCkwnPKtUNKA3+K+pgVe8YY92JlW2FemMkQHRfa0WcQVltr/tB7X8N2yURGcHK2tfa2tipzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728943809; c=relaxed/simple;
	bh=Wc/cxAT8IEV5gyHmDewjho9bCBhFtPxIlTXT1n4QkRo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNvTE+Rt8QjAYZpnDgGoysd0y42FnhdbwB5+XfVBZRRMK4fo8HJXV1v8LCdC5OzKpLMTZlH/ZVSmat7qPNACl6GAim1wQzhpDmY8j0uYSUtuwIUbNLVeN9y2etdxPJykYU415p1k1f52Z8BDUqPIdJ5blXaRlPHg2cNbXDdWtg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iW1rgcLR; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iW1rgcLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728943808; x=1760479808;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Wc/cxAT8IEV5gyHmDewjho9bCBhFtPxIlTXT1n4QkRo=;
  b=iW1rgcLRni28m150ujO0VBI36iqCkpasW4S9CpOGoSOXQCWztdqJdNrB
   3ApCMLv342tgjx7qlhUTrj3abXJ9encRh61uwMpjrYMAMHYYmk65o7v7C
   reasjcEi2zJ5g9go+Hl9rZp5Z22GKMiUERfZkRlPnF0W4EljpqZ5kh1/X
   D4jduwnDZZosQUU8Llv/bIvSnEZ3EYVnBZnCq2b/9uURjWKDsBI6iIgDo
   olnyzq7bYvE7LyBFiDM3wWP7Bh6YGY2anTtiEQGDOWTNX9F+/K73vdhab
   Oo4PlzeGhlpmwtsK6I/b8yQDY2wV5t5ZC3LHWheAoXaxYv8JXWXMn6ACq
   A==;
X-CSE-ConnectionGUID: ei53jcdsR5Sg1EcaQRnLxQ==
X-CSE-MsgGUID: 2Qykpc6nQXuVxuXjOZuutw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45784275"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45784275"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 15:10:07 -0700
X-CSE-ConnectionGUID: px/X1xL/SCOJjy4l65qrRw==
X-CSE-MsgGUID: HCeEo+hORvGyErkjtVVhsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="101046865"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Oct 2024 15:10:06 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0TGN-000HCB-30;
	Mon, 14 Oct 2024 22:10:03 +0000
Date: Tue, 15 Oct 2024 06:09:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: adis16400_write_raw+0xb5: can't find
 jump dest instruction at .text.adis16400_write_raw+0x293
Message-ID: <202410150601.1OErdBu2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Nuno Sa <nuno.sa@analog.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Hi Nuno,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eca631b8fe808748d7585059c4307005ca5c5820
commit: 9d9dae6ae8ab440835981b209ebe6ba8465b46a4 iio: imu: adis16400: make use of the new lock helpers
date:   4 months ago
config: x86_64-buildonly-randconfig-002-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150601.1OErdBu2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150601.1OErdBu2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150601.1OErdBu2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: adis16400_write_raw+0xb5: can't find jump dest instruction at .text.adis16400_write_raw+0x293

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
