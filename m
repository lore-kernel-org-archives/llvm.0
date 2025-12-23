Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE4B34104E;
	Tue, 23 Dec 2025 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766496862; cv=none; b=j8bsLbmK7bn21WBemkbG7PZUgThGqE7wqBrP4IJfmBCWQmOqVqVXVUJGaSGVuf/+1m3MAVnPp+T587/dXjUH9GbnpKP27uNOZ9JWScFPcFnwrdR0ZmOya/AQgP5tYndXeh5GFN/VRRZrp/SidcK+ALt4JUtur2LOaWoPej1B3cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766496862; c=relaxed/simple;
	bh=LAjeeJNsj8WZgSWWjK8ChoLGUFGD2bPpENzji4wLAUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pm8oFqDf/Z/2O22ps60EGpWDWu8QC/qPmjo7wm+sEwrS/aL968L/pvgCif46jM782+PJDavddIiO1L/LuyqLIyy2Xy6a6RZh8un31KQePlpeVK4ckjp9rlVxOq6hfPzBqMdd1TFY3i+BzSMNxcNTfH8QQS+knGktt4RrJVIRSH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhqI8a+L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhqI8a+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766496861; x=1798032861;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LAjeeJNsj8WZgSWWjK8ChoLGUFGD2bPpENzji4wLAUo=;
  b=KhqI8a+Lueas/k7SV8CODPfz+qeKu43TY4L4EunMltFSEBMFjxHVW36Q
   m19VBZmFTabCUFPurhQSw1qrHtN/0+E8W+JfsxUaSYHK+uOmibE/dJbfX
   kmQ/lNKGSvsd4/ZcqqRADx4Mggd7PxVeXtWAzkVZOgBL4hTAGK+aG2Ndp
   dT2Cy41aHFTdUG5/d+IRA+zGbkD6NdFJRISgieun62NFTci4WnJz2xh/w
   heMSBIUfxWDS5YLv9XMQVq5AMHTvdPgkt2pAByEEpXkpQ5NYomO8oChcd
   tMFRzP1SQ81keRNHqzV+2SXCuGQjwgMlTp5XCLQAaPDrcInLLd69UmKdl
   Q==;
X-CSE-ConnectionGUID: D7mHgiZ/S3GcmMuIuItH8Q==
X-CSE-MsgGUID: 4VuxHhFOQMO36Np1yl66Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="85759887"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="85759887"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 05:34:16 -0800
X-CSE-ConnectionGUID: DDVVe4AaTRqVfF6F3nz5uw==
X-CSE-MsgGUID: ylVe7GpWRZig4T73DO5+EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="204283660"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Dec 2025 05:34:13 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY2Wh-000000001yL-1fLY;
	Tue, 23 Dec 2025 13:34:11 +0000
Date: Tue, 23 Dec 2025 21:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Osose Itua <osose.itua@savoirfairelinux.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael.hennerich@analog.com, jerome.oufella@savoirfairelinux.com,
	Osose Itua <osose.itua@savoirfairelinux.com>
Subject: Re: [PATCH v2 1/2] net: phy: adin: enable configuration of the LP
 Termination Register
Message-ID: <202512232136.7GHkdaw8-lkp@intel.com>
References: <20251222222210.3651577-2-osose.itua@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222222210.3651577-2-osose.itua@savoirfairelinux.com>

Hi Osose,

kernel test robot noticed the following build errors:

[auto build test ERROR on net/main]
[also build test ERROR on net-next/main linus/master horms-ipvs/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Osose-Itua/net-phy-adin-enable-configuration-of-the-LP-Termination-Register/20251223-064926
base:   net/main
patch link:    https://lore.kernel.org/r/20251222222210.3651577-2-osose.itua%40savoirfairelinux.com
patch subject: [PATCH v2 1/2] net: phy: adin: enable configuration of the LP Termination Register
config: hexagon-randconfig-002-20251223 (https://download.01.org/0day-ci/archive/20251223/202512232136.7GHkdaw8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512232136.7GHkdaw8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512232136.7GHkdaw8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/adin.c:7:10: fatal error: 'cerrno' file not found
       7 | #include <cerrno>
         |          ^~~~~~~~
   1 error generated.


vim +/cerrno +7 drivers/net/phy/adin.c

   > 7	#include <cerrno>
     8	#include <linux/kernel.h>
     9	#include <linux/bitfield.h>
    10	#include <linux/delay.h>
    11	#include <linux/errno.h>
    12	#include <linux/ethtool_netlink.h>
    13	#include <linux/init.h>
    14	#include <linux/module.h>
    15	#include <linux/mii.h>
    16	#include <linux/phy.h>
    17	#include <linux/property.h>
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
