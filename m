Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2E356743;
	Fri,  5 Jun 2026 15:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780673573; cv=none; b=AvlB7yY1lxtvo5Zyo9CucoxRiYdZgqqEinFd/iYrLueJlK9Ecn6B5E2bZV+xllflUKVRBX3M4PR2NL9zRHmltgLgDDFHOkLwWyrz1lc4Xk50WIekOAPqeJoQ2+Yym3lF7SB5lvpZTIfY+R3TE3DS2L56mwSUXbhFMaKQxtJ6FSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780673573; c=relaxed/simple;
	bh=W4RLOFk/TGhtttGUfrWkm6V8KHWc1BAYySAVpaloJYg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PhYQcPz4PvgA5JD4emvqmEn4b5g+qBNveTDFlEHnD88Xr4tuZWr/xRibUw/ht2DQUTY7QqGO8k+2P4KZny439rEBd2X3P/LI7aeHqa+fwacE+EWM9grhcY7HwWdNj03gqGpi1jPuO7g0Mo8v9j7oBQJQQ57ab16V3eRUpj4zmag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cy+/qxHq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cy+/qxHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780673572; x=1812209572;
  h=date:from:to:cc:subject:message-id;
  bh=W4RLOFk/TGhtttGUfrWkm6V8KHWc1BAYySAVpaloJYg=;
  b=cy+/qxHq0w/HAlkmWRS/T8AD1GTmVzFJkk32rShJXpDvJJ14eBPj2oru
   4orBt0Ub+3PEIZNeYAubGsdIfYsES+bi3hnHCWM3QFRUPWn09uF5NwxI7
   hAIpoRSqAJ6jrCtYeyrpDIt9hQc3gr/1T3mqrBB3PxodyKtVVHBJpvrT4
   J4KvyS2H7gxNG7sGjOnC54Sj66UI6VGw/qQcnaKIkwKfVm+9l8hunNxTo
   I5utYMi5LTloUj7c4haWtntkXCtbaqHG6YOSxDMRSjlg+ShMSQkimvKzr
   Q1DA65nfuFTTQhvxEGq6JrkDgS47RTnqQ0F+gb4POHPzWhTVYs4sCobCh
   w==;
X-CSE-ConnectionGUID: dOFL46G8To2Ruk9H1bK0IA==
X-CSE-MsgGUID: Np2GtZNNT4ueuRRXnoVcPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="92995755"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="92995755"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 08:32:50 -0700
X-CSE-ConnectionGUID: kfhIEy5KTKOei+uF+IYvmg==
X-CSE-MsgGUID: 9Nl5ZRXZSu2+po6zlr9ZnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="242399376"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2026 08:32:48 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVWXO-00000000GAo-27vO;
	Fri, 05 Jun 2026 15:32:46 +0000
Date: Fri, 05 Jun 2026 23:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 7/9]
 drivers/media/mc/mc-event.c:17:10: fatal error: 'media/media-event.h' file
 not found
Message-ID: <202606052349.bOSyAnNd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 4d67653aa3bd15cbaf60bbe6f4d0dce10d0dccbc [7/9] media: mc: Add MEDIA_IOC_DQEVENT
config: arm64-randconfig-004-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052349.bOSyAnNd-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052349.bOSyAnNd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052349.bOSyAnNd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/mc/mc-event.c:17:10: fatal error: 'media/media-event.h' file not found
      17 | #include <media/media-event.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/media/mc/mc-device.c:26:10: fatal error: 'media/media-event.h' file not found
      26 | #include <media/media-event.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +17 drivers/media/mc/mc-event.c

    15	
    16	#include <media/media-device.h>
  > 17	#include <media/media-event.h>
    18	#include <media/media-fh.h>
    19	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
