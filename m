Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B7E1A704D
	for <llvm@lists.linux.dev>; Thu,  3 Oct 2024 16:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971909; cv=none; b=WONwyKSJ6sDTG4jGuQU1o5xuCUqJ0yz04UYy6qCQGg9XnEKT/e9oGriDveHciOLJIfPFxmoQbUQ2Gw+Rw/8wfokxJ1TWB9C2YCO5yx+8AkqAMyJQbT1tx0npNnP8teGi7+1PgcGqIsJ7ujPdlU/Fpwv6penjBfheUGjcVGVELb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971909; c=relaxed/simple;
	bh=KAJhNktsKQBL31h4FFeDeoZJgORcWmVqd2YZcjRTjio=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEAPy+CPA+DtsWBIbhDokFLn3LCygPvz/1hCkol3LK1o/ZRgq52r82nONtKdMGdzTBxg+rnXATDF5bLxIiz5OWi8WDGta/TQwySCfEuQsQXdagh98YuE16EssbZGml+PKetzffQrzm2Ie22in0qBsM2Q+ddzlEYDAtVn8tSNCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLWv2rM8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLWv2rM8"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37cc810ce73so762595f8f.1
        for <llvm@lists.linux.dev>; Thu, 03 Oct 2024 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727971906; x=1728576706; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8M94Szf86aflf7GYtGP4IFREoq5t6mzeSASTe2kb0E=;
        b=LLWv2rM83VpyuVbAu2v7vt4tzgreGEFZ48N8ddAe9LERh/jIbfAJrfEnS0tg2NyGm7
         IVVSYApFakjZkoEov7IUvn3VJy6FrgGg3gBKWDsxVBZgKrEvaaorfbz1qTtzHWeyG8/5
         AwTHSW97ig3Lorw/+HGhU+I4wJLMgNxPwlAzuh4uvWnF9EEqxKeadmqA4wZ4yfp6FVC6
         LkzUTvhC63A3wB2HvWzk1/gjw0sMwweO5+yKL0tWlXglFpGxHBmF7P7TNZRvpJy8Vjrv
         Cfz8yrdMk8abPhK05BB75bruyem5q3uoMzgd0JmWlSqvUehdvRcZ2tI7KAQ6/hsbaIrF
         kTKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971906; x=1728576706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8M94Szf86aflf7GYtGP4IFREoq5t6mzeSASTe2kb0E=;
        b=T1P25hdIEfizFaQTfDVJs4RlMMsjTmBeU+YeNJfyyuWkFLP2jlVi0cvJMH5Daj4Xvj
         o0hyfIK/aAYmD4uS7V13dIf6Q2rC986J+2ysbmBcsPXzpANek5jhk16umjkREwRGFql4
         lMfaRvx7WNoY2grTNldDl9/FCopXLJVTq6sbwlqynM3im6by7qGwYlDsyipkQU5pR7Zr
         K7zz15DoH3fmrgXR4BwU9U1VTchXChPrO8lHLfNE4LeNPeOxcAfKY+8bP03igC/Z7U5o
         cGyQPn4SidP7A8YG6BElkjJhtwdN319JZHcBK9bGJUOQrfcCNWUwd8RBk7vwmYOjI03T
         jSXA==
X-Forwarded-Encrypted: i=1; AJvYcCXk9CYECizj0aGFqcu2NRWQq/1czAHUvZVcRsX4hMno4/fX836TmMnJyz1iqVeKcQwmoNSd@lists.linux.dev
X-Gm-Message-State: AOJu0YzW0Vs8OBL3UF3/a7s1R5B1l/6juGvhoyg5LcTMAeGur+LJ9XZH
	aG1S6LbT49IG2wnuRzu5+dviuc3Ey+ZNQDiKcZBlKTZqrXks+zMFqe6GpSOEUFZ96RRccSdo6xA
	dFaGDDZhEPaOq4zNgq4nYUZ3LGAcl+zzRHT2S
X-Google-Smtp-Source: AGHT+IGsVwokVwDnq0q9EW2iHbb+PYH+PmCbmotDyShkoPWSykbINIhoAZtW8xfR6197nX/vMfmDWCNcz9sMeU0B/yE=
X-Received: by 2002:a05:6000:4009:b0:37c:c605:218b with SMTP id
 ffacd0b85a97d-37cfb9c8d6cmr4943794f8f.35.1727971905843; Thu, 03 Oct 2024
 09:11:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <CAKwvOdnS-vyTXHaGm4XiLMtg4rsTuUTJ6ao7Ji-fUobZjdBVLw@mail.gmail.com>
 <20241003160309.GY5594@noisy.programming.kicks-ass.net>
In-Reply-To: <20241003160309.GY5594@noisy.programming.kicks-ass.net>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Oct 2024 09:11:34 -0700
Message-ID: <CAKwvOd=CRiHitKeYtHH=tmT8yfDa2RSALbYn5uCC8nRq8ud79g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Peter Zijlstra <peterz@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, x86@kernel.org, "Xin Li (Intel)" <xin@zytor.com>, 
	Stephane Eranian <eranian@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 3, 2024 at 9:03=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Oct 03, 2024 at 08:51:51AM -0700, Nick Desaulniers wrote:
> > On Thu, Oct 3, 2024 at 8:42=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> > >
> > > On Wed, Oct 02, 2024 at 04:34:00PM -0700, Rong Xu wrote:
> > > > +6) Rebuild the kernel using the AutoFDO profile file with the same=
 config as step 1,
> > > > +    (Note CONFIG_AUTOFDO_CLANG needs to be enabled):
> > > > +
> > > > +      .. code-block:: sh
> > > > +
> > > > +         $ make LLVM=3D1 CLANG_AUTOFDO_PROFILE=3D<profile_file
> > > > +
> > >
> > >
> > > Can this be done without the endless ... code-block nonsense?
> >
> > Dunno, I think it looks pretty nice once rendered. Makes it
>
> It makes it absolute crap for all of us who 'render' text documents
> using less or vi.

"It hurts when I punch myself in the face."

https://docs.kernel.org/ is where we point people to, and what we
should be optimizing for (IMO).  Jonathan, do we have a policy about
using code-block consistently throughout the kernel docs or not?
Otherwise, this complaint smells like "non-technical non-sense" to me.

--=20
Thanks,
~Nick Desaulniers
