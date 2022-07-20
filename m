Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5923C3
	for <llvm@lists.linux.dev>; Wed, 20 Jul 2022 07:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658303843; x=1689839843;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIthjsEZ85d8ocjhmCfrhK7Xx0+PQIkRHO1HHgSI8pw=;
  b=JMfap8sOV2qYCJFluvIqbS7lB0IfSywxBkThbXOeC9s7SfnySr0bXIos
   RrxWRRgyL2SUjRWggAFXB/DvnPNF0//++9zyw7Yf0UHLIudxCTj47xMwk
   /B/wCNipMrNPAMbe5GJzX2nHg00hLWKS5LhOYaHo7EjXsYYXXhqP+LyL+
   teHH2P3pUGq8jggI5/hS6SsWBJLn7i38V9Nu/7CpJ+V2ZCzBQIIQukiIU
   t4q/NcNmbUfbE0OzYesGcvSnGMclbiN8aM7MuQdqwFmSMhL8+oWspnPgC
   9VwVTmfL67Mp8wAXZzCsjuS0JJ073bSu+5bs0BIjkMYs+2iYaTl7d2KwL
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="285473003"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="285473003"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 00:57:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; 
   d="scan'208";a="597981890"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jul 2022 00:57:17 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oE4a5-0000F5-1P;
	Wed, 20 Jul 2022 07:57:17 +0000
Date: Wed, 20 Jul 2022 15:57:05 +0800
From: kernel test robot <lkp@intel.com>
To: Can Guo <quic_cang@quicinc.com>, bvanassche@acm.org,
	stanley.chu@mediatek.com, adrian.hunter@intel.com,
	alim.akhtar@samsung.com, avri.altman@wdc.com, beanhuo@micron.com,
	quic_asutoshd@quicinc.com, quic_nguyenb@quicinc.com,
	quic_ziqichen@quicinc.com, linux-scsi@vger.kernel.org,
	kernel-team@android.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Daejun Park <daejun7.park@samsung.com>,
	Jinyoung Choi <j-young.choi@samsung.com>,
	Kiwoong Kim <kwmad.kim@samsung.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] scsi: ufs: Add Multi-Circular Queue support
Message-ID: <202207201538.0hGdcttT-lkp@intel.com>
References: <1658214120-22772-2-git-send-email-quic_cang@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1658214120-22772-2-git-send-email-quic_cang@quicinc.com>

Hi Can,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jejb-scsi/for-next]
[also build test WARNING on mkp-scsi/for-next next-20220719]
[cannot apply to linus/master v5.19-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Can-Guo/UFS-Multi-Circular-Queue-MCQ/20220719-150436
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git for-next
config: x86_64-randconfig-r036-20220718 (https://download.01.org/0day-ci/archive/20220720/202207201538.0hGdcttT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2b7356bcd24efd2d6b69f04dd9fd010c4256cc7e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Can-Guo/UFS-Multi-Circular-Queue-MCQ/20220719-150436
        git checkout 2b7356bcd24efd2d6b69f04dd9fd010c4256cc7e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/ufs/core/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/ufs/core/ufshcd.c:5465:13: warning: no previous prototype for function 'ufshcd_transfer_req_compl' [-Wmissing-prototypes]
   irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
               ^
   drivers/ufs/core/ufshcd.c:5465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
   ^
   static 
   1 warning generated.


vim +/ufshcd_transfer_req_compl +5465 drivers/ufs/core/ufshcd.c

  5456	
  5457	/**
  5458	 * ufshcd_transfer_req_compl - handle SCSI and query command completion
  5459	 * @hba: per adapter instance
  5460	 *
  5461	 * Returns
  5462	 *  IRQ_HANDLED - If interrupt is valid
  5463	 *  IRQ_NONE    - If invalid interrupt
  5464	 */
> 5465	irqreturn_t ufshcd_transfer_req_compl(struct ufs_hba *hba)
  5466	{
  5467		/* Resetting interrupt aggregation counters first and reading the
  5468		 * DOOR_BELL afterward allows us to handle all the completed requests.
  5469		 * In order to prevent other interrupts starvation the DB is read once
  5470		 * after reset. The down side of this solution is the possibility of
  5471		 * false interrupt if device completes another request after resetting
  5472		 * aggregation and before reading the DB.
  5473		 */
  5474		if (ufshcd_is_intr_aggr_allowed(hba) &&
  5475		    !(hba->quirks & UFSHCI_QUIRK_SKIP_RESET_INTR_AGGR))
  5476			ufshcd_reset_intr_aggr(hba);
  5477	
  5478		if (ufs_fail_completion())
  5479			return IRQ_HANDLED;
  5480	
  5481		/*
  5482		 * Ignore the ufshcd_poll() return value and return IRQ_HANDLED since we
  5483		 * do not want polling to trigger spurious interrupt complaints.
  5484		 */
  5485		ufshcd_poll(hba->host, 0);
  5486	
  5487		return IRQ_HANDLED;
  5488	}
  5489	EXPORT_SYMBOL_GPL(ufshcd_transfer_req_compl);
  5490	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
