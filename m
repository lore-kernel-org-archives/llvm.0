Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854213;
	b=cVdOeRYoDwlnQnge3XVtZtJ/E6nMwhntJjydq7wuHDDpy+DfDp9zq0GHjxkP0u01VcyX
	 lyoDke5AVZEexM5nxa8ioFtgQLHyA08nJbX0R9HaXNmmSn56WadnRTC8vALXTLWAsj5U4
	 eSj+ia9VfslmC94rMqmUDVK4Gv5KE1RCCTbvCFw3idHHYpgX8s7w+bpbmWRX/K3uIMNKy
	 7Cd+htRLwW6KGSIB3yx9HLkCWA978fDq9nGwv/zAwpyQROxfV615ub6JgPoyIl9hKTThB
	 0SLPsks1qD6zCVtRnjgJPYIQAvZ1YFuzWp+83QSGkze/HWavPoy6OAzN1GOhXhZi8MA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5vf/mrFyr2K5/oxQ9g09zxEySxJUY4RSC0I96yoXnUc=;
	b=rWjPuL2WOGLsvYNfBFmq+LoV9msheqqQH5PT94sCLSij4a412hwBAXJz5HGJByU4sVDT
	 UMKtWRuYHg0PbWMWIEcqBHwEnbAiqGpSJ1Cqab7Ux6TBwfBbVphdX6ad8/YYxlCItWGBT
	 PuGeA6kTOXy0rhsJ/wpDvrdibw9fK/dngPyF/s6ODX+Sc7QCho/sVdTBXfk7jn4hfacsx
	 Sm5f6fwOr4N02E7HmMCO9i/n3s3+1Y3wdLCk1qz1P1GQmHKf7TzM9vrDAN6PQaXn+RvXx
	 yAD5YhHgJfmpIXL6ROMvWm+cWCJjSs9yyNAAUYGFtXyR1EfL55NZlvl53fGCrTGzzHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OrsSf0Cq;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C8E606A31C
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 18:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OrsSf0Cq
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1529490b3a.1
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 10:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794854212; x=1795459012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vf/mrFyr2K5/oxQ9g09zxEySxJUY4RSC0I96yoXnUc=;
        b=OrsSf0Cqq43pQBnaVX2vO6dHUiUBjgE2ZeT8LACE4D+LYfuHANHJ8+rdEmf/tbbLa+
         s0r/qJGSpLKIxJoTIXJ+0OlJ9n48F00YPsELDgjC6eS9sfzlOV65TmjlLc1oUVJJtGuI
         Crem3favbfz6Z81thyEG9ssGRfa/NqhuGvS2Q2A+8ciubz2HVlWXm8Lz0gKTcY2CJJzb
         o7nx1YyL1P0iMjZFolzv+6NJxne/cF6+6JauUuHDR9X7yWfZv+CpSIsnGPHPcmmG3aOE
         pQJ7cazKCIRGqcw3Tj7SVSg23C48DhME6P2YGewd5THBBSmXW0rBeAZ2p0oUiQWX9Q29
         3wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854212; x=1795459012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vf/mrFyr2K5/oxQ9g09zxEySxJUY4RSC0I96yoXnUc=;
        b=uTDBNg+2Do2213wo8yyDeEnFYu9nWJDbEllnZ0ljjitTqqdkTfWVNAo4r6XIPKCrUm
         gezgwK+6zER7Z2ErKypDQihhsBqStgEJ50VW7T+NuxCgLpGCOdQR6UkLtdr29WyV3NMj
         vcY2NptZDPJJChIA6Qh3HqPXYRU/u8Cn2yQU4bJ+o+n9kWnrYD2UbtBNUjiW6T4vxc78
         cLvbQ3EDQRKmBhoSLXHC0/T5fMC5y4WiOVR/z4VSnGFFDA9odtCBy0iPszeJEVx4aaV7
         Z5lNSRcZr3ojxEDBQ1l3sxiCfz1IMjJeGT3iPRVq3+sFStDnXOkDq9C6dDkID2PXLYO4
         wf9g==
X-Forwarded-Encrypted: i=1; AL+hErGXOheUVAn4S/rP6beCqB/yVtoX2CkTERcftdVJg+zslAfOsAM1dwGuHfwpGmoDsfidlp/C@lists.linux.dev
X-Gm-Message-State: APuU4Z8OV1T4nYelxTE15kd5xgLFo03QHmnr89YCAXX35r2Xqu/pTUFF
	XSTUsMp/lVu3pdieIY5NFIwgd/ODRlq7PlJBiO+Okrhby8rCPYqlTzAFykDUByg+eA==
