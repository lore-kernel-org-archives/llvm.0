Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793391724;
	b=rvkpumrMyw45jylh/4pBi5p/BiY9wrmgOQqEHY/UCE5uQlJJPE1mLmYk7g5+NBa46NYK
	 xpX3LgTdWMwzy2X957KlpJLYoC/ZXBl0puUfHda1LWB2BfHVD+nWqzBmPH8BCADDpUy4C
	 vk9r6G+RH7+rrtNjBWJKIni2GXQCN9SqfSaA5RhESM6mUsVThl37+GjbvutXEnKOpOpgT
	 y9a3UJqIFN+ktImSZSY9YJ8JTkmqX869IJVKYgrSboawQ/LbK2BonbMlQZbtsoz6mJiia
	 rBzpFHUB47hBEjkbrgKRX51jqrDQ6cTaB2wvDbUkr6dLFY5iGkF/Yq4Xp27UFnCHqWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793391724;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=/ZKYNvV99olnOAN3/wz742NSCo6uP+fRvmVfRPXXfag=;
	b=kkaMwiTKp3YBJQCfpoJLx9cAgnQtzhPcqTgx+7yjJJstBxgMtFHsoJ9+pmMMf61KOzXh
	 Qgkwu0ATfNn8dGpXTJ2WQ8SliDWLFT1KisdDPMsXf9dRL59clVOoYYvxwziom5zB04owu
	 B37ipmEv5mDWRSRJUDgGtJqXt2lGO3AOhowcFwtyTdHk/2jE0g+viMcmHjahFAcRoz8rg
	 Q1hTa+xj8vo+r6zEKQah5wWNzvd6m6gaXIsagn7VspX8PLFA+XI0bATBwyeA6merRsoFZ
	 C9PL9kWaBZaUdmUM/8BsrQr9x7gwXWNkB4lttCT7NBE5JQAB4bElndHuiztUtwHROeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Rm4/aJkl";
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4EC606A31C;
	Fri, 30 Oct 2026 20:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4EC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Rm4/aJkl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793391723; x=1824927723;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vPSnCcsxmoggsBL8AhqusSxvlXgXWzci4B57bAku3no=;
  b=Rm4/aJklIqaRbvWzOW46M7Bu54lIxabPwXxZF6UiLwikvxhV4zH/46Bw
   sXXmmuOMD3p+NyioeGcIPbMr3ya07ON6cxle9Wbh8EL2Juap3thd0Uocs
   TRj61I++arOY8y5GONegdVB8Rb032tibs81vQi5+jenMxyEw30MqGByjP
   gA5sT+/HbG5V8vqfox6YvtPhckjOiCdOnb1FbHBggUGJh7aULuvU6ILqM
   xAjk/DT/j+q2eMb1BZxYIqIp7o1pQ6x5YDMqQUoer3cuQLMgsqYzUgUQP
   rex16/YqcLXwtPstXsdZhnE8RIpN3nt+0PQ0pDHdttYXaLgrwRyjCe362
   w==;
X-CSE-ConnectionGUID: TOXlS+1/RFGww7C0N2covQ==
X-CSE-MsgGUID: BGBEWVuSR9CacDlGVOJArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2257863"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2257863"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 13:22:02 -0700
X-CSE-ConnectionGUID: uq676+OpSbuSH9Qj21B94w==
X-CSE-MsgGUID: mVKp5fG6TpmsPslS7cKOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="6069808"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2026 13:21:54 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMt6k-00000000cBs-3Ksb;
	Fri, 30 Oct 2026 20:21:50 +0000
Date: Sat, 31 Oct 2026 04:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: hang.suan.wang@altera.com, Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Gabriel Whigham <gabewhigham@gmail.com>,
	Kiryl Shutsemau <kas@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com, chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com, adrian.ho.yin.ng@altera.com
