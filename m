Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5963033D2;
	Sat, 18 Nov 2023 04:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czXYAqmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700283330; x=1731819330;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KVgQQxXw9OUwZoMO3Zfw/OJypFs9cDre3sBr1FYQ7GM=;
  b=czXYAqmxpPfEFnl/UVY4eEfz2yqpFd4iyTwX1aN0NKpHDv4bhR7+cg1/
   M84ilRx6b+rpXCIAygBCDpfZitcrnJA/XBqyb8gsbOfq1zy+lzo8nNRuc
   Ned+eYCv+VCzF/X5uuoZgxfF2yeKyIiyVwpt9LFRaD2YEw0eVN5NyMnPT
   zuryN5+Cr/9959iI6Jx3vmEu213xNrXbAaK4d72OLjkfQxkiDdslfkvsM
   2Iz/UH3WHJEcJdDeNscYHkG7y73JCAUX+uQVhAOuhJ9YDC8eImi+y9SYR
   Qwr/AybkACHv6S9jEzkRVPdy1twBVoElWck1YViZqAJUWl/xFRJyH+Gpp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12957972"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="12957972"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 20:55:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="856522310"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="856522310"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Nov 2023 20:55:28 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4DMc-0003Wh-19;
	Sat, 18 Nov 2023 04:55:26 +0000
Date: Sat, 18 Nov 2023 12:44:40 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next v2 06/10] net: ethtool: Introduce a command
 to list PHYs on an interface
Message-ID: <202311181249.7bUVFYez-lkp@intel.com>
References: <20231117162323.626979-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117162323.626979-7-maxime.chevallier@bootlin.com>

Hi Maxime,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Chevallier/net-phy-Introduce-ethernet-link-topology-representation/20231117-234210
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231117162323.626979-7-maxime.chevallier%40bootlin.com
patch subject: [RFC PATCH net-next v2 06/10] net: ethtool: Introduce a command to list PHYs on an interface
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231118/202311181249.7bUVFYez-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311181249.7bUVFYez-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311181249.7bUVFYez-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/ethtool/phy.c:216:5: warning: no previous prototype for function 'ethnl_phy_dump_one_dev' [-Wmissing-prototypes]
   int ethnl_phy_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
       ^
   net/ethtool/phy.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ethnl_phy_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
   ^
   static 
   1 warning generated.


vim +/ethnl_phy_dump_one_dev +216 net/ethtool/phy.c

   215	
 > 216	int ethnl_phy_dump_one_dev(struct sk_buff *skb, struct net_device *dev,
   217				   struct netlink_callback *cb)
   218	{
   219		struct ethnl_phy_dump_ctx *ctx = (void *)cb->ctx;
   220		struct phy_req_info *pri = PHY_REQINFO(&ctx->req_info);
   221		struct phy_device_node *pdn;
   222		unsigned long index = 1;
   223		void *ehdr;
   224		int ret;
   225	
   226		ctx->req_info.dev = dev;
   227	
   228		xa_for_each(&dev->link_topo.phys, index, pdn) {
   229			ehdr = ethnl_dump_put(skb, cb,
   230					      ETHTOOL_MSG_PHY_GET_REPLY);
   231			if (!ehdr) {
   232				ret = -EMSGSIZE;
   233				break;
   234			}
   235	
   236			ret = ethnl_fill_reply_header(skb, dev,
   237						      ETHTOOL_A_PHY_HEADER);
   238			if (ret < 0) {
   239				genlmsg_cancel(skb, ehdr);
   240				break;
   241			}
   242	
   243			memcpy(&pri->pdn, pdn, sizeof(*pdn));
   244			ret = ethnl_phy_fill_reply(&ctx->req_info, skb);
   245	
   246			genlmsg_end(skb, ehdr);
   247		}
   248	
   249		ctx->req_info.dev = NULL;
   250	
   251		return ret;
   252	}
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
