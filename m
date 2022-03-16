Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1AD2FB3
	for <llvm@lists.linux.dev>; Wed, 16 Mar 2022 20:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647463846; x=1678999846;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dVG9+OWl3+PaAqbEgZhaN0JTSnfFMyBO3Solt6p4Ww0=;
  b=OYrbM3Nb/ckH2wqI3A6mTiY4K4A4MYstqwp91Yn9/kEgxb8LFv+alQkg
   fsrwhYVp+2US4aOOEiwbS2F0R6WZYSj772nJ9um6AcpLTN4ZS9CskzmIV
   Sgm/myZiWoEn/U2w+tJPHCW8anaWrbvRVhs3iyy78Ha9wV7jNANwMm23J
   OBTCSZwPXuYArJx2O3jcXhYsSW7qjMDV3B6EP483NJbPTRnMEGaUtHs3y
   Ibm6r+ERB2h11A30+M3aUuAfpRyAco/xNp1RRJm9UPu5EW3LWxyrisaMm
   PS+7Wp9n7JmjtnA3OVAcjXvlgbu4EnPJxF8X2wNdPUjloKhROQID2/Pb+
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="317428486"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="317428486"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2022 13:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; 
   d="scan'208";a="635127816"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 16 Mar 2022 13:50:41 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nUabQ-000CuV-JU; Wed, 16 Mar 2022 20:50:40 +0000
Date: Thu, 17 Mar 2022 04:49:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mattias Forsblad <mattias.forsblad@gmail.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Tobias Waldekranz <tobias@waldekranz.com>,
	Mattias Forsblad <mattias.forsblad+netdev@gmail.com>
Subject: Re: [PATCH v2 net-next 2/5] net: bridge: Implement bridge flood flag
Message-ID: <202203170401.hynO2BwT-lkp@intel.com>
References: <20220316153059.2503153-3-mattias.forsblad+netdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220316153059.2503153-3-mattias.forsblad+netdev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mattias,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Mattias-Forsblad/bridge-dsa-switchdev-mv88e6xxx-Implement-bridge-flood-flags/20220316-233416
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 9f01cfbf2922432668c2fd4dfc0413342aaff48b
config: hexagon-randconfig-r045-20220313 (https://download.01.org/0day-ci/archive/20220317/202203170401.hynO2BwT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4c003fec67078a4e8c1c6e36c7b9fc6303a3bb6f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mattias-Forsblad/bridge-dsa-switchdev-mv88e6xxx-Implement-bridge-flood-flags/20220316-233416
        git checkout 4c003fec67078a4e8c1c6e36c7b9fc6303a3bb6f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/bridge/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   net/bridge/br.c:347:26: warning: unused variable 'bm' [-Wunused-variable]
           struct br_boolopt_multi bm;
                                   ^
>> net/bridge/br.c:361:2: warning: variable 'bropt' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   net/bridge/br.c:365:20: note: uninitialized use occurs here
           br_opt_toggle(br, bropt, on);
                             ^~~~~
   net/bridge/br.c:348:2: note: variable 'bropt' is declared here
           enum net_bridge_opts bropt;
           ^
   2 warnings generated.


vim +/bropt +361 net/bridge/br.c

   338	
   339	int br_flood_toggle(struct net_bridge *br, enum br_boolopt_id opt,
   340			    bool on)
   341	{
   342		struct switchdev_attr attr = {
   343			.orig_dev = br->dev,
   344			.id = SWITCHDEV_ATTR_ID_BRIDGE_FLOOD,
   345			.flags = SWITCHDEV_F_DEFER,
   346		};
   347		struct br_boolopt_multi bm;
   348		enum net_bridge_opts bropt;
   349		int ret;
   350	
   351		switch (opt) {
   352		case BR_BOOLOPT_FLOOD:
   353			bropt = BROPT_FLOOD;
   354			break;
   355		case BR_BOOLOPT_MCAST_FLOOD:
   356			bropt = BROPT_MCAST_FLOOD;
   357			break;
   358		case BR_BOOLOPT_BCAST_FLOOD:
   359			bropt = BROPT_BCAST_FLOOD;
   360			break;
 > 361		default:
   362			WARN_ON(1);
   363			break;
   364		}
   365		br_opt_toggle(br, bropt, on);
   366	
   367		attr.u.brport_flags.mask = BIT(bropt);
   368		attr.u.brport_flags.val = on << bropt;
   369		ret = switchdev_port_attr_set(br->dev, &attr, NULL);
   370	
   371		return ret;
   372	}
   373	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
