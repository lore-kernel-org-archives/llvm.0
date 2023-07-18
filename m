Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B17D518;
	Tue, 18 Jul 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689695395; x=1721231395;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2+g8D6K4yOf3EbBU7xVCv4e+8/CcQMogoNMiwwmkgZ8=;
  b=SY05kovNO4vtb/DBiMJn42keG4gbHIhvr6k+jGu0FEoMu9EWg6ibOueM
   Mytpx6/GyDoJJcETKp5PSPBD5OeXP3YSascoJLxgJcMVTNNpFzEERyAfK
   Of4qdr1bXVn7MuM/L9T8PtFZX2KmpYkp+TpBnDQhA8dOk4R1ggUVNpt2u
   11vxiPDzQCwfUYZ0bUcCRY81+PPh8W0bU58LmJiUOykm2Q5PXMkExrk0I
   +Vb1G6K8A2r+8q+P99+epTiSrdCm7pDVucwzDXeTDqZiqKgR7cjasHUif
   aGvhX7X1xE9+Il40GprP+P2nm7bo41UCM6U/yrxH0TvcA9V7hhjSlxLBB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="346540452"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="346540452"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 08:49:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="673975356"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="673975356"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 08:49:46 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLmxO-0000hB-00;
	Tue, 18 Jul 2023 15:49:46 +0000
Date: Tue, 18 Jul 2023 23:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Maxim Georgiev <glipus@gmail.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Hangbin Liu <liuhangbin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jay Vosburgh <j.vosburgh@gmail.com>,
	Andy Gospodarek <andy@greyhouse.net>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, UNGLinuxDriver@microchip.com,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Simon Horman <simon.horman@corigine.com>,
	Casper Andersson <casper.casan@gmail.com>,
	Sergey Organov <sorganov@gmail.com>
Subject: Re: [PATCH v8 net-next 11/12] net: phy: provide phylib stubs for
 hardware timestamping operations
Message-ID: <202307182345.NOnFjOm2-lkp@intel.com>
References: <20230717152709.574773-12-vladimir.oltean@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717152709.574773-12-vladimir.oltean@nxp.com>

Hi Vladimir,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Oltean/net-add-NDOs-for-configuring-hardware-timestamping/20230718-174836
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230717152709.574773-12-vladimir.oltean%40nxp.com
patch subject: [PATCH v8 net-next 11/12] net: phy: provide phylib stubs for hardware timestamping operations
config: x86_64-randconfig-r023-20230718 (https://download.01.org/0day-ci/archive/20230718/202307182345.NOnFjOm2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307182345.NOnFjOm2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307182345.NOnFjOm2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/phy/phy_device.c:30:10: fatal error: 'linux/phylib_stubs.h' file not found
   #include <linux/phylib_stubs.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +30 drivers/net/phy/phy_device.c

    11	
    12	#include <linux/acpi.h>
    13	#include <linux/bitmap.h>
    14	#include <linux/delay.h>
    15	#include <linux/errno.h>
    16	#include <linux/etherdevice.h>
    17	#include <linux/ethtool.h>
    18	#include <linux/init.h>
    19	#include <linux/interrupt.h>
    20	#include <linux/io.h>
    21	#include <linux/kernel.h>
    22	#include <linux/list.h>
    23	#include <linux/mdio.h>
    24	#include <linux/mii.h>
    25	#include <linux/mm.h>
    26	#include <linux/module.h>
    27	#include <linux/of.h>
    28	#include <linux/netdevice.h>
    29	#include <linux/phy.h>
  > 30	#include <linux/phylib_stubs.h>
    31	#include <linux/phy_led_triggers.h>
    32	#include <linux/pse-pd/pse.h>
    33	#include <linux/property.h>
    34	#include <linux/rtnetlink.h>
    35	#include <linux/sfp.h>
    36	#include <linux/skbuff.h>
    37	#include <linux/slab.h>
    38	#include <linux/string.h>
    39	#include <linux/uaccess.h>
    40	#include <linux/unistd.h>
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
