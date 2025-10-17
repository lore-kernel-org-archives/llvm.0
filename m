Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A1A288A2;
	Fri, 17 Oct 2025 02:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760667479; cv=none; b=tJ1Dq5EPWHm22lnts+roXOk9Xdq98YvJTSJIbUmB8VG9OU1iJD7sy1TXna1Fa4AXvuaInzMqTbjwrz7TD6goC0bZlME3WE+qeEPFyRSr34X4FaTkJL+3XE0tGZdUR9LFSaRpRXkxR9Xm3Xbz9uP0HqOjdgUx/oOI+VVHPbsuf1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760667479; c=relaxed/simple;
	bh=/Un8LzctEQSHO9DJEZfkZItIz+oWX/DCtNE4h4VMKzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPSZ9oQwKxk7ovvin5Y2ArDhIqzwyLhx/VgmFwVF2zh0f14c04hEvcPsRupieaA89gxxt9mcES91K4mk03/CviLTSsSKo91ICvRDUxn83TA2MWmtChC7WpU/0dv2+O836v5OUy4QCcE4CvQafufokqS8GeT9JEWsKYR7zrf/0Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZsaEeUSv; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZsaEeUSv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760667476; x=1792203476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/Un8LzctEQSHO9DJEZfkZItIz+oWX/DCtNE4h4VMKzc=;
  b=ZsaEeUSvAyBA89cLlf68TvDeuK3swMR4GqBTIMWEIlILIFksXsqroFqj
   HxtMjYdDHDOfAsEdVDtnLm5/xAKmNaO/6B/gwKm8NLg4t+jveHZjVt8Hy
   uaSsJZj54wCISHdtvfnJEUbtwhtTzwaa/yIPMIPSQpdXF/s44R2h7LOIT
   FxoUXta7gjwFBcpIn/QotxmJkZiPVJd2GAIoEezG3hAfsy5W/OxXNdxs1
   of2cCYEhDnjLNrJYCq1qwnlEpvijlyt6GXiSyC+Z0iHqHcoQnB0Cx+CSD
   AK9cDpkkfVUMN1sz5KRwTixGSPYFUmULh2QyCu2hCPOp6hgeQCwk3AP/C
   A==;
X-CSE-ConnectionGUID: 9wP9JyaxQ/6RyXU3r6DvIw==
X-CSE-MsgGUID: +6ANf8/YQ8uUmHJhWZNm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63020181"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="63020181"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 19:17:56 -0700
X-CSE-ConnectionGUID: POrmFGVhRTOOw0UCY3eV/g==
X-CSE-MsgGUID: B05CBBuHS1uXaiyX4dUmtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="182549461"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2025 19:17:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9a2Q-0005Rv-2a;
	Fri, 17 Oct 2025 02:17:50 +0000
Date: Fri, 17 Oct 2025 10:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net,
	Marcos Paulo de Souza <mpdesouza@suse.com>
Subject: Re: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON
 consoles
Message-ID: <202510171023.YREXxhMK-lkp@intel.com>
References: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016-nbcon-kgdboc-v6-5-866aac60a80e@suse.com>

Hi Marcos,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcos-Paulo-de-Souza/printk-nbcon-Export-console_is_usable/20251016-225503
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251016-nbcon-kgdboc-v6-5-866aac60a80e%40suse.com
patch subject: [PATCH v6 5/5] kdb: Adapt kdb_msg_write to work with NBCON consoles
config: i386-buildonly-randconfig-006-20251017 (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171023.YREXxhMK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171023.YREXxhMK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/debug/kdb/kdb_io.c:612:22: error: incompatible pointer types passing 'struct nbcon_write_context *' to parameter of type 'struct console *' [-Werror,-Wincompatible-pointer-types]
     612 |                         nbcon_kdb_release(&wctxt);
         |                                           ^~~~~~
   include/linux/console.h:667:54: note: passing argument to parameter 'con' here
     667 | static inline void nbcon_kdb_release(struct console *con) { }
         |                                                      ^
   1 error generated.


vim +612 kernel/debug/kdb/kdb_io.c

   560	
   561	static void kdb_msg_write(const char *msg, int msg_len)
   562	{
   563		struct console *c;
   564		const char *cp;
   565		int cookie;
   566		int len;
   567	
   568		if (msg_len == 0)
   569			return;
   570	
   571		cp = msg;
   572		len = msg_len;
   573	
   574		while (len--) {
   575			dbg_io_ops->write_char(*cp);
   576			cp++;
   577		}
   578	
   579		/*
   580		 * The console_srcu_read_lock() only provides safe console list
   581		 * traversal. The use of the ->write() callback relies on all other
   582		 * CPUs being stopped at the moment and console drivers being able to
   583		 * handle reentrance when @oops_in_progress is set.
   584		 *
   585		 * There is no guarantee that every console driver can handle
   586		 * reentrance in this way; the developer deploying the debugger
   587		 * is responsible for ensuring that the console drivers they
   588		 * have selected handle reentrance appropriately.
   589		 */
   590		cookie = console_srcu_read_lock();
   591		for_each_console_srcu(c) {
   592			short flags = console_srcu_read_flags(c);
   593	
   594			if (!console_is_usable(c, flags, true))
   595				continue;
   596			if (c == dbg_io_ops->cons)
   597				continue;
   598	
   599			if (flags & CON_NBCON) {
   600				struct nbcon_write_context wctxt = { };
   601	
   602				/*
   603				 * Do not continue if the console is NBCON and the context
   604				 * can't be acquired.
   605				 */
   606				if (!nbcon_kdb_try_acquire(c, &wctxt))
   607					continue;
   608	
   609				nbcon_write_context_set_buf(&wctxt, (char *)msg, msg_len);
   610	
   611				c->write_atomic(c, &wctxt);
 > 612				nbcon_kdb_release(&wctxt);
   613			} else {
   614				/*
   615				 * Set oops_in_progress to encourage the console drivers to
   616				 * disregard their internal spin locks: in the current calling
   617				 * context the risk of deadlock is a bigger problem than risks
   618				 * due to re-entering the console driver. We operate directly on
   619				 * oops_in_progress rather than using bust_spinlocks() because
   620				 * the calls bust_spinlocks() makes on exit are not appropriate
   621				 * for this calling context.
   622				 */
   623				++oops_in_progress;
   624				c->write(c, msg, msg_len);
   625				--oops_in_progress;
   626			}
   627			touch_nmi_watchdog();
   628		}
   629		console_srcu_read_unlock(cookie);
   630	}
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
