Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262478465;
	Tue, 28 Mar 2023 14:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680012010; x=1711548010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oj3MPxsUxa8idTXjaz0LqHZazOUaL0RhUSuGpsCBQQk=;
  b=RhO5nqiR6qyV3ZwG57IlS30VQJknTPLJAi1RGeDJbT3RdWnTdepMAt7w
   8UYCF6TIS5kCBzs5AsJUjRIzvv4BGejXZ0J7b+UORAppS/CUsWlVPxYWN
   F6PPIM+f6ARB9y13opiM44/TY7u3OV3+9Q7qQ8v8yEG6ydcehgzk+fEN8
   YETIW+iByFYhibtR+masM17rHiTiRA3rZIpEQOB84bNcyd8Qy7qoMcKm7
   d6WmSkJERFw8tfXhAEicVrUnWkk964S+FYSfik/o1Uup9RE/XXsa7XdK+
   yeXmSSxCzqdm+QlEZhcVyJYYOYChb9O8/7SmN+k7ecYAUAJQKsdnYdBlC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="338071021"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="338071021"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 07:00:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="661185170"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="661185170"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Mar 2023 07:00:06 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph9rp-000IaR-29;
	Tue, 28 Mar 2023 14:00:05 +0000
Date: Tue, 28 Mar 2023 21:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: Wentong Wu <wentong.wu@intel.com>, sakari.ailus@linux.intel.com,
	hdegoede@redhat.com, djrscally@gmail.com,
	laurent.pinchart@ideasonboard.com, linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bingbu.cao@linux.intel.com, zhifeng.wang@intel.com,
	xiang.ye@intel.com, tian.shu.qiu@intel.com,
	Wentong Wu <wentong.wu@intel.com>
Subject: Re: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
Message-ID: <202303282158.PaVVxGIS-lkp@intel.com>
References: <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679898188-14426-2-git-send-email-wentong.wu@intel.com>

Hi Wentong,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on rafael-pm/linux-next sailus-media-tree/streams linus/master v6.3-rc4 next-20230328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230327-142435
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/1679898188-14426-2-git-send-email-wentong.wu%40intel.com
patch subject: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303282158.PaVVxGIS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/413726a06ca6f775b34425ed81e996b9b7237d31
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Wentong-Wu/media-pci-intel-ivsc-Add-CSI-submodule/20230327-142435
        git checkout 413726a06ca6f775b34425ed81e996b9b7237d31
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/media/i2c/ drivers/media/pci/intel/ivsc/ drivers/net/usb/ net/netfilter/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303282158.PaVVxGIS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/pci/intel/ivsc/csi_bridge.c:179:2: error: implicit declaration of function 'software_node_unregister_nodes' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           software_node_unregister_nodes(sensor->swnodes);
           ^
   drivers/media/pci/intel/ivsc/csi_bridge.c:231:8: error: implicit declaration of function 'software_node_register_nodes' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = software_node_register_nodes(sensor->swnodes);
                 ^
   drivers/media/pci/intel/ivsc/csi_bridge.c:249:2: error: implicit declaration of function 'software_node_unregister_nodes' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           software_node_unregister_nodes(sensor->swnodes);
           ^
>> drivers/media/pci/intel/ivsc/csi_bridge.c:284:5: warning: no previous prototype for function 'csi_bridge_init' [-Wmissing-prototypes]
   int csi_bridge_init(struct mei_cl_device *csi_dev)
       ^
   drivers/media/pci/intel/ivsc/csi_bridge.c:284:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int csi_bridge_init(struct mei_cl_device *csi_dev)
   ^
   static 
   1 warning and 3 errors generated.


vim +/csi_bridge_init +284 drivers/media/pci/intel/ivsc/csi_bridge.c

   283	
 > 284	int csi_bridge_init(struct mei_cl_device *csi_dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
