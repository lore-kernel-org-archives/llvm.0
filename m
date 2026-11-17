Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794875962;
	b=P+dzx5FKMCQMb4illLNn53VQWCUIyoc3cy6XgPXMAHd4jmoHBGAsKzrw80y5UjszhlCw
	 GEfQEjW+tpg0Dahu4fDdjJBQHotttuiuk43QhyJeA6hyX6SPYrlvezB6Ry3cy+MuqbkA1
	 XuRU7Q4yqGGu+Xfu/CJyrJ8M9mnCe6pYzGzPftUjVxCq7cxvw7cgjkVga/A8xA3aRQpGV
	 YyTo7rNoch33rmFnW1jl71H+kV7FL/6Q6UUtArtwYQGooJBGMHFGb5bZUHDlSojIqE14v
	 dr73zi7tkPrAh7rMSer6NVvfswPQG85CIy77+ZQ6/pZOl+cv4R2G2+EyRWLIeHYLcCw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794875962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
	b=Y9iC2WB9r2uEUOX5KxgROrb0TnXE5HDPx7OR31j9CZ5+VXW3bwUDeWK0LLSeS6Q40UZY
	 PZ+F5PEyM2DlXi9yB6oB5pGTDArTwL6A5uJzMhJNrS8nd158KjQGQ7YE9Bgx2h/ovVHm0
	 Zzv5PAXQCkbUD5sLe79TBA33N+QroY2jU65tGz2ehEhwOHlsGdjdK4utwSpS4jqyIlSzL
	 d494fVnyELAA9xZNvA08RZr3Q+gxWcuq2x7ZRrOKGfxI7MoMRG84sFLUq9FSpIP1Arc7Z
	 HiQ65Xbz5+I1fQx7glLyxXDFnikNoV5L5VADQ2Xq4jX0GjJeNK+4kpTcuwrhs2A2mBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kiNEoatP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB7B606A329
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 00:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB7B606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kiNEoatP
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49d64a88222so217482f8f.1
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 16:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794875960; cv=none;
        d=google.com; s=arc-20260327;
        b=YDzHCYQGCcvwCLTCYmb0ja+0dsZpWMpTBdimdw2ZpVyceNRFNaq6smRj/aORSrky5D
         fAwAtpccc5Twg16sbkXe7/x3O8jI2D6RDnMH+yTC7kCn1aseJKN/odGwNon38trpneAd
         YFwZ5ECIqpDavLYkeg95xPR/qCGrdFSv8LDeb0H1q7lMPmu1BXRNcJgqpF/NHkT9PUDV
         RfTLn1chFPybXYHqErcV0bC5h06hwqdGfdRYRMihS5wNPwEB31A3VUx5zpcrteUdftxA
         pR9lWJlYtmF3V3PksjlbEOIhg8c25F8f8KA8w4RgrmH9ZWWLnicUokD+rAGhbBkgvux9
         z/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
        fh=3p2m0bdSTaVRI1VNioMMyfAFqUPsiBTcBmyrmAKIiUk=;
        b=YV8Bg78vASECDa8fom+kLfzvNuqhz3bPXfAtEfIrseCg7GP2KA689BFSFenmlAMRAX
         9Az74mNlhLqFeKSYbETFB5jLHUDeENg2ms2cLyc1cghRu3E42h7v/1pxMKyZmBEgFwr+
         MHYUpArHPjbpnIlwFzwDYOsEs2xQ9wpdWb/tWuMi5N6X6TJ8vRcxopotKDaspPZcTs2u
         sNIEkuuLd5awIj4dRxE5ztY0uC/msmSBmW83FOAqAJJuqFjXCc03Pmm+jaUPwTA6we1+
         H5UDX7cDqBO6EfoNuAyoZHQbjQbn8E6Q2Bixn+1x0DqrTPFU3xs2ddWuKx0Des76bCBy
         ACTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794875960; x=1795480760; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
        b=kiNEoatP8k3LIYLNiqalZsJ7MXatTbaaULNOiqf3E4qSRf5jEkBJCbSJa4m6WWRKXB
         zd0aMEh/PgdE5SIGbTvIXgDsEhqH0mRSC+7v5Y6qLil7ksPP88Nsb1a5NmHscumBnM7N
         geUnYHezEJHEKcYDe8MNq5iHsTAtPSd1MSn5IZRtQ/TMF3VXkj5yxRuuEblF7nL6iT+X
         aM9GRguM9giaZI3k7KGL+yTgIPvjpFC41B+zL/2doGuWTA+Fb+QWDW+4yEuWoZqQySfI
         36aN4vkbIs2hzt3C5sOv7YNdeJ1XzVVcJTkz02gFL8sUazeF5dyRjQi/7v055jt112e4
         crcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794875960; x=1795480760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvgrNno9d5FQQl29xM4deIUmhIQOCFM5isagb92yiBg=;
        b=m3wVMAJLDgWjGS5OvNmAhekDBLNxLIG/ewhk0A0hWyHE35MxLyPFxSm10X2+Ynlb/n
         jg0SC+MqMyZLsgnZ4PXEojkFDN0p2/e3nOlWSUVO2Zh6sQR1iPrsZKndMW4bn30rSzem
         IHq0J88GZNkJX8O2i9N0Mt7qb/wcKQYMoiVLzOttWzOYSEGmsEIly85H1GLBV01nLxQ0
         K0cTRZlFWJxtwWVBfxZm7TXhi+xYza0J7uoOEdus/smpE9UuOLuBYWhI0T5zdLch+Dae
         PQqXOjokrtxLWOLs7JaVB6NeY4oThpWtbEmxS8RcB++JDqUyc9ydrMDypZ3+8G9hJQ8E
         Stsw==
