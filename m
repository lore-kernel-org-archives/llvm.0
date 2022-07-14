Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F83F3206
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657801457; x=1689337457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b5n3uqqFX9OVlCqhzlsnHIeY4hIIEtG22HTQgIB1QSY=;
  b=aUw1Pso9qyKnHQJ+vx7PcFZt97r7A7BKXeHn4R4YTYIdQTOWF0fcHpoL
   6NE6uteJizre5wp+Sonn+kVttzOTrtciiKn/J2GGGnWuPbCzI7QHU/DHc
   BZHSAEblk/4gC+nHX2kWtg3ZJ9ScHS3bExNAHw9nPQ3jn8jwRFbkUIU07
   MV8qzJPzrOTJmXukTB7wps4D5n0zXMNqE7WBxUvKuBqrlmX5SpfeKEpeb
   b01uB0SsGGA1Zyqv53JHSB3nw3YDFr3lGpy+QKdWamWnPhD60Kht0rWF8
   KRTG2RErS3tmCSYPfdhotVIVdg7zUCZXKhWk+C6jpQZa1GfKOH0tgULY9
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="286635409"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="286635409"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 05:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="923051658"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2022 05:24:15 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oBxt8-0000bD-RK;
	Thu, 14 Jul 2022 12:24:14 +0000
Date: Thu, 14 Jul 2022 20:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10519/10678] security/apparmor/policy_ns.c:83:20:
 warning: no previous prototype for function 'alloc_unconfined'
Message-ID: <202207142026.qqAoch7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
commit: 95c0581f9bfdfbe97126ba1c7f5650a9dd064dda [10519/10678] apparmor: add a kernel label to use on kernel objects
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220714/202207142026.qqAoch7S-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=95c0581f9bfdfbe97126ba1c7f5650a9dd064dda
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 95c0581f9bfdfbe97126ba1c7f5650a9dd064dda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash security/apparmor/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> security/apparmor/policy_ns.c:83:20: warning: no previous prototype for function 'alloc_unconfined' [-Wmissing-prototypes]
   struct aa_profile *alloc_unconfined(const char *name)
                      ^
   security/apparmor/policy_ns.c:83:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct aa_profile *alloc_unconfined(const char *name)
   ^
   static 
   1 warning generated.


vim +/alloc_unconfined +83 security/apparmor/policy_ns.c

    82	
  > 83	struct aa_profile *alloc_unconfined(const char *name)
    84	{
    85		struct aa_profile *profile;
    86	
    87		profile = aa_alloc_profile(name, NULL, GFP_KERNEL);
    88		if (!profile)
    89			return NULL;
    90	
    91		profile->label.flags |= FLAG_IX_ON_NAME_ERROR |
    92			FLAG_IMMUTIBLE | FLAG_NS_COUNT | FLAG_UNCONFINED;
    93		profile->mode = APPARMOR_UNCONFINED;
    94		profile->file.dfa = aa_get_dfa(nulldfa);
    95		profile->policy.dfa = aa_get_dfa(nulldfa);
    96	
    97		return profile;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
