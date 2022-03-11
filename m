Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF482102
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 16:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647017260; x=1678553260;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MBmm6hfe6ofPaZWinscXCme4Dj8Bg6tgZ9OwG6ZINs0=;
  b=h+Dee6K0sqbS/UgXLAzR7D8Xuo5/rJ+aEtSGjsTnM98fhaQbqOKmRMw4
   5gytFYWJQKIjZM1fMI084B9BQDeAoQ2kAQN5U1bEMArWolVwg1dG7Zw71
   46da2SY8LzK1Ah8HGzEjXbZ5l248Jy3R4zdNchwP/REsI7c7TexlgoUf1
   fjFqmDkaLa7qVeJBE3VC7Nmb7oEPOGU/i4pfK4BxjKy2GLjgI+2S2KXXr
   Y8lqyLztrRd1q8E3BV9j8RV4b2oS5c1BuO9umSvQO4n4dIZ+mYK9Errp9
   k59XU7iDG0TBr2M7nvX18co57+7QUgTpkNCtEH26xWm/WMvHxH49Wz/06
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="253169890"
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="253169890"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 08:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,174,1643702400"; 
   d="scan'208";a="597164038"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 11 Mar 2022 08:47:36 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSiQR-0006ll-LC; Fri, 11 Mar 2022 16:47:35 +0000
Date: Sat, 12 Mar 2022 00:47:27 +0800
From: kernel test robot <lkp@intel.com>
To: Sun Shouxin <sunshouxin@chinatelecom.cn>, j.vosburgh@gmail.com,
	vfalico@gmail.com, andy@greyhouse.net, davem@davemloft.net,
	kuba@kernel.org, yoshfuji@linux-ipv6.org, dsahern@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, huyd12@chinatelecom.cn,
	sunshouxin@chinatelecom.cn
Subject: Re: [PATCH 3/3] net:bonding:Add support for IPV6 RLB to balance-alb
 mode
Message-ID: <202203120015.kkExdFHA-lkp@intel.com>
References: <20220311024958.7458-4-sunshouxin@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311024958.7458-4-sunshouxin@chinatelecom.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Sun,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 2a9eef868a997ec575c2e6ae885e91313f635d59]

url:    https://github.com/0day-ci/linux/commits/Sun-Shouxin/net-bonding-Add-support-for-IPV6-RLB-to-balance-alb-mode/20220311-110221
base:   2a9eef868a997ec575c2e6ae885e91313f635d59
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220312/202203120015.kkExdFHA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/dde3df4ab3030a55968f48dc96ff2014d8f18410
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Sun-Shouxin/net-bonding-Add-support-for-IPV6-RLB-to-balance-alb-mode/20220311-110221
        git checkout dde3df4ab3030a55968f48dc96ff2014d8f18410
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/bonding/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/bonding/bond_alb.c:986:6: warning: no previous prototype for function 'rlb6_update_client' [-Wmissing-prototypes]
   void rlb6_update_client(struct rlb_client_info *client_info)
        ^
   drivers/net/bonding/bond_alb.c:986:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rlb6_update_client(struct rlb_client_info *client_info)
   ^
   static 
   1 warning generated.


vim +/rlb6_update_client +986 drivers/net/bonding/bond_alb.c

   984	
   985	/*********************** ipv6 rlb specific functions ***************************/
 > 986	void rlb6_update_client(struct rlb_client_info *client_info)
   987	{
   988		int i;
   989	
   990		if (!client_info->slave || !is_valid_ether_addr(client_info->mac_dst))
   991			return;
   992	
   993		for (i = 0; i < RLB_ARP_BURST_SIZE; i++) {
   994			ndisc_bond_send_na(client_info->slave->dev,
   995					   &client_info->ip6_dst,
   996					   &client_info->ip6_src,
   997					   false, false, true, true,
   998					   client_info->vlan_id,
   999					   client_info->mac_dst,
  1000					   client_info->slave->dev->dev_addr);
  1001		}
  1002	}
  1003	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
