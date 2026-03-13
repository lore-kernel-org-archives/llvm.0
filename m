Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F67344021
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388792; cv=pass; b=ByOYqCuf5xgfSvZptHPJ74OX6juau2PDx32qTcOIz3xpbJ3pbSaiknQfCs1RvDfX/TrAbUNXy/fh4vnmG2nAwncsf6yx51Njz6lDBeJGPLpHqTTMySbZA+TWTIAeaXZs4Dmdo1CIhvoUg/SU4cnvMkcAXFmj0R2MDh8VgEvKmdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388792; c=relaxed/simple;
	bh=QIHWA8ZzsBNYERfa3+3Mm5/uEIo98tJ0GDsuQJC4/RI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUl2f1qb9iA9w5b8IsnGnzGL7Gwx3/mqeLIV4FFAlyrIbEtmLtl97aM+DndPm/RvDj7r4aDrivyj6grxaxfql3wNtoykPzuzRg8FcPgc/NmmQv7l2QF8751PW6irtY7+jPbIppobrCNMZ1XF0hztpNu2eHB6032r95YA5DBKDvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sriC2vnX; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sriC2vnX"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a1322af04fso2276558e87.2
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 00:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773388789; cv=none;
        d=google.com; s=arc-20240605;
        b=TWjpSiEDJbi4ugmgtj/vxk/qEmZFNxS87Tso0UVSRW7fqebN+AkJUMWW4Lv21FAj0f
         K1u/qglPvT1UhVvbD+H+6asAq1OGl0pQTvjoxBNxmFoIqr1XkbRjEpValkaBy269vGUM
         qzfjQsQ6XUdpPNGd89CLIZ0k6nRD97COgWU09iu8HdzhjNFFgxVXYDeZh1DLSmsDPBuR
         Z4tQpntEqVbIIthcSq3E+nU9Av0ACXRvUh0ozJMyN2E7K6uMMrlAtAt1iDovi7gxoysJ
         mMaU4Tl0O7396Z9nsRUgl3OUt4aAzLAbHJAcVpAP4p5gJhA504HEGhrYHKhc8Ghg7lQO
         SHPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YU2ijIRSNPlWWjpyhyPvFF1uRN1PcQvJpKQYWQeBxi4=;
        fh=KBsoX/4STHeFnCrKnpmCBiaYzTTmITQ5m78mpfXrkH0=;
        b=EnaaaoN5gijf1YXmKV+cR4Y94rKChOwrIM+8cyGhDzs6kbllsGZ35Rrzxt70gvGpgx
         MlxNFXr/baZHcMMN/urwdHhavuxFYW0RpyPfzKoBt9oszM6KYugnLxgssDIrlMs0V/Fp
         Mh3OY/Bw2B09gH9HHakQZWozS16ahIuyM0cF9CsjerY8QTcssYFdfD+8hwp5m//5Vh/v
         qNsmcKQ1H6mqjOe/gzyLo4/evJ4v5pX9pgA9RtVtgEkPv1Uvjrwwn6oX6BhLldDgzmWn
         kiLlC4jqZYGeSMWsJgMZhpoQMgKO4jXKiXJx2jYOwq6petKN2bIDj13ecxUaV3kBE/BZ
         htyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773388789; x=1773993589; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YU2ijIRSNPlWWjpyhyPvFF1uRN1PcQvJpKQYWQeBxi4=;
        b=sriC2vnXFTkRIeYdo6kKbArivBRylZG6EvQqO46Cfo+1bVCY8eBfZtKt6XTNr0egQ+
         dCR0tX+dZw36HWCJPcvZi05LZNMqLDVXzHvHL3E6I+W/lniWqxjsLPEs3zOG2jCyVNus
         KNQE4a0ZE1ss0G9fgcd/RfwYurI1vXsKzc63KdytUX5jaSOUvqJfkbo0U1PG3GZ/+oRe
         W0MgeOcpwklvqsGPPTq4bBl+czWvBg0kmpaz0pjMzM9R8dZwTvIx1Knt3eu7RnXmguZq
         A6puYe44aAAEisDUDYQd3jwFoNVOyQVVac81cGLdWHzEVN93hupAYEevy4b9JcvKLbXa
         OVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388789; x=1773993589;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YU2ijIRSNPlWWjpyhyPvFF1uRN1PcQvJpKQYWQeBxi4=;
        b=I65JnOtCNx30krRkdEPA2M4xzq6b/p+c1vmB1kNLwz+fhNZ866VMhleMRe6y/W648I
         fjQseYKGSEFEyUIU5HluQ386af41cMezfPhWdb7maHOwFRNNxSmqwMXgleE0v9/KOJK3
         Wi9WnvN2vwZfgRIa2MrywNQrstXMzOzqYjrTMqJT1PDcFv/2NqFl4EHNAVDzfVYQNNiq
         n+NDdykOFWseFvNeFNVvAWF5tzZAEoRbW5U4imebFAhJVne6YIE8y6zJ+a5uhR68evt3
         Z6CAqaKi0899zh7vCqCgv9ea6bd6SSImIn4WoSKw8x9WDl4Gp8D+Z9H1IbH4TY3FmK/Z
         4pag==
