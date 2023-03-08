Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26417B;
	Wed,  8 Mar 2023 06:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678258076; x=1709794076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbGizSNsIdrCN7f4a30B9CpO48PO4QQhUY2fO6W5Sec=;
  b=PEMRG8LBVteRNwR0hv4nIFB/eBdwOFk8p+9n+kntT6w4coFe658b0e52
   FNop4gzkIgpZ34+55yICCJDPW/U0D9Cxt7NybUrIU9607aKDJiovegGB8
   G64L1IX0DagcKqYs+i2tZOvsMKOXvwbvF/nbCoHQq1bevbuiYFO9JCuCe
   QyWxuzeuF7unSCebEEmVLKNEEQAA4ax8PYX4pEskk6gpjb8OJRa61p984
   0BQV9pVNL769l/WrgUxFRzEmTrZkXj/dtWnCTUr6RW9rwR78cWEYoPKAC
   oz4okTqaFBGtBahopuiqrs9LrhNnhJsHQGb+Xt04YiiXn3VOQPDGBawSq
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="338402576"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="338402576"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 22:47:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="800648679"
X-IronPort-AV: E=Sophos;i="5.98,243,1673942400"; 
   d="scan'208";a="800648679"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Mar 2023 22:47:38 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZnaL-0001w1-0w;
	Wed, 08 Mar 2023 06:47:37 +0000
Date: Wed, 8 Mar 2023 14:46:41 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 19/35]
 drivers/nvmem/core.c:770:2: error: implicit declaration of function
 'of_device_node_request_module' is invalid in C99
Message-ID: <202303081413.rSnFgltK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   d8752324726fdde6bb205a5aa95ae8ff7d84eff7
commit: 836c64997070350f5797f17b1d7845b362836896 [19/35] nvmem: core: request layout modules loading
config: x86_64-randconfig-r026-20230306 (https://download.01.org/0day-ci/archive/20230308/202303081413.rSnFgltK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/836c64997070350f5797f17b1d7845b362836896
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout 836c64997070350f5797f17b1d7845b362836896
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303081413.rSnFgltK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/core.c:770:2: error: implicit declaration of function 'of_device_node_request_module' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           of_device_node_request_module(layout_np);
           ^
   1 error generated.


vim +/of_device_node_request_module +770 drivers/nvmem/core.c

   755	
   756	static struct nvmem_layout *nvmem_layout_get(struct nvmem_device *nvmem)
   757	{
   758		struct device_node *layout_np, *np = nvmem->dev.of_node;
   759		struct nvmem_layout *l, *layout = ERR_PTR(-EPROBE_DEFER);
   760	
   761		layout_np = of_get_child_by_name(np, "nvmem-layout");
   762		if (!layout_np)
   763			return NULL;
   764	
   765		/*
   766		 * In case the nvmem device was built-in while the layout was built as a
   767		 * module, we shall manually request the layout driver loading otherwise
   768		 * we'll never have any match.
   769		 */
 > 770		of_device_node_request_module(layout_np);
   771	
   772		spin_lock(&nvmem_layout_lock);
   773	
   774		list_for_each_entry(l, &nvmem_layouts, node) {
   775			if (of_match_node(l->of_match_table, layout_np)) {
   776				if (try_module_get(l->owner))
   777					layout = l;
   778	
   779				break;
   780			}
   781		}
   782	
   783		spin_unlock(&nvmem_layout_lock);
   784		of_node_put(layout_np);
   785	
   786		return layout;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
