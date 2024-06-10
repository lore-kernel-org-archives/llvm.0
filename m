Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370B747A40;
	Mon, 10 Jun 2024 22:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718057537; cv=none; b=KOart+J4g0O+Ycdjx3lyjVbM0sl60KShTVEu5xizRQwWo3ykaNxyTwoh3XynZW9UNg0Tb//sw3fKIFLnyh4CMb9XCiYpHKuAwRzZVUG/iEsSJehMdGT37MWzAOlxzb2Y1aHIecqodtwMhfi3y0/SNOtwjznkTQ8XqbCrdesPS5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718057537; c=relaxed/simple;
	bh=HLIrFdKaRfhkTD9oPDvkVjv86+Tv2zaDNO5vb6Xajlk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYtweUrdw3uQv/2aEwmqSICc/e7a/01PpE6yCfZMNoy5HNw6NmOj67x41GRZhVFKsexpnnYNN44zy+epVY8QN6D694uC9tDUF3Ohnjg+JmCPYTwj6GL5iUnIUJpFZ//Mly4rntePcsxy8pKBNhQ40GRHOLrx8zTcIt4sP/LKobw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZdtFD/C+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZdtFD/C+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718057536; x=1749593536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HLIrFdKaRfhkTD9oPDvkVjv86+Tv2zaDNO5vb6Xajlk=;
  b=ZdtFD/C+OofprDVyAZrBTbIWt2FmfC8kKHKjojR1z4pwdFajU+gwH3fP
   cvQ99NrVmxo3zfGJT6FXbOp4GeXDW491CkErY8WVWybipLtiTFL0rnzWU
   Is0RmxkWhzQvaem4ZpehMFAJdABTVXX2GwO1ZfvPogun/OO3nl4mPOePd
   qQL9BGZW79z+y1qp3K+ss/oFbVu+sTaBC3JZYubbsX/DOIGWPHBT4cZvn
   t9m5vNOB0NBANPHDL2KJBYQ15Mg5q+bYm21OOmdePs0BgijhKyrOYquB0
   k1IrCXd0FQpmqvYK8Iq+Qt1fZxPi0q9OMhN0rrgCjtqaJwhEfuFVKfKz/
   g==;
X-CSE-ConnectionGUID: rc2fZN6gT325Nk8jJZo3QA==
X-CSE-MsgGUID: YfCYV3uCS02iNeEb1V3IhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18525616"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="18525616"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 15:12:15 -0700
X-CSE-ConnectionGUID: YyApEqtlTX6Ha6NOruzxnQ==
X-CSE-MsgGUID: 3QpaZ3lvS/imcF644PCRCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="69996930"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Jun 2024 15:12:15 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGnFM-0002XB-1W;
	Mon, 10 Jun 2024 22:12:12 +0000
Date: Tue, 11 Jun 2024 06:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 22/22] drivers/ptp/ptp_vmclock.c:18:10: fatal error:
 'uapi/linux/vmclock.h' file not found
Message-ID: <202406110602.sDctGBQl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   05710da2c87231fc47e4599060371792a31edea2
commit: 05710da2c87231fc47e4599060371792a31edea2 [22/22] ptp: Add vDSO-style vmclock support
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406110602.sDctGBQl-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406110602.sDctGBQl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406110602.sDctGBQl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/ptp/ptp_vmclock.c:18:10: fatal error: 'uapi/linux/vmclock.h' file not found
      18 | #include <uapi/linux/vmclock.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +18 drivers/ptp/ptp_vmclock.c

  > 18	#include <uapi/linux/vmclock.h>
    19	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