X-Forwarded-Encrypted: i=1; AL+hErETRPp2qRS131pnHW0LhAONiDmVyEt+k6kunEzPZZKZtNzJ4KH2BnFhUaQCc4L9IWhhp+jJ@lists.linux.dev
X-Gm-Message-State: APuU4Z+tZ5JilSc+e8ZMP5XpTj71stz1XlOHGRykUMMkNFzWRjBLvx/U
	ewSO01Dihmn72Sm+3vDBTLTYkxOvQ17h4BogOfJ6yLK56U8yZ7TbMJv8bSgWCwbt7vJQdtFdldR
	aqGVDhybOTSF4DuKlQv7TQuh5w+Bju0LjDLlY5jlE
X-Gm-Gg: AYBFou3Wmg2s5It0fbP57KcBEpltuyflC8y7a6D8Uxe5ZMoQRTAJbZA+p3TCIjidIEq
	uI/L+ngwaRTV3KfB3Nf4W65sUqB2qtfg85Iq05UGt4TeeK70Je5dl97QEA3z0rKQqPhtgAm6kpe
	ChkSCsLkON8JCAby+3MuZgg+THfm7SXHmrBhombBgjtyqQrBJsFSWvsuDRSjjVQ7K0frkLsw+sz
	XE5YLY0ccGbTWD9p3kuDJclUtTuH9/gRcx+5+mTuo5JVWDuJKHEw/NARwGZEbqV6ZtqnE/UNZ4E
	6vD/+hA0a191vhvMgpgHqTpAyL/tdATVFgjHSTSfstT/FMKjFxNiB7iIFhqHdnCbxi914o12h8s
	rVXh7L9vOe5swPlZajg3zhqZgXVzhWYhU99CyF8XJDuMY8+iEk8nhA+RKRB2ikIOewsvYsWkjrl
	gRXOIBd1q+nOpoLeOJOtQBbAHkSwHpZoHspUC3kRQpK+PHKOtSCUH5LRn298SIRGMtlV2/UgBqS
	63CfyVtLuiIfip4sCYsymTvySJDFRJXN5JCXSs=
X-Received: by 2002:a05:600c:4f4f:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4bb7839996emr21077405e9.16.1794875959604; Mon, 16 Nov 2026
 16:39:19 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org>
In-Reply-To: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 16 Nov 2026 16:39:08 -0800
X-Gm-Features: Aa3M54rJVfSiPNSBUbY2jPJp90xuwKIoyFDAlZrLrZLvvd_WyhIWPKbXZui3s68
Message-ID: <CAKwvOdkJzq8V1hO9SCDcANha5Tofk7EKao=c7pMv_LUji9vTJw@mail.gmail.com>
Subject: Re: [PATCH v2] sched/topology: Avoid unsequenced accesses to jiffies
 in sd_init()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 12:55=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> After a recent improvement in clang to warn on unsequenced accesses to
