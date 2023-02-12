Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAFF4A3C;
	Sun, 12 Feb 2023 19:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676229232; x=1707765232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EnVh+TMc/Kqhtg7XlE8FGgry+SLMyX7biBGsg3Vw90Q=;
  b=nVsydrkkVaLLJRG71yaO6tXuF+KDGjeJ9ugGEKAw/ZbFqBWu8AKrJ39R
   4EpL+QqTWtRz3Aqr3iZqKjY9XnGWI8SfImfx67O404sC6TsHNv47bSMq+
   6EWhxikjvE2m1QLqJn1w62WXj4ErAB4Uj7rJzo/yecB8xyMDRKeaGyUQT
   s0Oxzgt+B+b2HEnYh/Stcf1YTaOhfODYx4yuIuGoJ9pzhcPiLcHs9CxFC
   iGhsoGQqLkdzU++iE6I5b3OXgXxOA70n24cTVL8PHeKx55S29NLuH5St0
   GrlhsuWEwggCg2T9PQJNg3cZ0bS9knqhcx8HOpawLnL6sguCIkPoi1fNC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395359634"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="395359634"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 11:13:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="701025425"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="701025425"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 12 Feb 2023 11:13:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRHnK-0007Mj-1c;
	Sun, 12 Feb 2023 19:13:50 +0000
Date: Mon, 13 Feb 2023 03:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping
 functions
Message-ID: <202302130237.SsIcHbaP-lkp@intel.com>
References: <20230212153250.1099136-2-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230212153250.1099136-2-vdonnefort@google.com>

Hi Vincent,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on rostedt-trace/for-next v6.2-rc7 next-20230210]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
patch link:    https://lore.kernel.org/r/20230212153250.1099136-2-vdonnefort%40google.com
patch subject: [RFC PATCH 1/2] ring-buffer: Introducing ring-buffer mapping functions
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230213/202302130237.SsIcHbaP-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/96cfb7d92682fb5df39febc590fec75748b47e15
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Donnefort/ring-buffer-Introducing-ring-buffer-mapping-functions/20230212-233420
        git checkout 96cfb7d92682fb5df39febc590fec75748b47e15
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302130237.SsIcHbaP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/trace_mmap.h:5:2: error: unknown type name '__u64'
           __u64           entries;
           ^
   ./usr/include/linux/trace_mmap.h:6:2: error: unknown type name '__u64'
           __u64           overrun;
           ^
>> ./usr/include/linux/trace_mmap.h:7:2: error: unknown type name '__u32'
           __u32           pages_touched;
           ^
   ./usr/include/linux/trace_mmap.h:8:2: error: unknown type name '__u32'
           __u32           reader_page;
           ^
   ./usr/include/linux/trace_mmap.h:9:2: error: unknown type name '__u32'
           __u32           nr_data_pages;
           ^
   ./usr/include/linux/trace_mmap.h:10:2: error: unknown type name '__u32'
           __u32           data_page_head;
           ^
   ./usr/include/linux/trace_mmap.h:11:2: error: unknown type name '__u32'
           __u32           data_pages[];
           ^
   7 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
