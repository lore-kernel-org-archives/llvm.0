Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C94A18
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 21:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656970313; x=1688506313;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rdN2rqoZBWLk3LC4FYIloZc57dlbIsEWo1uPTODC4W4=;
  b=fHRUzbtQnw1kDloyVkQfmOmAVMSQQZuh8jG/nPJKcgLa1xVxZ0KobSs2
   DjD691IRrsPIN0TM3m7Q96mLPM1abB3V0MJJZr8/EktYUMSNoidCesEFP
   Z6GKXIp/AxaW2Q29a6cXohevnmf/wca9mz3EfHtXzGuv4DvdbPeRt9bpp
   exzuz4UbLi858AiogtoBZwtqSEGnrOQaM6pgyyR2RcChlMYLOghqZ1tAD
   RQscCuPnQI7GLu7VBV57HHQKELvGSY/OpWhI6Q24lexhOTcR6LPNUMLLD
   2+ZlufBT3w6g3QpmE4I2zTJHGRma/Y9Gc/pwxvF6ILlM3njSuN9aHmmBL
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="281957881"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="281957881"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 14:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; 
   d="scan'208";a="619512148"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Jul 2022 14:31:51 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8Tfa-000ICD-Vu;
	Mon, 04 Jul 2022 21:31:50 +0000
Date: Tue, 5 Jul 2022 05:31:09 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:linux-5.10.y 2114/6854]
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.o: warning: objtool:
 komeda_fb_check_src_coords() falls through to next function
 komeda_fb_get_pixel_addr()
Message-ID: <202207050545.BlC2E8Bd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   ea86c1430c83aa91f2c4122408922e34a1279775
commit: eaafc590053b314d4907017044ba2e739893c17c [2114/6854] fortify: Explicitly disable Clang support
config: x86_64-randconfig-a011-20220704 (https://download.01.org/0day-ci/archive/20220705/202207050545.BlC2E8Bd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f7a80c3d08d4821e621fc88d6a2e435291f82dff)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=eaafc590053b314d4907017044ba2e739893c17c
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout eaafc590053b314d4907017044ba2e739893c17c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.o: warning: objtool: komeda_fb_check_src_coords() falls through to next function komeda_fb_get_pixel_addr()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