X-Forwarded-Encrypted: i=1; AJvYcCWG00EMdHqZdKdHLM7tpP6Ohvp7wdpVAE3OTJ8XgDhIMACidLPeRbVnqp0mhxKSyR+V/mUT@lists.linux.dev
X-Gm-Message-State: AOJu0Yzj/2d+B6U6byCsNxRrnYKgr1w6nmWOR8F2CofQjWD1REuIYtKo
	8VcSSfraswa2B6040gAv9IuqicgBYu4awdaLNnnP0ZEfTd5jM7cAqdks80bqAl7zvNwJahozp35
	1GUJZYXS/inTBXmAeewAGnYOksCAxRMLOF49p5A3q
X-Gm-Gg: ATEYQzyIlwo2Qjr0udbdrUZIl4bcRdw+UuizB57UBETDXByZSzvz6IAJkmy8ZDFxXd9
	XYSx4F/8LJjPivFxaKUKg73XbNlz4b3Gv6/1OAwWTfYwEtPs/1ztuWbHZtofg+Hn+gH+OgrcQZN
	hHDOjJFg8Haf3UXjnCC4LkgfQ4lJB7kZ5fr+cq/Q/NIqvL1OZT1VnHMOHRUytQqZai0aIwVZwjJ
	7nh/XFPRpFp0XqDUWJR+8nlDxa1PY6hQmWvLyP/ma2WTLC1K2geAyIaOCZvA0vv+hp4jKu7qkC8
	e0XW3r+ZnlVIv/uKapvkKoti4OHtlteRgn0Kf7G/nYMVrAdAYiOtVWILk4URTn/NvzRubw==
X-Received: by 2002:a05:651c:546:b0:38a:8c44:7593 with SMTP id
 38308e7fff4ca-38a8c4476c7mr5763831fa.21.1773388788246; Fri, 13 Mar 2026
 00:59:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311-kcov-extrecord-v1-0-68f03c4a05ad@google.com>
 <20260311-kcov-extrecord-v1-2-68f03c4a05ad@google.com> <CACT4Y+aLx-ZG7FqYNrhrABi1bgNo6AnG5JL9tq+mCPRAnx37Tg@mail.gmail.com>
In-Reply-To: <CACT4Y+aLx-ZG7FqYNrhrABi1bgNo6AnG5JL9tq+mCPRAnx37Tg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 13 Mar 2026 08:59:36 +0100
X-Gm-Features: AaiRm50R8EN91cImgEG_cYSH9YHGTp9wBIu0JPuDK5SlqwzowUinn7hL-082x9w
Message-ID: <CACT4Y+aXejLgWT=56_d-D04guRUi5iAnAeR-rV_Q6n4qL5g7aQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] kcov: wire up compiler instrumentation for CONFIG_KCOV_EXT_RECORDS
To: Jann Horn <jannh@google.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Mar 2026 at 08:53, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, 11 Mar 2026 at 22:06, Jann Horn <jannh@google.com> wrote:
> >
> > This is the first half of CONFIG_KCOV_EXT_RECORDS.
> >
> > Set the appropriate compiler flags to call separate hooks for function
> > entry/exit, and provide these hooks, but don't make it visible in the KCOV
> > UAPI yet.
> >
> > With -fsanitize-coverage=trace-pc-entry-exit, the compiler behavior changes
> > as follows:
> >
> > - The __sanitizer_cov_trace_pc() call on function entry is replaced with a
> >   call to __sanitizer_cov_trace_pc_entry(); so for now,
> >   __sanitizer_cov_trace_pc_entry() must be treated the same way as
> >   __sanitizer_cov_trace_pc().
> >  - On function exit, an extra call to __sanitizer_cov_trace_pc_exit()
> >    happens; since function exit produced no coverage in the old UAPI,
> >    __sanitizer_cov_trace_pc_exit() should do nothing for now.
> >
> > Cc: Josh Poimboeuf <jpoimboe@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  include/linux/kcov.h  |  2 ++
> >  kernel/kcov.c         | 30 +++++++++++++++++++++++-------
> >  lib/Kconfig.debug     | 14 ++++++++++++++
> >  scripts/Makefile.kcov |  2 ++
> >  tools/objtool/check.c |  2 ++
> >  5 files changed, 43 insertions(+), 7 deletions(-)
> >
> > diff --git a/include/linux/kcov.h b/include/linux/kcov.h
> > index 0143358874b0..e5502d674029 100644
> > --- a/include/linux/kcov.h
> > +++ b/include/linux/kcov.h
> > @@ -81,6 +81,8 @@ typedef unsigned long long kcov_u64;
> >  #endif
> >
> >  void __sanitizer_cov_trace_pc(void);
> > +void __sanitizer_cov_trace_pc_entry(void);
> > +void __sanitizer_cov_trace_pc_exit(void);
> >  void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
> >  void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
> >  void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
> > diff --git a/kernel/kcov.c b/kernel/kcov.c
> > index 0b369e88c7c9..2cc48b65384b 100644
> > --- a/kernel/kcov.c
> > +++ b/kernel/kcov.c
> > @@ -202,15 +202,10 @@ static notrace unsigned long canonicalize_ip(unsigned long ip)
> >         return ip;
> >  }
> >
> > -/*
> > - * Entry point from instrumented code.
> > - * This is called once per basic-block/edge.
> > - */
> > -void notrace __sanitizer_cov_trace_pc(void)
> > +static void notrace kcov_add_pc_record(unsigned long record)

