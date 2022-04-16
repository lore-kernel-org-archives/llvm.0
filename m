Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF7D20EA
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 03:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650078587; x=1681614587;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2oqCy262BIHrBhZkbyDWcQ+h+NCRtgXxKKOmXYXh2fs=;
  b=E+TSdXuiaaFVTR036TkbwqsH+S20Jo4Ux9G8kCDo2xq3NCGIaTGqhItc
   4svJnJc4v02vcQ5ltDRVFB+qb2CxINL+28S49bQ4gu4salQaaGPR3f+M9
   mcGOTM770gdPv5w1GXvUBOG7szlwUZRXFK9oInFYV99H4cvMADKv+oCDj
   f+rnAGglxfsNiNb+6DfrMeXh3aeL98Td00jcResr1iRXFb6opK7UJwDiU
   bD/GnOM7ADw6PyfsUqs15iUI4R/g7PL4+1iGR/DItYTEnai7gR2asvdFP
   8kT0vp67JH9eREh+a+8gIHIXf8Lw6mnOaZzkfB5PKmSJg5tcPN/02G417
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="245149672"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="245149672"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 20:09:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="624722956"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Apr 2022 20:09:45 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfYoi-0002hq-HI;
	Sat, 16 Apr 2022 03:09:44 +0000
Date: Sat, 16 Apr 2022 11:09:17 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [ammarfaizi2-block:bpf/bpf-next/master 10/17]
 drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.c:147:3: error: fallthrough
 annotation does not directly precede switch label
Message-ID: <202204161130.bjMDOgRJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block bpf/bpf-next/master
head:   0fb53aabc5fcdf848ec7adc777baff25a1c6c335
commit: c7dd09fd46283029a41615b2b7034aea26b22ee0 [10/17] ixgbe, xsk: Terminate Rx side of NAPI when XSK Rx queue gets full
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220416/202204161130.bjMDOgRJ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8e43cbab33765c476337571e5ed11b005199dd0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/c7dd09fd46283029a41615b2b7034aea26b22ee0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block bpf/bpf-next/master
        git checkout c7dd09fd46283029a41615b2b7034aea26b22ee0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.c:147:3: error: fallthrough annotation does not directly precede switch label
                   fallthrough; /* handle aborts by dropping packet */
                   ^
   include/linux/compiler_attributes.h:222:41: note: expanded from macro 'fallthrough'
   # define fallthrough                    __attribute__((__fallthrough__))
                                           ^
   1 error generated.


vim +147 drivers/net/ethernet/intel/ixgbe/ixgbe_xsk.c

