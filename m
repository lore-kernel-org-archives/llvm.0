Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47C07A
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 21:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650663616; x=1682199616;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtNauQO39gC+gnzURE7juSPWOT6BK9MhODzUK7jBNn0=;
  b=EksjN8gCkeGu0m8edm5bEjQtvkrqAbFdDoGJs9g9jvgC91D9EEvZjBQ8
   l2xIzjzUFnRi3Tspvf2PyldlNP31ApeQOJovvJN4T5ne+1vBECbWawdjz
   HgIa3S5G1gU5xQbmCxrvVQvf2mtFWlaWdi5vHUsLLx6rXKdUrLMHiJwee
   2EqbXrtwtSoOCG1g8yXhH1sYwCgtB6tKsdxrIlw6mihfukJ51dZDyX19M
   cDADJAzx6LFMCYHa/pX8zrIbT2JC3GVHZNppxs4TQGM6aYCpd38fsWiNQ
   cAZkEPgKaN1w18y1LnDj2mPOzjYqdaFNVcH7i8ghAzGbJ+tJFr9prHy+P
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351242558"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="351242558"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 14:40:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="728702704"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2022 14:40:14 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ni10g-000Ab8-6r;
	Fri, 22 Apr 2022 21:40:14 +0000
Date: Sat, 23 Apr 2022 05:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: "D. Starke" <daniel.starke@siemens.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] tty: n_gsm: fix invalid use of MSC in advanced option
Message-ID: <202204230518.DGoOVlvT-lkp@intel.com>
References: <20220422071025.5490-2-daniel.starke@siemens.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220422071025.5490-2-daniel.starke@siemens.com>

Hi Starke",

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20220422]
[cannot apply to tty/tty-testing linus/master linux/master v5.18-rc3 v5.18-rc2 v5.18-rc1 v5.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/D-Starke/tty-n_gsm-fix-broken-virtual-tty-handling/20220422-151637
base:    e7d6987e09a328d4a949701db40ef63fbb970670
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220423/202204230518.DGoOVlvT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/b2e534975b6bb743b6784e9030ba41b011e156bb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review D-Starke/tty-n_gsm-fix-broken-virtual-tty-handling/20220422-151637
        git checkout b2e534975b6bb743b6784e9030ba41b011e156bb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/tty/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/tty/n_gsm.c:939:13: warning: variable 'size' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           } else if (dlci->adaption == 2) {
                      ^~~~~~~~~~~~~~~~~~~
   drivers/tty/n_gsm.c:948:40: note: uninitialized use occurs here
           msg = gsm_data_alloc(gsm, dlci->addr, size, gsm->ftype);
                                                 ^~~~
   drivers/tty/n_gsm.c:939:9: note: remove the 'if' if its condition is always true
           } else if (dlci->adaption == 2) {
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/n_gsm.c:934:10: note: initialize the variable 'size' to silence this warning
           int size;
                   ^
                    = 0
   1 warning generated.


vim +939 drivers/tty/n_gsm.c

   916	
   917	/**
   918	 *	gsm_dlci_modem_output	-	try and push modem status out of a DLCI
   919	 *	@gsm: mux
   920	 *	@dlci: the DLCI to pull modem status from
   921	 *	@brk: break signal
   922	 *
   923	 *	Push an empty frame in to the transmit queue to update the modem status
   924	 *	bits and to transmit an optional break.
   925	 *
   926	 *	Caller must hold the tx_lock of the mux.
   927	 */
   928	
   929	static int gsm_dlci_modem_output(struct gsm_mux *gsm, struct gsm_dlci *dlci,
   930					 u8 brk)
   931	{
   932		u8 *dp = NULL;
   933		struct gsm_msg *msg;
   934		int size;
   935	
   936		/* for modem bits without break data */
   937		if (dlci->adaption == 1) {
   938			size = 0;
 > 939		} else if (dlci->adaption == 2) {
   940			size = 1;
   941			if (brk > 0)
   942				size++;
   943		} else {
   944			pr_err("%s: unsupported adaption %d\n", __func__,
   945			       dlci->adaption);
   946		}
   947	
   948		msg = gsm_data_alloc(gsm, dlci->addr, size, gsm->ftype);
   949		if (!msg) {
   950			pr_err("%s: gsm_data_alloc error", __func__);
   951			return -ENOMEM;
   952		}
   953		dp = msg->data;
   954		switch (dlci->adaption) {
   955		case 1: /* Unstructured */
   956			break;
   957		case 2: /* Unstructured with modem bits. */
   958			if (brk == 0) {
   959				*dp++ = (gsm_encode_modem(dlci) << 1) | EA;
   960			} else {
   961				*dp++ = gsm_encode_modem(dlci) << 1;
   962				*dp++ = (brk << 4) | 2 | EA; /* Length, Break, EA */
   963			}
   964			break;
   965		default:
   966			/* Handled above */
   967			break;
   968		}
   969	
   970		__gsm_data_queue(dlci, msg);
   971		return size;
   972	}
   973	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
