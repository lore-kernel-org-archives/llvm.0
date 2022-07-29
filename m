Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91BB31113
	for <llvm@lists.linux.dev>; Fri, 29 Jul 2022 16:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659112332; x=1690648332;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6tLVOzi5uy23c/11Rwvj/ZNBzCp71yo4iRnHF85mO3U=;
  b=g8mfCIQnlU1OUlOoVOK6FjbdnBJwSKPi8GT0f7W4d2B+UElY+B76/xD4
   Zw393F90FTySKBZH3vCQc1BTL0p79T72YFHCwapvQmN23Aw2ABk+6nmsD
   4Xi2Sg6PBUCq81fbkaCyksrN6KUskJlAHwDcS1vNlXN7Q2+bdDx/nR+oV
   MWK/qdoW01JEmS0V5fdNuLr5sJqV07/jpAy+GKWgYyUhSFKRbT3fyyvpg
   2IcZPWWp3FTboSmXAv1tZ9WC4NlIiKPzO+iyrdgtXK2zLF/7wObZDMxwu
   +Ktk2FIzLRQlBhnBB31hSxUbC+RhCO+ju1ifNwOp2tl7Wyur4CEJyKGlt
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10423"; a="288814990"
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="288814990"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2022 09:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,201,1654585200"; 
   d="scan'208";a="690781679"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2022 09:32:10 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oHSuI-000BrN-04;
	Fri, 29 Jul 2022 16:32:10 +0000
Date: Sat, 30 Jul 2022 00:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 3/3] netfilter: nf_tables: add string expression
Message-ID: <202207300046.EwgOKdTk-lkp@intel.com>
References: <20220729093129.3108-4-pablo@netfilter.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729093129.3108-4-pablo@netfilter.org>

Hi Pablo,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on nf/master]
[also build test ERROR on linus/master v5.19-rc8 next-20220728]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/nf_tables-string-match-support/20220729-173258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220730/202207300046.EwgOKdTk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1149ccc4ca2617ae8ef8b069f592cf77450a96fe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pablo-Neira-Ayuso/nf_tables-string-match-support/20220729-173258
        git checkout 1149ccc4ca2617ae8ef8b069f592cf77450a96fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "ac_iterate" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_iter_destroy" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_iter_create" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_del" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_add" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_clone" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_create" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_resolve_fail" [net/netfilter/nf_tables.ko] undefined!
ERROR: modpost: "ac_destroy" [net/netfilter/nf_tables.ko] undefined!
>> ERROR: modpost: "nft_string_type" [net/netfilter/nf_tables.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
