Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E127344D80
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388740; cv=pass; b=mKcg7E8o5RCwj09LzFd3s94jO77Y17jJsXJFKmDT0MTnrD/kQSCUe0MnwKdjU2iTkwJCsbf9OZ0vu4pXZFMnGE95E1tjvuMtEXKzP+XKfsoOErf+q+VGC7+BfmGhEFoTcw2mdkCC94Gjc/qCtlJCfc3mb41GJmPbZKOpLjhO4D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388740; c=relaxed/simple;
	bh=AFimHUR89DWsvnO4hdzHv2J+fCZfWepLuXruwsP+z4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoghGgKWUnAQy9fWXsQ4Xd4Ajc2zFJLKIbDYFKZ9471rEx998l36hp2d3oaNDiOEVGa1eFrNga1t9Moq56oWCsA4lSnMDz1Xaz+j78Zuo+my1zwppjkv5JJ5gLYsdk0UjOFAhdvSXd4igLVGIz7sPwRyDoUOp4GzsJySV+BsKXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kw7YIvNe; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kw7YIvNe"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3870778358aso15421601fa.1
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 00:58:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773388737; cv=none;
        d=google.com; s=arc-20240605;
        b=VffDtmu4/xMyHJVx1aA27aIwLFigP86nyYgq7bfyZn8lf1RmnNE+lTQdcZyYXKrPFk
         WDI9WMu3W4yYyAPhxpKBW1O3OOqqrzaTNIt9LCYS4Eb7VojAEzPwZMqZtdRL3u724XfH
         WEihnBykQhGnM4DTCd75obZzsLJ/XrowXIZ0KPQyHlqYca1fB1d35KTXqXSodd/W0v75
         vjBrdrxtF3rcgtV6jn2GmM2EuhjcNeFaESxpfI1Xals5H83QkJGJPvG1UPlM7r5TnFdJ
         F/jHjefBb4bwLdNm5OY0uV+6P5zCEdlj6UN8PQJGsGfDtuZoj5P8C+nrb5eBTcAowbnw
         Cevg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GFK6EAH+ms6i66/3ZF2HX4pTmFn69PlN2FhGdPkqRF0=;
        fh=OPlF8O8Shb7fBt6L+jhFcsuVJtky/SjCQN3vG9U1Rp8=;
        b=i4FSQpbBoHjJUtZSWmV2cyXF85s6dKXpKtr2JtiFJUsfNDc7XOuQ6FwWL14/dfy6bZ
         GswiaoSlRb5y+BRHQ0UBe0NQC0dz2YnGfhvPDqmdnIelPnW5Oh0Iv+WDVv0go3bspiOL
         N4qvIYMfRgQz1e+gphpacnfZLoLug/WMEiSfHHVeQRPk8HtJS6a36YR6wVTkEzdTHQcq
         VefJrnrU8zWh85zJBkuynTaD7if/nWhxuuQPi4iTIP9S9uwN9VRFvb5L51gPirXNtIyh
         YIWGse7pK39bReysd/2LvdW/RyFcvixiHLXgvXq9i+3NeUeI00d/xC2EpzmV3zmNF65K
         OH3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773388737; x=1773993537; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GFK6EAH+ms6i66/3ZF2HX4pTmFn69PlN2FhGdPkqRF0=;
        b=kw7YIvNergLJvkIAwolsHQD+zobFsRHUxJuFUVDbO0aE+TbV8uHMXAiGheh8VBCY8s
         1k7iFX/76YVJgBQfyPFhEnKnh4maOxL/ZHCe4gnQfGIt25QRs1PA+Tg0i0IdFbtwjHAE
         E3Gih+Stj1G+HR0K8auGeRg18UmhWGOq1cNgSLb3S52Jon0MP34ueCsva+ZDW1Ur2zA8
         EUXn1XhyoZiVp/PdAPyd20YV4O7bRyX7PXG6MXhymVb714H7rkj3QqkDw8NzBusfsPpV
         bbihOwuPzZ4pDJvHnEulTgqbzWT0BVThX4SAW4CXkHVAKWgDJnCB+21m4cHUtKZxkDvl
         /Xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388737; x=1773993537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFK6EAH+ms6i66/3ZF2HX4pTmFn69PlN2FhGdPkqRF0=;
        b=ejybGlOg4AciqBiTVwNYbQG/oiMpC2EYJjYeadyyWBwK5gLkZCsbP5Fq0tDOox7Bv5
         a0/FX9oayS2f5f7483QDepukyA6E+9A5TZITmI0JXlUYWnETXP+fXXXKnjmSYnWsm/hp
         3qXFCFejoPxSe42mhf0Ye2P8uhpm1gCGAXN5Oyifts064q+dhqvF9qUHSzQ+BkbIrK1S
         gpFNS+CkyBSRBgd6rhxlG5BbmdAceT+vB01yQRwMeRVGTLiV2DFylfCZJnpg0kshnbDo
         IPjzF7nauR5QldP2M2Vs6DcE7ItO2yjm+aLgxnih92pocmzjAl6FSiTyvVgrvfqn/4ks
         Zr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMr+GM8eOM5PaK5KsLbRycLLxvSrE2Ep8l9SGiajLEREMKX7Ks7W3Hf3mZ1dKk8GRsuvTH@lists.linux.dev
