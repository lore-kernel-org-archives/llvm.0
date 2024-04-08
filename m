Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C602030B
	for <llvm@lists.linux.dev>; Mon,  8 Apr 2024 08:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564381; cv=none; b=R4cxshSuHuZpSr7mbHyqFNVIBZ7vJ4XbfXV9wOO6AAGqJt6vynkToJXEtW2TNDdM2abAsQWeHNWvfxgyeNDFeSvHrq9+pNmmaUpbJlhLffSXuIiE9Su9fJGILA5ddGrfLZCtfDiBRceDcM3qNs9pryqUvfBp1MeFNWjfZ3qGWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564381; c=relaxed/simple;
	bh=3xyKNVnpyx7eTuoCOHoqqHyJSp+D6SnTDkUbYoFulbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DaqyLTzaLakeNNrBQnDbNpGW/6FpT/n1sKylebbrIDmsZVNKf2sopzDRwgc6nyRrQqoQP71IFZ91Zve2xHX4xyZ0lss9GsM/Oa1xsQW/EF301HV5OSLdLJUQHo8zvt2krHWM33p2S2v9Om0SlTx7cP9txCcNP93pObC/2f+GVSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2U1lzly; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2U1lzly"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-479cd0d5df9so1549230137.3
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 01:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712564379; x=1713169179; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AX5+jXHMJTfU3cppVGB1oM10Q5k8KJr3dApT/VnvvYU=;
        b=Q2U1lzlyH7/6vhrlD1ZAPBJrPvKFvLBAuwxfcWdNnh4vEfgwQ2vRgfUz6n5bau7yoS
         32vPz5t5Itf12MNbnVfnFioN1YVn2LQV0OR1huIWnDjcQLmoyYFwVJV79cDnaz8ikVra
         AE+mNMu35UxXjweZftuF0+iXeLQSDgB6/kdEnef8nDh2AlmuIeJL+BqvVcezqptD3i2v
         Fy3wiKOJY9mfMCGcSRq0crfb+dxoHE+FD7hHQ4apW0JQeDNi/A9bfknnswEh1kmadQO7
         1bOam9LbYOLehoZeVgItlLahQ8xnoFgRWLLym0TOeI87MyOv7kab42OqGytMd8h6g1+a
         0TDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564379; x=1713169179;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AX5+jXHMJTfU3cppVGB1oM10Q5k8KJr3dApT/VnvvYU=;
        b=MMQC7gIWTmCMJl4AX59d5hGGyqtKjf5CCj8wvzhPejOziz1SKmM3ieBFBBcACVkVXW
         HZueGGo7GaUaBrXAr4NYzg6kGEUhTw8Vdrfp0hOZQa+dij0znLwzEfFlC0RvLeT0lkRd
         FG0GrdAg2VrEg1LpBMO+fsBYxQ/67OlsmHn3JMI7kB0AiCMj6Tbgp5jDZ9jB2Ig02Sa9
         w30eHA58R162kjHSwHDRY8GJo9ddULnXHXcdzPLWdsV657XeOHRHDQ53y0nRnxSyowtj
         Yrr/3F56GDDq4ROY49mETi03lO1Es+6UKLVw1dLWJNQsl7v1pdKmrBe1DJTJMQKOP9NF
         lYeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwtbCLZh9rjRTl1/5rumqtEKv2Uzuhx8ebYsbIUrYfiMsMh4NIKXdMo+TCeg9wIZ2gecJe/6A4W2GKNl87lVo53IYEgA==
X-Gm-Message-State: AOJu0YyPhAUTQHHh+kdB92JhkOdtTquJOq3qW6eub3fvROzve/85cbUz
	+CRXbc+UezkWulOdPeZJLtc+k88iqXW8gyGzRg9WUPuixLbAEJEPwsVHCp9ctI/JdPPdrijsjKb
	oHUbpc96eFAFvIi0Rxsjg2ANMvEw=
X-Google-Smtp-Source: AGHT+IHwKABiDH+sg4ocAOFV1rysPCy6M6jUel2pd3ftK4+6+b2hwxv91016VKyxPctK/xPT3DR2sG4D7Wn8cgcCrtA=
X-Received: by 2002:a05:6102:32c8:b0:47a:110:143e with SMTP id
 o8-20020a05610232c800b0047a0110143emr1628878vss.6.1712564378854; Mon, 08 Apr
 2024 01:19:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240408080539.14282-1-liuhailong@oppo.com>
In-Reply-To: <20240408080539.14282-1-liuhailong@oppo.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 8 Apr 2024 20:19:26 +1200
Message-ID: <CAGsJ_4y7oGpxrgaWp=0WmG-zdkr2JmqMxnqQdjTsc1Q=5kKdoQ@mail.gmail.com>
Subject: Re: [PATCH] mm: vmscan: do not skip CMA while LRU is full of CMA folios
To: liuhailong@oppo.com
Cc: akpm@linux-foundation.org, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, surenb@google.com, zhaoyang.huang@unisoc.com, 
	quic_charante@quicinc.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 8, 2024 at 8:06=E2=80=AFPM <liuhailong@oppo.com> wrote:
