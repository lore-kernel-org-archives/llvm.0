Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16FC2F27
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644220214; x=1675756214;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FGfwn148nXlfPgw58grgzzwnKl15CDZCmNZxMMTJ6JM=;
  b=S0iVaoJoy8dU+0oacE20hoyYGs1n/7BQFCccG6HtojeTX8yrBEBHI7gS
   ff89faVKHQTznSw0HwSp7UDaFrNDk4/mcyqECCTof2Pq3uiCqV7MMWeEv
   H+fu3yA/fu2NmK6WklOPPiIOZ8Rzm1dtHV/pk4Ee9Q0zFv/8kYINDaSbd
   Rkykob57mXw5HCHM18TqabVLd1b+sYArlLXrExwaTPZIfBHSWhpYZ8dj7
   oioA3jArmgmcjAyp8aPSqWYFYalUo9Y5Qq8kel8IVABdxzgsN/WBulbXy
   ypo1ub8ViOr6J0tU2ukgUOf5zKrJcmNIE2zIhSgU0aAf+Y2a3aEHn0Bgz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="335068612"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="335068612"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 23:50:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; 
   d="scan'208";a="525039226"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Feb 2022 23:50:10 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGymo-0000FD-4C; Mon, 07 Feb 2022 07:50:10 +0000
Date: Mon, 7 Feb 2022 15:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: Re: Wrongly bound Elantech touchpad on Lenovo Yoga Slim 7
Message-ID: <202202071511.Vkx9UNQz-lkp@intel.com>
References: <s5hleyqwowl.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hleyqwowl.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Takashi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on dtor-input/next]
[also build test WARNING on hid/for-next linux/master linus/master v5.17-rc3 next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Takashi-Iwai/Wrongly-bound-Elantech-touchpad-on-Lenovo-Yoga-Slim-7/20220205-005753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220207/202202071511.Vkx9UNQz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/9f3fbdd527662d97eb0bece1005d96a0a1b0fac2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Takashi-Iwai/Wrongly-bound-Elantech-touchpad-on-Lenovo-Yoga-Slim-7/20220205-005753
        git checkout 9f3fbdd527662d97eb0bece1005d96a0a1b0fac2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0xe016ae): Section mismatch in reference from the function elan_probe() to the variable .init.rodata:elan_i2c_denylist
The function elan_probe() references
the variable __initconst elan_i2c_denylist.
This is often because elan_probe lacks a __initconst
annotation or the annotation of elan_i2c_denylist is wrong.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
