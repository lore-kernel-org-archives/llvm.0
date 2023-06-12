Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB44019BB1
	for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 18:04:16 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-75d4f12d4a3so16131585a.0
        for <llvm@lists.linux.dev>; Mon, 12 Jun 2023 11:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686593055; x=1689185055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=APHh3Nys4coEeSeVUj0oYbJvBI1pNrqCMzlNnyXighg=;
        b=RlK7II8xo4KN6uK+P4qhzADQcHADQU0gppNv539F+MhnKzEzKl8kGFT+Ezt4JxpxNz
         7H/6mXli4RYeNG3JvnaHG+6pEY+/L6AhxTll8ico20yxchoZKOUg1s/qwQHyEtGLYNaO
         CNIbdTO9hw6Mw6K0vzpoGDrUVcJOk6ebSmTL3/UxyfZalzNQPwzXkRbh72etZAQhjUmt
         kKoWtLNSO+hisLiT3gnrY0zT1UN0bfHj8ag59Bdg3pzucOp/IyNtNhAlGiE+1zs0pW1P
         SZQh8VyJa716lOLNnSBr5pFjltIYIowqnN2V9u9zM1TffiEnQ85BHYxD+NJBxpC9ikoN
         ev8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686593055; x=1689185055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APHh3Nys4coEeSeVUj0oYbJvBI1pNrqCMzlNnyXighg=;
        b=DzSgrjhgQY3CMUD2sUbzhccIqjsqhV+bpQwA5OG6PItBzabaIK43Imtl3PignhMmnB
         xsLSw/Nz+LGDtF8kK9EGjlUZFt+dx6Gwx5Lf2VaXFkh8oL8JBr95nauJcTIhVAbq+mRd
         6zaF6W6/JBxKds4RW4LNVLhYhcZQzh4zTIHyAwt8lg0EZb+uUTPMCRule+Mu1nOCXfHW
         Yf9AdeJD1m24Fvmi3tdzHJgDMA2U5IuzWB2puFmFgsMjgGAJEhNYnZFaTYqE8x2/59sj
         Fva7eoyMDCGMYYJI0+wTNT/XYE9Wd0USzWmFHECQzeVPrhWnHypxlULA9ZFHcu5WUbWw
         PhFw==
X-Gm-Message-State: AC+VfDxzWExH5jTsW3BBvOHznH+8uiDrobrPD/GWBUY2UhLc6/HPKljV
	qCT0tg9awi581JgQhIVVdp4=
X-Google-Smtp-Source: ACHHUZ42v1zzemlh5TyqezWxqhKP4+f7W8FTGmdaTJaUQKiluWd5q74RDa+nIJqNqXTIXjd7yh7FEA==
X-Received: by 2002:a05:620a:4bc9:b0:75e:c6e1:3ca9 with SMTP id sw9-20020a05620a4bc900b0075ec6e13ca9mr9030181qkn.43.1686593055236;
        Mon, 12 Jun 2023 11:04:15 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id o8-20020a05620a130800b0075caf18008bsm3010217qkj.116.2023.06.12.11.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 11:04:15 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailauth.nyi.internal (Postfix) with ESMTP id F0CAF27C005B;
	Mon, 12 Jun 2023 14:04:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Mon, 12 Jun 2023 14:04:14 -0400
X-ME-Sender: <xms:G16HZMNVqrczWrJlBmlnmqA_k3VHCkZKlMPdezVbzttdNLWyMeO7AA>
    <xme:G16HZC_STa5f_J1Ybm3vIOtNUX_iLnkPp03GgxwojQJDKxWUBr_Q46NhzKb6vWa5r
    -nornpYBqdvPEKyjA>
X-ME-Received: <xmr:G16HZDQQrZ5x6VPJNoKo17C11asfBTkCA-eOYIgUM-UuAnY6m9Ho6o41wZE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeduhedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleelieevtdeguefhgeeuveei
    udffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:G16HZEsKElmlwO8YuPshs7AS1ebBAVUXDJnxxwDMfVVRxRO3KKyrbw>
    <xmx:G16HZEeIVeVKGtqa1UMPTB_17IzjM2rVfekKaW8Fhyyyk4iJPLKq4A>
    <xmx:G16HZI1sNTLC6pSjNuJVN7hWHveas8tMSgvQ6XiG4SAK3POvuTV5Ng>
    <xmx:HV6HZCDb8rZpMmG2YODQuMZ_Pvj-i2G7rXcV5Kybq1j8UczScNQIKdIYfb0>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jun 2023 14:04:10 -0400 (EDT)
