Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72957A
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 06:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651647117; x=1683183117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WUdxltnjTGYi8GJimo0jo/o4IQzWZJE09Y0WFyBoURo=;
  b=fq5SUDa8/kxtta2D4KcNxpzf1rPHcaB81Xy72O0PUm/i/hftadQuI9vN
   fJRhwix9C/nckXT9lYR6DuV7BV8Scdzsu7YxL+zpMOwNkO1qCRcu4Go0o
   xLGdtYtooLFGXKbKH3nZu6nkurepqdTSKHtIa0zAunojghZQX1ZOMPLJK
   +2+niygiNPGrbrnF+tUKh8wea68xpITVwY/Q9nuPRP1nv+w32l5ezwDe3
   IS6fZ6MwTolPR0IipVZNDdvd32Wkk9PJYGSh279LQWfcdODtnj6zLc6BZ
   yf1IzmMp7DhJSseghlx1wiStad77zbaN0ssDA8KyII9DRDm2SqW7aVm4E
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="265269706"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="265269706"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 23:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; 
   d="scan'208";a="599405338"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 May 2022 23:51:55 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm8ra-000B9f-JT;
	Wed, 04 May 2022 06:51:54 +0000
Date: Wed, 4 May 2022 14:51:28 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [lunn:v5.18-rc4-stacked-bridges 2/2] net/bridge/br_input.c:45:7:
 error: no member named 'offload_fwd_mark' in 'struct sk_buff'
Message-ID: <202205041436.UX6XOeS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lunn/linux.git v5.18-rc4-stacked-bridges
head:   eab6004bc4f6b012db3b6e1fac75f4911662baf5
commit: eab6004bc4f6b012db3b6e1fac75f4911662baf5 [2/2] net: bridge: Clear offload_fwd_mark when passing frame up bridge interface.
config: x86_64-randconfig-a011-20220502 (https://download.01.org/0day-ci/archive/20220504/202205041436.UX6XOeS0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/lunn/linux/commit/eab6004bc4f6b012db3b6e1fac75f4911662baf5
        git remote add lunn https://github.com/lunn/linux.git
        git fetch --no-tags lunn v5.18-rc4-stacked-bridges
        git checkout eab6004bc4f6b012db3b6e1fac75f4911662baf5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/bridge/br_input.c:45:7: error: no member named 'offload_fwd_mark' in 'struct sk_buff'
           skb->offload_fwd_mark = false;
           ~~~  ^
   1 error generated.


vim +45 net/bridge/br_input.c

    32	
    33	static int br_pass_frame_up(struct sk_buff *skb)
    34	{
    35		struct net_device *indev, *brdev = BR_INPUT_SKB_CB(skb)->brdev;
    36		struct net_bridge *br = netdev_priv(brdev);
    37		struct net_bridge_vlan_group *vg;
    38	
    39		dev_sw_netstats_rx_add(brdev, skb->len);
    40	
    41		vg = br_vlan_group_rcu(br);
    42	
    43		/* Reset the offload_fwd_mark because there could be a stacked bridge
    44		 * above. */
  > 45		skb->offload_fwd_mark = false;
    46	
    47		/* Bridge is just like any other port.  Make sure the
    48		 * packet is allowed except in promisc mode when someone
    49		 * may be running packet capture.
    50		 */
    51		if (!(brdev->flags & IFF_PROMISC) &&
    52		    !br_allowed_egress(vg, skb)) {
    53			kfree_skb(skb);
    54			return NET_RX_DROP;
    55		}
    56	
    57		indev = skb->dev;
    58		skb->dev = brdev;
    59		skb = br_handle_vlan(br, NULL, vg, skb);
    60		if (!skb)
    61			return NET_RX_DROP;
    62		/* update the multicast stats if the packet is IGMP/MLD */
    63		br_multicast_count(br, NULL, skb, br_multicast_igmp_type(skb),
    64				   BR_MCAST_DIR_TX);
    65	
    66		return NF_HOOK(NFPROTO_BRIDGE, NF_BR_LOCAL_IN,
    67			       dev_net(indev), NULL, skb, indev, NULL,
    68			       br_netif_receive_skb);
    69	}
    70	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
