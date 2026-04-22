Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B233DBD5F
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 13:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776863229; cv=pass; b=q6nlJWPCYgmaYMHcTwU0JgQaSYaIgejbvBY5RN+DAyFEyAm467R1Jxm2ieu85MSdwWrqSwHoevtPnPYqKrKGpjfIBa6w/sLaAvSpGXYTYJ6Cpyxg9FVWCwNvlnh/qVYep5GLgdzYxdANWKY0l6YwKVV+OdpmCnW9V2VY4YYnezo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776863229; c=relaxed/simple;
	bh=kcVaVmnrfRG5ymOOafMNviByPv30wT6aQ5vvsB5ZTUE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JgsWEPuE723+WzWlS7hWpV+TkZU8NADED8hqx8bnEV/F6I1EfTsWQ7sR53UTSaH/Du2V8/f1PXOFLqGJflf3BfjpM5/gD9dyI+2YxcZPD9lNeSZ1qMgP6EzPJL81DOanj3oGKUC+sTOrViEHR1Q6tmxa0uZHAE+m47TJtDsrjUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YVzVUVj3; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YVzVUVj3"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c8f9846c8so4297258c88.0
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 06:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776863226; cv=none;
        d=google.com; s=arc-20240605;
        b=YnoDfZgFWXlXbewpIl5WBTBx3eVOfn/U3up5HSB0iBg9EAISdE6TvdPkHqs2Vjt3wV
         3RVDHFkqjjusAk52zIQTvMcbUhT8r4RpXdJNbHpuCaehhUq5tmlhZrXjQV7TE1zkS0Td
         AWNR05g13cCYWkA6OxU80Mexsth7NkE3yuNYLGKXU8miybYXht9dzMPgBsL0+sWI6+fF
         0BA2up7P9rWIHiR8YS64c1BbWugTt4VmGvJB2N6raTpCo+ha7PYqCFs4BHRba60erV6J
         bBg7lhrXWXBVBkmhUsy2QU6iF4QlNX45fXPchHb5T7HLmpRDm0i7aSlY54A5J9gosAvQ
         Yhbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FlW6IrHGthEjnJD7Nr5VvB1eBSTutrzVM+MzLpLbvUE=;
        fh=+y6qlO1/X5VlKILSMFqI3k6nO3T7A9ZXCCXRWi5GrtU=;
        b=Ru7vzBzRLRdpOCSLi8Y8/wkc4efdu/PQa0NeJHll1GHS3Z2TnZBa/P6C29tV/hPNRw
         Uw3YNBwMwOVNXT8ZbdqgJJFltJFRgGIJVjVUDWwalZsYsk9CL2/JWLOpaS3ONugxmXTK
         4UgfJ9LpiI8SbhUq3/qL0Vs1eeao3FRl7hxQNuCRb6dMDcJKpObdC8Nvwq1pIkUtri1O
         9q3vXqoN/XvaqoFBmGqLeo8kh1Rx34byalo7Jbp2eHHCSjZouvXHgXbFJToy458/V0Wq
         OxKgDNa/Zi1hG8zopG975X1j8t2y/g20zYuxZPvtkVgaNnbLWUVRgSCBApHPOtkQzLKb
         bAXg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776863226; x=1777468026; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FlW6IrHGthEjnJD7Nr5VvB1eBSTutrzVM+MzLpLbvUE=;
        b=YVzVUVj3NSzvs8e2IVXfRaF+PA3V1QJjd5aiiFouTW67s2rpv4I4kwFiAye2kVj3Cj
         1j4rDm+5V0Icisss3LBHqrQjW2mrP1KCTA+//EpE97GlR7KF3tcGDxEHaH13AhjWVpuz
         NFoIKJcM/Y5xRVm00jknx0nHF4INgBBD7BPsiRFjSGRa7vMmpRjMBH7hSgnr6ChkVm9O
         Q43ezeMRDoqqpJRB8zH1Ua4woINKwYLO5EhjmosFjyrEtrJJ8jqZNN/CoGmNPFa4LLtp
         F9bERqLx2lgMJyr821JnwWjopW6ogsD28g4euIgE91Pk7e8QSabYzk41dkf37k8Y8YhA
         WDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776863226; x=1777468026;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlW6IrHGthEjnJD7Nr5VvB1eBSTutrzVM+MzLpLbvUE=;
        b=tQX3MBcT9OnKWnuqtD8c5Gra0o0WckWIeDePBQOKDw74yKcH/ZQe2N/5z+/kyw1ALX
         YJWRNyUaWbEmIv+RGRFiG+APJ6EuVeI7KnZqlkul/smTMTEkDW9qrkUFVz5j/QNgUiE8
         mrthouAn7pwKFanmL5zixvm4r6nEP5K9e78qGG+3qLeJ9Dcx+wxc6ajIAORlNFO6Xe6U
         lmDNx5NxyYn7pzd72790FKOOWGViYKE+PsdURgJ2LdY8Mdz7KZ2Dri8ocerksrLdFsCi
         8CXrA/GF3olxZnQbaEdjt0+5reKTbVhewr93PnTG/DP0a8Ki8hK4n1dULkBD+PZUmU7n
         h0lQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HCSjQEv5Tmd8dBucndvwg6XhMap8WfovkbXdDVRT5eZGyjXJtc09IABrMkN/UE4jwsd79@lists.linux.dev
