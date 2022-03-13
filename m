Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975667A
	for <llvm@lists.linux.dev>; Sun, 13 Mar 2022 16:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647187682; x=1678723682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VR6DIT4iWdB9Gac4LY/lE+YdUIzpFqDBgGviZC8By/c=;
  b=AsGIDT/zw29jTva92HfZAYIw9G/zZp2spG2jdV8aLWe4Hl4PnOUbKYBe
   EjowpHSlGXefQBv3x1yP30TlFzrjEuRi5RltfYfI8UvsxDj5+h+XOr+li
   F+5leqe7pwoswqWnTALe2F9VFXh5GAAlQFhpb/YA1hRHWsRcoRyEvbL7y
   i3fubUe1rO5oRToXpSbRpPRc4BDgnCYdpQWZrHOjaqJRQ0IAYj9Nuq4Wh
   c3zdpiWvEIvQHJnWx+Nno9G3jKyNAxiVKEBtvacYS19WW/6uoAS2c1rQ2
   /9q+Ytfg0XjPAlONBRYkdJAxHGbg7hTDUWXJ1+5r7wDNJtEcLQg+2VxdM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="236484219"
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; 
   d="scan'208";a="236484219"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2022 09:08:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,178,1643702400"; 
   d="scan'208";a="713447402"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Mar 2022 09:08:00 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTQlD-00095p-LS; Sun, 13 Mar 2022 16:07:59 +0000
Date: Mon, 14 Mar 2022 00:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:irq/gpio-immutable 12/12]
 drivers/gpio/gpio-pl061.c:297:3: error: field designator
 'irq_request_resource' does not refer to any field in type 'const struct
 irq_chip'; did you mean 'irq_request_resources'?
Message-ID: <202203132300.UZKclCS6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/gpio-immutable
head:   0ddc020186ee141ff434eb515e5a0eeea2afafbc
commit: 0ddc020186ee141ff434eb515e5a0eeea2afafbc [12/12] gpio: pl061: Make the irqchip immutable
config: arm-buildonly-randconfig-r001-20220313 (https://download.01.org/0day-ci/archive/20220313/202203132300.UZKclCS6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0467eb2cb7654c15ae366967ef35093c5724c416)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=0ddc020186ee141ff434eb515e5a0eeea2afafbc
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/gpio-immutable
        git checkout 0ddc020186ee141ff434eb515e5a0eeea2afafbc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpio/gpio-pl061.c:297:3: error: field designator 'irq_request_resource' does not refer to any field in type 'const struct irq_chip'; did you mean 'irq_request_resources'?
           .irq_request_resource   = gpiochip_irq_reqres,
            ^~~~~~~~~~~~~~~~~~~~
            irq_request_resources
   include/linux/irq.h:536:9: note: 'irq_request_resources' declared here
           int             (*irq_request_resources)(struct irq_data *data);
                             ^
>> drivers/gpio/gpio-pl061.c:298:3: error: field designator 'irq_release_resource' does not refer to any field in type 'const struct irq_chip'; did you mean 'irq_release_resources'?
           .irq_release_resource   = gpiochip_irq_relres,
            ^~~~~~~~~~~~~~~~~~~~
            irq_release_resources
   include/linux/irq.h:537:10: note: 'irq_release_resources' declared here
           void            (*irq_release_resources)(struct irq_data *data);
                             ^
   2 errors generated.


vim +297 drivers/gpio/gpio-pl061.c

   295	
   296	static const struct irq_chip pl061_irq_chip = {
 > 297		.irq_request_resource	= gpiochip_irq_reqres,
 > 298		.irq_release_resource	= gpiochip_irq_relres,
   299		.irq_ack		= pl061_irq_ack,
   300		.irq_mask		= pl061_irq_mask,
   301		.irq_unmask		= pl061_irq_unmask,
   302		.irq_set_type		= pl061_irq_type,
   303		.irq_set_wake		= pl061_irq_set_wake,
   304		.irq_print_chip		= pl061_irq_print_chip,
   305		.flags			= IRQCHIP_IMMUTABLE,
   306	};
   307	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