Subject: Re: [PATCH v8 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS
 driver with SDOS feature
Message-ID: <202610310455.KTHdfiRf-lkp@intel.com>
References: <d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang@altera.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang@altera.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20261029]
[cannot apply to v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hang-suan-wang-altera-com/firmware-stratix10-svc-increase-args-array/20261028-221419
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/d2a662d1b783146e48642dc85c920008a02b433c.1793197438.git.hang.suan.wang%40altera.com
patch subject: [PATCH v8 3/3] firmware: socfpga-fcs: add Altera SoCFPGA FCS driver with SDOS feature
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310455.KTHdfiRf-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310455.KTHdfiRf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310455.KTHdfiRf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/firmware/socfpga-fcs-core.c:74 function parameter 'priv' not described in 'fcs_svc_send_sync'
>> Warning: drivers/firmware/socfpga-fcs-core.c:112 function parameter 'priv' not described in 'fcs_svc_send_async'
>> Warning: drivers/firmware/socfpga-fcs-core.c:197 function parameter 'priv' not described in 'fcs_svc_send_request'
>> Warning: drivers/firmware/socfpga-fcs-core.c:282 function parameter 'priv' not described in 'fcs_open_session_locked'
>> Warning: drivers/firmware/socfpga-fcs-core.c:282 function parameter 'owner' not described in 'fcs_open_session_locked'
>> Warning: drivers/firmware/socfpga-fcs-core.c:318 function parameter 'priv' not described in 'fcs_close_session_locked'
>> Warning: drivers/firmware/socfpga-fcs-core.c:353 function parameter 'priv' not described in 'fcs_ctx_begin'
>> Warning: drivers/firmware/socfpga-fcs-core.c:384 function parameter 'priv' not described in 'fcs_ctx_end'
>> Warning: drivers/firmware/socfpga-fcs-core.c:417 function parameter 'priv' not described in 'fcs_get_atf_version'
>> Warning: drivers/firmware/socfpga-fcs-core.c:465 function parameter 'priv' not described in 'fcs_sdos_crypt'
>> Warning: drivers/firmware/socfpga-fcs-core.c:612 function parameter 'priv' not described in 'fcs_read_version_from_atf'
>> Warning: drivers/firmware/socfpga-fcs-core.c:669 bad line: 
   Warning: drivers/firmware/socfpga-fcs-core.c:709 bad line: 
>> Warning: drivers/firmware/socfpga-fcs-core.c:74 function parameter 'priv' not described in 'fcs_svc_send_sync'
>> Warning: drivers/firmware/socfpga-fcs-core.c:112 function parameter 'priv' not described in 'fcs_svc_send_async'
>> Warning: drivers/firmware/socfpga-fcs-core.c:197 function parameter 'priv' not described in 'fcs_svc_send_request'
>> Warning: drivers/firmware/socfpga-fcs-core.c:282 function parameter 'priv' not described in 'fcs_open_session_locked'
>> Warning: drivers/firmware/socfpga-fcs-core.c:282 function parameter 'owner' not described in 'fcs_open_session_locked'
>> Warning: drivers/firmware/socfpga-fcs-core.c:318 function parameter 'priv' not described in 'fcs_close_session_locked'
>> Warning: drivers/firmware/socfpga-fcs-core.c:353 function parameter 'priv' not described in 'fcs_ctx_begin'
>> Warning: drivers/firmware/socfpga-fcs-core.c:384 function parameter 'priv' not described in 'fcs_ctx_end'
   Warning: drivers/firmware/socfpga-fcs-core.c:417 function parameter 'priv' not described in 'fcs_get_atf_version'
   Warning: drivers/firmware/socfpga-fcs-core.c:465 function parameter 'priv' not described in 'fcs_sdos_crypt'
   Warning: drivers/firmware/socfpga-fcs-core.c:612 function parameter 'priv' not described in 'fcs_read_version_from_atf'
   Warning: drivers/firmware/socfpga-fcs-core.c:669 bad line: 
   Warning: drivers/firmware/socfpga-fcs-core.c:709 bad line: 

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
