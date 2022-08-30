Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5B374
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 14:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661869943; x=1693405943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YM/tgbGk0khYfw4Cc4yOLQSvzl0VbOtmzYV4IRIQ0Fs=;
  b=bcPzrofJvhUZNqZR2VhyR2n78fBGB4EoFPizpXFJU2aPxtdhCTFkn7th
   YS+7AylEOaQCyu0yc4jzcp0V8qxQjcq+zz4t3yDqEFY50wyN3b2NnY/16
   7uguhTlN01FzZINZ6/tCpUv1YlyTyinfj2hhoiwfc/vSP7Tq0BsFZMUzl
   9fKXqet4ggmwjJOcM7kG+TxqpndLZ1UbtBQa/J80kTcMlsSXWAYdbbtp/
   OqKOaqdG6jtcnQCEFlPXbA/3vpDrbu6AVKvgBgBLmDDklZNe/AzlwqYxE
   B0KWQjknpbEUfC95Vq/h2JWTltDsrDYa6EUWtnJjWIGXcPwuxWlZAoKef
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="293931828"
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="293931828"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2022 07:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="562665153"
Received: from lkp-server02.sh.intel.com (HELO 77b6d4e16fc5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2022 07:32:20 -0700
Received: from kbuild by 77b6d4e16fc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oT2Hs-0000KJ-0c;
	Tue, 30 Aug 2022 14:32:20 +0000
Date: Tue, 30 Aug 2022 22:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [bvanassche:scsi-proc 3/4] drivers/scsi/esas2r/esas2r_main.c:643:12:
 warning: incompatible integer to pointer conversion assigning to 'struct
 proc_dir_entry *' from 'int'
Message-ID: <202208302248.WGHox2Rb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux scsi-proc
head:   9f3429c2524eb69771ca4dc34354b429324bcf9d
commit: 9bc087eaf74989496ad8827feb0a755389b1a440 [3/4] scsi: esas2r: Introduce scsi_template_proc_dir()
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220830/202208302248.WGHox2Rb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/bvanassche/linux/commit/9bc087eaf74989496ad8827feb0a755389b1a440
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-proc
        git checkout 9bc087eaf74989496ad8827feb0a755389b1a440
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/scsi/esas2r/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/scsi/esas2r/esas2r_main.c:643:14: error: implicit declaration of function 'scsi_template_proc_dir' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   proc_dir = scsi_template_proc_dir(esas2r_proc_host->hostt);
                              ^
>> drivers/scsi/esas2r/esas2r_main.c:643:12: warning: incompatible integer to pointer conversion assigning to 'struct proc_dir_entry *' from 'int' [-Wint-conversion]
                   proc_dir = scsi_template_proc_dir(esas2r_proc_host->hostt);
                            ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/esas2r/esas2r_main.c:738:15: error: implicit declaration of function 'scsi_template_proc_dir' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           proc_dir = scsi_template_proc_dir(sh->hostt);
                                      ^
   drivers/scsi/esas2r/esas2r_main.c:738:13: warning: incompatible integer to pointer conversion assigning to 'struct proc_dir_entry *' from 'int' [-Wint-conversion]
                           proc_dir = scsi_template_proc_dir(sh->hostt);
                                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 2 errors generated.


vim +643 drivers/scsi/esas2r/esas2r_main.c

   633	
   634	static void __exit esas2r_exit(void)
   635	{
   636		esas2r_log(ESAS2R_LOG_INFO, "%s called", __func__);
   637	
   638		if (esas2r_proc_major > 0) {
   639			struct proc_dir_entry *proc_dir;
   640	
   641			esas2r_log(ESAS2R_LOG_INFO, "unregister proc");
   642	
 > 643			proc_dir = scsi_template_proc_dir(esas2r_proc_host->hostt);
   644			if (proc_dir)
   645				remove_proc_entry(ATTONODE_NAME, proc_dir);
   646			unregister_chrdev(esas2r_proc_major, ESAS2R_DRVR_NAME);
   647	
   648			esas2r_proc_major = 0;
   649		}
   650	
   651		esas2r_log(ESAS2R_LOG_INFO, "pci_unregister_driver() called");
   652	
   653		pci_unregister_driver(&esas2r_pci_driver);
   654	}
   655	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
