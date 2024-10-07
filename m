Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43219154C08
	for <llvm@lists.linux.dev>; Mon,  7 Oct 2024 19:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728328927; cv=none; b=l74uJ9JumvwOcLqAV3EICNbOQ7J7rLtXzPtSQh0FTLomubKt+vGx4G4+6iul9imWnb1sQLFjDa3svUFUxLN4SinZt0GAq5IJOrNi/64oje1Sz70884+BRRfcNkst5PX1GYz4t8rr3GjO2vou40cQhPY7hQyXRTK8jaLJnxo2RiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728328927; c=relaxed/simple;
	bh=UBceWOcwbLap1fCOhukpD4Mo5RG5YgxK5J16S8Ai3Ik=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=trEwhT2ow3gxr0NOlBr7eUuG+br//MHvICUpKgQfUNHZgNgFLyUEhcgCoZ8oX+9V+Em8t43c7k3LRX787mb6AoHgPg4lCKweux8szRLMkGsryNfTdB9qT3f5aF/c/MJ7I/w6QPdN4MVAK13s9PZmh0d8awNrRCcMSgmnsGEDEVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tu9QUuyk; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tu9QUuyk"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4582a5b495cso56051cf.1
        for <llvm@lists.linux.dev>; Mon, 07 Oct 2024 12:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728328925; x=1728933725; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c52BAD3vzPw3xxGKfNNAH/Yruho8GrfSNRqDdGOTxvI=;
        b=tu9QUuyko4pWrTBbc90I/Z344RrnT30Jec9cMvSxQOIQlfja+eeXx3i0/cpROq440Z
         jzf+TjsKoJ8oDHJohLoh+ijphNbGFx5xB/2sVKn2Cvnw3/N4VfqyIKxLymK1lQtKS2tl
         YQkkXbC7hz90YYoGhI1r5AbVP2J7gUaCX9F2w6g27anLNprxTr1TMqwDrk0JlU/RgkHn
         zRhIJQOs4T3/s19tUPHdAfA6mCIicdiV69qyr9uyzycxeRQQgrhBhSJ+VDidx+ErRm2m
         TCs3svDT2EmywpoqrSiU/BNJiHC6Q2r6BCWs56rDiTT6Z8gTqJM246KgqAQhyR7/RGbv
         K7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728328925; x=1728933725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c52BAD3vzPw3xxGKfNNAH/Yruho8GrfSNRqDdGOTxvI=;
        b=AjXvggw2dbV68rDcMmu3aS2x0sSxC3e+BOWbKHhof5Sj/W9z0VG316nbX45mtrtR+d
         MS13br3iLXlSaWWKJPxMaddU+vuBQT3GxTihk+WOZ654DsZdIQQDUMtpjPIuiglOAiCs
         cGkrxLofeTNyYHSqI3pOv9298PvfCp7icEdkZJGrDau9pot5/fVq5ABo+58r4MRhGK3n
         8QPgb06jfhtKmDzrRXbCe7S3GXbAG/OlIYhXa/qKoWS2Xcjz6i7RjS36rajzqHdL2kud
         0ibxMN8HHEAv/wxdE2Nvvt1/M24t90FIsE1wvK+Babi5REbHz9l6OSOltjI8S+ibAzdX
         ksRg==
X-Forwarded-Encrypted: i=1; AJvYcCVuBK3xcyTyfDUAchmQVuLoUxqb9CGUtJeZPS2wV62o5auPAmCKKiEYF6P97g2L9YYwYONG@lists.linux.dev
X-Gm-Message-State: AOJu0YwWXy+hmUt5nwJQztXiG/1xg4ia0OtmJcI4+vh6NB3AKH7qP1Fh
	zIUV9Ib1InsyLk+poZ43ff9LFwLRMKvoKbO81hOPC+Drb3EuEWpy4ZgYQGpgK1i4JwZN1w5kawO
	ZBQEe3eNX5vokowHLejSw8ncw6N1jrdBJiGXp
X-Google-Smtp-Source: AGHT+IH7a2e4lsSgI4DFA4CW4H450JT8FmNGOQK1jt/YIR4/ypVzFlvPFzdBRbm39KDlJueZQ9ohBhaDeFALD+cZzbQ=
X-Received: by 2002:a05:622a:458b:b0:447:e59b:54eb with SMTP id
 d75a77b69052e-45e173ab174mr577261cf.26.1728328925088; Mon, 07 Oct 2024
 12:22:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241002233409.2857999-1-xur@google.com> <20241002233409.2857999-2-xur@google.com>
 <20241003154143.GW5594@noisy.programming.kicks-ass.net> <202410041106.6C1BC9BDA@keescook>
 <87setapq4s.fsf@trenco.lwn.net> <CAF1bQ=S7HfvXw+hczmQrSYcBf_DHsZo2k59JSL8T_9J9HitHuQ@mail.gmail.com>
 <CANiq72m7dkcy=0+ut=rM6Heo4tQSNyUrejBDWCvtwGQVVvLhWw@mail.gmail.com>
In-Reply-To: <CANiq72m7dkcy=0+ut=rM6Heo4tQSNyUrejBDWCvtwGQVVvLhWw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 7 Oct 2024 12:21:50 -0700
Message-ID: <CAF1bQ=S8PzBGDy1uF+4GrvoVtMSFjUjeByhLmqSdY_zDEyY4=g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] Add AutoFDO support for Clang build
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Han Shen <shenhan@google.com>, Sriraman Tallam <tmsriram@google.com>, David Li <davidxl@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>, 
	Brian Gerst <brgerst@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arch@vger.kernel.org, 
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

On Mon, Oct 7, 2024 at 11:33=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 7, 2024 at 8:04=E2=80=AFPM Rong Xu <xur@google.com> wrote:
> >
> > I removed the "code-block" directives from the rst files,
> > and used "::" suggested by Jonathan. The rst files themselves are now
>
> I think it was Mike.

Sorry for mixing up the names.

>
> > (1) The text that was previously in code-block no longer indents. It al=
igns
> >       with the preceding text, regardless of how many spaces I add.
>
> Did you try with a tab? At least in Doc/rust/ all those three ways
> (i.e. `::`, `.. code-block::` and a single `:` for indented non-code)
> seem to work fine, e.g. the following document uses all of them:
>
>     https://docs.kernel.org/rust/coding-guidelines.html

I looked at run/coding-guidelines.html generated by "make htmldocs".
It has the same issue
of indentation for "::" text. I also tried tab, nothing changed for me.

-Rong

>
> I hope that helps!
>
> Cheers,
> Miguel
