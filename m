Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F436D
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 03:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654053702; x=1685589702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OgaeKhdZDl52cK9xapH3XmFXKJy2D1r29Tm3NeaLEYU=;
  b=JpR9+COHEZNHYvagJoHIIj1oylvyNlu+G7oWEOgooLfhHsgLWc+v55x1
   SRKzEFFHDqhiGxPFOmBukumpl/2cCIO6tniZXh6IKFfc+2N3Cpq4qY9Gw
   jMQ/MO3TnqSp/Kh4RkQJNOuZHLJW1OadO0ldMJCaoNRjUFzdMaycnR+qk
   5pHE4QworfI7EOSTQT0fOAlTCG6wS3x5tDc8Z96XN8pDP3POk4YeiWgv+
   gWxCK1KyjvN+3Qff7YlaZf30x+3YUe12hdLUk4u7yAeOyOYhKxgupFx8K
   opQSf7akjrb8sT45oxEE3+zuFxdqziK7NQViU5xKqS2IvFLrQzKDjRm3H
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="255933967"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="255933967"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2022 20:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; 
   d="scan'208";a="581380449"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2022 20:21:40 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwEvT-0003Rj-UF;
	Wed, 01 Jun 2022 03:21:39 +0000
Date: Wed, 1 Jun 2022 11:21:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Selnes <jonathansb1@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:hdmi-dbg 19/22]
 drivers/media/i2c/cat24c208.c:415:34: warning: unused variable
 'cat24c208_of_match'
Message-ID: <202206011127.bbncUkYc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   fd8fe971a032c4dbc6e8b955f946d710d86fa856
commit: 5778f4cf22e6d23d9881fb9121714cc7216b181c [19/22] cat24c208: driver for the cat24c208 EDID EEPROM
config: hexagon-randconfig-r032-20220531 (https://download.01.org/0day-ci/archive/20220601/202206011127.bbncUkYc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add hverkuil-media-tree git://linuxtv.org/hverkuil/media_tree.git
        git fetch --no-tags hverkuil-media-tree hdmi-dbg
        git checkout 5778f4cf22e6d23d9881fb9121714cc7216b181c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/cat24c208.c:415:34: warning: unused variable 'cat24c208_of_match' [-Wunused-const-variable]
   static const struct of_device_id cat24c208_of_match[] = {
                                    ^
   1 warning generated.


vim +/cat24c208_of_match +415 drivers/media/i2c/cat24c208.c

   414	
 > 415	static const struct of_device_id cat24c208_of_match[] = {
   416		{ .compatible = "onsemi,cat24c208"},
   417		{}
   418	};
   419	MODULE_DEVICE_TABLE(of, cat24c208_of_match);
   420	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
