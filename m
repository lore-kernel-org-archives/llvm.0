Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E971AED28
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 10:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347134; cv=none; b=Ws+I1ouYoef4dMqtMIC0Eo2zPjTEMtWuoljpPQG/7GWxxMY79KXGGgr+S/vhx5vR2tvixqyNw6R881Ja52HCiyhF/46yBKoy6ZgauTnX72gbkT75gu8sVpSamF8+8eWF4cTUtIlHyDCzplj3Zc1XolnYTEbs7rQS37UYmhlY++c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347134; c=relaxed/simple;
	bh=8r1pcZkfw/tFfZR6si2jJmP1lsdT9fdbbtCLXQYgb+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=al/QR+TTx8fhULF6yZmxQQKQm3v7Y4e9S6uSf8HNMYZtwKQL/UamM4czfc+asSFNwHR97fjVlutF4Wm5uUBcruYylHZe4FS5hyWzzlGnQWcaN6yIO61rLlujSymieGtf2vE42m9LUL3ul6vP6ic+xQOPgdtF6931xnpMiW+u0vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZJmVhgkj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZJmVhgkj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-374c180d123so491772f8f.3
        for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 03:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727347131; x=1727951931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsEcz1fbSNxPzlZJA2pt/9oZVDJuGBFj7OVbuqkmeN0=;
        b=ZJmVhgkjksjsMx2gsIWwIRALAbPpfAp+TS9k6J+y6AOsg5V2NdgYz+iBhl5xMjwtmz
         tMgIaWShvHMQH2KF/PhFGsRIDUyXobv9M4u8g4NDC23uT22Z4wxweUKS9b5ak4NAablU
         ZrmvPUhaauVJP2oNKnx2a30H0sVujunyOw1LdU1rcLNtjm9mqXatcMXHJbInp22M5N+i
         5SBWq7i2lkUIPeimDIL4d4COg49VfqI6Lqo5a7UDW8XZ5NIVjI7AlGbXO9FmypzFIqzN
         DEGKPD5yFomT2oyE1uMT4CoZ13nVgvLIjlv/COCCUJeyntBoQiJjY/6yOBb6mOAik0eg
         3szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347131; x=1727951931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsEcz1fbSNxPzlZJA2pt/9oZVDJuGBFj7OVbuqkmeN0=;
        b=JzW7obCWiQ937HJ5lvQcB2Ok2bakRCg4kRA4tjckHgfSnf+VUr1bW7K+3Mg3dTReFu
         As/4ENivklD+Muw1Q1WkbHXr+2L+bIrR8tILcJK7w2uFNVKzY96BaBM467LYxKZKteEK
         LQa3qRSiYteabazjfbFC4sZca8hGsviXaDT8ym44UdmCNLtfH52Lufddpyb93AYluwwV
         Qnivy5s6GfuDtrq9n/L9AMZeaWZLhdoMzfNS2Oie9j2iJNaXGb3mFdd+kMD9ORBeBhQG
         fmqGOA2G+/UJmejeklnb50Bl8PLpU4qQfnhbI+dtg0FPI+ouHo8zKvZ5a6hfrEScE4x0
         BU5A==
X-Forwarded-Encrypted: i=1; AJvYcCWLj1GLZnLuxw6h+4nVp9sFS23IHOdMhHOg/K30EEBQcTTOv6OyyFRYKRxoiWHPmcLcbGC8@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ+kxF8XefpLp2cmZh0/wNq5P1lI28OOBr//0fi3uj+gYbGUs1
	pbvEPLXPg3UcBSOXaVY84X2Yzr9apwYiASFqDJY/YeLFV81ifY6b1FqreqkuL/z7CL8BoVmtnr7
	XXisUu4U12Uinti9VEd0p6Dg67jvXZZ6gqKqy
X-Google-Smtp-Source: AGHT+IG5GKlP6TVqHse15LFnIap0YvbFb8l1DzbrYAO+qzwI5i5VHGfbIunMaThYXrhbKoz3QqKt8XmqA8AbgALoDCU=
X-Received: by 2002:a5d:4e0c:0:b0:374:ba83:8d73 with SMTP id
 ffacd0b85a97d-37cc245b82fmr3076607f8f.8.1727347131137; Thu, 26 Sep 2024
 03:38:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com> <20240926000053.GA3188344@google.com>
In-Reply-To: <20240926000053.GA3188344@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Sep 2024 12:38:38 +0200
Message-ID: <CAH5fLgjoQvxFj5S1s_fUsfSho9QRCV5acHsQxpZdvEztpaxqCw@mail.gmail.com>
Subject: Re: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <kees@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 2:01=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi Alice,
>
> On Wed, Sep 25, 2024 at 08:10:18AM +0000, Alice Ryhl wrote:
> > An alternative solution is to inspect a binary created by clang or rust=
c
> > to see whether the faulty CFI tags are in the binary. This would be a
> > precise check, but it would involve hard-coding the *hashed* version of
> > the CFI tag. This is because there's no way to get clang or rustc to
> > output the unhased version of the CFI tag. Relying on the precise
> > hashing algorithm using by CFI seems too fragile, so I have not pursued
> > this option.
>
> I suppose there would be no need to hardcode hashes in the test,
> it's enough to verify that the hashes for the compiler-emitted
> functions change when integer normalization is enabled. Still, I
> agree that this doesn't sound worth it in this case.

Future compilers could change it so that the same hash works in both
cases. After all, the signatures in question have no integers in them.

> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index ee58df8b1080..b8066bf43153 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -829,7 +829,7 @@ config CFI_CLANG
> >  config CFI_ICALL_NORMALIZE_INTEGERS
> >       bool "Normalize CFI tags for integers"
> >       depends on CFI_CLANG
> > -     depends on $(cc-option,-fsanitize=3Dkcfi -fsanitize-cfi-icall-exp=
erimental-normalize-integers)
> > +     depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> >       help
> >         This option normalizes the CFI tags for integer types so that a=
ll
> >         integer types of the same size and signedness receive the same =
CFI
> > @@ -842,6 +842,22 @@ config CFI_ICALL_NORMALIZE_INTEGERS
> >
> >         This option is necessary for using CFI with Rust. If unsure, sa=
y N.
> >
> > +config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
> > +     def_bool !GCOV_KERNEL && !KASAN
> > +     depends on CFI_CLANG
> > +     depends on $(cc-option,-fsanitize=3Dkcfi -fsanitize-cfi-icall-exp=
erimental-normalize-integers)
>
> This looks reasonable to me. Thanks for the fix!
>
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Thanks for taking a look!

Alice
