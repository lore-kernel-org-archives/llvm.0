Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C149123CEE5;
	Sat, 26 Jul 2025 10:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753526253; cv=none; b=Z76Kxw8HgItnNv31gW6FrSDjzs8AZZcpNeSO+qDdJAGTkDo6hQwk3k3HDP46h6cv3AOFXPyPFsUI1D9wSZEB7l58ExUvbzwNe/HjrbMfSHZxgh8Gk9gt6FgjLf3tcE7+2CQurkutW2UCQYAWOsBODf7/tUcmTOGnABQ6NaqF5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753526253; c=relaxed/simple;
	bh=vo5MJkjAfYI/OCY1QVvQzWRjvyqTgOOz6i7fhoJvwB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kXOFaonIWe43DsO7nQlkXQfZsFgvcbUT55vfoHZVs7waGbNtkZozNr/BLcXdBWeYkpSs1fezm5jZ71rc4lUh0efygXGtsQkNNb7+UiQxXr+9pBPNVK86iHyGJ5j5DEdKLl63G9LnudQgTpGcnBatTRd7yBKccp0x3XUI1/9jD14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apYSxZPP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apYSxZPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753526252; x=1785062252;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vo5MJkjAfYI/OCY1QVvQzWRjvyqTgOOz6i7fhoJvwB8=;
  b=apYSxZPPs8zsXtoej6Zn668M56Zy/K/J+mmjS3/gnUxIs/vUXzNpfxYS
   qwKcvk8Glu6EOuNwI/fxaTgxL+L5qQFpDE3419L3qEFqLX08d214I79YN
   fQdEk/9BTXSXX3l8UXPdzRahqWgC6CUihcTNJx7SGTzyu8vz6m9WG1fee
   23qd2zMIxtkDtvf2KpeTyTfzlEKOiL3m2ZCpdUWBErSTl8N1pSBuRzaUv
   Lb6aDosPxcjDjI6q4/+tkxKZoerZoWshmcRTzvo0c9Mao9Yv4FQTr2NQM
   Hnh8SstkaypeeMXBhCBbONu8uAKFQiyjW/RjP79aKaWPoHvPuhM0t3fw3
   Q==;
X-CSE-ConnectionGUID: n7689YOpSRqYZ4WLzXKp7g==
X-CSE-MsgGUID: /VFEaxzXQYGWgcVMbs76qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55704399"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55704399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 03:37:31 -0700
X-CSE-ConnectionGUID: ncmExNasR5e06hxL51eTVw==
X-CSE-MsgGUID: qct0OuocQruFVFyGmStVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="161413943"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 26 Jul 2025 03:37:27 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcHM-000Lsr-31;
	Sat, 26 Jul 2025 10:37:24 +0000
Date: Sat, 26 Jul 2025 18:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v5 2/3] tracing: Add a tracepoint verification check at
 build time
Message-ID: <202507261823.mtwUpXNM-lkp@intel.com>
References: <20250725025213.342188378@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725025213.342188378@kernel.org>

Hi Steven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on masahiroy-kbuild/for-next]
[also build test WARNING on masahiroy-kbuild/fixes trace/for-next arnd-asm-generic/master linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/sorttable-Move-ELF-parsing-into-scripts-elf-parse-ch/20250725-105526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
patch link:    https://lore.kernel.org/r/20250725025213.342188378%40kernel.org
patch subject: [PATCH v5 2/3] tracing: Add a tracepoint verification check at build time
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250726/202507261823.mtwUpXNM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261823.mtwUpXNM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261823.mtwUpXNM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> scripts/tracepoint-update.c:106:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     106 |         int count = 0;
         |             ^
   1 warning generated.
--
>> scripts/tracepoint-update.c:106:6: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     106 |         int count = 0;
         |             ^
   1 warning generated.


vim +/count +106 scripts/tracepoint-update.c

   102	
   103	static void check_tracepoints(struct elf_tracepoint *etrace)
   104	{
   105		Elf_Ehdr *ehdr = etrace->ehdr;
 > 106		int count = 0;
   107		int len;
   108	
   109		if (!etrace->array)
   110			return;
   111	
   112		for_each_shdr_str(len, ehdr, tracepoint_data_sec) {
   113			if (!len)
   114				continue;
   115			if (!find_event(str, etrace->array, etrace->count)) {
   116				fprintf(stderr, "warning: tracepoint '%s' is unused.\n", str);
   117			}
   118			count++;
   119		}
   120	
   121		free(etrace->array);
   122	}
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
