Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC7C1D689;
	Thu,  4 Jan 2024 18:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H4cWwaep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704393013; x=1735929013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UF3SOcgkz/cAZmGRUkyrjoMp7zsPIBeYXrdPD/4DDr8=;
  b=H4cWwaep7mBF1TXc7enFWOEN8aS46KlVV+6UuNDqBeVbBmL14go5a9w1
   AL8kY4ZPHMxfOwRcevEWyeKKsIU3drLSFNDts427yxhmd4F1G2L5oqbaq
   LH3GGDWTWn5OSjqNn/7WnblcpjskL+m4NOnMW91rRsjIsfqziNQq8qUgj
   ojkJd+ZA7YG3mEweeUKYPpN6uIjUYto4tvyMoBlOzSXqyG2vg1Jm6/7S2
   Hh/UIFGTEU6xffifXgS4S3wXzjpFvFCqEhWso/2Od2Dzl277REHD/8f0Y
   2NX9POuqsotKvXf5abKhFtf51584as65LSEHCHewVh4sqFocM9H29DvLy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="428501278"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="428501278"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 10:30:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="846331004"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="846331004"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jan 2024 10:30:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLSTp-0000KG-29;
	Thu, 04 Jan 2024 18:30:09 +0000
Date: Fri, 5 Jan 2024 02:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [krzk-github:n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
 16454/16521] drivers/mailbox/qcom-cpucp-mbox.c:55:11: error: call to
 undeclared function 'readq'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202401050256.FiKwlKnS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-sm8650-on-neil-codelinaro-topic-sm8650-upstream-integ
head:   a793d03eceb5f77a083fbe3513016239b281fb0c
commit: 391f455feb268821a2dadc021a1438208cbd382d [16454/16521] mailbox: Add support for QTI CPUCP mailbox controller
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240105/202401050256.FiKwlKnS-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050256.FiKwlKnS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050256.FiKwlKnS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/qcom-cpucp-mbox.c:55:11: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      55 |         status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
         |                  ^
>> drivers/mailbox/qcom-cpucp-mbox.c:62:4: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      62 |                         writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
         |                         ^
   drivers/mailbox/qcom-cpucp-mbox.c:75:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      75 |         val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |               ^
   drivers/mailbox/qcom-cpucp-mbox.c:77:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      77 |         writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |         ^
   drivers/mailbox/qcom-cpucp-mbox.c:88:8: error: call to undeclared function 'readq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         val = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |               ^
   drivers/mailbox/qcom-cpucp-mbox.c:90:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      90 |         writeq(val, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |         ^
   drivers/mailbox/qcom-cpucp-mbox.c:189:2: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     189 |         writeq(0, cpucp->rx_base + APSS_CPUCP_RX_MBOX_EN);
         |         ^
   7 errors generated.


vim +/readq +55 drivers/mailbox/qcom-cpucp-mbox.c

    47	
    48	static irqreturn_t qcom_cpucp_mbox_irq_fn(int irq, void *data)
    49	{
    50		struct qcom_cpucp_mbox *cpucp = data;
    51		u64 status;
    52		u32 val;
    53		int i;
    54	
  > 55		status = readq(cpucp->rx_base + APSS_CPUCP_RX_MBOX_STAT);
    56	
    57		for (i = 0; i < cpucp->num_chan; i++) {
    58			val = 0;
    59			if (status & ((u64)1 << i)) {
    60				val = readl(cpucp->rx_base + APSS_CPUCP_RX_MBOX_CMD + (i * 8) + APSS_CPUCP_MBOX_CMD_OFF);
    61				mbox_chan_received_data(&cpucp->chans[i], &val);
  > 62				writeq(status, cpucp->rx_base + APSS_CPUCP_RX_MBOX_CLEAR);
    63			}
    64		}
    65	
    66		return IRQ_HANDLED;
    67	}
    68	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
