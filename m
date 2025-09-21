Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C292C187;
	Sun, 21 Sep 2025 04:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758427949; cv=none; b=FB717qHrtBuI6p5PBIz57dFnpP4oh8fXK5QizXWNM3cpu36l5tdmGekyv2zxovN8iA3vAPEeARhhSWXfkwwYBA9goYWL3iuW0U7UbRwxyao3B4HIumyWtCdm2zWpCeZ9N4TiIdjAAcAWn6+CGbzg9tPWIKukj+edpJJuBciY9ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758427949; c=relaxed/simple;
	bh=Qosd6iFsC2pqjdVrasIVZrOikIs8NgWYrQdl0YZRuA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zrry8V0u7Qx1ImupsxT5ardavbwJw/4v60HO8X+dVMQAfpPABSaNWQ2u/PaYiwNZu6FNdiVaaHCrPGlkk+dB1HY5tQsH/F33f5lalf1Kf8mKYcXJrDUYnsjbXMp7LSAwQKsVxPFKdaGFaloIQg7Bb0rY914lgp/voXexDPmKjCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m9yk2xn1; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m9yk2xn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758427947; x=1789963947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Qosd6iFsC2pqjdVrasIVZrOikIs8NgWYrQdl0YZRuA8=;
  b=m9yk2xn1E/B7m/gx03QHVWanLgW/q9AVhpsF0rG7PSa0Qg+vGkB7Tz3J
   CsqrS3NMb3odeaPfxBgl/zRpJLjbWga44/zjIdkkmvviJml2nmlYbwy85
   g7cOwXIOH6zw0PF8RWruk7BtNgLwNCMxVukNQVhyrzr2VhpMsbloollpw
   8o92Kt54LKNo3LQFBJSZNR/EWkZ5wzG891IIoaprsme1DFcvnfUQXCBQQ
   HhN2L4MhPsQb1Iw646nAQXfa8vdY9tclx+TrwNfLy+XOLHdtPWSf1S+YP
   qlkz1fr9XNHVyi7Gcybl8zQq5P54ZQnZokbwNmnoo7myD7BXly6zuY6jw
   A==;
X-CSE-ConnectionGUID: LdkFLy5wR6GmKSFA3VhfJg==
X-CSE-MsgGUID: UhGl/f6JSnmN0MVv01hBmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64533249"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64533249"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 21:12:26 -0700
X-CSE-ConnectionGUID: 4NT8ZI/9ScefxA/s6fGGow==
X-CSE-MsgGUID: BrNEfq3BTqee6WwWp/bldQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="180599717"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Sep 2025 21:12:25 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0BQw-0000QP-2f;
	Sun, 21 Sep 2025 04:12:19 +0000
Date: Sun, 21 Sep 2025 12:11:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-wired-lan] [PATCH RFC bpf-next 2/6] net: xdp: Add
 xmo_rx_checksum callback
Message-ID: <202509211152.pSvQE7Vp-lkp@intel.com>
References: <20250920-xdp-meta-rxcksum-v1-2-35e76a8a84e7@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920-xdp-meta-rxcksum-v1-2-35e76a8a84e7@kernel.org>

