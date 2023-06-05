Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EE443A;
	Mon,  5 Jun 2023 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685962806; x=1717498806;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EP+17NXEO4Ztl9FMitikZBW0xJsxetUCXOZuhNErMOw=;
  b=PGgkyL9Kk40T8LPNzrmWVLLh59Q80T+GKrh0rOKtKte5tzDjO+NOKSI3
   2PDSzX1fhHFjhgGn6km34P6i/FwTUqQZeK1y+3tkyTnKwSbr49VDhGaMj
   VGzXsYUNt64irn5BFd04+o16CygxuUTidp8sea9h6aXjMMfGGnSk2RncH
   f4BpzSYs+i4xfovwC2hxrueWQxOa2hXFw//nYsvRFhX95y8nkEsaFd2fl
   pH3Aka9Rx8ffZcrdiZ7Tq20bp6JY6H65iRS5sI+ljkm7pF1waatRtV9/a
   VuiTKZxGmhSCdH98upio5QmgMFkAfhGDAeRC6JKwbSBc/AWG/EA0kXkF6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="358787371"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="358787371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 04:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="955294125"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="955294125"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jun 2023 04:00:01 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q67wO-00048B-3A;
	Mon, 05 Jun 2023 11:00:00 +0000
Date: Mon, 5 Jun 2023 18:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Vlad Buslov <vladbu@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Pirko <jiri@nvidia.com>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.4.y 3300/8640] net/sched/cls_flower.c:296:12:
 warning: stack frame size (1040) exceeds limit (1024) in 'fl_classify'
Message-ID: <202306051816.mO3hqt7d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Vlad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   cf0b1e5482eaeb4db15c9e703267483dba88b575
commit: 5f2e54391893c67b709a64b280417ca0318adb73 [3300/8640] net/sched: flower: fix parsing of ethertype following VLAN header
config: mips-randconfig-r013-20230605 (https://download.01.org/0day-ci/archive/20230605/202306051816.mO3hqt7d-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5f2e54391893c67b709a64b280417ca0318adb73
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 5f2e54391893c67b709a64b280417ca0318adb73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306051816.mO3hqt7d-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/sched/cls_flower.c:296:12: warning: stack frame size (1040) exceeds limit (1024) in 'fl_classify' [-Wframe-larger-than]
   static int fl_classify(struct sk_buff *skb, const struct tcf_proto *tp,
              ^
   1 warning generated.


vim +/fl_classify +296 net/sched/cls_flower.c

e0ace68af2acfe Paul Blakey            2019-07-09  295  
77b9900ef53ae0 Jiri Pirko             2015-05-12 @296  static int fl_classify(struct sk_buff *skb, const struct tcf_proto *tp,
77b9900ef53ae0 Jiri Pirko             2015-05-12  297  		       struct tcf_result *res)
77b9900ef53ae0 Jiri Pirko             2015-05-12  298  {
77b9900ef53ae0 Jiri Pirko             2015-05-12  299  	struct cls_fl_head *head = rcu_dereference_bh(tp->root);
77b9900ef53ae0 Jiri Pirko             2015-05-12  300  	struct fl_flow_key skb_mkey;
e0ace68af2acfe Paul Blakey            2019-07-09  301  	struct fl_flow_key skb_key;
e0ace68af2acfe Paul Blakey            2019-07-09  302  	struct fl_flow_mask *mask;
e0ace68af2acfe Paul Blakey            2019-07-09  303  	struct cls_fl_filter *f;
77b9900ef53ae0 Jiri Pirko             2015-05-12  304  
05cd271fd61a0b Paul Blakey            2018-04-30  305  	list_for_each_entry_rcu(mask, &head->masks, list) {
50acd32ea7f682 Jason Baron            2020-02-17  306  		flow_dissector_init_keys(&skb_key.control, &skb_key.basic);
05cd271fd61a0b Paul Blakey            2018-04-30  307  		fl_clear_masked_range(&skb_key, mask);
bc3103f1ed405d Amir Vadai             2016-09-08  308  
8212ed777f40c7 Jiri Pirko             2019-06-19  309  		skb_flow_dissect_meta(skb, &mask->dissector, &skb_key);
05cd271fd61a0b Paul Blakey            2018-04-30  310  		/* skb_flow_dissect() does not set n_proto in case an unknown
05cd271fd61a0b Paul Blakey            2018-04-30  311  		 * protocol, so do it rather here.
77b9900ef53ae0 Jiri Pirko             2015-05-12  312  		 */
9b7fd81cf9b6ca Toke Høiland-Jørgensen 2020-07-03  313  		skb_key.basic.n_proto = skb_protocol(skb, false);
05cd271fd61a0b Paul Blakey            2018-04-30  314  		skb_flow_dissect_tunnel_info(skb, &mask->dissector, &skb_key);
e0ace68af2acfe Paul Blakey            2019-07-09  315  		skb_flow_dissect_ct(skb, &mask->dissector, &skb_key,
e0ace68af2acfe Paul Blakey            2019-07-09  316  				    fl_ct_info_to_flower_map,
e0ace68af2acfe Paul Blakey            2019-07-09  317  				    ARRAY_SIZE(fl_ct_info_to_flower_map));
05cd271fd61a0b Paul Blakey            2018-04-30  318  		skb_flow_dissect(skb, &mask->dissector, &skb_key, 0);
77b9900ef53ae0 Jiri Pirko             2015-05-12  319  
05cd271fd61a0b Paul Blakey            2018-04-30  320  		fl_set_masked_key(&skb_mkey, &skb_key, mask);
77b9900ef53ae0 Jiri Pirko             2015-05-12  321  
5c72299fba9df4 Amritha Nambiar        2018-11-12  322  		f = fl_lookup(mask, &skb_mkey, &skb_key);
e8eb36cd8ca93f Amir Vadai             2016-06-13  323  		if (f && !tc_skip_sw(f->flags)) {
77b9900ef53ae0 Jiri Pirko             2015-05-12  324  			*res = f->res;
77b9900ef53ae0 Jiri Pirko             2015-05-12  325  			return tcf_exts_exec(skb, &f->exts, res);
77b9900ef53ae0 Jiri Pirko             2015-05-12  326  		}
05cd271fd61a0b Paul Blakey            2018-04-30  327  	}
77b9900ef53ae0 Jiri Pirko             2015-05-12  328  	return -1;
77b9900ef53ae0 Jiri Pirko             2015-05-12  329  }
77b9900ef53ae0 Jiri Pirko             2015-05-12  330  

:::::: The code at line 296 was first introduced by commit
:::::: 77b9900ef53ae047e36a37d13a2aa33bb2d60641 tc: introduce Flower classifier

:::::: TO: Jiri Pirko <jiri@resnulli.us>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
