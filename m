Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BB42CA2
	for <llvm@lists.linux.dev>; Wed, 15 Dec 2021 09:45:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="237927369"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="237927369"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 01:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="482332423"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Dec 2021 01:45:55 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxQrD-0001ZC-1a; Wed, 15 Dec 2021 09:45:55 +0000
Date: Wed, 15 Dec 2021 17:45:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [net-next PATCH RFC v6 12/16] net: dsa: qca8k: add support for
 mdio read/write in Ethernet packet
Message-ID: <202112151702.Xhos4slJ-lkp@intel.com>
References: <20211214224409.5770-13-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214224409.5770-13-ansuelsmth@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Ansuel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Ansuel-Smith/Add-support-for-qca8k-mdio-rw-in-Ethernet-packet/20211215-064645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git fe4c82a7e0f06abdf5a6978aa00457b63bd46680
config: arm64-randconfig-r016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112151702.Xhos4slJ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/8036c636992760ad100109c1385110b8fda46e25
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Ansuel-Smith/Add-support-for-qca8k-mdio-rw-in-Ethernet-packet/20211215-064645
        git checkout 8036c636992760ad100109c1385110b8fda46e25
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/net/dsa/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca8k.c:2577:3: error: expected expression
                   struct tag_qca_priv *priv;
                   ^
>> drivers/net/dsa/qca8k.c:2579:3: error: use of undeclared identifier 'priv'
                   priv = ds->tagger_data;
                   ^
   drivers/net/dsa/qca8k.c:2584:3: error: use of undeclared identifier 'priv'
                   priv->rw_reg_ack_handler = qca8k_rw_reg_ack_handler;
                   ^
   3 errors generated.


vim +2577 drivers/net/dsa/qca8k.c

  2569	
  2570	static int qca8k_connect_tag_protocol(struct dsa_switch *ds,
  2571					      enum dsa_tag_protocol proto)
  2572	{
  2573		struct qca8k_priv *qca8k_priv = ds->priv;
  2574	
  2575		switch (proto) {
  2576		case DSA_TAG_PROTO_QCA:
> 2577			struct tag_qca_priv *priv;
  2578	
> 2579			priv = ds->tagger_data;
  2580	
  2581			mutex_init(&qca8k_priv->mdio_hdr_data.mutex);
  2582			init_completion(&qca8k_priv->mdio_hdr_data.rw_done);
  2583	
  2584			priv->rw_reg_ack_handler = qca8k_rw_reg_ack_handler;
  2585	
  2586			break;
  2587		default:
  2588			return -EOPNOTSUPP;
  2589		}
  2590	
  2591		return 0;
  2592	}
  2593	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