> volatile variables [1], an instance appears in sd_init(), which can
> break the build with CONFIG_WERROR=3Dy / W=3De:
>
>   In file included from kernel/sched/build_utility.c:86:
>   kernel/sched/topology.c:2008:29: error: unsequenced accesses to volatil=
e qualified 'jiffies' [-Werror,-Wunsequenced]
>    1998 |                 .last_balance           =3D jiffies,
>         |                                           ~~~~~~~
>    1999 |                 .balance_interval       =3D sd_weight,
>    2000 |
>    2001 |                 /* 50% success rate */
>    2002 |                 .newidle_call           =3D 512,
>    2003 |                 .newidle_success        =3D 256,
>    2004 |                 .newidle_ratio          =3D 512,
>    2005 |                 .newidle_stamp          =3D now,
>    2006 |
>    2007 |                 .max_newidle_lb_cost    =3D 0,
>    2008 |                 .last_decay_max_lb_cost =3D jiffies,
>         |                                           ^
>
> Per C11 5.1.2.3.2, accessing a volatile object is a side effect. Per C11
> 6.5.2, unsequenced side effects on the same scalar object are undefined
> behavior. Per C11 6.7.9.23, the evaluation of the initialization list
> expressions in a designated initializer is indeterminately sequenced
> relative to each other, meaning any side effects in the initialization
> list are unsequenced.
>
> Add a local variable to hold the value of jiffies before the designated
> initializer so that there are no unsequenced side effects while using a
> consistent value, clearing up the warning.
>
> Cc: stable@vger.kernel.org
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2190
> Fixes: 2b4cfe64dee0 ("sched/numa: Initialize newidle balance stats in sd_=
numa_init()")
> Link: https://github.com/llvm/llvm-project/commit/955715460eaf9188c241c74=
750637fc82dfcc423 [1]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
> Changes in v2:
> - Use a local variable with one access to jiffies before designated
>   initializer (Nick)
> - Link to v1: https://patch.msgid.link/20261114-topology-wunsequenced-v1-=
1-686a36fe61f5@kernel.org
> ---
>  kernel/sched/topology.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 99878da03bce..60fad1690894 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1956,6 +1956,7 @@ sd_init(struct sched_domain_topology_level *tl,
>         int sd_id, sd_weight, sd_flags =3D 0;
>         struct cpumask *sd_span;
>         u64 now =3D sched_clock();
> +       unsigned long j;
>
>         sd_span =3D sched_domain_span(sd);
>         cpumask_and(sd_span, cpu_map, tl->mask(tl, cpu));
> @@ -1973,6 +1974,7 @@ sd_init(struct sched_domain_topology_level *tl,
>  #endif
>         sd_flags |=3D asym_cpu_capacity_classify(sd_span, cpu_map);
>
> +       j =3D jiffies;
>         *sd =3D (struct sched_domain){
>                 .min_interval           =3D sd_weight,
>                 .max_interval           =3D 2*sd_weight,
> @@ -1994,7 +1996,7 @@ sd_init(struct sched_domain_topology_level *tl,
>                                         | sd_flags
>                                         ,
>
> -               .last_balance           =3D jiffies,
> +               .last_balance           =3D j,
>                 .balance_interval       =3D sd_weight,
>
>                 /* 50% success rate */
> @@ -2004,7 +2006,7 @@ sd_init(struct sched_domain_topology_level *tl,
>                 .newidle_stamp          =3D now,
>
>                 .max_newidle_lb_cost    =3D 0,
> -               .last_decay_max_lb_cost =3D jiffies,
> +               .last_decay_max_lb_cost =3D j,
>                 .child                  =3D child,
>                 .name                   =3D tl->name,
>         };
>
> ---
> base-commit: d7e670601af6c564ccf6d3b2ddf70ee4f41a6d1c
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.=
git master
> change-id: 20261114-topology-wunsequenced-18f1d3b9167c
>
> Best regards,
> --
> Cheers,
> Nathan
>


--=20
Thanks,
~Nick Desaulniers
