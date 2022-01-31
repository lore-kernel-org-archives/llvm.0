Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9EF2CA2
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643613075; x=1675149075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TfGiHLZjM4JIeY8ow/1UCu87qM9S1FgtBL6oAE8kFnc=;
  b=KN8LHF4wHd1SB84tq9SYf9D6Jw+0iaLjmFJNpv8CjJk+epGLzA2Y9rtZ
   5I/uHh6+UaMrXt6YwIaYRY6fe2xp3mtISAx5pFydYl/SQvEuixuzPC8b/
   Kr+bzwAAdQW+tYY3k29qPbhT/35vTkj4uY2AcF0HHDm1LR5IiV3hXjuFe
   0WGnLE3YrEjxS/joKuFyC2TJopuH3YxDRlVvRI4xcKbrt/sH21WQtBxCA
   L+/eAIf0NSruv44Ao4t6mKVTLdABh6iAsCNgdSjCvY1RNZXZa2lU0UMix
   KAIU5KxlQiunc55PRpb3xSdvIIhM33kdtyerqgVzdUOgpU/PuE5INZWDX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="333769609"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="333769609"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 23:11:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="478985543"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 30 Jan 2022 23:11:13 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEQqH-000RdB-AY; Mon, 31 Jan 2022 07:11:13 +0000
Date: Mon, 31 Jan 2022 15:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/irq_chip_ro 3/9]
 drivers/irqchip/irq-mvebu-pic.c:74:2: error: implicit declaration of
 function 'seq_printf'
Message-ID: <202201311558.nL1CN3DT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/irq_chip_ro
head:   f63a5ded3ea0cd2c587db00f89d219789fbee683
commit: a57739a1ce5301e34704447de96205450c3bf87d [3/9] irqchip/mvebu-pic: Switch to dynamic chip name output
config: arm64-randconfig-r015-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311558.nL1CN3DT-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=a57739a1ce5301e34704447de96205450c3bf87d
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/irq_chip_ro
        git checkout a57739a1ce5301e34704447de96205450c3bf87d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/irqchip/irq-mvebu-pic.c:74:2: error: implicit declaration of function 'seq_printf' [-Werror,-Wimplicit-function-declaration]
           seq_printf(p, "%s", dev_name(&pic->pdev->dev));
           ^
   1 error generated.


vim +/seq_printf +74 drivers/irqchip/irq-mvebu-pic.c

    69	
    70	static void mvebu_pic_print_chip(struct irq_data *d, struct seq_file *p)
    71	{
    72		struct mvebu_pic *pic = irq_data_get_irq_chip_data(d);
    73	
  > 74		seq_printf(p, "%s", dev_name(&pic->pdev->dev));
    75	}
    76	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
