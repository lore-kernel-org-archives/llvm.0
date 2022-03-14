Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88991B73
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 15:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647270967; x=1678806967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJF7Tq907/2GmUuouofC6Cceo1PnrDKm7Qn57CMZ3nU=;
  b=QIBHlBrOd3OigGJ3SbBSG3SYWli6MUKWcAYpaOY8/Smkae5CP8SkBcmV
   5fLHXIrrjtJkujEJITFo2+kWVBdV5+0jU4gLijFBBBxFXK6mG4hQS0XBF
   WsHN4FRFkU2+B1aUpybd19CoHMXgo8OoeafbGhILyfvMhWZUkehoRYPny
   Z7lVOhahObUnYPgMI9h+v+FlNJ6bWOj7BIHNRsV2/H8z4lOnaoXwD33xF
   sIsG1bpadJSySBQ/QsFys+J3FQbybBc/glBohnVwDMZLL+gBnLJN8Ph9w
   jz9GBg18aZylYYUDUFYlnK6xFR0khuU+aAof4dEEpyP7G7A5t5byesA/8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="253613649"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="253613649"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 08:15:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="612917286"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 14 Mar 2022 08:15:43 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTmQA-0009xc-No; Mon, 14 Mar 2022 15:15:42 +0000
Date: Mon, 14 Mar 2022 23:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	peterz@infradead.org, acme@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@arm.com>, Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V3 05/10] perf: Add PERF_BR_NEW_ARCH_[N] map for BRBE on
 arm64 platform
Message-ID: <202203142344.tb7inz6j-lkp@intel.com>
References: <20220314055857.125421-6-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314055857.125421-6-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Anshuman,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.17-rc8]
[cannot apply to tip/perf/core tip/master linux/master next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/perf-Expand-perf_branch_entry/20220314-140231
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
config: x86_64-randconfig-a011-20220314 (https://download.01.org/0day-ci/archive/20220314/202203142344.tb7inz6j-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/03ab85fbfe308184a6e9ad9039338f722204f2fd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Anshuman-Khandual/perf-Expand-perf_branch_entry/20220314-140231
        git checkout 03ab85fbfe308184a6e9ad9039338f722204f2fd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/perf_event.h: leak CONFIG_ARM64 to user-space
   make[2]: *** [scripts/Makefile.headersinst:63: usr/include/linux/perf_event.h] Error 1
   make[2]: Target '__headers' not remade because of errors.
   make[1]: *** [Makefile:1277: headers] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
