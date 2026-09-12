Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7EF3C13E3;
	Sat, 12 Sep 2026 07:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197057; cv=none; b=Oq0vJxpNaRMe156k4wV8qFAsUmOPUjMBrkaT5ekyLnPUc3m4jDR8zfT5qFBRIBgGeucrjbjWpv4cLLDO/eQtCvMa2b0n0WZaS6y1e/IQg04h8JwI7dYpdAfeXheOvtxnTu1yhTeoPnSxA/1Oa+65YuGj58cBy8+wwpSks5REgMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197057; c=relaxed/simple;
	bh=LhMJ5Q0w4AuibpSNNo6FqxPoWu7m2sSZ6Y1XrpudYCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXB269AuUhzMiCGdSUSIpRchj5xLJ+LeTM5rPrA0SYxpR8GOl+d0lVy3A/sU5ox2HLO+6Uns6oLWC2edt0k5reTshQzhGCAytfXxVpF8lAo9kKXmICEhM0LgvSyqE9VvCZvK/tNym8fQB+3Mi/Ct/cCWkjWvVJ49u17/175wRT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lctKHlh6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lctKHlh6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789197055; x=1820733055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LhMJ5Q0w4AuibpSNNo6FqxPoWu7m2sSZ6Y1XrpudYCY=;
  b=lctKHlh6Rs7xmQcbhG4SG0z8zSKxp7trW8+XgGPQVQLSmP2/tcRaQ3uQ
   FEJ/J0/UvQnw7MI/jKEucMdogEYPQJxh3emSmvqQ9QztD65mszhGztIwl
   Zu1M55TXvJyVmRAMi16SNq4xKEheItFGFEB7DAR5TAZLCSU/rnKmvSPAi
   4FsLIDKNlzlHxaTcW5WA57Z1/FhM97OHmd4idw5b8GdntLtE/vxtbOr2L
   6Elm5N5z/1pIfmpBsblNhswQu/+c1hcSn9MPQLRss811zyqTsl8ZBrfSx
   zMMJfeBsoLN6a0ikRH4nTvN0grpgw5IBHDAfN5mOew6eliHj/QpKCgkBz
   w==;
X-CSE-ConnectionGUID: xJ/Go2HuROmlxFIkvmNUAA==
X-CSE-MsgGUID: ro/mEphGQbiDQ4vLiSIn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89776181"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89776181"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 00:10:55 -0700
X-CSE-ConnectionGUID: TvVwvoY2SLedwxS/IybF0A==
X-CSE-MsgGUID: i707yAmbRmycIH45BZOsgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="268439045"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Sep 2026 00:10:52 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Hsv-000000002kF-2Dif;
	Sat, 12 Sep 2026 07:10:49 +0000
Date: Sat, 12 Sep 2026 15:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Zvolsky <matthew-kernel@post.cz>, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matthew Zvolsky <matthew-kernel@post.cz>
Subject: Re: [PATCH] staging: greybus: add missing newlines to sysfs_emit
Message-ID: <202609121559.mKrcvsr6-lkp@intel.com>
References: <20260911190253.894650-1-matthew-kernel@post.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911190253.894650-1-matthew-kernel@post.cz>

Hi Matthew,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Zvolsky/staging-greybus-add-missing-newlines-to-sysfs_emit/20260911-210253
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260911190253.894650-1-matthew-kernel%40post.cz
patch subject: [PATCH] staging: greybus: add missing newlines to sysfs_emit
config: i386-randconfig-014-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121559.mKrcvsr6-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121559.mKrcvsr6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121559.mKrcvsr6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/greybus/audio_manager_module.c:162:3: error: initializer element is not a compile-time constant
     162 |                 name_string,
         |                 ^~~~~~~~~~~
>> drivers/staging/greybus/audio_manager_module.c:180:46: error: passing 'const char *const[7]' to parameter of type 'char **' discards qualifiers in nested pointer types [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     180 |         kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
         |                                                     ^~~~
   include/linux/kobject.h:283:10: note: passing argument to parameter 'envp' here
     283 |                         char *envp[]);
         |                               ^
   2 errors generated.


vim +162 drivers/staging/greybus/audio_manager_module.c

8db00736d365b7 Svetlin Ankov    2016-01-13  151  
8db00736d365b7 Svetlin Ankov    2016-01-13  152  static void send_add_uevent(struct gb_audio_manager_module *module)
8db00736d365b7 Svetlin Ankov    2016-01-13  153  {
8db00736d365b7 Svetlin Ankov    2016-01-13  154  	char name_string[128];
8db00736d365b7 Svetlin Ankov    2016-01-13  155  	char vid_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  156  	char pid_string[64];
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  157  	char intf_id_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  158  	char ip_devices_string[64];
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  159  	char op_devices_string[64];
8db00736d365b7 Svetlin Ankov    2016-01-13  160  
a33c60996e0881 Matthew Zvolsky  2026-09-11  161  	static const char * const envp[] = {
8db00736d365b7 Svetlin Ankov    2016-01-13 @162  		name_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  163  		vid_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  164  		pid_string,
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  165  		intf_id_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  166  		ip_devices_string,
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  167  		op_devices_string,
8db00736d365b7 Svetlin Ankov    2016-01-13  168  		NULL
8db00736d365b7 Svetlin Ankov    2016-01-13  169  	};
8db00736d365b7 Svetlin Ankov    2016-01-13  170  
8db00736d365b7 Svetlin Ankov    2016-01-13  171  	snprintf(name_string, 128, "NAME=%s", module->desc.name);
8db00736d365b7 Svetlin Ankov    2016-01-13  172  	snprintf(vid_string, 64, "VID=%d", module->desc.vid);
8db00736d365b7 Svetlin Ankov    2016-01-13  173  	snprintf(pid_string, 64, "PID=%d", module->desc.pid);
d0af1bd5f6f449 Pankaj Bharadiya 2016-10-16  174  	snprintf(intf_id_string, 64, "INTF_ID=%d", module->desc.intf_id);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  175  	snprintf(ip_devices_string, 64, "I/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  176  		 module->desc.ip_devices);
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  177  	snprintf(op_devices_string, 64, "O/P DEVICES=0x%X",
a9234bfd6cec44 Vaibhav Agarwal  2016-03-30  178  		 module->desc.op_devices);
8db00736d365b7 Svetlin Ankov    2016-01-13  179  
8db00736d365b7 Svetlin Ankov    2016-01-13 @180  	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
8db00736d365b7 Svetlin Ankov    2016-01-13  181  }
8db00736d365b7 Svetlin Ankov    2016-01-13  182  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
