Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6DA7F
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 23:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661298202; x=1692834202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nVmxykiA0uq+h7e/PcBCUGhl/NChr999fUIhLiACrHQ=;
  b=AG12QSHnn41OAa4CR3wXcls4YwGCqPsWb5OHNWs5mBxbhkENU2UJSs80
   pjvE4r6hmNHSjXjSMs3RMEPnl0NmpR1S6WJMkr7xvkkA+pcVB3tjMJJui
   sBb1AoBkDvBTlQJ6kSDxMzXVMhVCr5h8LxmNxwbiurB0qzlvhf/HK08/k
   1eTshupJYnDsjlJoaxv2qLPn2hQxMnDeMpvEX8TurITMHcEx6DgxBB3ZP
   NsvhjNLnKBhNC6n9rrqPfYZ8vRXKlKL5dFYc34pN/uQVEIiYdJXb/bo7v
   wZRDjoJosFRckDQjqoJCNs3umPo6ldABLplE0qR8AcNvreITVSj0uEd3N
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="293821625"
X-IronPort-AV: E=Sophos;i="5.93,259,1654585200"; 
   d="scan'208";a="293821625"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 16:43:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,259,1654585200"; 
   d="scan'208";a="698852680"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Aug 2022 16:43:11 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQdY6-0000id-1b;
	Tue, 23 Aug 2022 23:43:10 +0000
Date: Wed, 24 Aug 2022 07:42:32 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Hans de Goede <hdegoede@redhat.com>, Jens Axboe <axboe@kernel.dk>,
	Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 07/23] ata: libahci_platform: Convert to using devm
 bulk clocks API
Message-ID: <202208240749.UcN8Fuu0-lkp@intel.com>
References: <20220822183728.24434-8-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220822183728.24434-8-Sergey.Semin@baikalelectronics.ru>

Hi Serge,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on axboe-block/for-next linus/master v6.0-rc2 next-20220823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/ata-ahci-Add-DWC-Baikal-T1-AHCI-SATA-support/20220823-024133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: hexagon-randconfig-r041-20220821 (https://download.01.org/0day-ci/archive/20220824/202208240749.UcN8Fuu0-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project b04d01c009d7f66bcca9138d2ce40999eedf104d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/fbc177b5ec3bf29261813907b13ab93865211e6e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Serge-Semin/ata-ahci-Add-DWC-Baikal-T1-AHCI-SATA-support/20220823-024133
        git checkout fbc177b5ec3bf29261813907b13ab93865211e6e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __clk_get_name
   >>> referenced by libahci_platform.c
   >>>               ata/libahci_platform.o:(ahci_platform_get_resources) in archive drivers/built-in.a
   >>> referenced by libahci_platform.c
   >>>               ata/libahci_platform.o:(ahci_platform_get_resources) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
