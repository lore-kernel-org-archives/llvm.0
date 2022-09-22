Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A283C26
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 14:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aBYt055UUb+wOT56a3sdr9XVeyIyRkejUmbCDc/HXxg=; b=DpBfyDE6gE7AgC2KPFHBpJ1mVC
	wZZBmX7IqjyQTk8DC+j36L39onORsqtHEWUdOHVPCXLPMNjg3Zb1qym0yGMmdwj1PcuvR4M0z1lZh
	ZLwt4MW4GR/6STPP/ccvugTnPnhjd6+iCw6Sa4K3u5ffPp6mx1I9FzBn5S47H01iYqT11q8UtDD8b
	CM7dbEKh7VVgbyaSNA6M4xyPZdF/J4ogcXMUh9/8ynakeX3k5lf42XN59FxlHm8tdHvkNOa0DwZfH
	eS5ZzF7HNWhiRXJiO0raB6NiscsZivORxJO1/p2ZcLss5TGAX00xgv93sEmZIL5I2dDd8NVFHhH4T
	YxauYXzg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMx9-00EyWa-5c; Thu, 22 Sep 2022 14:13:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 727FE300169;
	Thu, 22 Sep 2022 16:13:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 598772BBFE78A; Thu, 22 Sep 2022 16:13:22 +0200 (CEST)
Date: Thu, 22 Sep 2022 16:13:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com
Subject: Re: [peterz-queue:sched/idle 45/48] vmlinux.o: warning: objtool:
 enter_s2idle_proper+0x78: call to ct_cpuidle_exit() leaves .noinstr.text
 section
Message-ID: <Yyxtgs/jRYcyH43f@hirez.programming.kicks-ass.net>
References: <202209220456.cXRrGXs7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202209220456.cXRrGXs7-lkp@intel.com>

On Thu, Sep 22, 2022 at 04:34:47AM +0800, kernel test robot wrote:

> >> vmlinux.o: warning: objtool: enter_s2idle_proper+0x78: call to ct_cpuidle_exit() leaves .noinstr.text section
> >> vmlinux.o: warning: objtool: cpuidle_enter_state+0x111: call to ct_cpuidle_exit() leaves .noinstr.text section

include/linux/cpuidle.h:static __always_inline void ct_cpuidle_exit(void)

Dear LLVM folks, ... WTF ?!?
