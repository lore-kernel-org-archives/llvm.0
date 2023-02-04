Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF567F;
	Sat,  4 Feb 2023 08:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675499740; x=1707035740;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4obZi7tn+TOMMWkvH9TbKWAM0A9mKLHWtnKctz0kXcI=;
  b=eT0zJ8zI+CptDYS7JwPTwmuK5DwSZA7l7XoAkcHT2Re1UUmBzSq+xECa
   JzlBD4suSpmPiUngWGi5yBsfPzNTlupRcduOKEL/XO+IXQoLZGUNNpyu4
   VUEJGbafnnZ9O7GSoGdhPRGMbffG6epQxMAESYGzylMPR/bjjaZhL+vio
   Go86OUuKS9E0SVgISJlkXnrep9a5XmzgSYw326Z/4ZsAbS9S2R5T0tFIs
   ATgTloMVrn1ne1lLej6blhkDaw+ipbYNkDJXetmuBzi7l0sxnScDREa/J
   qsluZy1EzDqlIGm/MFAt6PdTD206NoYd3o3mOLlnoETaMlcvdddqq6x6i
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312585274"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312585274"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 00:35:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="659356644"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="659356644"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Feb 2023 00:35:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOE1J-0001AJ-0S;
	Sat, 04 Feb 2023 08:35:37 +0000
Date: Sat, 4 Feb 2023 16:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: Rakesh Sankaranarayanan <rakesh.sankaranarayanan@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 01/11] net: dsa: microchip: lan937x: add
 cascade tailtag
Message-ID: <202302041634.D4xvmQxf-lkp@intel.com>
References: <20230202125930.271740-2-rakesh.sankaranarayanan@microchip.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202125930.271740-2-rakesh.sankaranarayanan@microchip.com>

Hi Rakesh,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Rakesh-Sankaranarayanan/net-dsa-microchip-lan937x-add-cascade-tailtag/20230202-210316
patch link:    https://lore.kernel.org/r/20230202125930.271740-2-rakesh.sankaranarayanan%40microchip.com
patch subject: [RFC PATCH net-next 01/11] net: dsa: microchip: lan937x: add cascade tailtag
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230204/202302041634.D4xvmQxf-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d70ada5150dd09e1036c9de8c81198b9489430b3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rakesh-Sankaranarayanan/net-dsa-microchip-lan937x-add-cascade-tailtag/20230202-210316
        git checkout d70ada5150dd09e1036c9de8c81198b9489430b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/dsa/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/dsa/tag_ksz.c:488:2: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
           val |= BIT((dp->index + (8 * dp->ds->index)));
           ^~~
   net/dsa/tag_ksz.c:481:9: note: initialize the variable 'val' to silence this warning
           u32 val;
                  ^
                   = 0
   1 warning generated.


vim +/val +488 net/dsa/tag_ksz.c

   454	
   455	/* For xmit, 3/7 bytes are added before FCS.
   456	 * ---------------------------------------------------------------------------
   457	 * DA(6bytes)|SA(6bytes)|....|Data(nbytes)|ts(4bytes)|tag0(1byte)|tag1(1byte)|
   458	 * tag2(1byte)|FCS(4bytes)
   459	 * ---------------------------------------------------------------------------
   460	 * ts   : time stamp (Present only if PTP is enabled in the Hardware)
   461	 * tag0 : represents tag override, lookup and valid
   462	 * tag1 : each bit represents destination port map through switch 2
   463	 *	  (eg, 0x01=port1, 0x02=port2, 0x80=port8)
   464	 * tag2 : each bit represents destination port map through switch 1
   465	 *	  (eg, 0x01=port1, 0x02=port2, 0x80=port8)
   466	 *
   467	 * For rcv, 1/5 bytes is added before FCS.
   468	 * ---------------------------------------------------------------------------
   469	 * DA(6bytes)|SA(6bytes)|....|Data(nbytes)|ts(4bytes)|tag0(1byte)|FCS(4bytes)
   470	 * ---------------------------------------------------------------------------
   471	 * ts   : time stamp (Present only if bit 7 of tag0 is set)
   472	 * tag0 : zero-based value represents port
   473	 *	  (eg, 0x00=port1, 0x02=port3, 0x07=port8)
   474	 */
   475	static struct sk_buff *lan937x_cascade_xmit(struct sk_buff *skb,
   476						    struct net_device *dev)
   477	{
   478		struct dsa_port *dp = dsa_slave_to_port(dev);
   479		const struct ethhdr *hdr = eth_hdr(skb);
   480		__be32 *tag;
   481		u32 val;
   482	
   483		if (skb->ip_summed == CHECKSUM_PARTIAL && skb_checksum_help(skb))
   484			return NULL;
   485	
   486		tag = skb_put(skb, LAN937X_CASCADE_TAG_LEN);
   487	
 > 488		val |= BIT((dp->index + (8 * dp->ds->index)));
   489	
   490		if (is_link_local_ether_addr(hdr->h_dest))
   491			val |= (LAN937X_TAIL_TAG_BLOCKING_OVERRIDE << 8);
   492	
   493		val |= (LAN937X_TAIL_TAG_VALID << 8);
   494	
   495		put_unaligned_be24(val, tag);
   496	
   497		return skb;
   498	}
   499	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