__alwaysinline just in case

> >  {
> >         struct task_struct *t;
> >         unsigned long *area;
> > -       unsigned long ip = canonicalize_ip(_RET_IP_);
> >         unsigned long pos;
> >
> >         t = current;
> > @@ -230,11 +225,32 @@ void notrace __sanitizer_cov_trace_pc(void)
> >                  */
> >                 WRITE_ONCE(area[0], pos);
> >                 barrier();
> > -               area[pos] = ip;
> > +               area[pos] = record;
> >         }
> >  }
> > +
> > +/*
> > + * Entry point from instrumented code.
> > + * This is called once per basic-block/edge.
> > + */
> > +void notrace __sanitizer_cov_trace_pc(void)
> > +{
> > +       kcov_add_pc_record(canonicalize_ip(_RET_IP_));
> > +}
> >  EXPORT_SYMBOL(__sanitizer_cov_trace_pc);
> >
> > +#ifdef CONFIG_KCOV_EXT_RECORDS
> > +void notrace __sanitizer_cov_trace_pc_entry(void)
> > +{
> > +       unsigned long record = canonicalize_ip(_RET_IP_);
> > +
> > +       kcov_add_pc_record(record);
> > +}
> > +void notrace __sanitizer_cov_trace_pc_exit(void)
> > +{
> > +}
> > +#endif
> > +
> >  #ifdef CONFIG_KCOV_ENABLE_COMPARISONS
> >  static void notrace write_comp_data(u64 type, u64 arg1, u64 arg2, u64 ip)
> >  {
> > diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> > index 93f356d2b3d9..dddc330ad3ca 100644
> > --- a/lib/Kconfig.debug
> > +++ b/lib/Kconfig.debug
> > @@ -2215,6 +2215,20 @@ config KCOV
> >
> >           For more details, see Documentation/dev-tools/kcov.rst.
> >
> > +config KCOV_EXT_RECORDS
> > +       bool "Support extended KCOV records with function entry/exit records"
> > +       depends on KCOV
> > +       depends on 64BIT
> > +       # TODO: check CLANG_VERSION instead once this has landed in an LLVM
> > +       # release
>
> I think the compiler option check is actually better, since it will
> allow us to test earlier and supports compiler backports.
> But it may be good to add a reference to the compiler patch in the
> commit description.
>
> Otherwise:
>
> Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
>
> > +       depends on $(cc-option,-fsanitize-coverage=trace-pc-entry-exit)
> > +       help
> > +         Extended KCOV records allow distinguishing between multiple types of
> > +         records: Normal edge coverage, function entry, and function exit.
> > +
> > +         This will likely cause a small additional slowdown compared to normal
> > +         KCOV.
> > +
> >  config KCOV_ENABLE_COMPARISONS
> >         bool "Enable comparison operands collection by KCOV"
> >         depends on KCOV
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 78305a84ba9d..aa0be904268f 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -1,10 +1,12 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> >  kcov-flags-y                                   += -fsanitize-coverage=trace-pc
> > +kcov-flags-$(CONFIG_KCOV_EXT_RECORDS)          += -fsanitize-coverage=trace-pc-entry-exit
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)   += -fsanitize-coverage=trace-cmp
> >
> >  kcov-rflags-y                                  += -Cpasses=sancov-module
> >  kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-level=3
> >  kcov-rflags-y                                  += -Cllvm-args=-sanitizer-coverage-trace-pc
> > +kcov-rflags-$(CONFIG_KCOV_EXT_RECORDS)         += -Cllvm-args=-sanitizer-coverage-trace-pc-entry-exit
> >  kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)  += -Cllvm-args=-sanitizer-coverage-trace-compares
> >
> >  export CFLAGS_KCOV := $(kcov-flags-y)
> > diff --git a/tools/objtool/check.c b/tools/objtool/check.c
> > index a30379e4ff97..ae3127227621 100644
> > --- a/tools/objtool/check.c
> > +++ b/tools/objtool/check.c
> > @@ -1251,6 +1251,8 @@ static const char *uaccess_safe_builtin[] = {
> >         "write_comp_data",
> >         "check_kcov_mode",
> >         "__sanitizer_cov_trace_pc",
> > +       "__sanitizer_cov_trace_pc_entry",
> > +       "__sanitizer_cov_trace_pc_exit",
> >         "__sanitizer_cov_trace_const_cmp1",
> >         "__sanitizer_cov_trace_const_cmp2",
> >         "__sanitizer_cov_trace_const_cmp4",
> >
> > --
> > 2.53.0.473.g4a7958ca14-goog
> >
