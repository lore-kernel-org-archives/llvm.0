Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A3F2F44
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 13:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651584766; x=1683120766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t4ic3pIhi0Rn5xlNhRg2PqeUY4X0Tg2m1V1NnnoZHvg=;
  b=R7ZJFo6mZQFXrJO/CJ117SMY2UatL/nsCCuLF3S46CgAR5FcfYuhI0PA
   vmUm2abEgH6e7EFsol1zd2ft754c9g5SExkwLpxQZAZcIb1HFJvU+xW/m
   M8FDGkHcIhP2pa3MrgfyIQUjvS3b2Lh2Rzj38J52osMZuUfYRAneL+nSo
   gYclbD1QAlPvHwz/o2GuvmU5dw18CtjPqoZ8icLt3NGWvpTaD+ndSdjea
   rgu8ivIWO+kP2VlLxDNTOMU9/M0QtweAY83sb/4Fl8niJ4tij8zbKtVIP
   ggrdRhZOXWMA9IGUKgBdSjciJTiIR4PgTcxm8/3Aamq6LTJuvR+RlQutd
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267631214"
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="267631214"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 06:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,195,1647327600"; 
   d="scan'208";a="708027181"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 03 May 2022 06:32:44 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nlsdv-000AUq-IV;
	Tue, 03 May 2022 13:32:43 +0000
Date: Tue, 3 May 2022 21:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 22/24] qla1280: separate out host reset function from
 qla1280_error_action()
Message-ID: <202205032113.60oVJQpe-lkp@intel.com>
References: <20220502213820.3187-23-hare@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220502213820.3187-23-hare@suse.de>

Hi Hannes,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next powerpc/next linus/master v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Hannes-Reinecke/scsi-EH-rework-prep-patches-part-1/20220503-054317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
config: arm64-randconfig-r022-20220502 (https://download.01.org/0day-ci/archive/20220503/202205032113.60oVJQpe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c29ab2b7bfc02579580a4a887b6e5d7fe29807cc
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hannes-Reinecke/scsi-EH-rework-prep-patches-part-1/20220503-054317
        git checkout c29ab2b7bfc02579580a4a887b6e5d7fe29807cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla1280.c:1014:6: warning: variable 'rc' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (qla1280_abort_isp(ha) != 0) {       /* it's dead */
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla1280.c:1022:9: note: uninitialized use occurs here
           return rc;
                  ^~
   drivers/scsi/qla1280.c:1014:2: note: remove the 'if' if its condition is always true
           if (qla1280_abort_isp(ha) != 0) {       /* it's dead */
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/qla1280.c:1000:8: note: initialize the variable 'rc' to silence this warning
           int rc;
                 ^
                  = 0
   drivers/scsi/qla1280.c:1712:15: warning: variable 'num' set but not used [-Wunused-but-set-variable]
           int err = 0, num, i;
                        ^
   2 warnings generated.


vim +1014 drivers/scsi/qla1280.c

   992	
   993	/**************************************************************************
   994	 *   qla1280_adapter_reset
   995	 *     Reset the specified adapter (both channels)
   996	 **************************************************************************/
   997	static int
   998	qla1280_eh_adapter_reset(struct scsi_cmnd *cmd)
   999	{
  1000		int rc;
  1001		struct Scsi_Host *shost = cmd->device->host;
  1002		struct scsi_qla_host *ha = (struct scsi_qla_host *)shost->hostdata;
  1003	
  1004		spin_lock_irq(shost->host_lock);
  1005		if (qla1280_verbose) {
  1006			printk(KERN_INFO
  1007			       "scsi(%ld): Issued ADAPTER RESET\n",
  1008			       ha->host_no);
  1009			printk(KERN_INFO "scsi(%ld): I/O processing will "
  1010			       "continue automatically\n", ha->host_no);
  1011		}
  1012		ha->flags.reset_active = 1;
  1013	
> 1014		if (qla1280_abort_isp(ha) != 0) {	/* it's dead */
  1015			rc = FAILED;
  1016		}
  1017	
  1018		ha->flags.reset_active = 0;
  1019	
  1020		spin_unlock_irq(shost->host_lock);
  1021	
  1022		return rc;
  1023	}
  1024	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
