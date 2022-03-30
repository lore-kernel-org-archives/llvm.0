Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0842F46
	for <llvm@lists.linux.dev>; Wed, 30 Mar 2022 22:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648679026; x=1680215026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cdyV6ni5B0R2HoQiSpWxTiLJCHRmm/nefjUnGqeXvcU=;
  b=JzVsoxFOPh/s09VZx0cblv+yocUTzv4hKesfgD/IGtwXgUCnbLyKmFzH
   N+LEl/g9l45CuoJPF21Qczko5tYTzpgGMFVWYW4aA3qyuWoiMnaNl949C
   YWXSUeodB0/64UruDTdY6LoxDzCU94dy/FM2Fr9vPWfoL3uLguF0AtDvA
   XTwimLJUp5wVcA2lW7BEzkiGxRWwowD2n8UaiqwXkVBj77L+H7LiJk+6o
   tqSVjo9z3YPjTpD9QRo0vnxeQMsTjHBc0xFG8+uydkwbS61pi2RKekDi3
   qXC2YXJfjH79N/J4y7MrKcX+RMyvzOwR+K3q/qXPVNJBAdB5rqC8G5scM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="241812560"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="241812560"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 15:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="586168694"
Received: from lkp-server02.sh.intel.com (HELO 56431612eabd) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 30 Mar 2022 15:23:44 -0700
Received: from kbuild by 56431612eabd with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nZgj9-0000Zo-LY;
	Wed, 30 Mar 2022 22:23:43 +0000
Date: Thu, 31 Mar 2022 06:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:rostedt/linux-trace/ftrace/core 1/5]
 include/trace/trace_custom_events.h:38:10: fatal error:
 'stages/stage1_defines.h' file not found
Message-ID: <202203310653.AMWJCqi6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block rostedt/linux-trace/ftrace/core
head:   025833e54d2b7b031c44642a14df39a67a524b9a
commit: 7ebdde13050a7d880ef7403fd10c30f5167b6f0b [1/5] tracing: Rename the staging files for trace_events
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220331/202203310653.AMWJCqi6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/7ebdde13050a7d880ef7403fd10c30f5167b6f0b
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block rostedt/linux-trace/ftrace/core
        git checkout 7ebdde13050a7d880ef7403fd10c30f5167b6f0b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash samples/trace_events/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from samples/trace_events/trace_custom_sched.c:24:
   In file included from samples/trace_events/./trace_custom_sched.h:96:
   In file included from include/trace/define_custom_trace.h:55:
>> include/trace/trace_custom_events.h:38:10: fatal error: 'stages/stage1_defines.h' file not found
   #include "stages/stage1_defines.h"
            ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +38 include/trace/trace_custom_events.h

3a73333fb370f7 Steven Rostedt (Google  2022-03-03  37) 
3a73333fb370f7 Steven Rostedt (Google  2022-03-03 @38) #include "stages/stage1_defines.h"
3a73333fb370f7 Steven Rostedt (Google  2022-03-03  39) 

:::::: The code at line 38 was first introduced by commit
:::::: 3a73333fb370f7b65de9d94c53df503642bda789 tracing: Add TRACE_CUSTOM_EVENT() macro

:::::: TO: Steven Rostedt (Google) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
