Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938121E501;
	Sat, 16 Dec 2023 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aqrc4KpQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702766106; x=1734302106;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PKAg3YpsoXOf+xOOFWRygZBV1PZFjvxNCldytcqfINk=;
  b=Aqrc4KpQ8v0Hcf7l1dzIvIu5U3gX8xVxbDh1P5Ip/vqhDZpXMsvYYMYL
   xDX73k20TVFXvfeqfyoDXYsRzBcshGT1d/3kJqmh+M8baGMfCrEI2IlcJ
   rrNc0d1eeEYhkjhEQimmh1K5NYHQlAwOSKiIFpUnLlMcIPGaK/pDxv7Q3
   I3oDw3h8uWeB5sa0SMf0EZ/CAl37NDJXW4N2KHQXauyqhit882TUkSUaT
   1NJm+CGAYiwd2+8cTio8ecXuQc40t9cfIdyKnr+2Ckrfz8OOgUvL12BDB
   N+AJRYo8py0KX3FElKGOSNrgj7s5paPt5xkjVbq2OAJH8TKt6iIk8OxSR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="395127316"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="395127316"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 14:35:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="768395271"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="768395271"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Dec 2023 14:35:02 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEdFL-0002Hl-3D;
	Sat, 16 Dec 2023 22:35:00 +0000
Date: Sun, 17 Dec 2023 06:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Li Zetao <lizetao1@huawei.com>, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org
Subject: Re: [PATCH v3 1/2] leds: trigger: netdev: display only supported
 link speed attribute
Message-ID: <202312170610.BnWo2SnP-lkp@intel.com>
References: <20231214122041.17439-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231214122041.17439-1-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-leds/for-leds-next]
[cannot apply to net-next/main net/main linus/master v6.7-rc5 next-20231215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/docs-ABI-sysfs-class-led-trigger-netdev-Document-now-hidable-link_/20231214-202215
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20231214122041.17439-1-ansuelsmth%40gmail.com
patch subject: [PATCH v3 1/2] leds: trigger: netdev: display only supported link speed attribute
config: i386-buildonly-randconfig-002-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170610.BnWo2SnP-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170610.BnWo2SnP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170610.BnWo2SnP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: phy_speeds
   >>> referenced by ledtrig-netdev.c
   >>>               drivers/leds/trigger/ledtrig-netdev.o:(netdev_trig_notify) in archive vmlinux.a
   >>> referenced by ledtrig-netdev.c
   >>>               drivers/leds/trigger/ledtrig-netdev.o:(netdev_trig_notify) in archive vmlinux.a
   >>> referenced by ledtrig-netdev.c
   >>>               drivers/leds/trigger/ledtrig-netdev.o:(set_device_name) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
