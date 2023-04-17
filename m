Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058C8465;
	Mon, 17 Apr 2023 14:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681741073; x=1713277073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6+IWgC8Bon0J7vBYLs+uH4i2nmSl2ZjVNXYdDXAbBmE=;
  b=TOmUZDchlRqwUNEnIH0UfWaMZHCNfTJRBIBRcu9uW1Ve4PKbvp8/4iO7
   Q7lGI9QX/3h57YSWJqczjvwkoHfX2p7dO59qLNZhXLqTJO+JA7dku40xy
   iyTGIpATDOHTM0oUEEILZ8Sh3a771P/VFZR5p+o47ZVcr8MkV7Uklh8em
   wuYv2hsF/umK21BC5PXB2SOckF3l7n8msvidpXEXPIDeg0hh/NXF12NjH
   9/NQ1gxEa3goXO7hmBFVNYOwNvzddybfEDFPHDZNXEQ6aJaMQe4+p0XMC
   ZoYnWg8aGhEOJyedALhtbWsEKK8epSE9/3rEtT89Xd9duq0kmR2ti/+t9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="372779494"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="372779494"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 07:17:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="723260296"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; 
   d="scan'208";a="723260296"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Apr 2023 07:17:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poPfv-000cRJ-1C;
	Mon, 17 Apr 2023 14:17:47 +0000
Date: Mon, 17 Apr 2023 22:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Arun Ramadoss <arun.ramadoss@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next v1 2/2] net: dsa: microchip: Add partial ACL
 support for ksz9477 switches
Message-ID: <202304172250.WOCLE8lZ-lkp@intel.com>
References: <20230411172456.3003003-3-o.rempel@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411172456.3003003-3-o.rempel@pengutronix.de>

Hi Oleksij,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksij-Rempel/net-dsa-microchip-rework-ksz_prmw8/20230412-012709
patch link:    https://lore.kernel.org/r/20230411172456.3003003-3-o.rempel%40pengutronix.de
patch subject: [PATCH net-next v1 2/2] net: dsa: microchip: Add partial ACL support for ksz9477 switches
config: x86_64-randconfig-a011-20230417 (https://download.01.org/0day-ci/archive/20230417/202304172250.WOCLE8lZ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/a25d395c637a31cbf5c2188bf8f8475d4bdeeee8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksij-Rempel/net-dsa-microchip-rework-ksz_prmw8/20230412-012709
        git checkout a25d395c637a31cbf5c2188bf8f8475d4bdeeee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/dsa/microchip/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304172250.WOCLE8lZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/microchip/ksz9477_acl.c:622:27: warning: no previous prototype for function 'ksz9477_acl_get_init_entry' [-Wmissing-prototypes]
   struct ksz9477_acl_entry *ksz9477_acl_get_init_entry(struct ksz_device *dev,
                             ^
   drivers/net/dsa/microchip/ksz9477_acl.c:622:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct ksz9477_acl_entry *ksz9477_acl_get_init_entry(struct ksz_device *dev,
   ^
   static 
>> drivers/net/dsa/microchip/ksz9477_acl.c:887:28: warning: variable 'entry' set but not used [-Wunused-but-set-variable]
           struct ksz9477_acl_entry *entry;
                                     ^
   2 warnings generated.


vim +/ksz9477_acl_get_init_entry +622 drivers/net/dsa/microchip/ksz9477_acl.c

   609	
   610	/**
   611	 * ksz9477_acl_get_init_entry - Get a new uninitialized entry for a specified
   612	 *				port on a ksz_device.
   613	 * @dev: The ksz_device instance.
   614	 * @port: The port number to get the uninitialized entry for.
   615	 *
   616	 * This function retrieves the next available ACL entry for the specified port,
   617	 * clears all access flags, and associates it with the current cookie.
   618	 *
   619	 * Returns: A pointer to the new uninitialized ACL entry.
   620	 */
   621	
 > 622	struct ksz9477_acl_entry *ksz9477_acl_get_init_entry(struct ksz_device *dev,
   623							     int port)
   624	{
   625		struct ksz9477_acl_priv *acl = dev->ports[port].acl_priv;
   626		struct ksz9477_acl_entries *acles = &acl->acles;
   627		struct ksz9477_acl_entry *entry;
   628	
   629		entry = &acles->entries[acles->entries_count];
   630		entry->cookie = acl->current_cookie;
   631	
   632		/* clear all access flags */
   633		entry->entry[KSZ9477_ACL_PORT_ACCESS_10] = 0;
   634		entry->entry[KSZ9477_ACL_PORT_ACCESS_11] = 0;
   635	
   636		return entry;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
