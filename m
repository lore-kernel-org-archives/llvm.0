Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1DC2CA7
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 16:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643561568; x=1675097568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PHk+oaHZZiojjeI8TMX3SbWxPQ7wloJmh5lcnUZc440=;
  b=PYP5y7Rq9sD2/NEtnTEfhj1DrCOh6EMxWwfbBqlslKNgRtyaW3spdgXg
   8mQQvE8pCOikyqteijyq3M1oY8Os0lJQV+sIS0/1Pyc+vDxetlkLaLS19
   j+r6m5yQs8T4wPiyN3B92kFgKMT8VanWydocICF4ACai7sfJcOCBb1+uo
   798QoIhJl8WKatzGzDdTxk00GPjO+ZaML7QkwTJo0yrU+7gL2WeN9uTDs
   zgawGdkARHwFof/xayOITcDlDSKsSvMfKVwO+qFBlX/qUg+STGK3pOavo
   0rp9PphnA++/kk7X2f7PjEMAeHgh8+AwyHVi0TRi/6htEyZvrWsV+P1mx
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="228025246"
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="228025246"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 08:52:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,329,1635231600"; 
   d="scan'208";a="481325382"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Jan 2022 08:52:44 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEDRT-000Qkf-AN; Sun, 30 Jan 2022 16:52:43 +0000
Date: Mon, 31 Jan 2022 00:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Blakey <paulb@nvidia.com>, dev@openvswitch.org,
	netdev@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Pravin B Shelar <pshelar@ovn.org>, davem@davemloft.net,
	Jiri Pirko <jiri@nvidia.com>, Jakub Kicinski <kuba@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 1/1] net/sched: Enable tc skb ext allocation on
 chain miss only when needed
Message-ID: <202201310016.Z4iqHnpx-lkp@intel.com>
References: <20220130123141.10119-1-paulb@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130123141.10119-1-paulb@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Paul,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Paul-Blakey/net-sched-Enable-tc-skb-ext-allocation-on-chain-miss-only-when-needed/20220130-203224
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git ff58831fa02deb42fd731f830d8d9ec545573c7c
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220131/202201310016.Z4iqHnpx-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0bc6313c4ce18444ed88c99b19d0cb1682772988
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Paul-Blakey/net-sched-Enable-tc-skb-ext-allocation-on-chain-miss-only-when-needed/20220130-203224
        git checkout 0bc6313c4ce18444ed88c99b19d0cb1682772988
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> net/sched/cls_api.c:55:6: error: redefinition of 'tc_skb_ext_tc_ovs_enable'
   void tc_skb_ext_tc_ovs_enable(void)
        ^
   include/net/pkt_cls.h:1037:20: note: previous definition is here
   static inline void tc_skb_ext_tc_ovs_enable(void) { }
                      ^
>> net/sched/cls_api.c:61:6: error: redefinition of 'tc_skb_ext_tc_ovs_disable'
   void tc_skb_ext_tc_ovs_disable(void)
        ^
   include/net/pkt_cls.h:1038:20: note: previous definition is here
   static inline void tc_skb_ext_tc_ovs_disable(void) { }
                      ^
   2 errors generated.


vim +/tc_skb_ext_tc_ovs_enable +55 net/sched/cls_api.c

    54	
  > 55	void tc_skb_ext_tc_ovs_enable(void)
    56	{
    57		static_branch_inc(&tc_skb_ext_tc_ovs);
    58	}
    59	EXPORT_SYMBOL(tc_skb_ext_tc_ovs_enable);
    60	
  > 61	void tc_skb_ext_tc_ovs_disable(void)
    62	{
    63		static_branch_dec(&tc_skb_ext_tc_ovs);
    64	}
    65	EXPORT_SYMBOL(tc_skb_ext_tc_ovs_disable);
    66	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
