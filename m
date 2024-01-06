Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9941381;
	Sat,  6 Jan 2024 01:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCVts5YH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704505812; x=1736041812;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zPV4KdyfFl+sXjH7eP/WUHCwtm4MlrhF0od0mDU42Y=;
  b=aCVts5YHmn410X9YMBbZGJB+hAn6vfXgDnB1+JZ0aWwgoMEVApPb80S7
   D8QFHg0K5UEgKGH32a5bvzRLvqmMPbYCab2bzw9D1Ii7bISVnQTD9Cxru
   0nGDZIwMEZTh+GifblhcAbAy8hQPD8Ub7kqot+yR4AKq9lLwbw3PZQCc5
   MpAcgCYQThokYazcAv4sQ59El3B3wZQs+dXymGEdnqStT9MU51Z8akZsQ
   gPZcYToWxSvG1aLq5ka3My9TMGu/ApS3W86FFMq8RW0NhTvn0Kr9JBzZa
   +adIjA8+8MejCfISlyLsSRho8N83zEdlcEHT4Yp3j6gqOoSqgBlHNl6P4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="4721287"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="4721287"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 17:50:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="780906885"
X-IronPort-AV: E=Sophos;i="6.04,335,1695711600"; 
   d="scan'208";a="780906885"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Jan 2024 17:50:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLvp2-0001u4-2L;
	Sat, 06 Jan 2024 01:50:00 +0000
Date: Sat, 6 Jan 2024 09:49:59 +0800
From: kernel test robot <lkp@intel.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jacky Bai <ping.bai@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
	Peng Fan <peng.fan@nxp.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Shenghao Ding <13916275206@139.com>,
	Ryan Lee <ryans.lee@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Shuming Fan <shumingf@realtek.com>,
	"open list:CIRRUS LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>
Subject: Re: [PATCH v5 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Message-ID: <202401060947.GIRePUi6-lkp@intel.com>
References: <20240104223643.876292-4-jogletre@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104223643.876292-4-jogletre@opensource.cirrus.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on lee-mfd/for-mfd-next]
[also build test ERROR on dtor-input/next dtor-input/for-linus broonie-sound/for-next linus/master lee-mfd/for-mfd-fixes v6.7-rc8 next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Ogletree/firmware-cs_dsp-Add-write-sequencer-interface/20240105-064201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20240104223643.876292-4-jogletre%40opensource.cirrus.com
patch subject: [PATCH v5 3/5] mfd: cs40l50: Add support for CS40L50 core driver
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240106/202401060947.GIRePUi6-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401060947.GIRePUi6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401060947.GIRePUi6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/cs40l50-spi.c:12:10: fatal error: 'linux/mfd/spi.h' file not found
      12 | #include <linux/mfd/spi.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +12 drivers/mfd/cs40l50-spi.c

  > 12	#include <linux/mfd/spi.h>
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
