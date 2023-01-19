Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25637485;
	Thu, 19 Jan 2023 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674143462; x=1705679462;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aOUZMiKF3NX0nh5cZ7E09kHUs0CRUzV9PhmnGZt+OnA=;
  b=BfDH9SRts8Qwnc6aBLnLuZb3IxMSfynCvfJdT0bc1i/1Dmj8WwY8acp7
   y4sy0EWJtBO1cmjr9Dw+6fWja+aePDoSFVzXtk9GKC1CuVtA1fFMw9EFo
   yuYA9337iX0qmk3rNl5Yh90mnMgv/406rIxoOESy8pxCnqwQxhTilhwL9
   5BL31mRjcVGxv75JaT2mV0zeFfhiHfot0+FE8UEljcIin/ZPDbrDgSpNC
   8X86KtStImyiKYVRm0yyOZzoLCOstVWnPI6M3w3a9w4zYtPzjUmDJhUBl
   cscLJC0j/c/gQvrtIfVBRwQHe2BhZCoQlUkZANz977vAVFIBmLyHERbcA
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326601211"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="326601211"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 07:51:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="692463392"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="692463392"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 19 Jan 2023 07:50:58 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIXBp-0001ag-0c;
	Thu, 19 Jan 2023 15:50:57 +0000
Date: Thu, 19 Jan 2023 23:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Blakey <paulb@nvidia.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>,
	Cong Wang <xiyou.wangcong@gmail.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oz Shlomo <ozsh@nvidia.com>, Jiri Pirko <jiri@nvidia.com>,
	Roi Dayan <roid@nvidia.com>, Vlad Buslov <vladbu@nvidia.com>
Subject: Re: [PATCH net-next v3 1/6] net/sched: cls_api: Support hardware
 miss to tc action
Message-ID: <202301192343.MPDnhYo1-lkp@intel.com>
References: <20230119082357.21744-2-paulb@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119082357.21744-2-paulb@nvidia.com>

Hi Paul,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Blakey/net-sched-cls_api-Support-hardware-miss-to-tc-action/20230119-162743
patch link:    https://lore.kernel.org/r/20230119082357.21744-2-paulb%40nvidia.com
patch subject: [PATCH net-next v3 1/6] net/sched: cls_api: Support hardware miss to tc action
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230119/202301192343.MPDnhYo1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5c85cf394445e1140823351fdfdbf3e541b9abb9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-Blakey/net-sched-cls_api-Support-hardware-miss-to-tc-action/20230119-162743
        git checkout 5c85cf394445e1140823351fdfdbf3e541b9abb9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/sched/cls_api.c:3224:6: warning: variable 'err' is uninitialized when used here [-Wuninitialized]
           if (err)
               ^~~
   net/sched/cls_api.c:3200:9: note: initialize the variable 'err' to silence this warning
           int err;
                  ^
                   = 0
   1 warning generated.


vim +/err +3224 net/sched/cls_api.c

  3214	
  3215		exts->action = action;
  3216		exts->police = police;
  3217	
  3218		if (!use_action_miss)
  3219			return 0;
  3220	
  3221	#if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
  3222		err = tcf_exts_miss_cookie_base_alloc(exts, tp, handle);
  3223	#endif
> 3224		if (err)
  3225			goto err_miss_alloc;
  3226	
  3227		return 0;
  3228	
  3229	err_miss_alloc:
  3230		tcf_exts_destroy(exts);
  3231		return err;
  3232	}
  3233	EXPORT_SYMBOL(tcf_exts_init_ex);
  3234	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