X-Gm-Gg: AZFdTZf7+SPXDrFOSsn2YK+eGsYr59d/15LtBZgSAiSpOPDi/gMFxviyXoVReARUlMK
	pK4P7zYomZK/LK9FJJrxqtAEDMR7l3KruGleDGgnnCW1AASDydSL3GHvwfeSEQyENIBl2hYUtH+
	vOTDO7WpCGhp8tooJBTJTYPOBQjXx82bJRfsA3qbJ944gmNt2POu5haomvKCeLiHyU1w8dGjw/a
	tX7oKIUBsKfVjVWsQPa9HkvHP+vMRE+fZ3JmaT2Xk6ArZJvpqYc0fLnVH8zLPi5nW+wIgySso2L
	ky8BkusQzeg+SlLPsxojjaDBsP+Bubsg1IHvEpV7V7SQOsYi4nlEDAtG1lEH1PR1XB8hkXFISOk
	2LstCCUf95vIdovB/hq1j6pEXEsOU4QSj7Pi0rDe2lhNZI6XGFu2CEGKVotSvOP76xFsGi0dj52
	XRI/ZFsF39N2BokrT4ojmfz59aL39lwsxGCpwU3Gw/AOZCTVuJKIWzJ5L82i18QYE2eaKFA4h4J
	1d+xEgv1kkJOgChrRlacdcjgABFJS8W1/WOqUB9nD2Fp4JQjxwbrvoM1rf/qydm1UKeOcwjmM5O
	64ccTzlB+c55UlRmbSldTs1kOnMLPy7ht8MUc1mMobkpUSiqBAeMmVUaXtgbWysLTqhlrWelZUM
	xDs24GTEjjHzwJGMPuUsZyBbWnFz9CJ7dJcJQLG9dabFXSaws9sLiC67fJuLKa6LFcaycRhBEJO
	rOqy+4R9XouvI/bUQFPqqke0fq+aVreB+L0Q==
X-Received: by 2002:a17:90a:e550:b0:3b3:a4ef:dcce with SMTP id 98e67ed59e1d1-3b3a4efdd63mr901353a91.24.1794854211639;
        Mon, 16 Nov 2026 10:36:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2e87:6:9050:473d:cdf:7c63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac606d8csm345808a91.16.2026.11.16.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:36:50 -0800 (PST)
Date: Mon, 16 Nov 2026 10:36:45 -0800
From: Nick Desaulniers <ndesaulniers@google.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org
Subject: Re: [PATCH] sched/topology: Avoid unsequenced accesses to jiffies in
 sd_init()
Message-ID: <avtMzjJxIpFWkW-L@google.com>
References: <20261114-topology-wunsequenced-v1-1-686a36fe61f5@kernel.org>
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
In-Reply-To: <20261114-topology-wunsequenced-v1-1-686a36fe61f5@kernel.org>

On Sat, Nov 14, 2026 at 09:19:52PM -0700, Nathan Chancellor wrote:
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in sd_init(), which can
> break the build with CONFIG_WERROR=y / W=e:
> 
>   In file included from kernel/sched/build_utility.c:86:
>   kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatile qualified 'jiffies' [-Werror,-Wunsequenced]
>    1998 |                 .last_balance           = jiffies,
>         |                                           ~~~~~~~
>    1999 |                 .balance_interval       = sd_weight,
>    2000 |
>    2001 |                 /* 50% success rate */
>    2002 |                 .newidle_call           = 512,
>    2003 |                 .newidle_success        = 256,
>    2004 |                 .newidle_ratio          = 512,
>    2005 |                 .newidle_stamp          = now,
>    2006 |
>    2007 |                 .max_newidle_lb_cost    = 0,
>    2008 |                 .last_decay_max_lb_cost = jiffies,
>         |                                           ^
> 
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.7.9.23, the evaluation of the initialization list
> expressions in a designated initializer is indeterminately sequenced
> relative to each other, meaning any side effects in the initialization
> list are unsequenced.
> 
> Move the initialization of these fields outside the designated
> initializer to place sequence points between the accesses to jiffies,
> clearing up the warning.
> 
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2190
> Fixes: 2b4cfe64dee0 ("sched/numa: Initialize newidle balance stats in sd_numa_init()")
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  kernel/sched/topology.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 99878da03bce..f5975079f453 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1994,7 +1994,6 @@ sd_init(struct sched_domain_topology_level *tl,
>  					| sd_flags
>  					,
>  
> -		.last_balance		= jiffies,
>  		.balance_interval	= sd_weight,
>  
>  		/* 50% success rate */
> @@ -2004,10 +2003,11 @@ sd_init(struct sched_domain_topology_level *tl,
>  		.newidle_stamp		= now,
>  
>  		.max_newidle_lb_cost	= 0,
> -		.last_decay_max_lb_cost	= jiffies,
>  		.child			= child,
>  		.name			= tl->name,
>  	};
> +	sd->last_balance = jiffies;
> +	sd->last_decay_max_lb_cost = jiffies;

This pattern is going to wind up with two volatile (expensive) accesses,
(with potentially different values) rather than one access and the same
value by accessing `jiffies` once then storing the result in a temporary
local (before the designated initializer), then using that to initialize
the two fields in the designated initializer.

Example: https://godbolt.org/z/h8bvvKK6j

>  
>  	WARN_ONCE((sd->flags & (SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY)) ==
>  		  (SD_SHARE_CPUCAPACITY | SD_ASYM_CPUCAPACITY),
> 
> ---
> base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261114-topology-wunsequenced-18f1d3b9167c
> 
> Best regards,
> --  
> Cheers,
> Nathan
> 
