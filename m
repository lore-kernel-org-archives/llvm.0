Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED513364A4;
	Thu, 22 Aug 2024 02:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724295223; cv=none; b=d/x9v/vGbt7zoq3mk7hSoNdJe4Uhtm5TYgKlca/GKEP7MH1fhBzh07pM1Eo13hGhbIU8gRuQXqFT9ZpzIgIOsLyAONMqE57u5sy7ZWItp+HEqFZE0wRfAc1rWIx9PLAS9tvxICTGkhWjc6IJdAVsxWwiGAMICGTis0nYVkxpRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724295223; c=relaxed/simple;
	bh=prUZk+u45PePQ7VVy6xXMx0c7BlXLcugMMAUBK+ktlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrW02tblQPX4QuUM/l6l4g2l9Rr4bp6QaABuhGzg9fToMp9S0M8gLeyjq5m/PC+mMwdY0H3txeCB1WtCX3sS8ywVuAo9VCxE0gQhLoHX1gAKrRBHzHzRDj+Ws+fZzpc15xgdBgPS8B9GoPTm8tpfgjfEYOTGtcQo4B3bnrPOHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dF4DfXBN; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dF4DfXBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724295222; x=1755831222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=prUZk+u45PePQ7VVy6xXMx0c7BlXLcugMMAUBK+ktlM=;
  b=dF4DfXBNiBsLwRPAloANfJCDxIJhjcQkg3+rfTzkwzZhT8tJOKbMtrpN
   pfq7i47LFKvizQ9rZSegixsoDxI9tjtyfWwQ+24YEnRsRRREFSwJT/eTA
   4NGCnwwk0LfLI4EUVJ9xm913RkZNVR5gAiN67j3FZM7RWn1WC3R3Zilta
   Wj+zy5UTM/Hc7YEmXv7gmvzVBWI5QPYSmEgP6EvDMIMMovHlr01vTVEBA
   2bzRLOUuse274bxeprlTS5UrQeTKq/u9D411OI1pmF1CSAjBuzzfTlp/H
   7EkFrao2+wm//QXZWYwvG/fYW0/Q2jyvv+FFkCkQ+pJzw1VnuLlBjEcVG
   g==;
X-CSE-ConnectionGUID: og9eI6X/TM2Fs+QoYOSzJA==
X-CSE-MsgGUID: bnRAd/5sRPK4u6WHX237DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33350858"
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="33350858"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 19:53:17 -0700
X-CSE-ConnectionGUID: cVzipAESQiqQA+XMaXvUow==
X-CSE-MsgGUID: iFn+PojRSlG55fD65CliLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,165,1719903600"; 
   d="scan'208";a="61152213"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 21 Aug 2024 19:53:14 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgxwm-000CCJ-04;
	Thu, 22 Aug 2024 02:53:12 +0000
Date: Thu, 22 Aug 2024 10:52:26 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: cs-amp-lib: Ignore empty UEFI calibration entries
Message-ID: <202408221049.NJZYDeE8-lkp@intel.com>
References: <20240821100221.99699-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821100221.99699-1-rf@opensource.cirrus.com>

Hi Richard,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Richard-Fitzgerald/ASoC-cs-amp-lib-Ignore-empty-UEFI-calibration-entries/20240821-192545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240821100221.99699-1-rf%40opensource.cirrus.com
patch subject: [PATCH] ASoC: cs-amp-lib: Ignore empty UEFI calibration entries
config: x86_64-randconfig-004-20240822 (https://download.01.org/0day-ci/archive/20240822/202408221049.NJZYDeE8-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240822/202408221049.NJZYDeE8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408221049.NJZYDeE8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/cs-amp-lib-test.c:224:43: error: subscripted value is not an array, pointer, or vector
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |                               ~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:922:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:758:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:724:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
>> sound/soc/codecs/cs-amp-lib-test.c:224:43: error: subscripted value is not an array, pointer, or vector
     224 |         KUNIT_EXPECT_EQ(test, result_data.calTime[0],
         |                               ~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:922:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:758:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:724:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   sound/soc/codecs/cs-amp-lib-test.c:225:56: error: subscripted value is not an array, pointer, or vector
     225 |                               priv->cal_blob->data[param->amp_index].calTime[0]);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                         ^~~~~
   include/kunit/test.h:922:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                              ^~~~~
   include/kunit/test.h:758:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                               ^~~~~
   include/kunit/test.h:725:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                      ^~~~~
   sound/soc/codecs/cs-amp-lib-test.c:225:56: error: subscripted value is not an array, pointer, or vector
     225 |                               priv->cal_blob->data[param->amp_index].calTime[0]);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                         ^~~~~
   include/kunit/test.h:922:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                              ^~~~~
   include/kunit/test.h:758:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                               ^~~~~
   include/kunit/test.h:725:33: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                                        ^~~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:43: error: subscripted value is not an array, pointer, or vector
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |                               ~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:922:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:758:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:724:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   sound/soc/codecs/cs-amp-lib-test.c:226:43: error: subscripted value is not an array, pointer, or vector
     226 |         KUNIT_EXPECT_EQ(test, result_data.calTime[1],
         |                               ~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:28: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                   ^~~~
   include/kunit/test.h:922:8: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                    ^~~~
   include/kunit/test.h:758:9: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                     ^~~~
   include/kunit/test.h:724:31: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     724 |         const typeof(left) __left = (left);                                    \
         |                                      ^~~~
   sound/soc/codecs/cs-amp-lib-test.c:227:56: error: subscripted value is not an array, pointer, or vector
     227 |                               priv->cal_blob->data[param->amp_index].calTime[1]);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                         ^~~~~
   include/kunit/test.h:922:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                              ^~~~~
   include/kunit/test.h:758:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \
         |                                               ^~~~~
   include/kunit/test.h:725:15: note: expanded from macro 'KUNIT_BASE_BINARY_ASSERTION'
     725 |         const typeof(right) __right = (right);                                 \
         |                      ^~~~~
   sound/soc/codecs/cs-amp-lib-test.c:227:56: error: subscripted value is not an array, pointer, or vector
     227 |                               priv->cal_blob->data[param->amp_index].calTime[1]);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
   include/kunit/test.h:917:34: note: expanded from macro 'KUNIT_EXPECT_EQ'
     917 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |                                         ^~~~~
   include/kunit/test.h:922:18: note: expanded from macro 'KUNIT_EXPECT_EQ_MSG'
     922 |                                    left, ==, right,                            \
         |                                              ^~~~~
   include/kunit/test.h:758:19: note: expanded from macro 'KUNIT_BINARY_INT_ASSERTION'
     758 |                                     left, op, right,                           \


