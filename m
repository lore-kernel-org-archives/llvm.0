Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DDA6ABC;
	Wed,  5 Apr 2023 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680709822; x=1712245822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7TBEPUJmv5xlf+IkNBGFH71rsTT90c65Hdc72kaklog=;
  b=mWxaNwHi2sQqt1qpRRJE3mv8qwEyx4opFcJxfUiwPdFWYa1wA/k826ma
   v0ehvfrUDQEk1pUNLUbSFRoAKt2i/08ku+csDfb9UasiYqB6TWjkLoVZt
   HGid91PN2C2oIiaePntL/3eU/4tN0skm7MdvdJhkypBO71tnCX8TRk05K
   qkOrcWx49fHaYLUVxnfkdmWiXRVXAVlku+r3B+NQ/ATMp7OUyLXyOQFRX
   dLPDNbQdc9PxoEue58X3/aZo6znkv8UTkvTkILMmbxbZoyFiUFpS73lPA
   UW7J1LCaxtA4drSJ+R65rKIS0V7Ih1uMQrTIPLXPk3W3u7BgXmVFlVitO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="341213889"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="341213889"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 08:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="776113925"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="776113925"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Apr 2023 08:50:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk5Oq-000Qbr-0w;
	Wed, 05 Apr 2023 15:50:16 +0000
Date: Wed, 5 Apr 2023 23:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Georgiev <glipus@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 3/5] Add ndo_hwtstamp_get/set support to vlan code
 path
Message-ID: <202304052343.Nwvcrk03-lkp@intel.com>
References: <20230405063323.36270-1-glipus@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405063323.36270-1-glipus@gmail.com>