>
> From: liuhailong <liuhailong@oppo.com>
>
> If the allocation flag isn't movable, commit 5da226dbfce3 ("mm:
> skip CMA pages when they are not available") skips CMA during direct
> reclamation. This generally speeds up the reclamation of non-movable
> folios. However, in scenarios with limited system memory and a majority
> of reclaimable folios in LRU being from CMA, this can result in prolonged
> idle loops where the system reclaims nothing but consumes CPU.
>
> I traced the process of a thread entering direct reclamation,
> and printed the relevant information of the sc(scan_control).
> __alloc_pages_direct_reclaim start
> sc->priority:9 sc->nr_skipped_cma:32208  sc->nr_scanned:36  sc->nr_reclai=
med:3
> sc->priority:8 sc->nr_skipped_cma:32199  sc->nr_scanned:69  sc->nr_reclai=
med:3
> sc->priority:7 sc->nr_skipped_cma:198405 sc->nr_scanned:121 sc->nr_reclai=
med:3
> sc->priority:6 sc->nr_skipped_cma:236713 sc->nr_scanned:147 sc->nr_reclai=
med:3
> sc->priority:5 sc->nr_skipped_cma:708209 sc->nr_scanned:379 sc->nr_reclai=
med:3
> sc->priority:4 sc->nr_skipped_cma:785537 sc->nr_scanned:646 sc->nr_reclai=
med:3
> __alloc_pages_direct_reclaim end duration 3356ms
>
> Continuously skipping CMA even when the LRU is filled with CMA
> folios can also result in lmkd failing to terminate processes. The
> duration of psi_memstall (measured from the exit to the entry of
> __alloc_pages_direct_reclaim) becomes excessively long, lasting for
> example a couple of seconds. Consequently, lmkd fails to awaken and
> terminate processes promptly.

If you're planning to send a newer version, it's best to include
the reproducer here.

>
> This patch introduces no_skip_cma and sets it to true when the number of
> skipped CMA folios is excessively high. It offers two benefits: Rather
> than wasting time in idle loops, it's better to assist other threads in
> reclaiming some folios; This shortens the duration of psi_memstall and
> ensures timely activation of lmkd within a few milliseconds.
>
> Signed-off-by: liuhailong <liuhailong@oppo.com>

I believe this patch tackles a niche scenario where CMA is configured
to be large.

Acked-by: Barry Song <baohua@kernel.org>

> ---

This is evidently version 3 of your previous patch titled "[PATCH v2] Rever=
t "
mm: skip CMA pages when they are not available".[1]

It's advisable to provide a brief explanation of the changes made from v2
and include a link to v2 here.

[1] https://lore.kernel.org/linux-mm/CAGsJ_4wD-NiquhnhK_6TGEF4reTGO9pVNGyYB=
nYZ1inVFc40WQ@mail.gmail.com/

>  mm/vmscan.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index fa321c125099..2c74c1c94d88 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -114,6 +114,9 @@ struct scan_control {
>         /* Proactive reclaim invoked by userspace through memory.reclaim =
*/
>         unsigned int proactive:1;
>
> +       /* Can reclaim skip cma pages */
> +       unsigned int no_skip_cma:1;
> +
>         /*
>          * Cgroup memory below memory.low is protected as long as we
>          * don't threaten to OOM. If any cgroup is reclaimed at
> @@ -157,6 +160,9 @@ struct scan_control {
>         /* Number of pages freed so far during a call to shrink_zones() *=
/
>         unsigned long nr_reclaimed;
>
> +       /* Number of cma-pages skipped so far during a call to shrink_zon=
es() */
> +       unsigned long nr_skipped_cma;
> +
>         struct {
>                 unsigned int dirty;
>                 unsigned int unqueued_dirty;
> @@ -1572,9 +1578,13 @@ static __always_inline void update_lru_sizes(struc=
t lruvec *lruvec,
>   */
>  static bool skip_cma(struct folio *folio, struct scan_control *sc)
>  {
> -       return !current_is_kswapd() &&
> +       bool ret =3D !current_is_kswapd() && !sc->no_skip_cma &&
>                         gfp_migratetype(sc->gfp_mask) !=3D MIGRATE_MOVABL=
E &&
>                         folio_migratetype(folio) =3D=3D MIGRATE_CMA;
> +
> +       if (ret)
> +               sc->nr_skipped_cma +=3D folio_nr_pages(folio);
> +       return ret;
>  }
>  #else
>  static bool skip_cma(struct folio *folio, struct scan_control *sc)
> @@ -6188,6 +6198,7 @@ static unsigned long do_try_to_free_pages(struct zo=
nelist *zonelist,
>                         vmpressure_prio(sc->gfp_mask, sc->target_mem_cgro=
up,
>                                         sc->priority);
>                 sc->nr_scanned =3D 0;
> +               sc->nr_skipped_cma =3D 0;
>                 shrink_zones(zonelist, sc);
>
>                 if (sc->nr_reclaimed >=3D sc->nr_to_reclaim)
> @@ -6202,6 +6213,16 @@ static unsigned long do_try_to_free_pages(struct z=
onelist *zonelist,
>                  */
>                 if (sc->priority < DEF_PRIORITY - 2)
>                         sc->may_writepage =3D 1;
> +
> +               /*
> +                * If we're getting trouble reclaiming non-cma pages and
> +                * currently a substantial number of CMA pages on LRU,
> +                * start reclaiming cma pages to alleviate other threads
> +                * and decrease lru size.
> +                */
> +               if (sc->priority < DEF_PRIORITY - 2 &&
> +                   sc->nr_scanned < (sc->nr_skipped_cma >> 3))
> +                       sc->no_skip_cma =3D 1;
>         } while (--sc->priority >=3D 0);
>
>         last_pgdat =3D NULL;
> --
> 2.36.1
>

Thanks
Barry
