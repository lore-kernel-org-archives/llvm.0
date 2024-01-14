Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C899313AE9;
	Sun, 14 Jan 2024 23:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/CfRm+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705273641; x=1736809641;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ul5LxjoVAGj+T21ZGU67V27kHziwuFjxBxMjDR3PjfY=;
  b=k/CfRm+1dvpIqorXt1byWXOTtAwGwbpERp7JcgnHAYWVJM1WHpWiNAey
   BD8gy/W2SVQL5fQ2txSKquyGJHZw6tOgfqp0/QfPFiSWWBxNZtc9uvbKA
   MDlmd3MaE8Zul+KBOZt9uYKoZBegJU3dw2GqeTOFKG17PTutPWwBtCU1v
   uCAAgbjoBjE3/Y7WWQgYXNMin5hs3PC0o0eeHG55Nh/0Gn2eSN+h5H4Qt
   AnoXBwEFnbBXXWeM+Pre+aW9SmJeuuMzdZJ5e7cTsRrNmTrGcx+vbuqv6
   vO/e+p6vufVPXyjLF+dAYfdN3XZhUO4v5CjrTTt0wp9DYwKhpgBuGA0hw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="6592283"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="6592283"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2024 15:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="776564186"
X-IronPort-AV: E=Sophos;i="6.04,195,1695711600"; 
   d="scan'208";a="776564186"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Jan 2024 15:07:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rP9ZS-000Buk-2Q;
	Sun, 14 Jan 2024 23:07:14 +0000
Date: Mon, 15 Jan 2024 07:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
	benjamin.tissoires@redhat.com, hdegoede@redhat.com,
	ivan.orlov0322@gmail.com, heikki.krogerus@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-imx@nxp.com, jun.li@nxp.com
Subject: Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <202401150608.0Ok2pmGw-lkp@intel.com>
References: <20240112080108.1147450-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112080108.1147450-1-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus hid/for-next westeri-thunderbolt/next linus/master v6.7 next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-roles-try-to-get-put-all-relevant-modules/20240112-155735
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240112080108.1147450-1-xu.yang_2%40nxp.com
patch subject: [PATCH] usb: roles: try to get/put all relevant modules
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240115/202401150608.0Ok2pmGw-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401150608.0Ok2pmGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401150608.0Ok2pmGw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/roles/class.c:37:6: warning: no previous prototype for function 'usb_role_switch_get_modules' [-Wmissing-prototypes]
      37 | void usb_role_switch_get_modules(struct device *dev)
         |      ^
   drivers/usb/roles/class.c:37:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      37 | void usb_role_switch_get_modules(struct device *dev)
         | ^
         | static 
>> drivers/usb/roles/class.c:46:6: warning: no previous prototype for function 'usb_role_switch_put_modules' [-Wmissing-prototypes]
      46 | void usb_role_switch_put_modules(struct device *dev)
         |      ^
   drivers/usb/roles/class.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | void usb_role_switch_put_modules(struct device *dev)
         | ^
         | static 
   2 warnings generated.


vim +/usb_role_switch_get_modules +37 drivers/usb/roles/class.c

    36	
  > 37	void usb_role_switch_get_modules(struct device *dev)
    38	{
    39		while (dev) {
    40			if (dev->driver)
    41				WARN_ON(!try_module_get(dev->driver->owner));
    42			dev = dev->parent;
    43		}
    44	}
    45	
  > 46	void usb_role_switch_put_modules(struct device *dev)
    47	{
    48		while (dev) {
    49			if (dev->driver)
    50				module_put(dev->driver->owner);
    51			dev = dev->parent;
    52		}
    53	}
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
