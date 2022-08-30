Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99126625
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661851927; x=1693387927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gccZn9I0+N8z97syHj0uFijkRdJnRbnaf9VVahNbVog=;
  b=hrOWrE3ptmnhEnh37/VLRyk0hSPUsb1JcniTVDjwy3mXuvBIQE0tKPQT
   6vad7/tCrMbaQDlIEg0VPeFupJEurLUZaW4a8ZJDmVoyuwwzRUfmMxGK9
   vNHKuG/qYUcvPM+/5Kk8MerwmSu+0w3k/1stPTntjb70BTAF9ierzvMBa
   q9rUFlYNDm5euGIhhhLMR9oMoVcEtpT23W5TrzULLWcZjemQerF5FjMFK
   YF3fPAgXnWTKA5bkf2Z32kmXpCpAasb7GzQd/zGgDismGCqCpLWzZtnYv
   mIK+dxej1AVpTUKLDOsf9EKSFvEjzEL67hTbUcOKx0QSX5MZzAZzKrXOb
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="278148058"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="278148058"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 02:32:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="641302532"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 30 Aug 2022 02:32:01 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSxbE-00008Y-1I;
	Tue, 30 Aug 2022 09:32:00 +0000
Date: Tue, 30 Aug 2022 17:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: Kieran Frewen <kieran.frewen@morsemicro.com>, johannes@sipsolutions.net
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-wireless@vger.kernel.org, quic_jjohnson@quicinc.com,
	Kieran Frewen <kieran.frewen@morsemicro.com>
Subject: Re: [PATCH v2 01/12] cfg80211: regulatory: extend regulatory support
 for S1G
Message-ID: <202208301755.3ARl5XbS-lkp@intel.com>
References: <20220830022017.51017-2-kieran.frewen@morsemicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830022017.51017-2-kieran.frewen@morsemicro.com>

Hi Kieran,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless/main]
[also build test WARNING on linus/master v6.0-rc3 next-20220830]
[cannot apply to wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kieran-Frewen/Additional-Support-for-802-11ah-S1G/20220830-102217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main
config: arm-colibri_pxa270_defconfig (https://download.01.org/0day-ci/archive/20220830/202208301755.3ARl5XbS-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project c7df82e4693c19e3fd2e25c83eb04d9deb7b7b59)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/7c0e7a45e22911c6e1b16ecdce1a4d6022fd66ee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kieran-Frewen/Additional-Support-for-802-11ah-S1G/20220830-102217
        git checkout 7c0e7a45e22911c6e1b16ecdce1a4d6022fd66ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/wireless/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/wireless/util.c:137:5: warning: no previous prototype for function 'ieee80211_s1g_channel_to_freq_khz' [-Wmissing-prototypes]
   u32 ieee80211_s1g_channel_to_freq_khz(int chan)
       ^
   net/wireless/util.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 ieee80211_s1g_channel_to_freq_khz(int chan)
   ^
   static 
   1 warning generated.
--
>> net/wireless/reg.c:2597:33: warning: variable 'center_freq_khz' is uninitialized when used here [-Wuninitialized]
                   reg_rule = freq_reg_info_regd(center_freq_khz, regd, bw);
                                                 ^~~~~~~~~~~~~~~
   net/wireless/reg.c:2586:25: note: initialize the variable 'center_freq_khz' to silence this warning
           u32 bw, center_freq_khz;
                                  ^
                                   = 0
   1 warning generated.


vim +/ieee80211_s1g_channel_to_freq_khz +137 net/wireless/util.c

   136	
 > 137	u32 ieee80211_s1g_channel_to_freq_khz(int chan)
   138	{
   139		u32 base = ieee80211_s1g_base_freq(chan);
   140	
   141		if (!base)
   142			return 0;
   143	
   144		return (base + chan * 500);
   145	}
   146	EXPORT_SYMBOL(ieee80211_s1g_channel_to_freq_khz);
   147	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
