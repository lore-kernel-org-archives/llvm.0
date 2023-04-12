Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976920EE;
	Wed, 12 Apr 2023 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681318462; x=1712854462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DZIaaKhtrkIh717UpuHjFc2tGT0HE3K4qQ6hdEyXvSY=;
  b=egMmlkYGB5vCIAMgaC3TF6P/oDeY625XqjcbDW8H4sJUY+XxJK5pSS+n
   6H9Bcq1bPGYbXqRQOKCPFefmx7LIePzWk531t+OS4KNauS2r6YhwexapE
   dQHXQS54I/GH2QTcFdo4M/DUSqhRRPPmGCI2slVbifppaYANazhUcpeq4
   z2rKYSYtJdjW4ouuAPFsNRo0oFyyrkBAaM4uku6uuVat27Dhl7hJxt2UR
   pFWFfNgCHvu4LUfMgiVRb7WgBj2P5j5yqWwdhR2ebLZYQNki7at091CGj
   JxFmwACW9pLC9hz5iRloMRG4q+vAVWiX13uG1EtgbEmdWJXwZfRcqASJo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="409098668"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="409098668"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 09:54:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813058327"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="813058327"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 09:54:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmdjd-000XuH-2x;
	Wed, 12 Apr 2023 16:54:17 +0000
Date: Thu, 13 Apr 2023 00:53:46 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>, Jonathan Corbet <corbet@lwn.net>
Subject: [xilinx-xlnx:master 12090/14520] drivers/media/mc/mc-entity.c:308:
 warning: expecting prototype for media_entity_graph_walk_init(). Prototype
 was for media_graph_walk_init() instead
Message-ID: <202304130004.4RRrP7hX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 57f1706d9ac1a75fd4e037ce7f7907020c5efe8c [12090/14520] scripts: kernel-doc: validate kernel-doc markup with the actual names
config: x86_64-randconfig-a002-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130004.4RRrP7hX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/57f1706d9ac1a75fd4e037ce7f7907020c5efe8c
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 57f1706d9ac1a75fd4e037ce7f7907020c5efe8c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/media/mc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130004.4RRrP7hX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:308: warning: expecting prototype for media_entity_graph_walk_init(). Prototype was for media_graph_walk_init() instead


vim +308 drivers/media/mc/mc-entity.c

3775b4799ae34a drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  294  
3775b4799ae34a drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  295  /**
3775b4799ae34a drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  296   * media_entity_graph_walk_init - Allocate resources for graph walk
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  297   * @graph: Media graph structure that will be used to walk the graph
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  298   * @mdev: Media device
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  299   *
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  300   * Reserve resources for graph walk in media device's current
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  301   * state. The memory must be released using
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  302   * media_graph_walk_free().
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  303   *
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  304   * Returns error on failure, zero on success.
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  305   */
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  306  __must_check int media_graph_walk_init(
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  307  	struct media_graph *graph, struct media_device *mdev)
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16 @308  {
29d8da02d13020 drivers/media/media-entity.c Sakari Ailus     2015-12-16  309  	return media_entity_enum_init(&graph->ent_enum, mdev);
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  310  }
20b852273642f4 drivers/media/media-entity.c Sakari Ailus     2016-11-21  311  EXPORT_SYMBOL_GPL(media_graph_walk_init);
e03d220336dd69 drivers/media/media-entity.c Sakari Ailus     2015-12-16  312  

:::::: The code at line 308 was first introduced by commit
:::::: e03d220336dd69292370393f5eee98ac17eda308 [media] media: Amend media graph walk API by init and cleanup functions

:::::: TO: Sakari Ailus <sakari.ailus@iki.fi>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
