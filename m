Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7825C611
	for <llvm@lists.linux.dev>; Thu, 14 Mar 2024 15:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710431838; cv=none; b=OTHs3i4qHUEvuoT+4jNYcsHaVtvpFCSnMCq0BODtTKFy9//JNn5uK/0Lq46nfI5KC5rm/3D8BzisJa/0tzj4loZhq3vyD2gGisKNE5Oqf2Aj5jtIp1gwwoLxLdlq9TI3nsBpjkdWjVLmIRjbU72lWmQIpBcXFFIUTWI087kfBdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710431838; c=relaxed/simple;
	bh=7HQ3IpO13Y+q9VqOFTfv5rfBRj5NGDdKTqljlt/5bqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lLA3HcXnvz3QpcGuj6y8AXrRg4fxS/VYm9OCTpsEJu254tZkMbAGukfDm0KSZP/Oa0u/MGIpnQBxBnUHouJHbv8a/43P2Pwm7WSyYaG5wl+9iW5J3rrsGhwpkeEqK64qMFPq8h/aSt3NfeRRPuNv0785YpUGiSRwiVaWc3qaHzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RGgRJdYD; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RGgRJdYD"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4733d7040dfso151482137.0
        for <llvm@lists.linux.dev>; Thu, 14 Mar 2024 08:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710431835; x=1711036635; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7HQ3IpO13Y+q9VqOFTfv5rfBRj5NGDdKTqljlt/5bqA=;
        b=RGgRJdYDt8B+DH4eNJKzkun3ZfMrtU5jgV05Bm0GiagZv9pmXggriosRsMdYLujLwy
         e9+81PTaaAYtxkHreVqR9oo+tdP7XKzvYnXEsJzWEuaSNhVd4B5f7f6wMIvdXsLQ5TtP
         OAI12EroSJp06cFgEID2MNTgHthJEa/IlqiFl9zYssHNTOBpVNm1SuzRGczbvWJTnRO1
         0nZMU+5n0RhHtvOxf7BGj6pmlY3Y1pzGECHCKprNysYbwKfB7NhuI8Z0ssxDNF9pdpsD
         EsoMz8HrKGgRrSUOx3zRXfEugkElEf6kpsnn8l4oMHnHdK7+ETAmBr4+rIeGw+jTPtuc
         k2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710431835; x=1711036635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HQ3IpO13Y+q9VqOFTfv5rfBRj5NGDdKTqljlt/5bqA=;
        b=GyX0fmsHtm4AsP7VnQHWcCGs6DQUBSSqULTZ6jW6ta4vuZ/e+sT63w+gsx+W/ewvjI
         B0SGw9Aw9G0czu5DyMu+rSn3bzhpBhG9xZIs4Jd99Ft7gH497jIeuYv8+LoZ2aR1YnmP
         KGDs1pouo/RAgE8RBw8CKxWEbWuWRQIQzOGF1wGLL1HJG9zZT5qOXXSleuP+jOZaONb6
         /4BjpHp42S/+IEk3Cv+oO7BB2nv3jeYM5UOeWiYJoARutVnRm8fdoZUfnwXTUH6qMJcv
         7kfDqdeO/akISoZFjh5PFo3tqEnrFdryM7bAW/3+TBux1MuD1wxFJi8G0aJXJYDK52b9
         klCw==
X-Forwarded-Encrypted: i=1; AJvYcCXM1af5lVuh9emdatnztGOQGLmTaUKOh1EwLH955YjifXTm4c7tl8avGPymzEj6MjO8bqNV2aqU2vuOX7tMU5iQcc2kMg==
X-Gm-Message-State: AOJu0YzVvL3tDWQzdLarAIeOi5jIWkmr0RU5pgYx89otRl3ZFSzF6E8Y
	Cf46QotJKEdWo/+HoIW+CPe6iDXrqoJnbh79wnE3m7Z6JCkuhVE5GpJaJ7x4BQkYPlAXpgtW3q7
	0V2c1CrbHSclw+YsiE7i/KGyPxvjIx7sbaexO
X-Google-Smtp-Source: AGHT+IEOFuQHsI3D29O5MY90DhCqB2gYp03PZpY3DtGYEUDYmaQaVyOYcsrzQfrSYP+I+5eIGdBCg56AcJ4Fcw+IhwA=
X-Received: by 2002:a67:cd11:0:b0:474:acae:f3c3 with SMTP id
 u17-20020a67cd11000000b00474acaef3c3mr611837vsl.25.1710431835573; Thu, 14 Mar
 2024 08:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240206223620.1833276-1-acdunlap@google.com> <168b4e3b-8076-4fc3-92bc-fcd9f2b516a8@intel.com>
 <CAMj1kXE4Yhh_5y=ybFkD7YQUZuh7+-P_Vyzv-gpvbQ=i=eRMnw@mail.gmail.com> <CAMBK9=bTMJircCK9SYHsZcKvbD0oZUByQPXcYciD6mcVqgg6=g@mail.gmail.com>
In-Reply-To: <CAMBK9=bTMJircCK9SYHsZcKvbD0oZUByQPXcYciD6mcVqgg6=g@mail.gmail.com>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Thu, 14 Mar 2024 08:57:04 -0700
Message-ID: <CAGdbjm+A2UwK0yYfA+AasxqjQJBfRE3k9ubpPcaVP9KJNinxHQ@mail.gmail.com>
Subject: Re: [PATCH v3] x86/asm: Force native_apic_mem_read to use mov
To: Adam Dunlap <acdunlap@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Arjan van de Ven <arjan@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Jacob Xu <jacobhxu@google.com>, Alper Gun <alpergun@google.com>, 
	Peter Gonda <pgonda@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 10:20=E2=80=AFAM Adam Dunlap <acdunlap@google.com> w=
rote:
>
> On Fri, Feb 9, 2024 at 7:22=E2=80=AFAM Ard Biesheuvel <ardb@kernel.org> w=
rote:
> >
> > this seems like the kind of thing we'll want in -stable in case folks
> > are compiling stable kernels with new clangs.
>
> That makes sense. Note that there was another patch accepted recently
> that fixed another
> clang-with-SEV problem [1], so they should probably be backported to
> the same stable
> branches since neither is that useful without the other.
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?i=
d=3D1c811d403afd73f04bde82b83b24c754011bd0e8

Agreed; clang builds of SEV-SNP guests will need both this patch and
[1]. If an additional patch [2] also gets merged, we may want to do
the same for [2] as well.

[2] https://lore.kernel.org/lkml/20240313121546.2964854-1-kevinloughlin@goo=
gle.com/
