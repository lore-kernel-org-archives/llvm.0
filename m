Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19691B394E;
	Thu, 27 Feb 2025 16:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740674684; cv=none; b=ax4Bwow6NmSubjekwBsZEw1q94wOaWDbFhyqoMmJNd7YtO0RCQ3PHo/8yfYA9TvczykkyBIeqVRT4WgEgDlxxIvzwMMCnAEFtJ9Tlb9naYbfXEMQvtB/LRnq5WXzje3WSFPXIoU6iv0fmMYnjDVtEyV6p75P8xqbjjjPq0pQCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740674684; c=relaxed/simple;
	bh=NSkCFs2BKqIrsD9CtXqHGrUr/LYyPZ+FWDhKBGlbeGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AjP1W/XMMuCn6tg7Umgp6Xa7d4jqamsKh5rLEkdekzVnbdqdhG3mNXApJ8SWd4lRS+/zUV87VXV4/EAFeDziJIwpydweu6UVOuK9tJ0sEiOhY++348FxUlDtPc3m8yQ8yws3AMdqFNlV9Byw00tEbpopvSgTVw0NaSE1SD5R0UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A60FC4CEDD;
	Thu, 27 Feb 2025 16:44:42 +0000 (UTC)
Date: Thu, 27 Feb 2025 11:45:25 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] ftrace: Add arguments to function tracer
Message-ID: <20250227114525.732b6124@gandalf.local.home>
In-Reply-To: <202502280024.KCZLllFN-lkp@intel.com>
References: <20250225222654.069143074@goodmis.org>
	<202502280024.KCZLllFN-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 28 Feb 2025 00:32:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Steven,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.14-rc4 next-20250227]
> [cannot apply to trace/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Add-print_function_args/20250226-063252
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250225222654.069143074%40goodmis.org
> patch subject: [PATCH v3 4/4] ftrace: Add arguments to function tracer
> config: i386-randconfig-002-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280024.KCZLllFN-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280024.KCZLllFN-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502280024.KCZLllFN-lkp@intel.com/

Yep, my tests found this, and one more bug that this patch series has.

I'll expect a report on that third bug from you too ;-)

-- Steve
