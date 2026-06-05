Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62DA36D9E0;
	Fri,  5 Jun 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780669135; cv=none; b=DlDpD3Biw6m7nln8u4ZDpBUXlNYH+mhtP1/2nlRMCfpp5cYCuolEkTkNenPXmh2rOJJKlG39KbywtGMJeNSNlm2oy7406KCPgcriEKtp7XNBUkedcET/u0HMMjXaE8PRfXavtoTfwABwu4XslbtgXc3nGJd+cCsSeLq5txtkUks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780669135; c=relaxed/simple;
	bh=6j6Kbr3PTBz4Ce08nM4gCYJRDe0clylusP7FpmuwSPQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvOV7Ae0Wgv58SVIYeCjMDQM/CjmnrPyZK6JJuO8GUEeSNfz2NJQfOAs7ZnHCGEu1iPd/byRPLl1du+ZiE0BtbX+3nEdlWuaTszEjk349xj9XPrJQ2azlRRZ8AUAds25SEDn1r6Kj0qX80sWpd95cHus1Xg7ga0KikYKGPGI930=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dQlqtzz6; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dQlqtzz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780669129; x=1812205129;
  h=date:from:to:cc:subject:message-id;
  bh=6j6Kbr3PTBz4Ce08nM4gCYJRDe0clylusP7FpmuwSPQ=;
  b=dQlqtzz68rSwb1cY2X4LpKJS8I2hxmFYdto//QW2wdpkPEhAHi35tsB0
   nqdNHXLr9NvlyiNG8PyGBAQQIAY0vPAWRT5LWuzJmwgRjTUcNHn078se7
   EtLxghuCJuMmeSpJVEw3abFlAqg+9LntJm4FeJpGvjaIM1eHvNFG+RJZc
   60Y1dLm/l2NBgErDvgQGYlCE9edWODoEunM+kSOBJGRt5EzZo4ZALdL4d
   eRWqAxzQWyf3AKnJiaBYLsQpog6dS9g38u0CWY2tXeGguMLnpGLP1uWSw
   t4XN9V8xksT6aMYtsiso0A9m5zJGbi0PxjfdHIHrIX3xHUHjwa9ly7kHT
   w==;
X-CSE-ConnectionGUID: ljyq+rP4QHaqrIlitFo/VA==
X-CSE-MsgGUID: iQanu1ZkQsGZOYsuevYAOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81411662"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81411662"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 07:18:48 -0700
X-CSE-ConnectionGUID: GPiRgkVvRLqU/obW3K9mGw==
X-CSE-MsgGUID: /3+SwIOpTQCe212hiyW2LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249960226"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Jun 2026 07:18:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVVNj-00000000G78-3I2t;
	Fri, 05 Jun 2026 14:18:43 +0000
Date: Fri, 05 Jun 2026 22:18:13 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:partial-reg 5/9]
 drivers/media/v4l2-core/v4l2-event.c:81:41: warning: variable 'evspec' is
 uninitialized when used within its own initialization
Message-ID: <202606052235.rM24ifzS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 0258a2c8b5c7b9a6a0adce2059f2ecd12046776d [5/9] v4l: event: Split the event framework into generic and V4L2 bits
config: arm64-randconfig-004-20260605 (https://download.01.org/0day-ci/archive/20260605/202606052235.rM24ifzS-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052235.rM24ifzS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052235.rM24ifzS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/v4l2-core/v4l2-event.c:81:41: warning: variable 'evspec' is uninitialized when used within its own initialization [-Wuninitialized]
      81 |         const struct v4l2_event_spec *evspec = evspec;
         |                                       ~~~~~~   ^~~~~~
   1 warning generated.


vim +/evspec +81 drivers/media/v4l2-core/v4l2-event.c

    77	
    78	static bool v4l2_evop_is_subscribed(struct media_subscribed_evbase *mse,
    79					    const void *__evspec)
    80	{
  > 81		const struct v4l2_event_spec *evspec = evspec;
    82		struct v4l2_subscribed_event *sev = to_v4l2_subscribed_event(mse);
    83	
    84		return sev->evspec.type == evspec->type &&
    85			sev->evspec.id == evspec->id;
    86	}
    87	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
