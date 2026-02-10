Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8533254AC;
	Tue, 10 Feb 2026 18:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770749889; cv=none; b=eBDjbTZxgzajU8r6eSPvnFNgc5jG5nt6jH00HC5RO7t/JXaeYYoWGnEkj8/gYOwOlUI5ePFQ43omqcnY9UO97swOA8v5dvdeXHe9IAzsadI405ARcZ3zIILviI66hBdc8JM7QAGCObPJ+14Puv3Cefai6lj+DPHMt3aOI18WgJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770749889; c=relaxed/simple;
	bh=ndnRyaUEXpAoWZMC4allwdMXxMR/8rO/epz3OUkXb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8zJCe92A6ZyNZbgauneBb32ONwqgNswLHnlEWp2kEjYZFMuclMrANRAJ/JH/vtKOSu7tN5qZj7u2QelkBWY4ji5CXggv9HPLkJ7RE3lHghNRcXoCQdYFEGLW79kcqyeHU8YMq/nWKBW+VyuRIE68NB+vxp41ZiMAWB4Zx3r7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4bEZUYT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4bEZUYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770749887; x=1802285887;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ndnRyaUEXpAoWZMC4allwdMXxMR/8rO/epz3OUkXb0Q=;
  b=f4bEZUYTvfkbGY5bN5wFG9UgIxlJeRrHjtIhp953gFyK0l6WnJQAS8Bf
   Gg5jCj17zzleDNi9haI2bBOmn9e4lloUppqMVeXxXR4WZn8SiEyDtjGzq
   6nDtTdDMqxcRZfuvNznt/ejGctjl1nWPEYNJz4e15It+wImJ3NjHI+LTT
   VPQsXpUI6f8fyxJdsA3l7rEanT8drRV1RtU3GA8Bhs03g5FKoIJkSwle3
   Nllq5bDG9EiJ7jX+lFIBlmFWuFmpUir8zffT8YT8PgpkB7Pmd10D8w32I
   2OhbkB6145Pmyz+vtRTorClblOGhvZ3P9h/ei4FLCoyLmkijPhL6bBcQ9
   Q==;
X-CSE-ConnectionGUID: Pa7IGg3JRmS+YjPqlfYJ0A==
X-CSE-MsgGUID: vGtVhjiHRa64IdITg4MSaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="82618745"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="82618745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 10:57:57 -0800
X-CSE-ConnectionGUID: PtIeTR/jRY+jT+Spna1GSA==
X-CSE-MsgGUID: 3ZsBTh6nQpaAKNUUFYRqfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216538346"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Feb 2026 10:57:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpsvo-00000000pJw-1Mbo;
	Tue, 10 Feb 2026 18:57:52 +0000
Date: Wed, 11 Feb 2026 02:57:03 +0800
From: kernel test robot <lkp@intel.com>
To: Petr Pavlu <petr.pavlu@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Tom Zanussi <zanussi@kernel.org>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH 1/5] tracing: Fix checking of freed trace_event_file for
 hist files
Message-ID: <202602110247.8HeuKXss-lkp@intel.com>
References: <20260210113427.1068932-2-petr.pavlu@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210113427.1068932-2-petr.pavlu@suse.com>

Hi Petr,

kernel test robot noticed the following build errors:

[auto build test ERROR on 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b]

url:    https://github.com/intel-lab-lkp/linux/commits/Petr-Pavlu/tracing-Fix-checking-of-freed-trace_event_file-for-hist-files/20260210-194023
base:   05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
patch link:    https://lore.kernel.org/r/20260210113427.1068932-2-petr.pavlu%40suse.com
patch subject: [PATCH 1/5] tracing: Fix checking of freed trace_event_file for hist files
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260211/202602110247.8HeuKXss-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110247.8HeuKXss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110247.8HeuKXss-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_events.c:1300:2: error: call to undeclared function 'hist_poll_wakeup'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1300 |         hist_poll_wakeup();
         |         ^
   1 error generated.


vim +/hist_poll_wakeup +1300 kernel/trace/trace_events.c

  1289	
  1290	static void remove_event_file_dir(struct trace_event_file *file)
  1291	{
  1292		eventfs_remove_dir(file->ei);
  1293		list_del(&file->list);
  1294		remove_subsystem(file->system);
  1295		free_event_filter(file->filter);
  1296		file->flags |= EVENT_FILE_FL_FREED;
  1297		event_file_put(file);
  1298	
  1299		/* Wake up hist poll waiters to notice the EVENT_FILE_FL_FREED flag. */
> 1300		hist_poll_wakeup();
  1301	}
  1302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
