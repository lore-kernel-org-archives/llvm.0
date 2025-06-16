Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700641A0BF1;
	Mon, 16 Jun 2025 04:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750047986; cv=none; b=QSldnpwxR+2e2FTQqYgSkxOjPRADPKnaCBKysgbcKmGfBLUXjrZ3VN7jlLONm8LqImmlo+LOiuImvoYTEXq1ZoZOwylVtN2/R6ffNfSoJOg72wHaqvUbyEFz5GlAipeH6xjw6Ixk/sjN6Y/wlPILI2J/oyMKHN7Fr+NdLCus594=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750047986; c=relaxed/simple;
	bh=m3S0zSBgDFKKScH5RHAi0V+FAYo9FVJQ4q5+WQzTGBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZfGYIP8Rnx91XTDtUqaG/4pchgKCWImCMHE/ZTR99QJzo+q6zJqdnZLo/pcNRfqPH7Ue2vvFWDwK1xoObgiQC9HiQLxfLGFkub425PxCfg+83YN5cFvdQagJTZy94wL47SJ5TVQvVktMFSOFIX4z/Tri2c3UGdtW3AN2of5oOgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h6vdfh5L; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h6vdfh5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750047985; x=1781583985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m3S0zSBgDFKKScH5RHAi0V+FAYo9FVJQ4q5+WQzTGBk=;
  b=h6vdfh5LCosBGkqcrS8xm7pjF5VF9Vg0nreSrUIfmEMhKIPVMH9fN9s+
   N1w7BuezM+O0uo3H1Nte8iZzVZyIQtoX2X1HuV5mkwtbQ/QWxpuvSYLmS
   TkTnueojWMsMEg+GR3RlLXzl/sv2muOqVLpkw3wQFGI2qIvAusMu9HkFc
   aluumZX1H0zztEryE7cesH/SxVDulNUgo7k5um6/FO8hGhBuYjQd7/1ko
   b/MMaw2RBU+SCSVosjXHQIpocjbA8Sy479Y93RHksfDIQ89p4cjm0xwqt
   pGAGL2tt1gta2nV4NJwQqcbBJPMLMpjVgIh5brFfu4wc2qRZmY4Qg8T9S
   A==;
X-CSE-ConnectionGUID: vAXFzZSWQlS/v9puR7vLJQ==
X-CSE-MsgGUID: DHEOe4jxQyahX5ijaba9+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54800369"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="54800369"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2025 21:26:18 -0700
X-CSE-ConnectionGUID: zylQUKlmThCzhIwHPwYjjg==
X-CSE-MsgGUID: exEdgsBoQpepmT98IkqQIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="149239912"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Jun 2025 21:26:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uR1QB-000Ek0-37;
	Mon, 16 Jun 2025 04:26:11 +0000
Date: Mon, 16 Jun 2025 12:25:29 +0800
From: kernel test robot <lkp@intel.com>
To: Feng Tang <feng.tang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	paulmck@kernel.org, john.ogness@linutronix.de,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: Re: [PATCH V2 3/5] sys_info: add help to translate sys_info string
 to bitmap
Message-ID: <202506161234.wRZSzo5v-lkp@intel.com>
References: <20250616010840.38258-4-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616010840.38258-4-feng.tang@linux.alibaba.com>

Hi Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on akpm-mm/mm-everything linus/master v6.16-rc2 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Tang/panic-clean-up-code-for-console-replay/20250616-091042
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20250616010840.38258-4-feng.tang%40linux.alibaba.com
patch subject: [PATCH V2 3/5] sys_info: add help to translate sys_info string to bitmap
config: x86_64-buildonly-randconfig-001-20250616 (https://download.01.org/0day-ci/archive/20250616/202506161234.wRZSzo5v-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250616/202506161234.wRZSzo5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506161234.wRZSzo5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/sys_info.c:13:19: warning: unused variable 'sys_info_avail' [-Wunused-const-variable]
      13 | static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
         |                   ^~~~~~~~~~~~~~
   1 warning generated.


vim +/sys_info_avail +13 lib/sys_info.c

    12	
  > 13	static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
