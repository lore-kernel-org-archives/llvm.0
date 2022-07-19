Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DB41871
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658234474; x=1689770474;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5K9Sn3hjVaN7AmQBmAjNWJyp6DduzsXd9J8X1vrLuYI=;
  b=NYeTDlf/P0bxJrq8BRZuE3TWJP2vZLTDopty6IfE751tdDpnPjeUOoe9
   T6DQUvD3DONlJY7Fd6evs4tq8yhNE1+hf+tVcETUZOtZhUGEw/z1Yj7Ll
   9x5E8UiMUcNsTeL9v2FLK19xnsu++N2NW2jX6Ie+UZbl86S8/rZkw9EqV
   y2//jouZue7Um71om/CnZ8PN5/eiWJ73BaJ8mVmyfXEs7ADR6qBWI53F8
   YpwuM34dTW5y/CaXHP1bFlQXBa1eMXRhJA4hQ1TDx9IrRnT+3GCVihTf2
   dEirNSXTD56/0jWGmVvK7o63qFoWkc3LHTi8JoK2vu//pPgPu00F2C+9V
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="287224013"
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="287224013"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 05:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,284,1650956400"; 
   d="scan'208";a="630316024"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 19 Jul 2022 05:41:13 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDmXI-0005eY-Hy;
	Tue, 19 Jul 2022 12:41:12 +0000
Date: Tue, 19 Jul 2022 20:40:47 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Anderson <sean.anderson@seco.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH net-next 3/9] net: pcs: Add helpers for registering
 and finding PCSs
Message-ID: <202207192022.7RkDOpof-lkp@intel.com>
References: <20220711160519.741990-4-sean.anderson@seco.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220711160519.741990-4-sean.anderson@seco.com>

Hi Sean,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on robh/for-next]
[also build test ERROR on shawnguo/for-next arm/for-next linus/master v5.19-rc7 next-20220718]
[cannot apply to net-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Anderson/net-pcs-Add-support-for-devices-probed-in-the-usual-manner/20220712-001203
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20220719/202207192022.7RkDOpof-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 07022e6cf9b5b3baa642be53d0b3c3f1c403dbfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/344e04b738b5ce1493a6085673309fac376c9763
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sean-Anderson/net-pcs-Add-support-for-devices-probed-in-the-usual-manner/20220712-001203
        git checkout 344e04b738b5ce1493a6085673309fac376c9763
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/pcs/core.o: error: local symbol 'pcs_get_by_fwnode' was exported

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
