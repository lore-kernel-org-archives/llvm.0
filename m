Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90A12641C6;
	Thu, 26 Jun 2025 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750975194; cv=none; b=UAkV0TdQvud5VPq2BddgzXcHT+mpaUybn1Xmo5USLLaScGTG259x080dDF6PhlAD0YOBgFGG8uV3XYfQG31B5XakBG/7Xh4/qf4H784iPQJO0v44OzLn1dAZ+eYPBkh/uEUQwbywPaPPx7aCBLpMRbyeg6F/3Gw0rX29QfS7K/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750975194; c=relaxed/simple;
	bh=XRYbfqsJ7qnAoaJH3rM4gNchk8PQWuZdiZsxvD9nwMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwNwASFRFUjwDg8/ccJaKrt/DyCTCKAxK+UNTnXkFbtiRIC2OAVQ48S7dPauiuEuuEal927EDvXJ3+Z4wBmfQ/iYkvXSdZubfKxgP09gSlmG4x5vqdqnF8R3EIALUt0xL+41gWOltoGmZuKAWBFBdf0pTq10cEFryuwbj12GmHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQaeOtW6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQaeOtW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750975192; x=1782511192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XRYbfqsJ7qnAoaJH3rM4gNchk8PQWuZdiZsxvD9nwMk=;
  b=QQaeOtW6XMt1ZGKUzJ8bR2Nde+7DlHB2l2gfVoFYsxJJtdeL3Bo392RE
   sO7QGUxfthdn/kxQxCCSjAAI6v4/Qow88pF/Z7XpqJNhCkT3wgFJIfNK1
   CmMUeLS7SObqhCIOYZXu+Jlyk83Q7y5ZC2UGt2OaIvVr5DC8g1Cicx+1N
   OsDhYcDOYCtuyU0Rj/ROKlGa3dL5E6Qw8IC0N0m0vIkUoYkgOpWXAfVvH
   Y3ooJntBZDsO/oMraEZMqJ98tlOW2PRNYke8fy6pNYkIC9HMGcTvz8Oy8
   vueDb1JdfBz7LIErgZ5u2Lrh8hJrMKjGu8XJft5hzbUJig3rJafhqMEuv
   w==;
X-CSE-ConnectionGUID: S8TFEjByTqajbYk5cIVmdA==
X-CSE-MsgGUID: H0RkA2fUSOSXEMkKmxC/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="70857112"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="70857112"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 14:59:52 -0700
X-CSE-ConnectionGUID: hKgrfqXsRJm1+phCqfbyWQ==
X-CSE-MsgGUID: D64mJ5WsTAW3TZ804zNVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="153153202"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Jun 2025 14:59:50 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUudI-000VZ8-1T;
	Thu, 26 Jun 2025 21:59:48 +0000
Date: Fri, 27 Jun 2025 05:59:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] tpm: Cleanup class for tpm_buf
Message-ID: <202506270544.5uEqUaOS-lkp@intel.com>
References: <20250626101935.1007898-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626101935.1007898-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.16-rc3 next-20250626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-Cleanup-class-for-tpm_buf/20250626-182148
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20250626101935.1007898-1-jarkko%40kernel.org
patch subject: [PATCH v2] tpm: Cleanup class for tpm_buf
config: arm64-randconfig-001-20250627 (https://download.01.org/0day-ci/archive/20250627/202506270544.5uEqUaOS-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506270544.5uEqUaOS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506270544.5uEqUaOS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm1-cmd.c:21:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm1-cmd.c:326:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     326 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm1-cmd.c:465:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     465 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm1-cmd.c:483:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     483 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm1-cmd.c:530:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     530 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm1-cmd.c:581:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     581 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm1-cmd.c:612:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     612 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm1-cmd.c:733:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     733 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   8 warnings generated.
--
   In file included from drivers/char/tpm/tpm2-space.c:16:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-space.c:74:22: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
      74 |         CLASS_TPM_BUF(tbuf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-space.c:123:22: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     123 |         CLASS_TPM_BUF(tbuf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   3 warnings generated.
--
   In file included from drivers/char/tpm/tpm2-cmd.c:14:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm2-cmd.c:168:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     168 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:235:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     235 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:293:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     293 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:368:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     368 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:405:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     405 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:447:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     447 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:472:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     472 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:508:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     508 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:564:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     564 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:637:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     637 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   drivers/char/tpm/tpm2-cmd.c:712:21: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
     712 |         CLASS_TPM_BUF(buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   12 warnings generated.
--
   In file included from drivers/char/tpm/tpm-sysfs.c:16:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
     167 |         int mapping_size;
         |             ^
>> drivers/char/tpm/tpm-sysfs.c:35:25: warning: implicit conversion from 'unsigned long' to 'u16' (aka 'unsigned short') changes value from 65536 to 0 [-Wconstant-conversion]
      35 |         CLASS_TPM_BUF(tpm_buf, PAGE_SIZE);
         |         ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/vdso/page.h:15:30: note: expanded from macro 'PAGE_SIZE'
      15 | #define PAGE_SIZE       (_AC(1,UL) << CONFIG_PAGE_SHIFT)
         |                                    ^
   include/linux/tpm.h:430:54: note: expanded from macro 'CLASS_TPM_BUF'
     430 | #define CLASS_TPM_BUF(buf, size) CLASS(tpm_buf, buf)(size)
         |                                  ~~~~~~~~~~~~~~~~~~~ ^~~~
   2 warnings generated.


vim +326 drivers/char/tpm/tpm1-cmd.c

   313	
   314	/**
   315	 * tpm1_startup() - turn on the TPM
   316	 * @chip: TPM chip to use
   317	 *
   318	 * Normally the firmware should start the TPM. This function is provided as a
   319	 * workaround if this does not happen. A legal case for this could be for
   320	 * example when a TPM emulator is used.
   321	 *
   322	 * Return: same as tpm_transmit_cmd()
   323	 */
   324	static int tpm1_startup(struct tpm_chip *chip)
   325	{
 > 326		CLASS_TPM_BUF(buf, PAGE_SIZE);
   327		int rc;
   328	
   329		if (!buf)
   330			return -ENOMEM;
   331	
   332		dev_info(&chip->dev, "starting up the TPM manually\n");
   333	
   334		tpm_buf_reset(buf, TPM_TAG_RQU_COMMAND, TPM_ORD_STARTUP);
   335		tpm_buf_append_u16(buf, TPM_ST_CLEAR);
   336	
   337		rc = tpm_transmit_cmd(chip, buf, 0, "attempting to start the TPM");
   338		return rc;
   339	}
   340	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
