Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FAC7A
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 16:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658938716; x=1690474716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tBeOUp/yxaWMe5c9npreqRETmrBhESTwQGPebnMPCV8=;
  b=ijJu5SQ8GM92qIKzrADpxF7Va7GzkErUi8B5MDWG1ejCowAN/R/NgNFa
   lxPrOaFNbYijN77URwF1jrAAIGf6Iql2QDJeNgdGRMayvk/zMQjqZch2O
   sZVGoarsHZB8hRbz8VCgEkmj3TTxGJph0PbJyxwzcWP3jRMGc4EJ7OycK
   I8mj8XklQBQHKQY8s1zf8A8XCJQ3oXdsPQ+XLNR5c8MHVGskKi6dJeErU
   aDaZ1c3rbGW8Y1x5pfhoJKRP2E9Dz+v0r6h4Cfp8ZfzXRk68fisMf65gN
   vARc4fkYk0kPCeI82m1GzJxKpwxEs1aunTH2ypZIR/jELWjy7CaO0gJmp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="374578119"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="374578119"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2022 09:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="927851599"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 27 Jul 2022 09:18:34 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGjk2-0008tK-0M;
	Wed, 27 Jul 2022 16:18:34 +0000
Date: Thu, 28 Jul 2022 00:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1175:34:
 warning: unused variable 'c8sectpfe_match'
Message-ID: <202207280016.r8tOLF4N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mauro,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   39c3c396f8131f3db454c80e0fcfcdc54ed9ec01
commit: e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2 media: platform: place stm32/ and sti/ under st/ dir
date:   4 months ago
config: mips-buildonly-randconfig-r001-20220727 (https://download.01.org/0day-ci/archive/20220728/202207280016.r8tOLF4N-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e7b8153e2a4f0c9c8d1450aa7328d54ea64fe8b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/media/platform/ drivers/tty/serial/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c:1175:34: warning: unused variable 'c8sectpfe_match' [-Wunused-const-variable]
   static const struct of_device_id c8sectpfe_match[] = {
                                    ^
   1 warning generated.


vim +/c8sectpfe_match +1175 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c

c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30  1174  
c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30 @1175  static const struct of_device_id c8sectpfe_match[] = {
c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30  1176  	{ .compatible = "st,stih407-c8sectpfe" },
c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30  1177  	{ /* sentinel */ },
c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30  1178  };
c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30  1179  MODULE_DEVICE_TABLE(of, c8sectpfe_match);
c5f5d0f99794cfb drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c Peter Griffin 2015-07-30  1180  

:::::: The code at line 1175 was first introduced by commit
:::::: c5f5d0f99794cfb675ecacfe37a1b33b352b9752 [media] c8sectpfe: STiH407/10 Linux DVB demux support

:::::: TO: Peter Griffin <peter.griffin@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