X-Gm-Message-State: AOJu0YyYGQExkvfNJ2Ltk6o/gkDBgKIbdGh1kpTXodcl+mR9qdW4j+Uw
	N3Adqi9Mq6Jgbvoh842bY4y1IYD1oUCWLNKSrYdkOLrNRvtXMDWh7iyGbETVn8YdDv5zCURt5nX
	fyU4rjWgSSPuEKGJiWJJkTRzh6oMnBlMfbAl9MxN5
X-Gm-Gg: AeBDiesgGqW7tZY1Pcny/qlCVeSM1bNr39HbKKyh5Si/H7LqqF1jdXAub4VUQNgcIdI
	OQwhagj8G36sJt/FPusVFjKQPeW7OHf7Pk9dyROFgCP9s1E26Ty5TtzmI0ehQwYxfXUkinQ1Aer
	t67RsLs9xrLjYLIDeKGE3jl/30cCtIil3c6fRRgwx/Ctz/24FKFT/HWpXPz2+GUAtKirJTsY+Ub
	79sXMlVz9ghQxuH0vaQu5R93MedoeykClAnDqkTlvLt2mJUCM/DhWtF26w6WAnUSIpicpfKEuOX
	7cL895SMshNs+uz3oSAyVmip3mVLvqMoEhlSP8fr6Bd/n6KmAw5Coq50JYo=
X-Received: by 2002:a05:7022:6714:b0:12c:8e7f:1b11 with SMTP id
 a92af1059eb24-12c8e7f1d18mr6227148c88.7.1776863225211; Wed, 22 Apr 2026
 06:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <20260422110114.0f48d109@pumpkin>
 <CANpmjNNG9fKcqj36LHcx8v8qyB8r0qzr7EdkoUOeLiNu9uoRCw@mail.gmail.com>
In-Reply-To: <CANpmjNNG9fKcqj36LHcx8v8qyB8r0qzr7EdkoUOeLiNu9uoRCw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 22 Apr 2026 15:06:28 +0200
X-Gm-Features: AQROBzAxaZ72zyJn30Q3XksewkSIVxQPXGlnNgzNUY3MiF20XfQu1nS-OzXGEP4
Message-ID: <CANpmjNPrfhntCnQJgcokvwcBOPv-gcydwif8A2rd2AnYSRypHg@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>, kasan-dev@googlegroups.com, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Apr 2026 at 12:20, Marco Elver <elver@google.com> wrote:
>
> On Wed, 22 Apr 2026 at 12:01, David Laight <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 21 Apr 2026 21:03:47 +0200
> > Marco Elver <elver@google.com> wrote:
> >
> > > Add support for the `__access__` attribute, which is supported since gcc
> > > >= 11 but not currently supported by clang.
> > >
> > > The attribute allows specifying how a function accesses memory passed
> > > via a pointer argument (read_only, write_only, read_write, none) and
> > > optionally the size of the access. Per [1] these annotations only affect
> > > diagnostics, and should not affect code generation:
> > >
> > >       "The access attribute enables the detection of invalid or unsafe
> > >        accesses by functions or their callers, as well as write-only
> > >        accesses to objects that are never read from. Such accesses may
> > >        be diagnosed by warnings such as -Wstringop-overflow,
> > >        -Wuninitialized, -Wunused, and others."
> > >
> > > [1] https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> > >
> > > Signed-off-by: Marco Elver <elver@google.com>
> > > ---
> > >  include/linux/compiler_attributes.h | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> > > index c16d4199bf92..ef4e279e9872 100644
> > > --- a/include/linux/compiler_attributes.h
> > > +++ b/include/linux/compiler_attributes.h
> > > @@ -20,6 +20,18 @@
> > >   * Provide links to the documentation of each supported compiler, if it exists.
> > >   */
> > >
> > > +/*
> > > + * Optional: only supported since gcc >= 11
> > > + * Optional: not supported by clang
> > > + *
> > > + *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Attributes.html#index-access
> > > + */
> > > +#if __has_attribute(__access__)
> > > +# define __access(x, ...)            __attribute__((__access__(x, ## __VA_ARGS__)))
> > > +#else
> > > +# define __access(x, ...)
> > > +#endif
> >
> > No need to the initial 'x', you can just do:
> > # define __access(...)          __attribute__((__access__(__VA_ARGS__)))
> >
> > Putting the actual syntax in the comment would help, eg as:
> >         __access__(read_only|read_write|write_only|none, param_number[, size])
>
> Will add.
>
> Arnd reports odd behaviour on gcc-11:
> https://lore.kernel.org/all/4b36f629-9338-40e0-b114-ee37aaad9cf3@app.fastmail.com/
>
> The documentation says "When the optional size-index argument is
> omitted for an argument of void* type, the actual pointer argument is
> ignored." - but gcc 11 seems to not ignore it. Is it a known bug with
> gcc 11? I.e. do we need to add a version check?

FWIW, I found that even later GCC seem to complain when using access
'none' - https://godbolt.org/z/jGGG97MW3

I'm not sure if that's intended or not - either that, or the GCC docs
are misleading me here. To avoid this footgun, I'm going to drop this
patch and found a simpler solution using absolute_pointer():
https://lore.kernel.org/all/20260422125256.87513-1-elver@google.com/