Hi Lorenzo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 315f423be0d1ebe720d8fd4fa6bed68586b13d34]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/netlink-specs-Add-XDP-RX-checksum-capability-to-XDP-metadata-specs/20250920-202402
base:   315f423be0d1ebe720d8fd4fa6bed68586b13d34
patch link:    https://lore.kernel.org/r/20250920-xdp-meta-rxcksum-v1-2-35e76a8a84e7%40kernel.org
patch subject: [Intel-wired-lan] [PATCH RFC bpf-next 2/6] net: xdp: Add xmo_rx_checksum callback
config: x86_64-buildonly-randconfig-001-20250921 (https://download.01.org/0day-ci/archive/20250921/202509211152.pSvQE7Vp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509211152.pSvQE7Vp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509211152.pSvQE7Vp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/netdev-genl.c:50:1: error: use of undeclared identifier 'NETDEV_XDP_RX_METADATA_CHECKSUM'; did you mean 'NETDEV_XDP_RX_METADATA_HASH'?
      50 | XDP_METADATA_KFUNC_xxx
         | ^
   include/net/xdp.h:585:7: note: expanded from macro 'XDP_METADATA_KFUNC_xxx'
     585 |                            NETDEV_XDP_RX_METADATA_CHECKSUM, \
         |                            ^
   include/uapi/linux/netdev.h:52:2: note: 'NETDEV_XDP_RX_METADATA_HASH' declared here
      52 |         NETDEV_XDP_RX_METADATA_HASH = 2,
         |         ^
   1 error generated.


vim +50 net/core/netdev-genl.c

6b6171db7fc8f7 Amritha Nambiar    2023-12-01  32  
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  33  static int
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  34  netdev_nl_dev_fill(struct net_device *netdev, struct sk_buff *rsp,
0e19d3108aeab6 Jakub Kicinski     2023-08-14  35  		   const struct genl_info *info)
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  36  {
48eb03dd26304c Stanislav Fomichev 2023-11-27  37  	u64 xsk_features = 0;
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  38  	u64 xdp_rx_meta = 0;
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  39  	void *hdr;
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  40  
99e44f39a8f713 Jakub Kicinski     2025-04-08  41  	netdev_assert_locked(netdev); /* note: rtnl_lock may not be held! */
99e44f39a8f713 Jakub Kicinski     2025-04-08  42  
0e19d3108aeab6 Jakub Kicinski     2023-08-14  43  	hdr = genlmsg_iput(rsp, info);
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  44  	if (!hdr)
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  45  		return -EMSGSIZE;
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  46  
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  47  #define XDP_METADATA_KFUNC(_, flag, __, xmo) \
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  48  	if (netdev->xdp_metadata_ops && netdev->xdp_metadata_ops->xmo) \
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  49  		xdp_rx_meta |= flag;
a9c2a608549bb1 Stanislav Fomichev 2023-09-13 @50  XDP_METADATA_KFUNC_xxx
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  51  #undef XDP_METADATA_KFUNC
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  52  
48eb03dd26304c Stanislav Fomichev 2023-11-27  53  	if (netdev->xsk_tx_metadata_ops) {
48eb03dd26304c Stanislav Fomichev 2023-11-27  54  		if (netdev->xsk_tx_metadata_ops->tmo_fill_timestamp)
48eb03dd26304c Stanislav Fomichev 2023-11-27  55  			xsk_features |= NETDEV_XSK_FLAGS_TX_TIMESTAMP;
48eb03dd26304c Stanislav Fomichev 2023-11-27  56  		if (netdev->xsk_tx_metadata_ops->tmo_request_checksum)
48eb03dd26304c Stanislav Fomichev 2023-11-27  57  			xsk_features |= NETDEV_XSK_FLAGS_TX_CHECKSUM;
ca4419f15abd19 Song Yoong Siang   2025-02-16  58  		if (netdev->xsk_tx_metadata_ops->tmo_request_launch_time)
ca4419f15abd19 Song Yoong Siang   2025-02-16  59  			xsk_features |= NETDEV_XSK_FLAGS_TX_LAUNCH_TIME_FIFO;
48eb03dd26304c Stanislav Fomichev 2023-11-27  60  	}
48eb03dd26304c Stanislav Fomichev 2023-11-27  61  
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  62  	if (nla_put_u32(rsp, NETDEV_A_DEV_IFINDEX, netdev->ifindex) ||
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  63  	    nla_put_u64_64bit(rsp, NETDEV_A_DEV_XDP_FEATURES,
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  64  			      netdev->xdp_features, NETDEV_A_DEV_PAD) ||
a9c2a608549bb1 Stanislav Fomichev 2023-09-13  65  	    nla_put_u64_64bit(rsp, NETDEV_A_DEV_XDP_RX_METADATA_FEATURES,
48eb03dd26304c Stanislav Fomichev 2023-11-27  66  			      xdp_rx_meta, NETDEV_A_DEV_PAD) ||
48eb03dd26304c Stanislav Fomichev 2023-11-27  67  	    nla_put_u64_64bit(rsp, NETDEV_A_DEV_XSK_FEATURES,
7ed352d34f1a09 Jakub Kicinski     2024-06-13  68  			      xsk_features, NETDEV_A_DEV_PAD))
7ed352d34f1a09 Jakub Kicinski     2024-06-13  69  		goto err_cancel_msg;
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  70  
13ce2daa259a3b Maciej Fijalkowski 2023-07-19  71  	if (netdev->xdp_features & NETDEV_XDP_ACT_XSK_ZEROCOPY) {
13ce2daa259a3b Maciej Fijalkowski 2023-07-19  72  		if (nla_put_u32(rsp, NETDEV_A_DEV_XDP_ZC_MAX_SEGS,
7ed352d34f1a09 Jakub Kicinski     2024-06-13  73  				netdev->xdp_zc_max_segs))
7ed352d34f1a09 Jakub Kicinski     2024-06-13  74  			goto err_cancel_msg;
13ce2daa259a3b Maciej Fijalkowski 2023-07-19  75  	}
13ce2daa259a3b Maciej Fijalkowski 2023-07-19  76  
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  77  	genlmsg_end(rsp, hdr);
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  78  
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  79  	return 0;
7ed352d34f1a09 Jakub Kicinski     2024-06-13  80  
7ed352d34f1a09 Jakub Kicinski     2024-06-13  81  err_cancel_msg:
7ed352d34f1a09 Jakub Kicinski     2024-06-13  82  	genlmsg_cancel(rsp, hdr);
7ed352d34f1a09 Jakub Kicinski     2024-06-13  83  	return -EMSGSIZE;
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  84  }
d3d854fd6a1d97 Jakub Kicinski     2023-02-01  85  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
