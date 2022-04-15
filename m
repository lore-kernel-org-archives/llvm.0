Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8E7B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 18:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650047189; x=1681583189;
  h=date:from:cc:subject:message-id:mime-version;
  bh=P6b+GTgmvRPBYx7h8RNJV1ZoHv4xAXQXJXPgIyI9a50=;
  b=GNWUnerquwVlLezKxPn8/TJZ0KIoGwXbyWBVdqsuota/x3ma/4Ad/DuI
   W8Z2FZMc10TJU4cNBivuGJxJ+xXTaZx41yZcSvsNSuYByCTtS9p12pdOS
   BTLZ+2J9Q2jMtcW+P6GckBt2gJMzxl+Usm8n1MwufiN2Vhxgnz4dRkNRz
   kY/6gOXU09OOww1LE0xpXaxUS1jgj+lRFhK8070nIkxMaJM+DRgAgOHVs
   gx2Cdu0rplhs3Hr/LEsSLA0xl+jPs4WtbYMr9v0VgW59gDwqODuyqplie
   fn2B+Ab8UBfwGzyN1/4Sfa1/JPTLxSFdQ2tRC7gSbhlMSy20+oEVW9iq1
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="245092437"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="245092437"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 11:26:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="662259943"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Apr 2022 11:26:27 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfQeI-0002GW-UF;
	Fri, 15 Apr 2022 18:26:26 +0000
Date: Sat, 16 Apr 2022 02:26:05 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 9981/9999] fs/ocfs2/cluster/heartbeat.o:
 warning: objtool: o2hb_setup_one_bio() falls through to next function
 o2hb_bio_end_io()
Message-ID: <202204160247.UyxzNdFW-lkp@intel.com>
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
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20220416/202204160247.UyxzNdFW-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ocfs2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/ocfs2/cluster/heartbeat.o: warning: objtool: o2hb_setup_one_bio() falls through to next function o2hb_bio_end_io()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
