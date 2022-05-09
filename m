Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1099D7E
	for <llvm@lists.linux.dev>; Mon,  9 May 2022 13:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652104338; x=1683640338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kU+skApzpOV77ptWSa9MmY3qt6uJPKTjCq/D4Ml+90o=;
  b=jcWc+Qb4gzw46jNvHskQePxdb63Jt9oIBS/Ngi7eNGY7V62GKbzeGOXM
   vcpysyof/zjXSob6ewZEtRpkeNYLlqtpGP/3bDgyp6DMMT6EFrJlHPMeg
   NtYlGq72U/Aw1tZtb2UDQTm7IA3gvSJekWbxYPEZWi0a0RHuNVXB6F+iT
   A9fmycVSU4LY5kHI9ea6+dMidzTiqdoBgedZ7nbYqqeNBOkfqbu7ws1V7
   r+rh0VFkvFvzwZb8uy9X5LkXSX7EOFlYKJiMugQ2BfGEW9clMPqhBzlxu
   Z9szirYCJ3NeUJZDcNHlII9tqg+O3iD7aVuK3biTuM1dAwA23UoQKT84k
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355482314"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; 
   d="scan'208";a="355482314"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 06:52:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; 
   d="scan'208";a="551027046"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 May 2022 06:52:14 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1no3o6-000GYc-7m;
	Mon, 09 May 2022 13:52:14 +0000
Date: Mon, 9 May 2022 21:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-pm@vger.kernel.org
Subject: [chanwoo:devfreq-testing 5/5]
 drivers/devfreq/governor_passive.c:409:2: error: use of undeclared
 identifier 'ret'
Message-ID: <202205092158.pfjjAl5S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git devfreq-testing
head:   edb11683479cd9e51010f571ae4011ae01e88ee5
commit: edb11683479cd9e51010f571ae4011ae01e88ee5 [5/5] PM / devfreq: passive: Update frequency when start governor
config: arm64-randconfig-r034-20220509 (https://download.01.org/0day-ci/archive/20220509/202205092158.pfjjAl5S-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a385645b470e2d3a1534aae618ea56b31177639f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git/commit/?id=edb11683479cd9e51010f571ae4011ae01e88ee5
        git remote add chanwoo https://git.kernel.org/pub/scm/linux/kernel/git/chanwoo/linux.git
        git fetch --no-tags chanwoo devfreq-testing
        git checkout edb11683479cd9e51010f571ae4011ae01e88ee5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/devfreq/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/devfreq/governor_passive.c:409:2: error: use of undeclared identifier 'ret'
           ret = devfreq_update_target(devfreq, parent->previous_freq);
           ^
   drivers/devfreq/governor_passive.c:410:6: error: use of undeclared identifier 'ret'
           if (ret < 0)
               ^
   drivers/devfreq/governor_passive.c:424:18: warning: unused variable 'parent' [-Wunused-variable]
           struct devfreq *parent = (struct devfreq *)p_data->parent;
                           ^
   1 warning and 2 errors generated.


vim +/ret +409 drivers/devfreq/governor_passive.c

   387	
   388	static int devfreq_passive_register_notifier(struct devfreq *devfreq)
   389	{
   390		struct devfreq_passive_data *p_data
   391				= (struct devfreq_passive_data *)devfreq->data;
   392		struct devfreq *parent = (struct devfreq *)p_data->parent;
   393		struct notifier_block *nb = &p_data->nb;
   394	
   395		if (!parent)
   396			return -EPROBE_DEFER;
   397	
   398		/*
   399		 * If the parent device changes the their frequency before
   400		 * registering the passive device, the passive device cannot
   401		 * receive the notification from parent device and then the
   402		 * passive device cannot be able to set the proper frequency
   403		 * according to the frequency of parent device.
   404		 *
   405		 * When start the passive governor, update the frequency
   406		 * according to the frequency of parent device.
   407		 */
   408		mutex_lock(&devfreq->lock);
 > 409		ret = devfreq_update_target(devfreq, parent->previous_freq);
   410		if (ret < 0)
   411			dev_warn(&devfreq->dev,
   412			"failed to update devfreq using passive governor\n");
   413		mutex_unlock(&devfreq->lock);
   414	
   415		nb->notifier_call = devfreq_passive_notifier_call;
   416		return devfreq_register_notifier(parent, nb, DEVFREQ_TRANSITION_NOTIFIER);
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
