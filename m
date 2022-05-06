Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48E52568
	for <llvm@lists.linux.dev>; Fri,  6 May 2022 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651857745; x=1683393745;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZ/svxAUpJRgB6FaxRby9FwSB3QTj1kMzWOltbQx/w0=;
  b=A0QGAaK8DG5j1SOU/i+ULsV72alfk33lxc2Ljop+emVZh+5jKtJrAP5G
   K2KAALTP62VhWON6bt728JQyg0UwADCFz6aYE/X07M5wVpH/QmJ4jV8Lg
   JsyFlmqyKlHaUzObbyDUVHwb6uvz1xWgjV8KNRDqt7GG9crNRFJ5LD1v/
   zH3LtUZ+5wJXQyoHaHcZsj+iBICqShypdgEdS9uHGn9FQ2ap4KyY3xQB1
   3QdNytC9ANGHVpVLDP6mjEmTSExQjGE3ufT85ZPvE0hDwBMziWld8KAVu
   kujZFvrbKKQii25mMAROBqrucY4II8MNVUlf0kai7NRA2TgprhQ2zr+Z5
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="267365486"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="267365486"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2022 10:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; 
   d="scan'208";a="569179816"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 May 2022 10:22:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nn1eo-000Dht-Ow;
	Fri, 06 May 2022 17:22:22 +0000
Date: Sat, 7 May 2022 01:21:25 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 579/1129]
 drivers/media/mc/mc-entity.c:308: warning: expecting prototype for
 media_entity_graph_walk_init(). Prototype was for media_graph_walk_init()
 instead
Message-ID: <202205070140.t1FZimiv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   3076249fc30bf463f8390f89009de928ad3e95ff
commit: 8b578fae9aba7b82a2af5e1bce0edc9189ca9b79 [579/1129] media: entity: Add media_entity_has_route() function
config: hexagon-randconfig-r045-20220506 (https://download.01.org/0day-ci/archive/20220507/202205070140.t1FZimiv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e004fb787698440a387750db7f8028e7cb14cfc)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/8b578fae9aba7b82a2af5e1bce0edc9189ca9b79
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 8b578fae9aba7b82a2af5e1bce0edc9189ca9b79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/mc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/mc/mc-entity.c:308: warning: expecting prototype for media_entity_graph_walk_init(). Prototype was for media_graph_walk_init() instead


vim +308 drivers/media/mc/mc-entity.c

8b578fae9aba7b drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  294  
8b578fae9aba7b drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  295  /**
8b578fae9aba7b drivers/media/mc/mc-entity.c Laurent Pinchart 2014-03-26  296   * media_entity_graph_walk_init - Allocate resources for graph walk
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
https://01.org/lkp
