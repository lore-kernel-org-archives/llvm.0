Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F7129B4
	for <llvm@lists.linux.dev>; Sat, 12 Feb 2022 23:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644707675; x=1676243675;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gd+aFqfmOKSD6/n5omvf69+8KOB5SRxFpZkpzwn8bwU=;
  b=JTnIwNYwpMzKfFTV9ajVpRXJMhprfhINuHdK/2V/e+rf5v5DajG5O+RS
   6gQNT9hYLSEM1xZTqp6VlDU6KvbXhow7SC5Zz8x5hNHfbZDdz8FPv7S7Y
   VtameCPUbY6dHrdE8X3WOPfOMeI9rip95Au0mf8phV5qSJO9MmlcfGKI4
   qR7JUddyiad/rmcoub+v12+P5vmpWuYvUJJpAtCHTFNRIg1CdL1hpVFqM
   ZPnN6nHB2OXiyeQT8jfLPUTfhLK91i9B57Sra7egz6pk6bjKa00LUvhL8
   E/YjPzY7Ys4wZXNy/4Ls6RogCrEdwAwkIsE6EJEgpGACN9Ct/o344/My7
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="237316365"
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="237316365"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2022 15:14:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,364,1635231600"; 
   d="scan'208";a="774573109"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 Feb 2022 15:14:32 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJ1b5-0006jp-Gx; Sat, 12 Feb 2022 23:14:31 +0000
Date: Sun, 13 Feb 2022 07:13:53 +0800
From: kernel test robot <lkp@intel.com>
To: Marcello Sylvester Bauer <sylv@sylv.io>, linux-hwmon@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Marcello Sylvester Bauer <sylv@sylv.io>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] pmbus: Add support for pli1209bc
Message-ID: <202202130705.3YDPfyow-lkp@intel.com>
References: <e4d83b95cfb0cc0c6acb65bd1263cf0131b6ce51.1644597670.git.sylv@sylv.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4d83b95cfb0cc0c6acb65bd1263cf0131b6ce51.1644597670.git.sylv@sylv.io>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Marcello,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on groeck-staging/hwmon-next]
[also build test ERROR on robh/for-next v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marcello-Sylvester-Bauer/Support-pli1209bc-Digital-Supervisor/20220212-011956
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: hexagon-randconfig-r024-20220213 (https://download.01.org/0day-ci/archive/20220213/202202130705.3YDPfyow-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c7eb84634519e6497be42f5fe323f9a04ed67127)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0b0d15e123c13b2eb898502661b18d81ed87e325
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marcello-Sylvester-Bauer/Support-pli1209bc-Digital-Supervisor/20220212-011956
        git checkout 0b0d15e123c13b2eb898502661b18d81ed87e325
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module pli1209bc uses symbol pmbus_read_word_data from namespace PMBUS, but does not import it.
>> ERROR: modpost: module pli1209bc uses symbol pmbus_do_probe from namespace PMBUS, but does not import it.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
