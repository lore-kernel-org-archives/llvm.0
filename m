Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6575214037F
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727258436; cv=none; b=SsogtfO7Aqjj0EvNp9XZFHxSQlCzEEVnsF/7l6c/IXzO7y4drOFeMn4KS6JpLGhKWeS2lx7qK7sfq0uqe84/Rankxf4K4bq1tqtf8Ru53oheXXVQfDcBkDZ/uQTFM5wLjdPIERpG7Dv1S2x5PeontTLrh2u0T2jcFPyeiVxXAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727258436; c=relaxed/simple;
	bh=pJ2juEFqj+48bXu5zvFqiWfX3lEeexWtmQCXqHMpLug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m8GRwB/AolRQPvMtc4RBJymZeFAdOdtNNuFnR6I0gcx8wPBHIXmPJTf3Y2Y/Fe343i56B+W7YDv69qj2wpC7IUQfQPKKi4ELb/Bq1mpQjtLkZxJc07g2Es4aW2OFlLMSPCBnTbeH1M12nKxo3ppz69tfs8DhNC0MSOM+pvMixZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CazRLJSw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CazRLJSw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c3400367so5792515f8f.2
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 03:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727258432; x=1727863232; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzoOml1YCYEgfJn8QSXq3DVawdpDp//KSF0cYbIea6E=;
        b=CazRLJSw0fRqj6oKFVOYX8ZaZcK8D7+eE3dCTRpOGeimHuAAP9WOBS2ArvYt7u3uUt
         yW1dr9LnZY43kiW2D74aLu0YxKEJMofFkMjP1OJoVqpynzseIdjbyrrdni26yKVmTM3R
         f/S7goD8gSunem4jmqzxiRq4frO2MntwbgH6P6KZPW91xEqezZu7hugo0djJyGddLQcM
         2j/wPJjmMKQ9BYZ8G1lx+epqhQZalbGpug1+MercmUoqlNEIbG49pDq4lA3s7qUEXbxG
         NSow9aMucooDHvXVoVZVvJ0Jp0xPRQnv5wTpZBa7bmpZSz2dLf8uDH9HpAjMTxVxw84B
         Wcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258432; x=1727863232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzoOml1YCYEgfJn8QSXq3DVawdpDp//KSF0cYbIea6E=;
        b=c+xCgtinjPsUPNIXWb3wMzbYTOhN1QnnkCUf/g+cz+hYRRu6i0yCiIPQFc95oPOI29
         EzxKkdlEsJ+jnYAgbCVp5rmuH9Pgo5jg53QmilIZH326j2+dgLaCeEhIlF6z1ooNSaGT
         w1bKYXVOMLyIJr15j8opsYwjXLXwEYi5VjnKpcegqNVTkx+JaanvZokf8qwwpCF44jtz
         sqHmQxpBchLdLrRG9c3oEWiePxjSqM0cf35sgjRrO4z+BvWMaYGkX0Z9iiILUnQgs+dE
         MhKRTDaf0vZkbtVHbxgMF7TfuLhIbcZt+SYqiSOl5fEDpHMsHR0DizBioezSSgkXvS+3
         2Rrw==
X-Forwarded-Encrypted: i=1; AJvYcCVriVqPpVxJZS3FN7MW5LZXlo12yVrNcix/RrU1uiHInSVBS3uG+JefjO21gyj/7+RgQudx@lists.linux.dev
X-Gm-Message-State: AOJu0YwBIStG/53okHfjwewfxwI5i+fHSocSczhGyE7iib4+LaT/Wyg2
	hwHp1eJk4jIy+MVWPsZ8VnvoTp87B5HVnFN3homaL04VaWCJASId7nS2Oh+E+ZpNAdHY2W4In6G
	wMJyivVng7FyRCahY0IWilv5WZl7LeA4icqDp
X-Google-Smtp-Source: AGHT+IGKx3uL22uVQI6NHByefGqy6iXJLA73m1W8DO6NEIobANtIbLRvc5jJ2Ew/h8x1OdttDYdjCDqwhHlO027Qz2g=
X-Received: by 2002:a5d:5547:0:b0:371:8dd3:27c8 with SMTP id
 ffacd0b85a97d-37cc246a5cemr1937135f8f.23.1727258432326; Wed, 25 Sep 2024
 03:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240820194910.187826-1-mmaurer@google.com> <CANiq72mv5E0PvZRW5eAEvqvqj74PH01hcRhLWTouB4z32jTeSA@mail.gmail.com>
 <CANiq72myZL4_poCMuNFevtpYYc0V0embjSuKb7y=C+m3vVA_8g@mail.gmail.com> <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com>
In-Reply-To: <CAH5fLgheG47LdgJGX6grHXL6h08tsSM1DACRkkzQk_1U8VAOxQ@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 25 Sep 2024 12:00:19 +0200
Message-ID: <CAH5fLgj7E03DKBcptgmZ8SLgco=Qs4puO=O6=v9=-3SSuqJyUQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Rust KASAN Support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, andreyknvl@gmail.com, ojeda@kernel.org, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, dvyukov@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:26=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> On Mon, Sep 16, 2024 at 6:47=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Mon, Sep 16, 2024 at 6:15=E2=80=AFPM Miguel Ojeda
> > <miguel.ojeda.sandonis@gmail.com> wrote:
> > >
> > > Applied to `rust-next` -- thanks everyone!
> >
> > Also, for KASAN + RETHUNK builds, I noticed objtool detects this:
> >
> >     samples/rust/rust_print.o: warning: objtool:
> > asan.module_ctor+0x17: 'naked' return found in MITIGATION_RETHUNK
> > build
> >     samples/rust/rust_print.o: warning: objtool:
> > asan.module_dtor+0x17: 'naked' return found in MITIGATION_RETHUNK
> > build
> >
> > And indeed from a quick look the `ret` is there.
> >
> > Since KASAN support is important, I decided to take it nevertheless,
> > but please let's make sure this is fixed during the cycle (or add a
> > "depends on").
>
> I figured out what the problem is. I will follow up with a fix soon.

I posted a fix:
https://github.com/rust-lang/rust/pull/130824

We'll need a check on RUSTC_VERSION in Kconfig for this. If the PR
gets merged within the next 22 days, this will land in 1.83.0. Would
you like me to send a fix with that version number now or wait for it
to get merged before I send that fix?

Alice
