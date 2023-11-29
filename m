Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1997134CEB;
	Wed, 29 Nov 2023 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPB1OU2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701272552; x=1732808552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QiyXou6E8XmzV1Lkd+K2NH2kAgeGJ5XMMDCOjzZ30v8=;
  b=gPB1OU2WoeqfzybsPBkA3CCtdZpOEPE5xzWgxVU9Lg8RuGspinMU3MtI
   Jg0oaUTN7oGICOkzg0DzJpy+wanpnbWrY/lub2J9YySa/vOIZJ1KoBPT9
   eoYS6eMV/70M3kqsQ/pa0byeW3+3mTGDFRqa82grhAWn6Egk712Z7FpOL
   Ila3x3mZU1T9LMeZp41urEV0GK5R3oeuQFew9Kpx7PN/CC+3S7HOnTr1w
   05fMpSsCBY1XlQyy4VIW1OoD1o4p//eMjYdriDlI9Plq5qCiMesY+rJQ7
   HhTl+2BW8LqgEsM/0Ihic8/4z48luJ8l2PeyWsRfAtiuHfKZw0WXZZlum
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="392925318"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="392925318"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:42:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="772724283"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="772724283"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 29 Nov 2023 07:42:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Mhb-0000OZ-1t;
	Wed, 29 Nov 2023 15:42:17 +0000
Date: Wed, 29 Nov 2023 23:42:00 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Ramirez-Ortiz <jorge@foundries.io>, ulf.hansson@linaro.org,
	adrian.hunter@intel.com, CLoehle@hyperstone.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, axboe@kernel.dk,
	jinpu.wang@ionos.com, beanhuo@micron.com, yibin.ding@unisoc.com,
	f.fainelli@gmail.com, asuk4.q@gmail.com,
	victor.shih@genesyslogic.com.tw, marex@denx.de,
	rafael.beims@toradex.com, robimarko@gmail.com, ricardo@foundries.io
Subject: Re: [PATCH] mmc: rpmb: add quirk MMC_QUIRK_BROKEN_RPMB_RETUNE
Message-ID: <202311292124.O8uscyp0-lkp@intel.com>
References: <20231129094350.2605322-1-jorge@foundries.io>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231129094350.2605322-1-jorge@foundries.io>

