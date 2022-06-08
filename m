Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5EF7B
	for <llvm@lists.linux.dev>; Wed,  8 Jun 2022 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654701581; x=1686237581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C/vRiU53efJcn6fLogwCXc6HwBl6rv6d1wnE187attg=;
  b=HePnd1wHZ5+7TlPZmoqFogSKE81I8OmRXPDySxR3vGvyXTvyJXvdjKOb
   Age9qWF+t9DPDOf+LRyz+pigMtPIScFc/0mo7BeFxrjvRTrAiMOR21xkj
   ixzv6Y5BXAomxz9ByJLFWtbohCURU+lub9aonsPdFv3ykkikip98x9PHf
   rhNnjRzwX5Z36OX0ZDusebPadltYYcrtVtepFKVkKF+FmRHIh9ZXaGaSp
   J0/zmRnuL+JGeO20LfLEKNwAdq6qkTFP3CJcF7d4HPgRY6pmzN6tHFaQg
   zepD1cfWtERNCkBu9YxlTRKd9JyQepVmRpECzep+VKPykokallW8Ocog3
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10372"; a="275696463"
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="275696463"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2022 08:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,286,1647327600"; 
   d="scan'208";a="533136744"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Jun 2022 08:19:37 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyxT6-000Ejc-GS;
	Wed, 08 Jun 2022 15:19:36 +0000
Date: Wed, 8 Jun 2022 23:19:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>, Ted Tso <tytso@mit.edu>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-ext4@vger.kernel.org, Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] jbd2: Remove unused exports for jbd2 debugging
Message-ID: <202206082321.RIUKdEnL-lkp@intel.com>
References: <20220606144047.16780-1-jack@suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220606144047.16780-1-jack@suse.cz>

Hi Jan,

I love your patch! Yet something to improve:

[auto build test ERROR on tytso-ext4/dev]
[also build test ERROR on linus/master v5.19-rc1 next-20220608]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Jan-Kara/jbd2-Remove-unused-exports-for-jbd2-debugging/20220606-224629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
config: hexagon-randconfig-r023-20220607 (https://download.01.org/0day-ci/archive/20220608/202206082321.RIUKdEnL-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/9aaaac58ce0525ce441ad75b45bf3e5f3911a82b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jan-Kara/jbd2-Remove-unused-exports-for-jbd2-debugging/20220606-224629
        git checkout 9aaaac58ce0525ce441ad75b45bf3e5f3911a82b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__jbd2_debug" [fs/ext4/ext4.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
