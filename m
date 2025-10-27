Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C92C08BA
	for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 11:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761563774; cv=none; b=WBlg6zSnEofBPXzI/rhSMbMvYcQDMa3yeCpOSU1UkVml5eQtZY3hpa/y5cDLuHg2SbeXGvHtDszDZYAGNhD6ouocZ3rvItWqtpuZeZQ3b8iY/fhVZXa68X0Powd1lJj9ndNFP2SVDH8zzWj1GSxczAX/drJlE0+KPvLdkhJVz5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761563774; c=relaxed/simple;
	bh=LB1x7BTh2A7aT4Ar9EAQILXWwWs6rqT8BpARa22vuVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDguCr2u25BK24DE/WEAYQVO2rLyn9psPavrsgPkDAfbaLQHiBr9fPQOzMwv0Hh5tJJAh8frbuMPZD5oylX+N38qZOjoC5i+R1uVqyP4rOh400FUFkuGGv4abl9DGN37hfPnA3+2ENAyzFdm38SdZJMAqQOs/ldCQRK1OUzyo2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=PDaj0ngb; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="PDaj0ngb"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3284275b3a.2
        for <llvm@lists.linux.dev>; Mon, 27 Oct 2025 04:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1761563771; x=1762168571; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2EuCROQjNcUGO3SGHRGo+0eYSMk802EES6aqkHgOAUk=;
        b=PDaj0ngbMjM2qXKWF6Nr2xj5iZafBV3AQW/Lt0R2mLC6Kk8KJv5/KzXU1mjXOu/isD
         ZMvhPP1B1LgbbjCh+pEStnM++OlDAq5gzZ8Cv7qEElunG64Rylwyq6S6UbmDZxszXIkE
         MbEZSTITgG+CTdmklvUObqUUtam2r4SKIGhXQMx+jzpsj3TosBXqNanr/h4vyDLPomVh
         FxH+wCw5AHC8vRj52QGqMM3lsWzMv5epuAD1ZGrwuZmN853MBfK/RPEMzayZjKAIDJOn
         SASVvp7FAWt/6RLhOTMouPOPvXnrU5F2TvsAm3wA0vGX84bOEUzXls3p9OBPA/hFKThp
         wlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563771; x=1762168571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EuCROQjNcUGO3SGHRGo+0eYSMk802EES6aqkHgOAUk=;
        b=rJ01ZPwXOKByPeob9JyZMm8PbXPCfaiIrKHEB+wznMlzn2okYMviW84DeY8O9CHNNv
         yq7cbMsZLWjJUjavcZn6+HKanCBjKoCuITq4JBaObppz/hDxLzKhYaD+eva/juxkwKGB
         YwCrZePCW/zRT8Qkh/nxTEsDnLnThT+mNtb/otQKbBR5gobySJ2IJmdcK+6oUS+Qbj/8
         KV88TpZ7YtQJ7MO0hDN1nXCxW6wKdSEQihtH8Hk4+8xnw48IyYLxUG3NGOuc0fLLAgdK
         tFAMMRfU3rt6nJTHWd9/sjWAMgvy0j/u8+UUY0I4aoDDfo6sH5+lQDj1k44VQpOGT2Qc
         ziLw==
X-Forwarded-Encrypted: i=1; AJvYcCXnwViicrFvze/zUfaLoSI5+7JzZZWHbZotKBMy9E4/uz8qny1Uhu3UehO7Bs/v4SBP7ub1@lists.linux.dev
X-Gm-Message-State: AOJu0YwEBSt7udKJ9S5/Q/WK1ZDfa+s2sDzd8gjcqWz2Qeswx2IRMVlR
	xfCle45npr5CIbA3WsVXWL6GcGalN7kyOZ9mRGsLWOKKse2ek5UzQJ7RzE1gpcNAnw==
X-Gm-Gg: ASbGnctbDbZTBi6zXvHLXh9gMA0Vqj46Jep8wpaARAPCI5eiNlpMLjvH04mzH2IEuCO
	nUAVa942shSkvtrpEkQIYx5ELemO2Zw4rzyjk/I1u3e5ZC35aV1JYYqCTX80Brrp59mddbSZHes
	z7CIwm6HU8Au1ItUbIVL+aomYVqB/rHUh4l51Zc2I2/BuLmXGpxXLnoUsGLW2UjKNFJYJ9oqMKv
	VDdFt233luCP5xMIe7J93R9CG4aHWMSam7ZvJ4Rci+ZVbULagxzIUam+bm+GhgZtfV3zsg3fobs
	KZBaQpRf1LqjN+uHko8farSEbFR9deVsj9L4+TAYm2R//alpAj1bn4Sf8tPEtNp8NKih+h+Belq
	NsQUmzkb6bsQHwBPAlBzdvIDZDjkMqs+9LpmJNpRGR7HGFDDXI+f7QuNxtjB6ZH6wPsx+F20qkb
	XAQiaM0MURsj94Kr2nxnN3idAnqIUaRTo=
X-Google-Smtp-Source: AGHT+IHjcNKIqHx7XlVV4F+FWNuGokV68s61fjE1WVvhohLMYjdAGDU/gdAXYEut+xcuQ4GTYWJd+g==
X-Received: by 2002:a05:6a21:32aa:b0:340:e7d3:2f40 with SMTP id adf61e73a8af0-340e7e272bbmr11991133637.25.1761563771317;
        Mon, 27 Oct 2025 04:16:11 -0700 (PDT)
Received: from bytedance ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7d2869sm8127511a91.7.2025.10.27.04.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:16:10 -0700 (PDT)
Date: Mon, 27 Oct 2025 19:15:52 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] sched/fair: Remove dead code which might prevent
 from building
Message-ID: <20251027111552.GA33@bytedance>
References: <20251027100529.1806944-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027100529.1806944-1-andriy.shevchenko@linux.intel.com>

On Mon, Oct 27, 2025 at 11:05:29AM +0100, Andy Shevchenko wrote:
> Clang, in particular, is not happy about dead code:
> 
> kernel/sched/fair.c:5233:19: error: unused function 'cfs_rq_throttled' [-Werror,-Wunused-function]
>  5233 | static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq);
>       |                   ^~~~~~~~~~~~~~~~
> 1 error generated.
> 
> kernel/sched/fair.c:6736:19: error: unused function 'cfs_rq_throttled' [-Werror,-Wunused-function]
>  6736 | static inline int cfs_rq_throttled(struct cfs_rq *cfs_rq)
>       |                   ^~~~~~~~~~~~~~~~
> 1 error generated.
> 
> Remove a leftover from the previous cleanup.
> 
> Fixes: fe8d238e646e ("sched/fair: Propagate load for throttled cfs_rq")
> Fixes: eb962f251fbb ("sched/fair: Task based throttle time accounting")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Aaron Lu <ziqianlu@bytedance.com>

Thanks.
