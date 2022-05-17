Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C767C7F
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 07:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652771834; x=1684307834;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1jTU5KHo259xMf0l/RnxXGGu/AAe/sE0TQK8+z7eBQc=;
  b=OiF2LfvUqDZvAEp6veTlqxRWapyysRPBGWw0FwA5gfOXo6MBCrgoCsvx
   kQRhyL1GfmIil3EwWPADuqU9kBuqbrvkctb8Aq3YTClfDKuj4p6x3yIpP
   cwL6dRLNGWwsWnqjdoidRUjgVk1Mgui7voWn9hOyXNhD3+VHT6AE7Y3rr
   N6BJBW3LKp6K0nmitHqOtT6R3zahc8xWsnbnPIHlxNdUelFkjW8q81QZd
   TVo9oDhlH+9P5HAw166xwuI+KKo00/TiZc/FbE2R6MZioiTM8Atq+eU0p
   +1Q4majp+/8JP31cVkp6l4V5NzXoDEGnex6vCzKwhBwO3m663ETjvYz27
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10349"; a="250987401"
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="250987401"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 00:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,232,1647327600"; 
   d="scan'208";a="638621112"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 17 May 2022 00:17:11 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqrSB-0000iV-8K;
	Tue, 17 May 2022 07:17:11 +0000
Date: Tue, 17 May 2022 15:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	jikos@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	benjamin.tissoires@redhat.com, spbnick@gmail.com,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	stefanberzl@gmail.com,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH for-5.19/uclogic 2/4] HID: uclogic: Add KUnit tests for
 uclogic_rdesc_template_apply()
Message-ID: <202205171527.RQ8sqqya-lkp@intel.com>
References: <20220516181323.59554-3-jose.exposito89@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220516181323.59554-3-jose.exposito89@gmail.com>

Hi "José,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on f7d8e387d9aeff963e6691c0166269b8042b4ff9]

url:    https://github.com/intel-lab-lkp/linux/commits/Jos-Exp-sito/Add-support-for-XP-PEN-Deco-L/20220517-021641
base:   f7d8e387d9aeff963e6691c0166269b8042b4ff9
config: riscv-randconfig-r036-20220516 (https://download.01.org/0day-ci/archive/20220517/202205171527.RQ8sqqya-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/59e13d6c9ab96d326e1575bd6cd2f0ca0c98f561
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jos-Exp-sito/Add-support-for-XP-PEN-Deco-L/20220517-021641
        git checkout 59e13d6c9ab96d326e1575bd6cd2f0ca0c98f561
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-uclogic-rdesc.o
ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-uclogic-rdesc-test.o
>> ERROR: modpost: "uclogic_rdesc_template_apply" [drivers/hid/hid-uclogic-rdesc-test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
