Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80CE21ADC3;
	Tue,  8 Apr 2025 09:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103778; cv=none; b=q/1gb+og7SP1JXXChdy59YJj5IYh0B/og9tB7qVJ1psj3vhSzmX2sk/Bzft3OMP9KvF2fzbTv9GBlQOZJVkm0aXGqQCTmV+jKPIZivHUhLm+04dXOWRbJ22iBTXWlAHkHJFpqD3pZIqT2ILv5yKLutvBqWT7bFLPIljmqlhUsak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103778; c=relaxed/simple;
	bh=5y9ZaIpfhpkEthXHbwVNrs4IpTsNUoJUKgaFWJKOroI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DI8r7G0RXA0WwWSPV2lP/jEfl0gdp7nov6Koy4KGliiwE28QmaS5w7hOdqWDihuCWEOSu/8n4qqFMjq397xgvLvBIm/YmyfGdwvPmOHBOfMi/otlT2BZehjiwXmDIpVtCcnLp28xhgClAsofzqplnUEXz67obIGa/oi/EjLDxC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bc7E13TX; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bc7E13TX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744103777; x=1775639777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5y9ZaIpfhpkEthXHbwVNrs4IpTsNUoJUKgaFWJKOroI=;
  b=Bc7E13TXva6k14Ql/jxTYtBL7/WwL1mRf/ICH/i0vZKWINCP2YZ0Qsnv
   Ulu8/E49095gqx6TDjktbuYo/5t7K0JKST4mc18mHoPwEWEVFW3UK0Y4H
   y0peQes0zjx400awiDlttiBvTHy7Rx2tMOrlEvAMBpB+scXr52wFA+GaW
   E7P7zwX2eRG4KHGfGbkMX7gFSfz2WpfN6fx6bYG6y+z6h8U6+qWApdW8H
   hz3kLoWNHp4sFm188kUHdreBv6o1UYzWuu6RPTtvIXATmORec1mPFYyrE
   3uANAOoCVQ11SxCwVLnds5SEodq4o8RVuJiri4oCK9WlPwNUxNAJJNNUd
   g==;
X-CSE-ConnectionGUID: +UZjVSyeRlGdKRcdELOiyg==
X-CSE-MsgGUID: 7R18LvTnSPmTnIwpxSkvXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45240294"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45240294"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:16:13 -0700
X-CSE-ConnectionGUID: LQH3vnWBT5et0s5O24ouyA==
X-CSE-MsgGUID: fjYef4KtSfK6bs9dEB4pew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="159201563"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2025 02:16:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u253s-0004NM-30;
	Tue, 08 Apr 2025 09:16:04 +0000
Date: Tue, 8 Apr 2025 17:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: Pei Xiao <xiaopei01@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 1423/1936] sound/core/sound_kunit.c:271:31:
 warning: address of array 'card->id' will always evaluate to 'true'
Message-ID: <202504081707.R7V62K13-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7702d0130dc002bab2c3571ddb6ff68f82d99aea
commit: 5108e5eb9e15fce3087555c3b4b7198d41f94575 [1423/1936] ALSA: kunit: fix build warning in test_card_set_id
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504081707.R7V62K13-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081707.R7V62K13-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081707.R7V62K13-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/sound_kunit.c:271:31: warning: address of array 'card->id' will always evaluate to 'true' [-Wpointer-bool-conversion]
     271 |         kunit_info(test, "%s", card->id ? card->id : "(null)");
         |                                ~~~~~~^~ ~
   include/kunit/test.h:616:39: note: expanded from macro 'kunit_info'
     616 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/kunit/test.h:604:21: note: expanded from macro 'kunit_printk'
     604 |                   (test)->name, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/kunit/test.h:597:21: note: expanded from macro 'kunit_log'
     597 |                 printk(lvl fmt, ##__VA_ARGS__);                         \
         |                                   ^~~~~~~~~~~
   include/linux/printk.h:507:60: note: expanded from macro 'printk'
     507 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:479:19: note: expanded from macro 'printk_index_wrap'
     479 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
>> sound/core/sound_kunit.c:271:31: warning: address of array 'card->id' will always evaluate to 'true' [-Wpointer-bool-conversion]
     271 |         kunit_info(test, "%s", card->id ? card->id : "(null)");
         |                                ~~~~~~^~ ~
   include/kunit/test.h:616:39: note: expanded from macro 'kunit_info'
     616 |         kunit_printk(KERN_INFO, test, fmt, ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/kunit/test.h:604:21: note: expanded from macro 'kunit_printk'
     604 |                   (test)->name, ##__VA_ARGS__)
         |                                   ^~~~~~~~~~~
   include/kunit/test.h:599:8: note: expanded from macro 'kunit_log'
     599 |                                  ##__VA_ARGS__);                        \
         |                                    ^~~~~~~~~~~
   2 warnings generated.


vim +271 sound/core/sound_kunit.c

   255	
   256	static void test_card_set_id(struct kunit *test)
   257	{
   258		struct snd_card *card = kunit_kzalloc(test, sizeof(*card), GFP_KERNEL);
   259		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, card);
   260	
   261		snd_card_set_id(card, VALID_NAME);
   262		KUNIT_EXPECT_STREQ(test, card->id, VALID_NAME);
   263	
   264		/* clear the first id character so we can set it again */
   265		card->id[0] = '\0';
   266		snd_card_set_id(card, NAME_W_SPEC_CHARS);
   267		KUNIT_EXPECT_STRNEQ(test, card->id, NAME_W_SPEC_CHARS);
   268	
   269		card->id[0] = '\0';
   270		snd_card_set_id(card, NAME_W_SPACE);
 > 271		kunit_info(test, "%s", card->id ? card->id : "(null)");
   272		KUNIT_EXPECT_STREQ(test, card->id, NAME_W_SPACE_REMOVED);
   273	}
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
