Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2FE1C2324;
	Fri,  9 May 2025 07:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774374; cv=none; b=pU/zBp+lCBZ/0NNc64o8ooZRQu+xAw7w1b+uNOJEmsPuP3NOHQXQ2t+BzuW6rJuGR7hg/K+cdX4N9KuhrQDjbYZBTRjqVmp7lmgE7eJDglqdZNnE1E2x+LauZ/Ib5ASJxdqDXwFnHP8uS+94rObJEu4GAW3MGPOP1N3y+fuceME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774374; c=relaxed/simple;
	bh=oku0r/Ayq+YtBcuqgLmPUgKTINLSv48UB3ues+qQLaE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EJfeEwDfVJ2NvRNEhPvBnWWhmn/WOzQl3rbp5cOFOnbw9WyDEfEYm6kNOL9+z2hwkPUGZdfPL2Mj3kyu4XReH9+ToOitrN9rBjHC2JfRAMNB8FJU3NabaK0Ggo6905UB9QRaQX65RWkBD15rzUgrVFZTI2eyzkR5WVExuXn5VT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UzsfT0tl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UzsfT0tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746774372; x=1778310372;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=oku0r/Ayq+YtBcuqgLmPUgKTINLSv48UB3ues+qQLaE=;
  b=UzsfT0tlP/yyqbQmTfw+bjoNpkAcmXPLLn6jgMkhAjmxCnO/b/zzx+5l
   D+2fyBJqWjZw5zPyg6SRy018b/6p25hUOACtXWhmy80yaBusvJoKZ9WOl
   lVQZ6ZVok29KhT7p6RYI3uPIicPbCN+L9e0JXORU8jhR/CuNvQKQ/dlOn
   8CEk/mAbt92i1DPmloy8cyZ+soR7Kzu8cSU+rxYRNHxTZdZBuAxrGxEdH
   dQv5oPfAJCvXPIS8vHSvsyIkmehJkAHCq/c+bT+8uS2NdNZ3x2LupSikh
   pPBq3qTutsHR+0XHYQgmRAPDdSINa3RlNoGTJlPe9XgWS+1wItnlw+czn
   Q==;
X-CSE-ConnectionGUID: KIkA/IdOSbyHP7AlUVqgVw==
X-CSE-MsgGUID: Vi8G9YBsTLuLp8UVqh4ABg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="65996126"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="65996126"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:06:11 -0700
X-CSE-ConnectionGUID: ZOlALN0/Q56SGDAcaUaw2w==
X-CSE-MsgGUID: fsARGzI1TQKg7upLIE8XVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136456946"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.123])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:06:08 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 9 May 2025 10:06:04 +0300 (EEST)
To: kernel test robot <lkp@intel.com>
cc: "Luke D. Jones" <luke@ljones.dev>, llvm@lists.linux.dev, 
    oe-kbuild-all@lists.linux.dev, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, 
    Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [pdx86-platform-drivers-x86:review-ilpo-next 74/89]
 drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type
 'struct acpi_s2idle_dev_ops'
In-Reply-To: <202505090418.DaeaXe4i-lkp@intel.com>
Message-ID: <83e5ee5d-de9d-51c5-457e-803b0b7a57cd@linux.intel.com>
References: <202505090418.DaeaXe4i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 May 2025, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
> head:   83579675331059689e2869bf752ca9e17fadbd82
> commit: feea7bd6b02d43a794e3f065650d89cf8d8e8e59 [74/89] platform/x86: asus-wmi: Refactor Ally suspend/resume
> config: x86_64-buildonly-randconfig-004-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090418.DaeaXe4i-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505090418.DaeaXe4i-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/platform/x86/asus-wmi.c:5028:35: error: variable has incomplete type 'struct acpi_s2idle_dev_ops'
>     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
>          |                                   ^
>    drivers/platform/x86/asus-wmi.c:5028:15: note: forward declaration of 'struct acpi_s2idle_dev_ops'
>     5028 | static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
>          |               ^
> >> drivers/platform/x86/asus-wmi.c:5063:8: error: call to undeclared function 'acpi_register_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     5063 |         ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
>          |               ^
> >> drivers/platform/x86/asus-wmi.c:5099:2: error: call to undeclared function 'acpi_unregister_lps0_dev'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     5099 |         acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);
>          |         ^
>    3 errors generated.
> 
> 
> vim +5028 drivers/platform/x86/asus-wmi.c
> 
>   5026	
>   5027	/* Use only for Ally devices due to the wake_on_ac */
> > 5028	static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
>   5029		.restore = asus_ally_s2idle_restore,
>   5030	};
>   5031	

> > 5063		ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);

> > 5099		acpi_unregister_lps0_dev(&asus_ally_s2idle_dev_ops);

Hi Luke,

It seems CONFIG_SUSPEND is not defined in this config leading to the 
failure. Can you please look at this as I was slight unsure what way the 
fix should go although it looked like some ifdeffery is necessary and 
probably wrapping those register/unregister functions.

-- 
 i.

