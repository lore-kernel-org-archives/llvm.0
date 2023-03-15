Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A1E3C02;
	Wed, 15 Mar 2023 11:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678879987; x=1710415987;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=el4QWUuHMHO09Aw74RD2UQUc2eNAgoNjoLUKMEMhVYQ=;
  b=bWLAvQdTaQMHDk4W2lkXCs3bnmv8w2Taw7isM2r8wtc4L9kxwvTRCQ/n
   9/nlVTe3zEflYmo/HAp7OEBvc+Qr1rmZCYuE6Dl4jqT421oZSTzOuuGmj
   nMNwWGfIq2oeGcYIwvB7RXiUffXukgNjh6Pt3pjEB+C9mwotSmlQqTuET
   tpjtXUQc5WoP7Z478CZZX8pdTS/0nKZn6sven40SeQYlFbgXqOjj25eam
   erAuSqDGg2cwAyd/CQTOLKSCbQ9IUtBhtLw36HL4e95HofZ788ixpTHJJ
   9xnfyKij9PAKCIHhlASm9eWIKE7ORTd2Cr8v1lNfQUnKRdTa5TgWTDC0I
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336365041"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="336365041"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 04:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672704573"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="672704573"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Mar 2023 04:32:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcPN6-0007db-0x;
	Wed, 15 Mar 2023 11:32:44 +0000
Date: Wed, 15 Mar 2023 19:32:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, rafael@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lukasz.luba@arm.com, dietmar.eggemann@arm.com, rui.zhang@intel.com,
	amit.kucheria@verdurent.com, amit.kachhap@gmail.com,
	daniel.lezcano@linaro.org, viresh.kumar@linaro.org,
	len.brown@intel.com, pavel@ucw.cz, Pierre.Gondois@arm.com,
	ionela.voinescu@arm.com, rostedt@goodmis.org, mhiramat@kernel.org
Subject: Re: [PATCH 13/17] PM: EM: Refactor struct em_perf_domain and add
 default_table
Message-ID: <202303151927.WD6O0PWN-lkp@intel.com>
References: <20230314103357.26010-14-lukasz.luba@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314103357.26010-14-lukasz.luba@arm.com>

Hi Lukasz,

I love your patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/thermal linus/master pavel-leds/for-next v6.3-rc2 next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Luba/PM-EM-Refactor-em_cpufreq_update_efficiencies-arguments/20230314-184448
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20230314103357.26010-14-lukasz.luba%40arm.com
patch subject: [PATCH 13/17] PM: EM: Refactor struct em_perf_domain and add default_table
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230315/202303151927.WD6O0PWN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ce3aad5db08006a2a6b6d52f9c26b11448cd8bb4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lukasz-Luba/PM-EM-Refactor-em_cpufreq_update_efficiencies-arguments/20230314-184448
        git checkout ce3aad5db08006a2a6b6d52f9c26b11448cd8bb4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303151927.WD6O0PWN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/cpufreq_cooling.c:381:24: warning: unused variable 'table' [-Wunused-variable]
           struct em_perf_state *table;
                                 ^
   1 warning generated.


vim +/table +381 drivers/thermal/cpufreq_cooling.c

   376	
   377	static unsigned int get_state_freq(struct cpufreq_cooling_device *cpufreq_cdev,
   378					   unsigned long state)
   379	{
   380		struct cpufreq_policy *policy;
 > 381		struct em_perf_state *table;
   382		unsigned long idx;
   383	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
