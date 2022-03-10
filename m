Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F9E7A
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 07:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646897019; x=1678433019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8DW4ZkjykbyMj9hKtNQeQHVqLXxJ1uy9HK9dUIuuugg=;
  b=J8EBIco8/OmZ77TRGJqwXRMbbZtUZAawrwhwdl7QWLwVrcX9F1Kuz5DT
   tnJkGq9cV8tMgFWZbR5U/Be7ip2XSyusSrzkOMe7xhe83cpuz+v2uScu7
   raXZK70C159x1TSVSKi8sqE7s5pFPemv2D3iSg4ufwuvclQqk5JXq9OPT
   iVCVI12fgaXOYjdUzp9yol5rB9FMZCSHK1tmeVDezjZgYL74rI0VP3KSb
   ktTYd/fVzPey4c7UyuEEUldHidNzQvfxvD03MbmUSg+K+ysUsBLiioyx8
   st6GwMzD4NlJeA+ndbsQGq33+aSxvjyyDvMsbr+oxAHVyGba2krkbM3RB
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242625979"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="242625979"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2022 23:23:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; 
   d="scan'208";a="554517163"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 09 Mar 2022 23:23:36 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSD96-0004XS-4D; Thu, 10 Mar 2022 07:23:36 +0000
Date: Thu, 10 Mar 2022 15:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sam Shih <sam.shih@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [groeck-staging:watchdog-next 22/33]
 drivers/watchdog/mtk_wdt.c:13:10: fatal error:
 'dt-bindings/reset/mt7986-resets.h' file not found
Message-ID: <202203101530.3l4W0JyC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   b6447e51682d2d364b82ba35606888e39251dfcf
commit: 6c2b372365e1e64170e209a1e903c5cb64bebc63 [22/33] watchdog: mtk_wdt: mt7986: Add toprgu reset controller support
config: arm-randconfig-r001-20220310 (https://download.01.org/0day-ci/archive/20220310/202203101530.3l4W0JyC-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git/commit/?id=6c2b372365e1e64170e209a1e903c5cb64bebc63
        git remote add groeck-staging https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
        git fetch --no-tags groeck-staging watchdog-next
        git checkout 6c2b372365e1e64170e209a1e903c5cb64bebc63
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/watchdog/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/watchdog/mtk_wdt.c:13:10: fatal error: 'dt-bindings/reset/mt7986-resets.h' file not found
   #include <dt-bindings/reset/mt7986-resets.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +13 drivers/watchdog/mtk_wdt.c

  > 13	#include <dt-bindings/reset/mt7986-resets.h>
    14	#include <dt-bindings/reset/mt8183-resets.h>
    15	#include <dt-bindings/reset/mt8186-resets.h>
    16	#include <dt-bindings/reset/mt8192-resets.h>
    17	#include <dt-bindings/reset/mt8195-resets.h>
    18	#include <linux/delay.h>
    19	#include <linux/err.h>
    20	#include <linux/init.h>
    21	#include <linux/io.h>
    22	#include <linux/kernel.h>
    23	#include <linux/module.h>
    24	#include <linux/moduleparam.h>
    25	#include <linux/of.h>
    26	#include <linux/of_device.h>
    27	#include <linux/platform_device.h>
    28	#include <linux/reset-controller.h>
    29	#include <linux/types.h>
    30	#include <linux/watchdog.h>
    31	#include <linux/interrupt.h>
    32	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
