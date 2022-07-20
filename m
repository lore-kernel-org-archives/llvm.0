Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484ED7B
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 00:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658277222; x=1689813222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BTDvz51y7XQjvBmWKxsS4dYwYvBBvN5avdwI2oCYmH0=;
  b=LPJkiYEr0v46Xicmh/a1kKyAb5bL88isNVpYt6nov479RjoYJM1g/9j6
   2ljw5QuHlq66j/FC/v3gsN27xuyeCa2XOGUq0A8W4hLneATsZ8SsROSr6
   /triIaujtoIomZ9zksMr0GFX4MJWGmtoafiXwCXnPKskowiEGxd+TAVlL
   q19rCNRBs61WHqu2Bz9Mb3XljMAcZA82JcFkYeYwTEppFnRyYYBWJlL68
   V4OpPwdaRyCCSXLcR7xXjtIlpfO+cpQrBCIGtCyNS1/yfbqFfVR+LTv2M
   8q+1Fw6HPp8Khu661N1Bw1w47j+bXDjIUMuKMy8ywlWuwSJE/GpWTsF/p
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="372943085"
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="372943085"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2022 17:33:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,285,1650956400"; 
   d="scan'208";a="665658825"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2022 17:33:40 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDxel-0006Gm-DC;
	Wed, 20 Jul 2022 00:33:39 +0000
Date: Wed, 20 Jul 2022 08:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
	Andi Kleen <ak@linux.intel.com>
Subject: [intel-tdx:guest-attest 5/8] arch/x86/coco/tdx/attest.c:246:6:
 warning: no previous prototype for function 'terminate_quote_request'
Message-ID: <202207200845.YVJavepg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-attest
head:   7dd2b3e1f9d655ffb17fafb777d77d860b3a42ea
commit: 28cd09ae55b12e152d390c37224a15c43f7621e5 [5/8] x86/tdx: Add Quote generation support
config: x86_64-buildonly-randconfig-r002-20220718 (https://download.01.org/0day-ci/archive/20220720/202207200845.YVJavepg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fa0c7639e91fa1cd0cf2ff0445a1634a90fe850a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/28cd09ae55b12e152d390c37224a15c43f7621e5
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-attest
        git checkout 28cd09ae55b12e152d390c37224a15c43f7621e5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/coco/tdx/attest.c:246:6: warning: no previous prototype for function 'terminate_quote_request' [-Wmissing-prototypes]
   void terminate_quote_request(struct quote_entry *entry)
        ^
   arch/x86/coco/tdx/attest.c:246:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void terminate_quote_request(struct quote_entry *entry)
   ^
   static 
   1 warning generated.


vim +/terminate_quote_request +246 arch/x86/coco/tdx/attest.c

   244	
   245	/* Handles early termination of GetQuote requests */
 > 246	void terminate_quote_request(struct quote_entry *entry)
   247	{
   248		struct tdx_quote_hdr *quote_hdr;
   249	
   250		/*
   251		 * For early termination, if the request is not yet
   252		 * processed by VMM (GET_QUOTE_IN_FLIGHT), the VMM
   253		 * still owns the shared buffer, so mark the request
   254		 * invalid to let quote_callback_handler() handle the
   255		 * memory cleanup function. If the request is already
   256		 * processed, then do the cleanup and return.
   257		 */
   258	
   259		mutex_lock(&quote_lock);
   260		quote_hdr = (struct tdx_quote_hdr *)entry->buf.vmaddr;
   261		if (quote_hdr->status == GET_QUOTE_IN_FLIGHT) {
   262			entry->valid = false;
   263			mutex_unlock(&quote_lock);
   264			return;
   265		}
   266		_del_quote_entry(entry);
   267		mutex_unlock(&quote_lock);
   268	}
   269	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
