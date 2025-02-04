Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8314A4F0;
	Tue,  4 Feb 2025 11:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738668762; cv=none; b=XgADWhjvWXh0ay7h1q0ql91FDAObcQwuu6qg1P8PWdZvpuA2j98RdteVZyrEGe2NTrH/xw5UYeMfYdh/h38BliZsc3LRnnhUGklRT+B2WM+FvT54dUR8vR39FTD/ON6ebyNrWbDkinkgHWtjed7c3zuGri7a9xCdyNSMuq3eZMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738668762; c=relaxed/simple;
	bh=XVe/wUUtmEkQzytBqE87qBgcOjGL2ZU+jr5E1or4Ce8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBrsriUIi+wAV07VZ4tH9denj7hjUrrKVBbMZ4KnJnnfkzKTy8dpPvx3SKoLgfN1MEE0HwdqqbglzK7Uo563Gu3yQMq1l6rLTYlb6XlWa/l7f2AL1RadrUIEs8L2qohVUHzC01PwPaCR61Esxr073G/aKT+R0Ngq+wmzJwipgUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=XhN2dlsr; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XhN2dlsr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m8zJGL5bTarexS3IdALK/2AvnwvmFt40SI1OSwoDu6A=; b=XhN2dlsrVZFXp6JdkbScItjMdA
	06fUWpnG9d9k8CP56dwEHu4MQ7CMfR9SvJ+Aeqp7p6z/OSk/mfyFBnr81YM5oFol0zjJD9iAg0lfj
	USfmesboTXj556z76J/Z33fdykkKVjU/cny3aapWzx2zVC2iz8/4qOMKYvAbqLlp5Oa/hckTLzH99
	HGMB+UE8zk8hKBC83MPIVpWApvpRUZZlvMFXfqV7uvURMadn/03wE45uL3clKF5mHtshxuHl3PQ+V
	O38m+RKriQID6fk25JV+EGnozugiOhuzCnaKJMOSO0/vdHID+0VkewbkVVCL6t2tUfbWJDPn+N9uV
	aJI0xVkw==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfHAQ-00000002dU4-3M6D;
	Tue, 04 Feb 2025 11:32:34 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 405673002CE; Tue,  4 Feb 2025 12:32:34 +0100 (CET)
Date: Tue, 4 Feb 2025 12:32:34 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vincent.guittot@linaro.org
Subject: Re: [PATCH] sched: Fix static declaration of 'sched_clock_irqtime'
 follows non-static declaration
Message-ID: <20250204113234.GG14028@noisy.programming.kicks-ass.net>
References: <202502012207.b8iyB4Fh-lkp@intel.com>
 <20250204084915.4887-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204084915.4887-1-laoar.shao@gmail.com>

On Tue, Feb 04, 2025 at 04:49:15PM +0800, Yafang Shao wrote:
> kernel test robot reported the following error:
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/build_policy.c:59:
> >> kernel/sched/cputime.c:25:12: error: static declaration of 'sched_clock_irqtime' follows non-static declaration
>       25 | static int sched_clock_irqtime;
>          |            ^
>    kernel/sched/sched.h:3262:12: note: previous declaration is here
>     3262 | extern int sched_clock_irqtime;
>          |            ^
>    1 error generated.
> 
> vim +/sched_clock_irqtime +25 kernel/sched/cputime.c
> 
>     24
>   > 25	static int sched_clock_irqtime;
>     26
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502012207.b8iyB4Fh-lkp@intel.com/
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>

Once the build robot complained I dropped the patch. This don't apply to
anything.
