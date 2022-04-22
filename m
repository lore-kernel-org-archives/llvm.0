Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD1533FC
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 23:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650671010; x=1682207010;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNbYdNva6h3X6M/oHJo2WqlgWtXnrs+cSIDnARJ/xJ0=;
  b=QuAxxlWNe6BzeAkdk/pJVSZxa56j2jq4KJYIHVTj/p2j19RKXQfAU6TO
   AA1tPG9bGvm7fi+wSYP63nQPYRbtnyzpirB7ODP75ebYR6+WVwjb6J6b1
   Kg67s2d6FGMIVEeyxHHeN99N/52TZutlX5fbX0eTOCjxKC3ZIYPB9IDgl
   kvneJgoyppez6m8vPDiB533VOZVqlrJ5qvuLfuj9Iyqdayrej1baq5Ld1
   Ayj2yRPQu0YIZ7WswC+TM/Da7QVT6dtQ10lSKhnHHEVD8WugF2QURZDzu
   4MpQs+/19unVbC94yXG1/cewcTSUedOXZJISutxhiDMVDBVoUvG1M7xji
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="327729455"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="327729455"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 16:43:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="615622248"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 22 Apr 2022 16:43:26 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ni2vt-000Aft-T6;
	Fri, 22 Apr 2022 23:43:25 +0000
Date: Sat, 23 Apr 2022 07:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Starke <daniel.starke@siemens.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-serial@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [tty:tty-linus 23/26] drivers/tty/n_gsm.c:939:13: warning: variable
 'size' is used uninitialized whenever 'if' condition is false
Message-ID: <202204230704.5MxboEEo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-linus
head:   637674fa40059cddcc3ad2212728965072f62ea3
commit: c19ffe00fed6bb423d81406d2a7e5793074c7d83 [23/26] tty: n_gsm: fix invalid use of MSC in advanced option
config: hexagon-randconfig-r035-20220422 (https://download.01.org/0day-ci/archive/20220423/202204230704.5MxboEEo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?id=c19ffe00fed6bb423d81406d2a7e5793074c7d83
        git remote add tty https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
        git fetch --no-tags tty tty-linus
        git checkout c19ffe00fed6bb423d81406d2a7e5793074c7d83
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/tty/

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
