Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510187E
	for <llvm@lists.linux.dev>; Sat, 23 Jul 2022 23:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658620337; x=1690156337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rN1To4w81kkDR5odmME9HZKNEMuJa2D6WZFyhrEIYKU=;
  b=k95rIbIwDZYt4JEl0cbdPlF0nfdRSGCsi0ypQpiDJelYCzkSRlnIKCeJ
   GYHSzbBRDnHiGFO0JEAlyutFUkICYgpgUCGmeH+EEhLkaMVcsvP7yg3xN
   Hd8Kg8JEQCeO0p9n9jKDeq4ZzK9efiJirochezwa2zAIHHmK3OM032OMD
   dts+bwp9mzC0yA9B5X+Rwo8QMEovXs/yDcapy9eyByHrCJe+GZDNwXM+7
   m2GlO5WlD9xf3ISsrbFLeSiWEZUhnmW2uktSg3OoT/8op3QQnLDa2kBAf
   W0+5vnVKLf+xpabzuEz0V7nHLJ8URHOIAqEsisp5AjsieCZmhs0saF/uo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10417"; a="286260970"
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="286260970"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2022 16:52:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,189,1654585200"; 
   d="scan'208";a="688656719"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2022 16:52:12 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFOuq-0003FZ-0B;
	Sat, 23 Jul 2022 23:52:12 +0000
Date: Sun, 24 Jul 2022 07:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, netdev@vger.kernel.org
Subject: Re: [net-next PATCH v3 03/14] net: dsa: qca8k: move mib struct to
 common code
Message-ID: <202207240750.2zRvF1Qu-lkp@intel.com>
References: <20220723141845.10570-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723141845.10570-4-ansuelsmth@gmail.com>

Hi Christian,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/net-dsa-qca8k-code-split-for-qca8k/20220723-222259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git 502c6f8cedcce7889ccdefeb88ce36b39acd522f
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220724/202207240750.2zRvF1Qu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/21c0b9bac2dea29fbb83f818459e7d6f6c74e83e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christian-Marangi/net-dsa-qca8k-code-split-for-qca8k/20220723-222259
        git checkout 21c0b9bac2dea29fbb83f818459e7d6f6c74e83e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/dsa/qca/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-8xxx.c:3208:9: error: initializer element is not a compile-time constant
           .ops = qca8xxx_ops,
                  ^~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:3214:9: error: initializer element is not a compile-time constant
           .ops = qca8xxx_ops,
                  ^~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:3220:9: error: initializer element is not a compile-time constant
           .ops = qca8xxx_ops,
                  ^~~~~~~~~~~
   3 errors generated.


vim +3208 drivers/net/dsa/qca/qca8k-8xxx.c

7f6400ae8410e85 drivers/net/dsa/qca/qca8k.c Christian Marangi 2022-07-23  3203  
f477d1c8bdbef4f drivers/net/dsa/qca8k.c     Christian Marangi 2021-10-14  3204  static const struct qca8k_match_data qca8327 = {
f477d1c8bdbef4f drivers/net/dsa/qca8k.c     Christian Marangi 2021-10-14  3205  	.id = QCA8K_ID_QCA8327,
f477d1c8bdbef4f drivers/net/dsa/qca8k.c     Christian Marangi 2021-10-14  3206  	.reduced_package = true,
c126f118b330ccf drivers/net/dsa/qca8k.c     Christian Marangi 2021-11-22  3207  	.mib_count = QCA8K_QCA832X_MIB_COUNT,
7f6400ae8410e85 drivers/net/dsa/qca/qca8k.c Christian Marangi 2022-07-23 @3208  	.ops = qca8xxx_ops,
f477d1c8bdbef4f drivers/net/dsa/qca8k.c     Christian Marangi 2021-10-14  3209  };
f477d1c8bdbef4f drivers/net/dsa/qca8k.c     Christian Marangi 2021-10-14  3210  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
