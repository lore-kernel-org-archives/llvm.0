Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233FF2C80
	for <llvm@lists.linux.dev>; Sat, 27 Nov 2021 11:44:51 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10180"; a="235994313"
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="235994313"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2021 03:44:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,269,1631602800"; 
   d="scan'208";a="510965686"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Nov 2021 03:44:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqw8N-0009RH-PM; Sat, 27 Nov 2021 11:44:47 +0000
Date: Sat, 27 Nov 2021 19:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ciara Loftus <ciara.loftus@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH bpf-next 3/8] xsk: handle XDP_REDIRECT_XSK and expose
 xsk_rcv/flush
Message-ID: <202111271955.w9AzLVNN-lkp@intel.com>
References: <20211116073742.7941-4-ciara.loftus@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116073742.7941-4-ciara.loftus@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ciara,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Ciara-Loftus/XDP_REDIRECT_XSK-and-Batched-AF_XDP-Rx/20211116-153952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: x86_64-randconfig-a004-20211116 (https://download.01.org/0day-ci/archive/20211127/202111271955.w9AzLVNN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project fbe72e41b99dc7994daac300d208a955be3e4a0a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/06daa8f48870f74b06ed02fe7f36b820c09844c9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ciara-Loftus/XDP_REDIRECT_XSK-and-Batched-AF_XDP-Rx/20211116-153952
        git checkout 06daa8f48870f74b06ed02fe7f36b820c09844c9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/core/dev.c:4883:5: error: expected expression
                                   struct xdp_sock *xs =
                                   ^
>> net/core/dev.c:4886:27: error: use of undeclared identifier 'xs'
                                   err = xsk_generic_rcv(xs, &xdp);
                                                         ^
   2 errors generated.


vim +4883 net/core/dev.c

  4870	
  4871	int do_xdp_generic(struct bpf_prog *xdp_prog, struct sk_buff *skb)
  4872	{
  4873		if (xdp_prog) {
  4874			struct xdp_buff xdp;
  4875			u32 act;
  4876			int err;
  4877	
  4878			act = netif_receive_generic_xdp(skb, &xdp, xdp_prog);
  4879			if (act != XDP_PASS) {
  4880				switch (act) {
  4881	#ifdef CONFIG_XDP_SOCKETS
  4882				case XDP_REDIRECT_XSK:
> 4883					struct xdp_sock *xs =
  4884						READ_ONCE(skb->dev->_rx[xdp.rxq->queue_index].xsk);
  4885	
> 4886					err = xsk_generic_rcv(xs, &xdp);
  4887					if (err)
  4888						goto out_redir;
  4889					consume_skb(skb);
  4890					break;
  4891	#endif
  4892				case XDP_REDIRECT:
  4893					err = xdp_do_generic_redirect(skb->dev, skb,
  4894								      &xdp, xdp_prog);
  4895					if (err)
  4896						goto out_redir;
  4897					break;
  4898				case XDP_TX:
  4899					generic_xdp_tx(skb, xdp_prog);
  4900					break;
  4901				}
  4902				return XDP_DROP;
  4903			}
  4904		}
  4905		return XDP_PASS;
  4906	out_redir:
  4907		kfree_skb(skb);
  4908		return XDP_DROP;
  4909	}
  4910	EXPORT_SYMBOL_GPL(do_xdp_generic);
  4911	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