Date: Mon, 12 Jun 2023 11:02:28 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, keescook@chromium.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com,	masahiroy@kernel.org,
 nathan@kernel.org, ndesaulniers@google.com,	nicolas@fjasle.eu,
 catalin.marinas@arm.com, will@kernel.org,	vkoul@kernel.org,
 trix@redhat.com, ojeda@kernel.org,	mingo@redhat.com, longman@redhat.com,
 dennis@kernel.org,	tj@kernel.org, cl@linux.com, acme@kernel.org,
 mark.rutland@arm.com,	alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,	namhyung@kernel.org, irogers@google.com,
 adrian.hunter@intel.com,	juri.lelli@redhat.com,
 vincent.guittot@linaro.org,	dietmar.eggemann@arm.com,
 rostedt@goodmis.org, bsegall@google.com,	mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com,	paulmck@kernel.org,
 frederic@kernel.org, quic_neeraju@quicinc.com,	joel@joelfernandes.org,
 josh@joshtriplett.org,	mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,	rientjes@google.com, vbabka@suse.cz,
 roman.gushchin@linux.dev,	42.hyeyoo@gmail.com, apw@canonical.com,
 joe@perches.com,	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 08/57] sched: Simplify wake_up_if_idle()
Message-ID: <ZIddtMiTj8Kktq1z@boqun-archlinux>
References: <20230612090713.652690195@infradead.org>
 <20230612093537.977924652@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612093537.977924652@infradead.org>

On Mon, Jun 12, 2023 at 11:07:21AM +0200, Peter Zijlstra wrote:
> Use guards to reduce gotos and simplify control flow.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/sched/core.c  |   20 ++++++--------------
>  kernel/sched/sched.h |   15 +++++++++++++++
>  2 files changed, 21 insertions(+), 14 deletions(-)
> 
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -3872,21 +3872,13 @@ static void __ttwu_queue_wakelist(struct
>  void wake_up_if_idle(int cpu)
>  {
>  	struct rq *rq = cpu_rq(cpu);
> -	struct rq_flags rf;
>  
> -	rcu_read_lock();
> -
> -	if (!is_idle_task(rcu_dereference(rq->curr)))
> -		goto out;
> -
> -	rq_lock_irqsave(rq, &rf);
> -	if (is_idle_task(rq->curr))
> -		resched_curr(rq);
> -	/* Else CPU is not idle, do nothing here: */
> -	rq_unlock_irqrestore(rq, &rf);
> -
> -out:
> -	rcu_read_unlock();
> +	guard(rcu)();
> +	if (is_idle_task(rcu_dereference(rq->curr))) {
> +		guard(rq_lock)(rq);

We assume that irq must be disabled when this function called?
Otherwise, I don't understand why this is not

	guard(rq_lock_irqsave)(rq);

?

Regards,
Boqun

> +		if (is_idle_task(rq->curr))
> +			resched_curr(rq);
> +	}
>  }
>  
>  bool cpus_share_cache(int this_cpu, int that_cpu)
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1678,6 +1678,21 @@ rq_unlock(struct rq *rq, struct rq_flags
>  	raw_spin_rq_unlock(rq);
>  }
>  
> +DEFINE_LOCK_GUARD_1(rq_lock, struct rq,
> +		    rq_lock(_T->lock, &_T->rf),
> +		    rq_unlock(_T->lock, &_T->rf),
> +		    struct rq_flags rf)
> +
> +DEFINE_LOCK_GUARD_1(rq_lock_irq, struct rq,
> +		    rq_lock_irq(_T->lock, &_T->rf),
> +		    rq_unlock_irq(_T->lock, &_T->rf),
> +		    struct rq_flags rf)
> +
> +DEFINE_LOCK_GUARD_1(rq_lock_irqsave, struct rq,
> +		    rq_lock_irqsave(_T->lock, &_T->rf),
> +		    rq_unlock_irqrestore(_T->lock, &_T->rf),
> +		    struct rq_flags rf)
> +
>  static inline struct rq *
>  this_rq_lock_irq(struct rq_flags *rf)
>  	__acquires(rq->lock)
> 
> 
