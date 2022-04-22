Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7542919
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 18:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650651421; x=1682187421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UMRs4BhTByG3T0yDZhW94axoO98VgNSgjnfEZMM3/as=;
  b=MGKAMLco8gokPyKmjK3vONPVrn1RurPcHtHDAcCERkKx2Q2PnhZZxxoC
   r4kbFaYKaeaTYlN1Iev0rdrawpqthIeeq3xwrTWEYD7bjFGzOLtmhkvbL
   pVdqw1imno5CB6zAquErS15Hl9klZ8qqFhlVv+FJRjhQmXmwv5hRm4M9N
   Vgo8So0lgyk6rEs7kcRq55NoVVLAWZ2NK79Bg7KMY3dP6uaiIZtznh503
   wFCOJ6gXGM6ASO8PNYiqCkU9Iyn5q4VynICa/2YLFX8k0NXPG8snhrDvQ
   GXQUPYesIKStLG3NvsJ40oSdCm4aXoSaROn+BnSjiSs8GtvP1FBl9ZswC
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="244674116"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="244674116"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 11:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="594251782"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Apr 2022 11:16:57 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhxpx-000ARo-9g;
	Fri, 22 Apr 2022 18:16:57 +0000
Date: Sat, 23 Apr 2022 02:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Cixi Geng <gengcixi@gmail.com>, sre@kernel.org, orsonzhai@gmail.com,
	baolin.wang7@gmail.com, zhang.lyra@gmail.com,
	chenyongzhi811@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] power: supply: Add enable the primary charger interface
Message-ID: <202204230206.9TgyhSb1-lkp@intel.com>
References: <20220422074109.1709106-1-gengcixi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422074109.1709106-1-gengcixi@gmail.com>

Hi Cixi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on sre-power-supply/for-next]
[also build test WARNING on v5.18-rc3 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Cixi-Geng/power-supply-Add-enable-the-primary-charger-interface/20220422-154432
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git for-next
config: riscv-randconfig-r042-20220422 (https://download.01.org/0day-ci/archive/20220423/202204230206.9TgyhSb1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a566cf23ffad8453d1e1f611086b6eda3f14515d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cixi-Geng/power-supply-Add-enable-the-primary-charger-interface/20220422-154432
        git checkout a566cf23ffad8453d1e1f611086b6eda3f14515d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/power/supply/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/power/supply/sc2731_charger.c:156:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (val && !info->charging) {
                      ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sc2731_charger.c:164:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/power/supply/sc2731_charger.c:156:9: note: remove the 'if' if its condition is always true
           } else if (val && !info->charging) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/power/supply/sc2731_charger.c:156:13: warning: variable 'ret' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
           } else if (val && !info->charging) {
                      ^~~
   drivers/power/supply/sc2731_charger.c:164:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/power/supply/sc2731_charger.c:156:13: note: remove the '&&' if its condition is always true
           } else if (val && !info->charging) {
                      ^~~~~~
>> drivers/power/supply/sc2731_charger.c:153:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!val && info->charging) {
               ^~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sc2731_charger.c:164:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/power/supply/sc2731_charger.c:153:2: note: remove the 'if' if its condition is always false
           if (!val && info->charging) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sc2731_charger.c:151:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   drivers/power/supply/sc2731_charger.c:255:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (val->intval == true) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sc2731_charger.c:268:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/power/supply/sc2731_charger.c:255:3: note: remove the 'if' if its condition is always true
                   if (val->intval == true) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/power/supply/sc2731_charger.c:225:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   4 warnings generated.


vim +156 drivers/power/supply/sc2731_charger.c

   148	
   149	static int sc2731_charger_set_status(struct sc2731_charger_info *info, int val)
   150	{
   151		int ret;
   152	
 > 153		if (!val && info->charging) {
   154			sc2731_charger_stop_charge(info);
   155			info->charging = false;
 > 156		} else if (val && !info->charging) {
   157			ret = sc2731_charger_start_charge(info);
   158			if (ret)
   159				dev_err(info->dev, "start charge failed\n");
   160			else
   161				info->charging = true;
   162		}
   163	
   164		return ret;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
