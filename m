Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FAD136A
	for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 19:47:28 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1b3d0b33dc2so16485125ad.0
        for <llvm@lists.linux.dev>; Tue, 13 Jun 2023 12:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686685648; x=1689277648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhOeElaMsiD9GyeVbS/Kz/uOr4hArVsc6evONFkFnM=;
        b=aeMNEMT7mnAhLHospPJ5V6vIYNCAcophNZar1VJgpYHxyFURQMMgUNDfiKxbq31qUx
         /ntMLDU6dIgcpzP5jt5szoYlfgJOQ930p726r6qPC78stOnaYjfEWHjjMU58XMpu3dyx
         I1eRXxTLecm0sTZY+o9wNW2LEqaDO5EnnyJcs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686685648; x=1689277648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WhOeElaMsiD9GyeVbS/Kz/uOr4hArVsc6evONFkFnM=;
        b=GMeVajmPehZ67dVEGrXQwd04FvYeN+ma3uIIVeP3ftMIIyPUGV8zICJ0zSAs+ytjCX
         eIw32FV0p/CO3vivn7p80OjZkDKmm46N6ZBtPcyVb1kuupLSLhyk0w/F42roxz8MOX1h
         Tz1qhW8jCBjeKofMNqZM6U/l/Rw7wyhAcikewVwCtDESGoCA/zoykSYw4Jih//bIr543
         HApSqFUN5WZTupw2ihfOIajLRkPLyGVrTy847hunKZNz/VqJQqDv0rk6Ij3S03vCa0DD
         /cwg5lGO0yervs+OLeSRMHPoS+SzZEnatxoEJuLefPUzzQc0Wu2pS1YYxjl5Olra0r4U
         Dptw==
X-Gm-Message-State: AC+VfDxW8vr2JRI5q+81Sb9pSUVOIz/KG5L+fGVYofXr1rsyW+zpIdb3
	ojUCOgzKVLbspV4g1y82C+QERQ==
X-Google-Smtp-Source: ACHHUZ4wkZtVASMYXX5dMM9DSBV3rPVF6650RBePcMhCjKiUT61w7X++xe3XcHFN8ktb3nqMI7IKLw==
X-Received: by 2002:a17:902:c20d:b0:1b2:4e50:f22e with SMTP id 13-20020a170902c20d00b001b24e50f22emr10107078pll.1.1686685647720;
        Tue, 13 Jun 2023 12:47:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x21-20020a17090300d500b001a221d14179sm10578328plc.302.2023.06.13.12.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 12:47:27 -0700 (PDT)
Date: Tue, 13 Jun 2023 12:47:26 -0700
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: torvalds@linux-foundation.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, masahiroy@kernel.org, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu, catalin.marinas@arm.com,
	will@kernel.org, vkoul@kernel.org, trix@redhat.com,
	ojeda@kernel.org, mingo@redhat.com, longman@redhat.com,
	boqun.feng@gmail.com, dennis@kernel.org, tj@kernel.org,
	cl@linux.com, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	joel@joelfernandes.org, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
	42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	john.johansen@canonical.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
	tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
	luc.vanoostenryck@gmail.com
Subject: Re: [PATCH v3 45/57] perf: Simplify perf_event_parse_addr_filter()
Message-ID: <202306131247.3E617931@keescook>
References: <20230612090713.652690195@infradead.org>
 <20230612093540.779825032@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612093540.779825032@infradead.org>

On Mon, Jun 12, 2023 at 11:07:58AM +0200, Peter Zijlstra wrote:
> XXX this code needs a cleanup

:)

> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/events/core.c |   56 ++++++++++++++++++++-------------------------------
>  1 file changed, 22 insertions(+), 34 deletions(-)
> 
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -10495,6 +10495,8 @@ static void free_filters_list(struct lis
>  	}
>  }
>  
> +DEFINE_FREE(filter_list, struct list_head *, if (_T) free_filters_list(_T))
> +
>  /*
>   * Free existing address filters and optionally install new ones
>   */
> @@ -10658,13 +10660,15 @@ perf_event_parse_addr_filter(struct perf
>  			     struct list_head *filters)
>  {
>  	struct perf_addr_filter *filter = NULL;
> -	char *start, *orig, *filename = NULL;
>  	substring_t args[MAX_OPT_ARGS];
>  	int state = IF_STATE_ACTION, token;
>  	unsigned int kernel = 0;
> -	int ret = -EINVAL;
> +	char *start;
> +	int ret;
>  
> -	orig = fstr = kstrdup(fstr, GFP_KERNEL);
> +	struct list_head *fguard __free(filter_list) = filters;
> +	char *filename __free(kfree) = NULL;
> +	char *orig __free(kfree) = fstr = kstrdup(fstr, GFP_KERNEL);

Ah! I see a kfree users. Sorry for the noise. :)

-- 
Kees Cook
