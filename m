Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC362119
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 11:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661859499; x=1693395499;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vNXWulkektdKcwNNK8U1oOGCwUo+V3hfQyLKHk6tUcg=;
  b=cUmMuXinf6aASIUZP1ec6eKCGwUlZiDs2OBKfU2HmMzVeTsZmleXrB4K
   OI+04B3q3R0GQOF4/sHu931L0NXITn76rTrdnv+iBw/7fyeTrIM3e7PhQ
   oHwcqt8kNDMrDZBeqc5szSOMB28iZg1qyoLdr3z4cCayPCDsl8z8sHmhG
   POu40YFuWRQuHrRowDceDPltnKnxwbVfvZzXUhD5GlMnFo/412fPvfqhH
   dZ++Eu9+ulJaKYg0Aq2GXkaTphxOJeyof9MklL2sSkbfRkg3hZ8u8PtPi
   bslFmS5GUkYml23s6VSzNd++UGTlWdCMVTpd3Hih+dvjtRF6gcEjQ4Dx+
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381447907"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="381447907"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 04:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="939985819"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2022 04:38:18 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSzZR-0000Fb-1Y;
	Tue, 30 Aug 2022 11:38:17 +0000
Date: Tue, 30 Aug 2022 19:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: Haimin Zhang <tcs.kernel@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V2] net/ieee802154: fix uninit value bug in dgram_sendmsg
Message-ID: <202208301926.Dbvh7eGF-lkp@intel.com>
References: <20220830070339.494695-1-tcs_kernel@tencent.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830070339.494695-1-tcs_kernel@tencent.com>

Hi Haimin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master linus/master v6.0-rc3 next-20220830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Haimin-Zhang/net-ieee802154-fix-uninit-value-bug-in-dgram_sendmsg/20220830-150500
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git f97e971dbdc7c83d697fa2209fed0ea50fffa12e
config: hexagon-randconfig-r045-20220830 (https://download.01.org/0day-ci/archive/20220830/202208301926.Dbvh7eGF-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/10679908140f660fb3391ea1d12f03365d95060f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Haimin-Zhang/net-ieee802154-fix-uninit-value-bug-in-dgram_sendmsg/20220830-150500
        git checkout 10679908140f660fb3391ea1d12f03365d95060f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/ieee802154/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/ieee802154/socket.c:631:6: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
                                    daddr, msg->msg_name);
                                    ^
   1 warning generated.


vim +631 net/ieee802154/socket.c

   608	
   609	static int dgram_sendmsg(struct sock *sk, struct msghdr *msg, size_t size)
   610	{
   611		struct net_device *dev;
   612		unsigned int mtu;
   613		struct sk_buff *skb;
   614		struct ieee802154_mac_cb *cb;
   615		struct dgram_sock *ro = dgram_sk(sk);
   616		struct ieee802154_addr dst_addr;
   617		int hlen, tlen;
   618		int err;
   619	
   620		if (msg->msg_flags & MSG_OOB) {
   621			pr_debug("msg->msg_flags = 0x%x\n", msg->msg_flags);
   622			return -EOPNOTSUPP;
   623		}
   624	
   625		if (msg->msg_name) {
   626			if (ro->connected)
   627				return -EISCONN;
   628			if (msg->msg_namelen < IEEE802154_MIN_NAMELEN)
   629				return -EINVAL;
   630			DECLARE_SOCKADDR(struct sockaddr_ieee802154*,
 > 631					 daddr, msg->msg_name);
   632			err = ieee802154_addr_from_sa(&dst_addr, &daddr->addr,
   633						      msg->msg_namelen);
   634			if (err < 0)
   635				return err;
   636		} else {
   637			if (!ro->connected)
   638				return -EDESTADDRREQ;
   639			dst_addr = ro->dst_addr;
   640		}
   641	
   642		if (!ro->bound)
   643			dev = dev_getfirstbyhwtype(sock_net(sk), ARPHRD_IEEE802154);
   644		else
   645			dev = ieee802154_get_dev(sock_net(sk), &ro->src_addr);
   646	
   647		if (!dev) {
   648			pr_debug("no dev\n");
   649			err = -ENXIO;
   650			goto out;
   651		}
   652		mtu = IEEE802154_MTU;
   653		pr_debug("name = %s, mtu = %u\n", dev->name, mtu);
   654	
   655		if (size > mtu) {
   656			pr_debug("size = %zu, mtu = %u\n", size, mtu);
   657			err = -EMSGSIZE;
   658			goto out_dev;
   659		}
   660	
   661		hlen = LL_RESERVED_SPACE(dev);
   662		tlen = dev->needed_tailroom;
   663		skb = sock_alloc_send_skb(sk, hlen + tlen + size,
   664					  msg->msg_flags & MSG_DONTWAIT,
   665					  &err);
   666		if (!skb)
   667			goto out_dev;
   668	
   669		skb_reserve(skb, hlen);
   670	
   671		skb_reset_network_header(skb);
   672	
   673		cb = mac_cb_init(skb);
   674		cb->type = IEEE802154_FC_TYPE_DATA;
   675		cb->ackreq = ro->want_ack;
   676		cb->secen = ro->secen;
   677		cb->secen_override = ro->secen_override;
   678		cb->seclevel = ro->seclevel;
   679		cb->seclevel_override = ro->seclevel_override;
   680	
   681		err = wpan_dev_hard_header(skb, dev, &dst_addr,
   682					   ro->bound ? &ro->src_addr : NULL, size);
   683		if (err < 0)
   684			goto out_skb;
   685	
   686		err = memcpy_from_msg(skb_put(skb, size), msg, size);
   687		if (err < 0)
   688			goto out_skb;
   689	
   690		skb->dev = dev;
   691		skb->protocol = htons(ETH_P_IEEE802154);
   692	
   693		err = dev_queue_xmit(skb);
   694		if (err > 0)
   695			err = net_xmit_errno(err);
   696	
   697		dev_put(dev);
   698	
   699		return err ?: size;
   700	
   701	out_skb:
   702		kfree_skb(skb);
   703	out_dev:
   704		dev_put(dev);
   705	out:
   706		return err;
   707	}
   708	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
