Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD2D10792;
	Tue,  7 Mar 2023 21:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678223661; x=1709759661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lzRlaQAMQQ0iCsjKUrKyy4tLvLHrlsBCKN/XyjW0dU=;
  b=A78Sb8HEgwzzPV6pkahzlXa5Df3+DzUlCWv5PO70g6IG9gis+aFoLMlR
   ZemDA/xZSQ9mq6VdmDCdFvMrEgg3gaQ5bzY08zVaCaoQlZ57/wkEougoD
   A+0A4OqxzSKbmoIJrSYz/P9UTYrWMYokzDLeCVDxKAWmo/WIPsFj2NPcM
   EUsm4muDvYlnuo7IupR9j50XcPY1QMP/Y1W8HZwhe7KGt55HgggmUGSaa
   Gnf40+XTg7HpC3JXOSlav2/poAPtNfTVZzx4c4N4r33GQjkxyWoHwAavN
   FBNLD/4TCpNxH5gNYQ1wnrC0861aecd1tP8ufCpX0aXRNrJPWSd5tC1jH
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337495422"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="337495422"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2023 13:14:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="676708491"
X-IronPort-AV: E=Sophos;i="5.98,241,1673942400"; 
   d="scan'208";a="676708491"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Mar 2023 13:14:19 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZedX-0001bv-0J;
	Tue, 07 Mar 2023 21:14:19 +0000
Date: Wed, 8 Mar 2023 05:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [miquelraynal:nvmem-layouts-and-of-cleanup 20/57]
 drivers/nvmem/core.c:770:2: error: call to undeclared function
 'of_device_node_request_module'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202303080509.4GBE41tL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/miquelraynal/linux-0day.git nvmem-layouts-and-of-cleanup
head:   4dbec5e07ef322a0458183244c9a11e92eebd61d
commit: b3a67512c995dbf8f71e14e7df1278ee7c6d26ca [20/57] nvmem: core: request layout modules loading
config: hexagon-randconfig-r033-20230306 (https://download.01.org/0day-ci/archive/20230308/202303080509.4GBE41tL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/miquelraynal/linux-0day/commit/b3a67512c995dbf8f71e14e7df1278ee7c6d26ca
        git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
        git fetch --no-tags miquelraynal nvmem-layouts-and-of-cleanup
        git checkout b3a67512c995dbf8f71e14e7df1278ee7c6d26ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/nvmem/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303080509.4GBE41tL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/nvmem/core.c:770:2: error: call to undeclared function 'of_device_node_request_module'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
