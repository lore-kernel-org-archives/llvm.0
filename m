Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF70433D6
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 19:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650051511; x=1681587511;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MPbwJhvJ/az4V1k3qX+QU1Jdh2zxOXzE1cHiwCvxBB4=;
  b=K4NE6ChB97dws06WRWf4gfMUNHgFvx57XRryc6yUmqhuBlwOgxaDTfKm
   dnzwm8fPh+ulK3XwCNZLUKTwzMYfCAImFhvhZvseM5QlH5EDZb9hsDubm
   013a3u3TKooTO0sFf9GR2RV2JGuPUtIh+zOlPeSNiaJe8Lfnd3LIzPQaD
   KljDwwnqp3Ec+SBKC65rauf6uOptFbu1f7pT59wFVawmqJmpilF7ekNk5
   Af6HLcHBonsdf/EwESulksoHZIzydLny6F6GHQr/YawOYUxB0ny2UVz1h
   NWtaLCIAdnQwQcHTyn296HXxAI4zMuW2qsj420a7tbpuJzjSbm0VhaFBC
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="243149403"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="243149403"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 12:38:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="725893267"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Apr 2022 12:38:29 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfRm0-0002Jv-VS;
	Fri, 15 Apr 2022 19:38:28 +0000
Date: Sat, 16 Apr 2022 03:37:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 9981/9999] arch/x86/kernel/head64.o:
 warning: objtool: __startup_64() falls through to next function
 startup_64_setup_env()
Message-ID: <202204160317.oVcHACQX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   fd52dd72478ce6c2ec00847b959b153328b5faaa
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [9981/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220416/202204160317.oVcHACQX-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=58823a9b097cf36dd59c4d463396e15a5ec4efb7
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout 58823a9b097cf36dd59c4d463396e15a5ec4efb7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/video/ sound/soc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head64.o: warning: objtool: __startup_64() falls through to next function startup_64_setup_env()
--
>> drivers/video/fbdev/smscufx.o: warning: objtool: ufx_ops_write() falls through to next function ufx_ops_setcolreg()
--
>> sound/soc/codecs/wm8978.o: warning: objtool: wm8978_configure_pll() falls through to next function params_width()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