vim +224 sound/soc/codecs/cs-amp-lib-test.c

177862317a98add Richard Fitzgerald 2024-03-04  199  
177862317a98add Richard Fitzgerald 2024-03-04  200  /* Get cal data block for a given amp, matched by target UID. */
177862317a98add Richard Fitzgerald 2024-03-04  201  static void cs_amp_lib_test_get_efi_cal_by_uid_test(struct kunit *test)
177862317a98add Richard Fitzgerald 2024-03-04  202  {
177862317a98add Richard Fitzgerald 2024-03-04  203  	struct cs_amp_lib_test_priv *priv = test->priv;
177862317a98add Richard Fitzgerald 2024-03-04  204  	const struct cs_amp_lib_test_param *param = test->param_value;
177862317a98add Richard Fitzgerald 2024-03-04  205  	struct cirrus_amp_cal_data result_data;
177862317a98add Richard Fitzgerald 2024-03-04  206  	u64 target_uid;
177862317a98add Richard Fitzgerald 2024-03-04  207  	int ret;
177862317a98add Richard Fitzgerald 2024-03-04  208  
177862317a98add Richard Fitzgerald 2024-03-04  209  	cs_amp_lib_test_init_dummy_cal_blob(test, param->num_amps);
177862317a98add Richard Fitzgerald 2024-03-04  210  
177862317a98add Richard Fitzgerald 2024-03-04  211  	/* Redirect calls to get EFI data */
177862317a98add Richard Fitzgerald 2024-03-04  212  	kunit_activate_static_stub(test,
177862317a98add Richard Fitzgerald 2024-03-04  213  				   cs_amp_test_hooks->get_efi_variable,
177862317a98add Richard Fitzgerald 2024-03-04  214  				   cs_amp_lib_test_get_efi_variable);
177862317a98add Richard Fitzgerald 2024-03-04  215  
177862317a98add Richard Fitzgerald 2024-03-04  216  	target_uid = cs_amp_lib_test_get_target_uid(test);
177862317a98add Richard Fitzgerald 2024-03-04  217  	ret = cs_amp_get_efi_calibration_data(&priv->amp_pdev.dev, target_uid, -1, &result_data);
177862317a98add Richard Fitzgerald 2024-03-04  218  	KUNIT_EXPECT_EQ(test, ret, 0);
177862317a98add Richard Fitzgerald 2024-03-04  219  
177862317a98add Richard Fitzgerald 2024-03-04  220  	kunit_deactivate_static_stub(test, cs_amp_test_hooks->get_efi_variable);
177862317a98add Richard Fitzgerald 2024-03-04  221  
177862317a98add Richard Fitzgerald 2024-03-04  222  	KUNIT_EXPECT_EQ(test, result_data.calTarget[0], target_uid & 0xFFFFFFFFULL);
177862317a98add Richard Fitzgerald 2024-03-04  223  	KUNIT_EXPECT_EQ(test, result_data.calTarget[1], target_uid >> 32);
177862317a98add Richard Fitzgerald 2024-03-04 @224  	KUNIT_EXPECT_EQ(test, result_data.calTime[0],
177862317a98add Richard Fitzgerald 2024-03-04  225  			      priv->cal_blob->data[param->amp_index].calTime[0]);
177862317a98add Richard Fitzgerald 2024-03-04  226  	KUNIT_EXPECT_EQ(test, result_data.calTime[1],
177862317a98add Richard Fitzgerald 2024-03-04  227  			      priv->cal_blob->data[param->amp_index].calTime[1]);
177862317a98add Richard Fitzgerald 2024-03-04  228  	KUNIT_EXPECT_EQ(test, result_data.calAmbient,
177862317a98add Richard Fitzgerald 2024-03-04  229  			      priv->cal_blob->data[param->amp_index].calAmbient);
177862317a98add Richard Fitzgerald 2024-03-04  230  	KUNIT_EXPECT_EQ(test, result_data.calStatus,
177862317a98add Richard Fitzgerald 2024-03-04  231  			      priv->cal_blob->data[param->amp_index].calStatus);
177862317a98add Richard Fitzgerald 2024-03-04  232  	KUNIT_EXPECT_EQ(test, result_data.calR,
177862317a98add Richard Fitzgerald 2024-03-04  233  			      priv->cal_blob->data[param->amp_index].calR);
177862317a98add Richard Fitzgerald 2024-03-04  234  }
177862317a98add Richard Fitzgerald 2024-03-04  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
