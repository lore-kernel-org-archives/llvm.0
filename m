Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D03B168
	for <llvm@lists.linux.dev>; Sun, 19 Dec 2021 04:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639887255; x=1671423255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qg0l10N0oGqusyqqv4ijSEmstuJ+o1BVUZv/9rxrixE=;
  b=GVRNPazlxOCFuPTJe86EgEoH9bTZ+nzwp7FeGV3IXWQtJmXuOHj0NXB2
   Kw0rRuU9eGaaHw8cO/W8OsOJ99L+H7c3uObv7oU1i6A1eGWmvUx0kHRyw
   wMUP27PN7evI/6uJr1psKEIRymzqPETQzHd3ipE84NyUEW2KFM5ElUicV
   P5dmMlRzaimmHlmTtsIRT0v/NX04xpJQzuyCcBu3EukLG+HWy6a+cto6a
   TTbpf1/izrl7Tvam7bkvprsh4iuxMsCtapbIta2+NnfvFT3oNl4LxZVes
   +rvvuQnuwZsbtoKkkhzUdztupteT62nqzRg9sb1lBjuzu7UWlslKqMN6c
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="264157690"
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="264157690"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 20:14:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,217,1635231600"; 
   d="scan'208";a="683848731"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 18 Dec 2021 20:14:13 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mynaO-0006h6-Ew; Sun, 19 Dec 2021 04:14:12 +0000
Date: Sun, 19 Dec 2021 12:14:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2] drm: make drm_syncobj_array_wait() use the range
 hrtimer feature
Message-ID: <202112191223.dorzSdCu-lkp@intel.com>
References: <20211218141839.25078-1-ishitatsuyuki@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211218141839.25078-1-ishitatsuyuki@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tatsuyuki,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-intel/for-linux-next drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next v5.16-rc5 next-20211217]
[cannot apply to airlied/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tatsuyuki-Ishi/drm-make-drm_syncobj_array_wait-use-the-range-hrtimer-feature/20211218-222016
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: x86_64-randconfig-a016-20211218 (https://download.01.org/0day-ci/archive/20211219/202112191223.dorzSdCu-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d0e29bdb6f8cd1a9042e34c833035438900bf332
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tatsuyuki-Ishi/drm-make-drm_syncobj_array_wait-use-the-range-hrtimer-feature/20211218-222016
        git checkout d0e29bdb6f8cd1a9042e34c833035438900bf332
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "select_estimate_accuracy" [drivers/gpu/drm/drm.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
