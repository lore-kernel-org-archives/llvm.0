Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A146B1EB5F8;
	Fri, 20 Feb 2026 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771616926; cv=none; b=MScx1uSodZmyyOSjV+hqr8Q96pky5beBo1uVVc2EcfO1UCP8/a3pAJ51/XBu/BvPIs0Pl7MGbE1XGKg7PlR0WlVl28hcEYcn8a/WR+HhOpQVSWqNTMLGOEVKEfidfqc/yOCa11S+P3fnFCOja1clrIYxpayUJBlnR2Qw+E42QqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771616926; c=relaxed/simple;
	bh=FqLwlZv5T4PcU5Lx38wjyY1+MPk+2MDQishNCUj+ZJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nW8Kn7bT9S5phycF3jfaoF6BJMa6uoY2ubFRpHzsYRqvo391jDA0RJOQVgnHF/eBdDO9OZ/4dGywqVmzdH2VCA0J11A8J7FlQWtjt83OqKLZr/0EqvtOJYKwcMfiRhCFXH2Ecq4u1hTS2emxPnbYCPfaPL/qPGWj1MlgZ4He1q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kN0hsNv8; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kN0hsNv8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bSXrxa/Xe6oP4E0ru+5uQNqaptdqTfvkzoZk1NJOWaQ=; b=kN0hsNv8GILaCmURVoLxT4ioO6
	nQxYpjP+FVr4gZrIVb+FeVx6kTjIMtyM3lMdQicJkfyQeNht6QtAGNMMligT2FoKPKR4aiuQvwPVL
	O9H/vCsQ/coYgAkDx4vsq3lD5exDy5/JRmTyyyb9N1/Vuii926JcL6wIVilBavKpdHGBbYsndJewo
	fV7XAustPskpNMBcUo3UnNjGPPwk/VD8KXkqysECVXZJ8VYOSsWF44cvfrB9dkcRInO//oXb9Rxx6
	N2HAI7y71XT11drpCsexAu9zbN7AvdbA58W/WBEAG3Zom0yUJa0LPK98kz4A/YG5C/dm5bDPR/dAv
	pnHNmEuA==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWUP-0000000A5Wx-32iq;
	Fri, 20 Feb 2026 19:48:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 7C3CF300CDE; Fri, 20 Feb 2026 20:48:36 +0100 (CET)
Date: Fri, 20 Feb 2026 20:48:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sun Jian <sun.jian.kdev@gmail.com>
Cc: mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] sched: rcu: fix rq->{curr,donor} address space
 annotations
Message-ID: <20260220194836.GP1282955@noisy.programming.kicks-ass.net>
References: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>
 <20260220193353.21870-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220193353.21870-1-sun.jian.kdev@gmail.com>

On Sat, Feb 21, 2026 at 03:33:53AM +0800, Sun Jian wrote:
> With CONFIG_SCHED_PROXY_EXEC enabled, struct rq::curr and rq::donor are
> annotated as __rcu. Several call sites access these pointers as plain
> struct task_struct * while holding rq locks, which triggers address
> space warnings from sparse.
> 
> Fix these sites by dereferencing rq->{curr,donor} with
> rcu_dereference_protected() under rq locks and reusing local pointers,
> and by using rcu_access_pointer() for address-only comparisons.
> 
> No functional change intended.
> 
> Build/verify:
>   make -j$(nproc) O=../out/full-clang-x86_64 LLVM=1 kernel/sched/core.o
>   make -j$(nproc) O=../out/full-clang-x86_64 LLVM=1 C=2 CHECK=sparse \
>     kernel/sched/{core,pelt,build_policy}.o
> 
> Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Yeah, lets not do this. It makes the code horrible.