Hi Maxim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tnguy-next-queue/dev-queue]
[also build test ERROR on next-20230405]
[cannot apply to horms-ipvs/master linus/master v6.3-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxim-Georgiev/Add-ifreq-pointer-field-to-kernel_hwtstamp_config-structure/20230405-143518
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230405063323.36270-1-glipus%40gmail.com
patch subject: [RFC PATCH v3 3/5] Add ndo_hwtstamp_get/set support to vlan code path
config: hexagon-randconfig-r041-20230403 (https://download.01.org/0day-ci/archive/20230405/202304052343.Nwvcrk03-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e48fe7f9909e9c0768e866c43b1cc880c0eb329f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxim-Georgiev/Add-ifreq-pointer-field-to-kernel_hwtstamp_config-structure/20230405-143518
        git checkout e48fe7f9909e9c0768e866c43b1cc880c0eb329f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash net/8021q/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304052343.Nwvcrk03-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/8021q/vlan_dev.c:22:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from net/8021q/vlan_dev.c:22:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from net/8021q/vlan_dev.c:22:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> net/8021q/vlan_dev.c:369:30: error: use of undeclared identifier 'real_dev'
                           return ops->ndo_eth_ioctl(real_dev, &ifr, cmd);
                                                     ^
>> net/8021q/vlan_dev.c:370:3: error: expected expression
                   else
                   ^
>> net/8021q/vlan_dev.c:395:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:427:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:514:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:526:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:542:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:547:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:554:1: error: function definition is not allowed here
   {
   ^
>> net/8021q/vlan_dev.c:563:20: error: use of undeclared identifier 'vlan_parse_protocol'; did you mean 'vlan_get_protocol'?
           .parse_protocol = vlan_parse_protocol,
                             ^~~~~~~~~~~~~~~~~~~
                             vlan_get_protocol
   include/linux/if_vlan.h:626:22: note: 'vlan_get_protocol' declared here
   static inline __be16 vlan_get_protocol(const struct sk_buff *skb)
                        ^
   net/8021q/vlan_dev.c:570:1: error: function definition is not allowed here
   {
   ^
>> net/8021q/vlan_dev.c:581:13: error: use of undeclared identifier 'vlan_passthru_hard_header'; did you mean 'vlan_dev_hard_header'?
           .create  = vlan_passthru_hard_header,
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
                      vlan_dev_hard_header
   net/8021q/vlan_dev.c:44:12: note: 'vlan_dev_hard_header' declared here
   static int vlan_dev_hard_header(struct sk_buff *skb, struct net_device *dev,
              ^
   net/8021q/vlan_dev.c:583:20: error: use of undeclared identifier 'vlan_parse_protocol'; did you mean 'vlan_get_protocol'?
           .parse_protocol = vlan_parse_protocol,
                             ^~~~~~~~~~~~~~~~~~~
                             vlan_get_protocol
   include/linux/if_vlan.h:626:22: note: 'vlan_get_protocol' declared here
   static inline __be16 vlan_get_protocol(const struct sk_buff *skb)
                        ^
   net/8021q/vlan_dev.c:593:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:665:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:679:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:685:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:708:1: error: function definition is not allowed here
   {
   ^
   net/8021q/vlan_dev.c:716:1: error: function definition is not allowed here
   {
   ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   6 warnings and 20 errors generated.


vim +/real_dev +369 net/8021q/vlan_dev.c

   355	
   356	static int vlan_dev_hwtstamp(struct net_device *dev, struct ifreq *ifr, int cmd)
   357	{
   358		const struct net_device_ops *ops = dev->netdev_ops;
   359		struct kernel_hwtstamp_config kernel_config = {};
   360		struct hwtstamp_config config;
   361		int err;
   362	
   363		if (!netif_device_present(dev))
   364			return -ENODEV;
   365	
   366		if ((cmd == SIOCSHWTSTAMP && !ops->ndo_hwtstamp_set) ||
   367		    (cmd == SIOCGHWTSTAMP && !ops->ndo_hwtstamp_get)) {
   368			if (ops->ndo_eth_ioctl) {
 > 369				return ops->ndo_eth_ioctl(real_dev, &ifr, cmd);
 > 370			else
   371				return -EOPNOTSUPP;
   372		}
   373	
   374		kernel_config.ifr = ifr;
   375		if (cmd == SIOCSHWTSTAMP) {
   376			if (copy_from_user(&config, ifr->ifr_data, sizeof(config)))
   377				return -EFAULT;
   378	
   379			hwtstamp_config_to_kernel(&kernel_config, &config);
   380			err = ops->ndo_hwtstamp_set(dev, &kernel_config, NULL);
   381		} else if (cmd == SIOCGHWTSTAMP) {
   382			err = ops->ndo_hwtstamp_get(dev, &kernel_config, NULL);
   383		}
   384	
   385		if (err)
   386			return err;
   387	
   388		hwtstamp_kernel_to_config(&config, &kernel_config);
   389		if (copy_to_user(ifr->ifr_data, &config, sizeof(config)))
   390			return -EFAULT;
   391		return 0;
   392	}
   393	
   394	static int vlan_dev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
 > 395	{
   396		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   397		const struct net_device_ops *ops = real_dev->netdev_ops;
   398		struct ifreq ifrr;
   399		int err = -EOPNOTSUPP;
   400	
   401		strscpy_pad(ifrr.ifr_name, real_dev->name, IFNAMSIZ);
   402		ifrr.ifr_ifru = ifr->ifr_ifru;
   403	
   404		switch (cmd) {
   405		case SIOCSHWTSTAMP:
   406			if (!net_eq(dev_net(dev), dev_net(real_dev)))
   407				break;
   408			fallthrough;
   409		case SIOCGHWTSTAMP:
   410			err = vlan_dev_hwtstamp(real_dev, &ifrr, cmd);
   411			break;
   412		case SIOCGMIIPHY:
   413		case SIOCGMIIREG:
   414		case SIOCSMIIREG:
   415			if (netif_device_present(real_dev) && ops->ndo_eth_ioctl)
   416				err = ops->ndo_eth_ioctl(real_dev, &ifrr, cmd);
   417			break;
   418		}
   419	
   420		if (!err)
   421			ifr->ifr_ifru = ifrr.ifr_ifru;
   422	
   423		return err;
   424	}
   425	
   426	static int vlan_dev_neigh_setup(struct net_device *dev, struct neigh_parms *pa)
   427	{
   428		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   429		const struct net_device_ops *ops = real_dev->netdev_ops;
   430		int err = 0;
   431	
   432		if (netif_device_present(real_dev) && ops->ndo_neigh_setup)
   433			err = ops->ndo_neigh_setup(real_dev, pa);
   434	
   435		return err;
   436	}
   437	
   438	#if IS_ENABLED(CONFIG_FCOE)
   439	static int vlan_dev_fcoe_ddp_setup(struct net_device *dev, u16 xid,
   440					   struct scatterlist *sgl, unsigned int sgc)
   441	{
   442		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   443		const struct net_device_ops *ops = real_dev->netdev_ops;
   444		int rc = 0;
   445	
   446		if (ops->ndo_fcoe_ddp_setup)
   447			rc = ops->ndo_fcoe_ddp_setup(real_dev, xid, sgl, sgc);
   448	
   449		return rc;
   450	}
   451	
   452	static int vlan_dev_fcoe_ddp_done(struct net_device *dev, u16 xid)
   453	{
   454		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   455		const struct net_device_ops *ops = real_dev->netdev_ops;
   456		int len = 0;
   457	
   458		if (ops->ndo_fcoe_ddp_done)
   459			len = ops->ndo_fcoe_ddp_done(real_dev, xid);
   460	
   461		return len;
   462	}
   463	
   464	static int vlan_dev_fcoe_enable(struct net_device *dev)
   465	{
   466		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   467		const struct net_device_ops *ops = real_dev->netdev_ops;
   468		int rc = -EINVAL;
   469	
   470		if (ops->ndo_fcoe_enable)
   471			rc = ops->ndo_fcoe_enable(real_dev);
   472		return rc;
   473	}
   474	
   475	static int vlan_dev_fcoe_disable(struct net_device *dev)
   476	{
   477		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   478		const struct net_device_ops *ops = real_dev->netdev_ops;
   479		int rc = -EINVAL;
   480	
   481		if (ops->ndo_fcoe_disable)
   482			rc = ops->ndo_fcoe_disable(real_dev);
   483		return rc;
   484	}
   485	
   486	static int vlan_dev_fcoe_ddp_target(struct net_device *dev, u16 xid,
   487					    struct scatterlist *sgl, unsigned int sgc)
   488	{
   489		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   490		const struct net_device_ops *ops = real_dev->netdev_ops;
   491		int rc = 0;
   492	
   493		if (ops->ndo_fcoe_ddp_target)
   494			rc = ops->ndo_fcoe_ddp_target(real_dev, xid, sgl, sgc);
   495	
   496		return rc;
   497	}
   498	#endif
   499	
   500	#ifdef NETDEV_FCOE_WWNN
   501	static int vlan_dev_fcoe_get_wwn(struct net_device *dev, u64 *wwn, int type)
   502	{
   503		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   504		const struct net_device_ops *ops = real_dev->netdev_ops;
   505		int rc = -EINVAL;
   506	
   507		if (ops->ndo_fcoe_get_wwn)
   508			rc = ops->ndo_fcoe_get_wwn(real_dev, wwn, type);
   509		return rc;
   510	}
   511	#endif
   512	
   513	static void vlan_dev_change_rx_flags(struct net_device *dev, int change)
   514	{
   515		struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
   516	
   517		if (dev->flags & IFF_UP) {
   518			if (change & IFF_ALLMULTI)
   519				dev_set_allmulti(real_dev, dev->flags & IFF_ALLMULTI ? 1 : -1);
   520			if (change & IFF_PROMISC)
   521				dev_set_promiscuity(real_dev, dev->flags & IFF_PROMISC ? 1 : -1);
   522		}
   523	}
   524	
   525	static void vlan_dev_set_rx_mode(struct net_device *vlan_dev)
   526	{
   527		dev_mc_sync(vlan_dev_priv(vlan_dev)->real_dev, vlan_dev);
   528		dev_uc_sync(vlan_dev_priv(vlan_dev)->real_dev, vlan_dev);
   529	}
   530	
   531	/*
   532	 * vlan network devices have devices nesting below it, and are a special
   533	 * "super class" of normal network devices; split their locks off into a
   534	 * separate class since they always nest.
   535	 */
   536	static struct lock_class_key vlan_netdev_xmit_lock_key;
   537	static struct lock_class_key vlan_netdev_addr_lock_key;
   538	
   539	static void vlan_dev_set_lockdep_one(struct net_device *dev,
   540					     struct netdev_queue *txq,
   541					     void *unused)
   542	{
   543		lockdep_set_class(&txq->_xmit_lock, &vlan_netdev_xmit_lock_key);
   544	}
   545	
   546	static void vlan_dev_set_lockdep_class(struct net_device *dev)
   547	{
   548		lockdep_set_class(&dev->addr_list_lock,
   549				  &vlan_netdev_addr_lock_key);
   550		netdev_for_each_tx_queue(dev, vlan_dev_set_lockdep_one, NULL);
   551	}
   552	
   553	static __be16 vlan_parse_protocol(const struct sk_buff *skb)
   554	{
   555		struct vlan_ethhdr *veth = (struct vlan_ethhdr *)(skb->data);
   556	
   557		return __vlan_get_protocol(skb, veth->h_vlan_proto, NULL);
   558	}
   559	
   560	static const struct header_ops vlan_header_ops = {
   561		.create	 = vlan_dev_hard_header,
   562		.parse	 = eth_header_parse,
 > 563		.parse_protocol = vlan_parse_protocol,
   564	};
   565	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
