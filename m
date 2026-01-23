Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F09292936;
	Fri, 23 Jan 2026 02:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769134377; cv=none; b=mNKtbLBjf3vThb9q8yWjnZCN+Hjl1ir5sdYJSaiPY2v5fzMv7t/OjExf/cdX1jjkyuR9vMccxdjjsu/uOkN1/xvuUI0QKMvI5NBSAglQfWNY3hRi6Y/OBnwWMJqEHYFQraraMLeRpUfBSS6gZFDs0kDd++rhQQ1vTUUwY8lMl+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769134377; c=relaxed/simple;
	bh=lzxjY+Dz1GcflUKh93fa+rrxb0XIDKDZw4CbJH82K88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5JNxNu5UYZ8Em9fwqpndZvESY/5VpCvtUgww28Kh17XMtI+U0JmWzop2eC96/fEdDj4mkkrU4uH5OAPzMCujJlPJkgAnCim39p7pTZlQoQGaCZ5dMDyLrW0bx8y4wPmtjkspZI463OnGP6vLg/S5uMnU3hZDvEwlc3BGCPkdyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsjExc/e; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsjExc/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769134359; x=1800670359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lzxjY+Dz1GcflUKh93fa+rrxb0XIDKDZw4CbJH82K88=;
  b=WsjExc/eih/W4wqGn1GBO6RwBGttaaLeeyKoPMYU/Unq7ArYsyNpxs7i
   QeuFEtD42w66SKF7/S33055S5YjZMDttCRv1If7KpjlzdFNjCFBJzGK/m
   uHUCMBOEJzw1ecFKjRrIIk81cL5xt1yElItIyCEFlVNgwIhgZnZjh5izk
   tOBdP2IPYO4H+eQhF71xf+0gDQnecT5q1EMMC2gzk69jIyEczbAmwog60
   QEt3bTok8hoTs7e9ult3q/c2SHoiuellq0ugYgRM3/CatKJGSzNR37zv4
   lfBMmQYHJOdQzAVa0ZI1ph7ucT+vT/3AxjAt68ReyxIjDwwnbIcKSHF7f
   g==;
X-CSE-ConnectionGUID: KQVqhwjlTTy7FhcGGjurPA==
X-CSE-MsgGUID: i3J4qjVoRiSN2Yg2EM2Xzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81827741"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81827741"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 18:12:32 -0800
X-CSE-ConnectionGUID: pzxDbVSsTvK98R6RE4BGQw==
X-CSE-MsgGUID: M7Lk9k4gQqCvy/DYacrBaA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Jan 2026 18:12:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj6ew-00000000TQq-2OhB;
	Fri, 23 Jan 2026 02:12:26 +0000
Date: Fri, 23 Jan 2026 10:11:33 +0800
From: kernel test robot <lkp@intel.com>
To: Pnina Feder <pnina.feder@mobileye.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, pmladek@suse.com,
	bhe@redhat.com, linux-kernel@vger.kernel.org, lkp@intel.com,
	mgorman@suse.de, mingo@redhat.com, pnina.feder@mobileye.com,
	rostedt@goodmis.org, senozhatsky@chromium.org, tglx@linutronix.de,
	vkondra@mobileye.com
Subject: Re: [PATCH v8] panic: add panic_force_cpu= parameter to redirect
 panic to a specific CPU
Message-ID: <202601231058.Q6hDGfoT-lkp@intel.com>
References: <20260122102457.1154599-1-pnina.feder@mobileye.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122102457.1154599-1-pnina.feder@mobileye.com>

Hi Pnina,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.19-rc6 next-20260122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pnina-Feder/panic-add-panic_force_cpu-parameter-to-redirect-panic-to-a-specific-CPU/20260122-182657
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260122102457.1154599-1-pnina.feder%40mobileye.com
patch subject: [PATCH v8] panic: add panic_force_cpu= parameter to redirect panic to a specific CPU
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260123/202601231058.Q6hDGfoT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601231058.Q6hDGfoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601231058.Q6hDGfoT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/panic.c:79:14: warning: unused variable 'panic_force_buf' [-Wunused-variable]
      79 | static char *panic_force_buf;
         |              ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/panic_force_buf +79 kernel/panic.c

    77	
    78	static int panic_force_cpu = -1;
  > 79	static char *panic_force_buf;
    80	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