Hi Jorge,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc3 next-20231129]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jorge-Ramirez-Ortiz/mmc-rpmb-add-quirk-MMC_QUIRK_BROKEN_RPMB_RETUNE/20231129-181517
base:   linus/master
patch link:    https://lore.kernel.org/r/20231129094350.2605322-1-jorge%40foundries.io
patch subject: [PATCH] mmc: rpmb: add quirk MMC_QUIRK_BROKEN_RPMB_RETUNE
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231129/202311292124.O8uscyp0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311292124.O8uscyp0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311292124.O8uscyp0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/core/mmc.c:27:
   drivers/mmc/core/quirks.h:137:22: error: use of undeclared identifier 'CIF_MANFID_SANDISK2'
           MMC_FIXUP("DG4064", CIF_MANFID_SANDISK2, 0x100, add_quirk_mmc,
                               ^
>> drivers/mmc/core/mmc.c:115:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   card->cid.serial        = UNSTUFF_BITS(resp, 16, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:57:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   1 warning and 1 error generated.


vim +115 drivers/mmc/core/mmc.c

7ea239d9e6d699 Pierre Ossman      2006-12-31   53  
7ea239d9e6d699 Pierre Ossman      2006-12-31   54  #define UNSTUFF_BITS(resp,start,size)					\
7ea239d9e6d699 Pierre Ossman      2006-12-31   55  	({								\
7ea239d9e6d699 Pierre Ossman      2006-12-31   56  		const int __size = size;				\
7ea239d9e6d699 Pierre Ossman      2006-12-31   57  		const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1;	\
7ea239d9e6d699 Pierre Ossman      2006-12-31   58  		const int __off = 3 - ((start) / 32);			\
7ea239d9e6d699 Pierre Ossman      2006-12-31   59  		const int __shft = (start) & 31;			\
7ea239d9e6d699 Pierre Ossman      2006-12-31   60  		u32 __res;						\
7ea239d9e6d699 Pierre Ossman      2006-12-31   61  									\
7ea239d9e6d699 Pierre Ossman      2006-12-31   62  		__res = resp[__off] >> __shft;				\
7ea239d9e6d699 Pierre Ossman      2006-12-31   63  		if (__size + __shft > 32)				\
7ea239d9e6d699 Pierre Ossman      2006-12-31   64  			__res |= resp[__off-1] << ((32 - __shft) % 32);	\
7ea239d9e6d699 Pierre Ossman      2006-12-31   65  		__res & __mask;						\
7ea239d9e6d699 Pierre Ossman      2006-12-31   66  	})
7ea239d9e6d699 Pierre Ossman      2006-12-31   67  
7ea239d9e6d699 Pierre Ossman      2006-12-31   68  /*
7ea239d9e6d699 Pierre Ossman      2006-12-31   69   * Given the decoded CSD structure, decode the raw CID to our CID structure.
7ea239d9e6d699 Pierre Ossman      2006-12-31   70   */
bd766312618d2e Pierre Ossman      2007-05-01   71  static int mmc_decode_cid(struct mmc_card *card)
7ea239d9e6d699 Pierre Ossman      2006-12-31   72  {
7ea239d9e6d699 Pierre Ossman      2006-12-31   73  	u32 *resp = card->raw_cid;
7ea239d9e6d699 Pierre Ossman      2006-12-31   74  
ac9d25557dcc9f Linus Walleij      2022-04-25   75  	/*
ac9d25557dcc9f Linus Walleij      2022-04-25   76  	 * Add the raw card ID (cid) data to the entropy pool. It doesn't
ac9d25557dcc9f Linus Walleij      2022-04-25   77  	 * matter that not all of it is unique, it's just bonus entropy.
ac9d25557dcc9f Linus Walleij      2022-04-25   78  	 */
ac9d25557dcc9f Linus Walleij      2022-04-25   79  	add_device_randomness(&card->raw_cid, sizeof(card->raw_cid));
ac9d25557dcc9f Linus Walleij      2022-04-25   80  
7ea239d9e6d699 Pierre Ossman      2006-12-31   81  	/*
7ea239d9e6d699 Pierre Ossman      2006-12-31   82  	 * The selection of the format here is based upon published
7ea239d9e6d699 Pierre Ossman      2006-12-31   83  	 * specs from sandisk and from what people have reported.
7ea239d9e6d699 Pierre Ossman      2006-12-31   84  	 */
7ea239d9e6d699 Pierre Ossman      2006-12-31   85  	switch (card->csd.mmca_vsn) {
7ea239d9e6d699 Pierre Ossman      2006-12-31   86  	case 0: /* MMC v1.0 - v1.2 */
7ea239d9e6d699 Pierre Ossman      2006-12-31   87  	case 1: /* MMC v1.4 */
7ea239d9e6d699 Pierre Ossman      2006-12-31   88  		card->cid.manfid	= UNSTUFF_BITS(resp, 104, 24);
7ea239d9e6d699 Pierre Ossman      2006-12-31   89  		card->cid.prod_name[0]	= UNSTUFF_BITS(resp, 96, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   90  		card->cid.prod_name[1]	= UNSTUFF_BITS(resp, 88, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   91  		card->cid.prod_name[2]	= UNSTUFF_BITS(resp, 80, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   92  		card->cid.prod_name[3]	= UNSTUFF_BITS(resp, 72, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   93  		card->cid.prod_name[4]	= UNSTUFF_BITS(resp, 64, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   94  		card->cid.prod_name[5]	= UNSTUFF_BITS(resp, 56, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   95  		card->cid.prod_name[6]	= UNSTUFF_BITS(resp, 48, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31   96  		card->cid.hwrev		= UNSTUFF_BITS(resp, 44, 4);
7ea239d9e6d699 Pierre Ossman      2006-12-31   97  		card->cid.fwrev		= UNSTUFF_BITS(resp, 40, 4);
7ea239d9e6d699 Pierre Ossman      2006-12-31   98  		card->cid.serial	= UNSTUFF_BITS(resp, 16, 24);
7ea239d9e6d699 Pierre Ossman      2006-12-31   99  		card->cid.month		= UNSTUFF_BITS(resp, 12, 4);
7ea239d9e6d699 Pierre Ossman      2006-12-31  100  		card->cid.year		= UNSTUFF_BITS(resp, 8, 4) + 1997;
7ea239d9e6d699 Pierre Ossman      2006-12-31  101  		break;
7ea239d9e6d699 Pierre Ossman      2006-12-31  102  
7ea239d9e6d699 Pierre Ossman      2006-12-31  103  	case 2: /* MMC v2.0 - v2.2 */
7ea239d9e6d699 Pierre Ossman      2006-12-31  104  	case 3: /* MMC v3.1 - v3.3 */
7ea239d9e6d699 Pierre Ossman      2006-12-31  105  	case 4: /* MMC v4 */
7ea239d9e6d699 Pierre Ossman      2006-12-31  106  		card->cid.manfid	= UNSTUFF_BITS(resp, 120, 8);
421b605edb1ce6 Dominique Martinet 2023-11-03  107  		card->cid.oemid		= UNSTUFF_BITS(resp, 104, 16);
7ea239d9e6d699 Pierre Ossman      2006-12-31  108  		card->cid.prod_name[0]	= UNSTUFF_BITS(resp, 96, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31  109  		card->cid.prod_name[1]	= UNSTUFF_BITS(resp, 88, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31  110  		card->cid.prod_name[2]	= UNSTUFF_BITS(resp, 80, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31  111  		card->cid.prod_name[3]	= UNSTUFF_BITS(resp, 72, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31  112  		card->cid.prod_name[4]	= UNSTUFF_BITS(resp, 64, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31  113  		card->cid.prod_name[5]	= UNSTUFF_BITS(resp, 56, 8);
51e7e8b632d8e5 Bernie Thompson    2013-02-27  114  		card->cid.prv		= UNSTUFF_BITS(resp, 48, 8);
7ea239d9e6d699 Pierre Ossman      2006-12-31 @115  		card->cid.serial	= UNSTUFF_BITS(resp, 16, 32);
7ea239d9e6d699 Pierre Ossman      2006-12-31  116  		card->cid.month		= UNSTUFF_BITS(resp, 12, 4);
7ea239d9e6d699 Pierre Ossman      2006-12-31  117  		card->cid.year		= UNSTUFF_BITS(resp, 8, 4) + 1997;
7ea239d9e6d699 Pierre Ossman      2006-12-31  118  		break;
7ea239d9e6d699 Pierre Ossman      2006-12-31  119  
7ea239d9e6d699 Pierre Ossman      2006-12-31  120  	default:
a3c76eb9d4a1e6 Girish K S         2011-10-11  121  		pr_err("%s: card has unknown MMCA version %d\n",
7ea239d9e6d699 Pierre Ossman      2006-12-31  122  			mmc_hostname(card->host), card->csd.mmca_vsn);
bd766312618d2e Pierre Ossman      2007-05-01  123  		return -EINVAL;
7ea239d9e6d699 Pierre Ossman      2006-12-31  124  	}
bd766312618d2e Pierre Ossman      2007-05-01  125  
bd766312618d2e Pierre Ossman      2007-05-01  126  	return 0;
7ea239d9e6d699 Pierre Ossman      2006-12-31  127  }
7ea239d9e6d699 Pierre Ossman      2006-12-31  128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