d0bcacd0a130974 Björn Töpel        2018-10-02   96  
d0bcacd0a130974 Björn Töpel        2018-10-02   97  static int ixgbe_run_xdp_zc(struct ixgbe_adapter *adapter,
d0bcacd0a130974 Björn Töpel        2018-10-02   98  			    struct ixgbe_ring *rx_ring,
d0bcacd0a130974 Björn Töpel        2018-10-02   99  			    struct xdp_buff *xdp)
d0bcacd0a130974 Björn Töpel        2018-10-02  100  {
d0bcacd0a130974 Björn Töpel        2018-10-02  101  	int err, result = IXGBE_XDP_PASS;
d0bcacd0a130974 Björn Töpel        2018-10-02  102  	struct bpf_prog *xdp_prog;
4fe815850bdc8d4 Jason Xing         2021-09-29  103  	struct ixgbe_ring *ring;
d0bcacd0a130974 Björn Töpel        2018-10-02  104  	struct xdp_frame *xdpf;
d0bcacd0a130974 Björn Töpel        2018-10-02  105  	u32 act;
d0bcacd0a130974 Björn Töpel        2018-10-02  106  
d0bcacd0a130974 Björn Töpel        2018-10-02  107  	xdp_prog = READ_ONCE(rx_ring->xdp_prog);
d0bcacd0a130974 Björn Töpel        2018-10-02  108  	act = bpf_prog_run_xdp(xdp_prog, xdp);
d8c3061e5edd3b1 Kevin Laatz        2019-08-27  109  
7d52fe2eaddfa3d Magnus Karlsson    2020-12-02  110  	if (likely(act == XDP_REDIRECT)) {
7d52fe2eaddfa3d Magnus Karlsson    2020-12-02  111  		err = xdp_do_redirect(rx_ring->netdev, xdp, xdp_prog);
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  112  		if (!err)
8281356b1cab1cc Magnus Karlsson    2021-05-10  113  			return IXGBE_XDP_REDIR;
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  114  		if (xsk_uses_need_wakeup(rx_ring->xsk_pool) && err == -ENOBUFS)
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  115  			result = IXGBE_XDP_EXIT;
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  116  		else
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  117  			result = IXGBE_XDP_CONSUMED;
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  118  		goto out_failure;
7d52fe2eaddfa3d Magnus Karlsson    2020-12-02  119  	}
7d52fe2eaddfa3d Magnus Karlsson    2020-12-02  120  
d0bcacd0a130974 Björn Töpel        2018-10-02  121  	switch (act) {
d0bcacd0a130974 Björn Töpel        2018-10-02  122  	case XDP_PASS:
d0bcacd0a130974 Björn Töpel        2018-10-02  123  		break;
d0bcacd0a130974 Björn Töpel        2018-10-02  124  	case XDP_TX:
1b698fa5d8ef958 Lorenzo Bianconi   2020-05-28  125  		xdpf = xdp_convert_buff_to_frame(xdp);
8281356b1cab1cc Magnus Karlsson    2021-05-10  126  		if (unlikely(!xdpf))
8281356b1cab1cc Magnus Karlsson    2021-05-10  127  			goto out_failure;
4fe815850bdc8d4 Jason Xing         2021-09-29  128  		ring = ixgbe_determine_xdp_ring(adapter);
4fe815850bdc8d4 Jason Xing         2021-09-29  129  		if (static_branch_unlikely(&ixgbe_xdp_locking_key))
4fe815850bdc8d4 Jason Xing         2021-09-29  130  			spin_lock(&ring->tx_lock);
4fe815850bdc8d4 Jason Xing         2021-09-29  131  		result = ixgbe_xmit_xdp_ring(ring, xdpf);
4fe815850bdc8d4 Jason Xing         2021-09-29  132  		if (static_branch_unlikely(&ixgbe_xdp_locking_key))
4fe815850bdc8d4 Jason Xing         2021-09-29  133  			spin_unlock(&ring->tx_lock);
8281356b1cab1cc Magnus Karlsson    2021-05-10  134  		if (result == IXGBE_XDP_CONSUMED)
8281356b1cab1cc Magnus Karlsson    2021-05-10  135  			goto out_failure;
d0bcacd0a130974 Björn Töpel        2018-10-02  136  		break;
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  137  	case XDP_DROP:
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  138  		result = IXGBE_XDP_CONSUMED;
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  139  		break;
d0bcacd0a130974 Björn Töpel        2018-10-02  140  	default:
c8064e5b4adac5e Paolo Abeni        2021-11-30  141  		bpf_warn_invalid_xdp_action(rx_ring->netdev, xdp_prog, act);
5463fce643e8d04 Jeff Kirsher       2020-06-03  142  		fallthrough;
d0bcacd0a130974 Björn Töpel        2018-10-02  143  	case XDP_ABORTED:
c7dd09fd4628302 Maciej Fijalkowski 2022-04-13  144  		result = IXGBE_XDP_CONSUMED;
8281356b1cab1cc Magnus Karlsson    2021-05-10  145  out_failure:
d0bcacd0a130974 Björn Töpel        2018-10-02  146  		trace_xdp_exception(rx_ring->netdev, xdp_prog, act);
5463fce643e8d04 Jeff Kirsher       2020-06-03 @147  		fallthrough; /* handle aborts by dropping packet */
d0bcacd0a130974 Björn Töpel        2018-10-02  148  	}
d0bcacd0a130974 Björn Töpel        2018-10-02  149  	return result;
d0bcacd0a130974 Björn Töpel        2018-10-02  150  }
d0bcacd0a130974 Björn Töpel        2018-10-02  151  

:::::: The code at line 147 was first introduced by commit
:::::: 5463fce643e8d041f54378b28b35940fd5e5a5a4 ethernet/intel: Convert fallthrough code comments

:::::: TO: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
