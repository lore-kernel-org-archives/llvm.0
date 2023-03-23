Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2686F944E;
	Thu, 23 Mar 2023 13:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679579191; x=1711115191;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9ennairkf3iy0DLpGRVHy/xvU8CQYM6AxEOs9CSrRLY=;
  b=cKbEvOktt+X0Zhy/7zQePUCQZHnvXAvg9VHG6+ruU1Cx1sWYYCzfxvuQ
   iRfqLkZXMV25vcxRkyyzP0dXeMCjx0MB+UrUXj6uUugSvFELaQTicXXQ0
   7l2AGrFWLM2T7RioEexJNg+dYuOHJgLVgIpp06ijRAkkHFRr52ZZI3Ofy
   EgA62YTnp8zb/zWsQYN3vHNQQ+arzLspms4C0zizR/c2LlLe3xMTUtrBX
   tvzrt/AJu3rkkWQsuWeNNvaUrzQjtV88O2jNvWjL0LWXwE+AkP2ILrCh7
   2d3Ep6SaNJZohLMsDw58LVKph5pz9YYK02CK9f75JEEAj39yYSiyzvHTZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="339523430"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="339523430"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 06:46:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="928241273"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="928241273"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2023 06:46:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfLGt-000EPt-2m;
	Thu, 23 Mar 2023 13:46:27 +0000
Date: Thu, 23 Mar 2023 21:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: John Garry <john.g.garry@oracle.com>, jejb@linux.ibm.com,
	martin.petersen@oracle.com, dgilbert@interlog.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	bvanassche@acm.org, John Garry <john.g.garry@oracle.com>
Subject: Re: [PATCH v2 06/11] scsi: scsi_debug: Dynamically allocate
 sdebug_queued_cmd
Message-ID: <202303232141.ElpLC72H-lkp@intel.com>
References: <20230323094555.584624-7-john.g.garry@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323094555.584624-7-john.g.garry@oracle.com>

Hi John,

I love your patch! Perhaps something to improve:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on next-20230323]
[cannot apply to jejb-scsi/for-next linus/master v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Garry/scsi-scsi_debug-Fix-check-for-sdev-queue-full/20230323-175305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20230323094555.584624-7-john.g.garry%40oracle.com
patch subject: [PATCH v2 06/11] scsi: scsi_debug: Dynamically allocate sdebug_queued_cmd
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230323/202303232141.ElpLC72H-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/be81e49de2c71f280dd3eac902d05afcb1061d12
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review John-Garry/scsi-scsi_debug-Fix-check-for-sdev-queue-full/20230323-175305
        git checkout be81e49de2c71f280dd3eac902d05afcb1061d12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303232141.ElpLC72H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/scsi_debug.c:5579:27: warning: no previous prototype for function 'sdebug_alloc_queued_cmd' [-Wmissing-prototypes]
   struct sdebug_queued_cmd *sdebug_alloc_queued_cmd(struct scsi_cmnd *scmd)
                             ^
   drivers/scsi/scsi_debug.c:5579:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct sdebug_queued_cmd *sdebug_alloc_queued_cmd(struct scsi_cmnd *scmd)
   ^
   static 
   1 warning generated.


vim +/sdebug_alloc_queued_cmd +5579 drivers/scsi/scsi_debug.c

  5578	
> 5579	struct sdebug_queued_cmd *sdebug_alloc_queued_cmd(struct scsi_cmnd *scmd)
  5580	{
  5581		struct sdebug_queued_cmd *sqcp = kmem_cache_zalloc(queued_cmd_cache, GFP_ATOMIC);
  5582		struct sdebug_defer *sd_dp;
  5583	
  5584		if (!sqcp)
  5585			return NULL;
  5586	
  5587		sd_dp = &sqcp->sd_dp;
  5588	
  5589		hrtimer_init(&sd_dp->hrt, CLOCK_MONOTONIC, HRTIMER_MODE_REL_PINNED);
  5590		sd_dp->hrt.function = sdebug_q_cmd_hrt_complete;
  5591		INIT_WORK(&sd_dp->ew.work, sdebug_q_cmd_wq_complete);
  5592	
  5593		sqcp->scmd = scmd;
  5594		sd_dp->sqa_idx = -1;
  5595	
  5596		return sqcp;
  5597	}
  5598	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