X-Gm-Message-State: AOJu0YyhfT+azx57ynPkNSGvIG8AIwEkDbf7xkpFiUkEJp1h20RDSUyG
	OJUl1WuKl/HS0NvkCYKhmCuI5rlUcfegNfWU0srHwSdPZRHwRFIq5q9zJEOScqLEbN8KZkuF/LP
	k7b6UXZ2mZbyRIA+4CGqlgB6M8/loWsrhDV6a3IHa
X-Gm-Gg: ATEYQzzL5iYHUikDzE/tkoYiZ4IaVs6/VUin+V342Ced4lZ4FCC+WujF4D7HVq2L1Y1
	T+78kT4pylau3qng4eo95/He9EIHwyidhowvBfO+lcdGqkPmJVPqtBUzMD05HhdWliVArvu2LEc
	aIACLPVjCI9bCjEio++Lg2BIRdpFm/MzeC3onY4dfslNc77sNiMjH0OTYExooun5wastqn15BoO
	iwcI1uGrOgtQ51gcjB1xoimjbNh92jqqaxW4uWkJEoYVLknj4eOSV3GKe5K1/+fbQ6uYnVW2Ty3
	y2BcWhcB5ouNWsw7JUyH6ivuP3E0dAx0Jug3te3jRGVb1yQ2FBhvefyfn9T8pSO9ukl9aw==
X-Received: by 2002:a2e:b8cf:0:b0:389:ecf8:16ae with SMTP id
 38308e7fff4ca-38a897874a7mr7759601fa.28.1773388736635; Fri, 13 Mar 2026
 00:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com> <20260311-kcov-extrecord-v1-3-68f03c4a05ad@google.com>
In-Reply-To: <20260311-kcov-extrecord-v1-3-68f03c4a05ad@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 13 Mar 2026 08:58:45 +0100
X-Gm-Features: AaiRm51e3lXevaNBVmKrXCOob6z4zewMgvSCJG9hi1kl7Zo7egkEOglbzwS-qKE
Message-ID: <CACT4Y+bRTjPG7pw-k9okGZ=Gv81b+_AgdQcCxWxpF25guYpo=w@mail.gmail.com>
Subject: Re: [PATCH 3/3] kcov: introduce extended PC coverage collection mode
To: Jann Horn <jannh@google.com>, Alexander Potapenko <glider@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 at 22:06, Jann Horn <jannh@google.com> wrote:
>
> This is the second half of CONFIG_KCOV_EXT_RECORDS.
>
> Introduce a new KCOV mode KCOV_TRACE_PC_EXT which replaces the upper 8 bits
> of recorded instruction pointers with metadata. For now, userspace can use
> this metadata to distinguish three types of records:
>
>  - function entry
>  - function exit
>  - normal basic block inside the function
>
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/linux/sched.h     |  6 ++++--
>  include/uapi/linux/kcov.h | 12 ++++++++++++
>  kernel/kcov.c             | 46 +++++++++++++++++++++++++++++++++++++++++-----
>  3 files changed, 57 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index a7b4a980eb2f..9a297d2d2abc 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1519,8 +1519,10 @@ struct task_struct {
>         int                             kcov_sequence;
>
>         /* Collect coverage from softirq context: */
> -       unsigned int                    kcov_softirq;
> -#endif
> +       unsigned int                    kcov_softirq : 1;
> +       /* Emit KCOV records in extended format: */
> +       unsigned int                    kcov_ext_format : 1;

Setting/saving/restoring this flag is fragile. I afraid some of future
patches can break it in some corner cases.
Can we have a new kcov_mode and use some mask check on tracing fast
path, so that it's as cheap as the current == kcov_mode comparison?

+glider, what did you do in your coverage deduplication patch? I have
some vague memories we tried to do something similar.


> +#endif /* CONFIG_KCOV */
>
>  #ifdef CONFIG_MEMCG_V1
>         struct mem_cgroup               *memcg_in_oom;
> diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> index ed95dba9fa37..8d8a233bd61f 100644
> --- a/include/uapi/linux/kcov.h
> +++ b/include/uapi/linux/kcov.h
> @@ -35,8 +35,20 @@ enum {
>         KCOV_TRACE_PC = 0,
>         /* Collecting comparison operands mode. */
>         KCOV_TRACE_CMP = 1,
> +       /*
> +        * Extended PC coverage collection mode.
> +        * In this mode, the top byte of the PC is replaced with flag bits
> +        * (KCOV_RECORDFLAG_*).
> +        */
> +       KCOV_TRACE_PC_EXT = 2,
>  };
>
> +#define KCOV_RECORD_IP_MASK         0x00ffffffffffffff
> +#define KCOV_RECORDFLAG_TYPEMASK    0xf000000000000000
> +#define KCOV_RECORDFLAG_TYPE_NORMAL 0xf000000000000000
> +#define KCOV_RECORDFLAG_TYPE_ENTRY  0x0000000000000000
> +#define KCOV_RECORDFLAG_TYPE_EXIT   0x1000000000000000
> +
>  /*
>   * The format for the types of collected comparisons.
>   *
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 2cc48b65384b..3482044a7bd5 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -71,6 +71,8 @@ struct kcov {
>          * kcov_remote_stop(), see the comment there.
>          */
>         int                     sequence;
> +       /* Whether emitted records should have type bits. */
> +       unsigned int kcov_ext_format : 1 __guarded_by(&lock);
>  };
>
>  struct kcov_remote_area {
> @@ -97,6 +99,7 @@ struct kcov_percpu_data {
>         void                    *saved_area;
>         struct kcov             *saved_kcov;
>         int                     saved_sequence;
> +       unsigned int            saved_kcov_ext_format : 1;
>  };
>
>  static DEFINE_PER_CPU(struct kcov_percpu_data, kcov_percpu_data) = {
> @@ -235,6 +238,12 @@ static void notrace kcov_add_pc_record(unsigned long record)
>   */
>  void notrace __sanitizer_cov_trace_pc(void)
>  {
> +       /*
> +        * No bitops are needed here for setting the record type because
> +        * KCOV_RECORDFLAG_TYPE_NORMAL has the high bits set.
> +        * This relies on userspace not caring about the rest of the top byte
> +        * for KCOV_RECORDFLAG_TYPE_NORMAL records.
> +        */
>         kcov_add_pc_record(canonicalize_ip(_RET_IP_));
>  }
>  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
> @@ -244,10 +253,26 @@ void notrace __sanitizer_cov_trace_pc_entry(void)
>  {
>         unsigned long record = canonicalize_ip(_RET_IP_);
>
> +       /*
> +        * This hook replaces __sanitizer_cov_trace_pc() for the function entry
> +        * basic block; it should still emit a record even in classic kcov mode.
> +        */
> +       if (current->kcov_ext_format)
> +               record = (record & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_ENTRY;
>         kcov_add_pc_record(record);
>  }
>  void notrace __sanitizer_cov_trace_pc_exit(void)
>  {
> +       unsigned long record;
> +
> +       /*
> +        * Unlike __sanitizer_cov_trace_pc_entry(), this PC should only be
> +        * reported in extended mode.

It would help to explain _why_. The fact that it's not traced is
already in the code.

> +        */
> +       if (!current->kcov_ext_format)
> +               return;
> +       record = (canonicalize_ip(_RET_IP_) & KCOV_RECORD_IP_MASK) | KCOV_RECORDFLAG_TYPE_EXIT;
> +       kcov_add_pc_record(record);
>  }
>  #endif
>
> @@ -371,7 +396,7 @@ EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>
>  static void kcov_start(struct task_struct *t, struct kcov *kcov,
>                         unsigned int size, void *area, enum kcov_mode mode,
> -                       int sequence)
> +                       int sequence, unsigned int kcov_ext_format)
>  {
>         kcov_debug("t = %px, size = %u, area = %px\n", t, size, area);
>         t->kcov = kcov;
> @@ -379,6 +404,7 @@ static void kcov_start(struct task_struct *t, struct kcov *kcov,
>         t->kcov_size = size;
>         t->kcov_area = area;
>         t->kcov_sequence = sequence;
> +       t->kcov_ext_format = kcov_ext_format;
>         /* See comment in check_kcov_mode(). */
>         barrier();
>         WRITE_ONCE(t->kcov_mode, mode);
> @@ -398,6 +424,7 @@ static void kcov_task_reset(struct task_struct *t)
>         kcov_stop(t);
>         t->kcov_sequence = 0;
>         t->kcov_handle = 0;
> +       t->kcov_ext_format = 0;
>  }
>
>  void kcov_task_init(struct task_struct *t)
> @@ -570,6 +597,8 @@ static int kcov_get_mode(unsigned long arg)
>  #else
>                 return -ENOTSUPP;
>  #endif
> +       else if (arg == KCOV_TRACE_PC_EXT)
> +               return IS_ENABLED(CONFIG_KCOV_EXT_RECORDS) ? KCOV_MODE_TRACE_PC : -ENOTSUPP;
>         else
>                 return -EINVAL;
>  }
> @@ -636,8 +665,9 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                         return mode;
>                 kcov_fault_in_area(kcov);
>                 kcov->mode = mode;
> +               kcov->kcov_ext_format = (arg == KCOV_TRACE_PC_EXT);
>                 kcov_start(t, kcov, kcov->size, kcov->area, kcov->mode,
> -                               kcov->sequence);
> +                               kcov->sequence, kcov->kcov_ext_format);
>                 kcov->t = t;
>                 /* Put either in kcov_task_exit() or in KCOV_DISABLE. */
>                 kcov_get(kcov);
> @@ -668,7 +698,8 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
>                         return -EINVAL;
>                 kcov->mode = mode;
>                 t->kcov = kcov;
> -               t->kcov_mode = KCOV_MODE_REMOTE;
> +               t->kcov_mode = KCOV_MODE_REMOTE;
> +               kcov->kcov_ext_format = (remote_arg->trace_mode == KCOV_TRACE_PC_EXT);
>                 kcov->t = t;
>                 kcov->remote = true;
>                 kcov->remote_size = remote_arg->area_size;
> @@ -853,6 +884,7 @@ static void kcov_remote_softirq_start(struct task_struct *t)
>                 data->saved_area = t->kcov_area;
>                 data->saved_sequence = t->kcov_sequence;
>                 data->saved_kcov = t->kcov;
> +               data->saved_kcov_ext_format = t->kcov_ext_format;
>                 kcov_stop(t);
>         }
>  }
> @@ -865,12 +897,14 @@ static void kcov_remote_softirq_stop(struct task_struct *t)
>         if (data->saved_kcov) {
>                 kcov_start(t, data->saved_kcov, data->saved_size,
>                                 data->saved_area, data->saved_mode,
> -                               data->saved_sequence);
> +                               data->saved_sequence,
> +                               data->saved_kcov_ext_format);
>                 data->saved_mode = 0;
>                 data->saved_size = 0;
>                 data->saved_area = NULL;
>                 data->saved_sequence = 0;
>                 data->saved_kcov = NULL;
> +               data->saved_kcov_ext_format = 0;
>         }
>  }
>
> @@ -884,6 +918,7 @@ void kcov_remote_start(u64 handle)
>         unsigned int size;
>         int sequence;
>         unsigned long flags;
> +       unsigned int kcov_ext_format;
>
>         if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
>                 return;
> @@ -930,6 +965,7 @@ void kcov_remote_start(u64 handle)
>          * acquired _after_ kcov->lock elsewhere.
>          */
>         mode = context_unsafe(kcov->mode);
> +       kcov_ext_format = context_unsafe(kcov->kcov_ext_format);
>         sequence = kcov->sequence;
>         if (in_task()) {
>                 size = kcov->remote_size;
> @@ -958,7 +994,7 @@ void kcov_remote_start(u64 handle)
>                 kcov_remote_softirq_start(t);
>                 t->kcov_softirq = 1;
>         }
> -       kcov_start(t, kcov, size, area, mode, sequence);
> +       kcov_start(t, kcov, size, area, mode, sequence, kcov_ext_format);
>
>         local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
>
>
> --
> 2.53.0.473.g4a7958ca14-goog
>
