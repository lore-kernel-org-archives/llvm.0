Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6A41206
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 19:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707764652; cv=none; b=E9VA0rxX/HYFM+6svQiWSzp3ITYABZ5tvI8eMm0r4AmpvgWjC580Iuk21O3ghavXW11pTc+POn6uMkA/aJAwmVG4d0uMRbd/duWHS++5w6xGxzZsvodZmFsnuo7FoyWzOl/H9u/ASAx9nTO6k1+npIeqsark+ACGHbssBa+Euao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707764652; c=relaxed/simple;
	bh=XzCqnLw1+99Zw8U3ViYnydrnyF7SQJQlIabSysNhMG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H09xPhvKy+PhykWF1ZNy0cTsG6yuDszsztuuv9P908ScJWgfmzHsGvslEZ8HGz4+/R4RY6A5eIANBNJEbeE9xJPbbrTJoYaRycWuHxSzkT7etSZo2hhFQPQ+bKx61TQJuFrMtwWjVyfpqDWbqIByzharKW6obMpyJXn8KrXg/gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NNcm/id1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NNcm/id1"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a29c4bbb2f4so460801966b.1
        for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 11:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707764648; x=1708369448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzCqnLw1+99Zw8U3ViYnydrnyF7SQJQlIabSysNhMG4=;
        b=NNcm/id1QpThz2ZoHKclcjNhlOtstrSVDA/8r7ILA1EOeBMG4Q1/Bfw2gsov9S+AqI
         CQ9RiuruCuUY0zavyynOIAyGSImbVp6gQoz1pYjVcsKUxJRUktd5XxmQKCsXVvPxqlF0
         Rj6yp/pPBuFVcXqo1YQyqz4733d8ut9++xYPd11u2j3Xc0s42J1OAB+l64nx/G7drbyf
         7GZBxiIEcRJEZP4UtH38QbhQVxIPvsnk290ydvo4wAxozQLQtEGQ9Np1C2lqv3xpfbWp
         ThJT+aYsUJeBFrZHYc8eDYdJK1S1uvretOU7I+Byv2J0VUNiCRYjmqxICz3GIQQ1dfDf
         hrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707764648; x=1708369448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzCqnLw1+99Zw8U3ViYnydrnyF7SQJQlIabSysNhMG4=;
        b=NA9fdyGoMYS0/TwLI5410PnIcrSjNRL7aRfItsyNbeGtmjNbZRs3yaLdH5qYXK6p67
         meDfC75u4CSFASmNURS+mSwHeV0DT5RTL9OEJuT6KY10nWcWi4aFLHaCwBoKzC7O9S7Q
         fCl4j7NnhBgba9Lr9HtaQo6icAMy6EIL33vE2ozrfH8X1WoTTez9xTR2p9a87+yM6ysP
         sskxJdrlLpuB260FPlvshVy09hmbMNFBBoxMrE3RngFqT0Hv2hv+tkrko78M/EM792CW
         89IIzR8gUjmYA4IS3ENURE/4ZnerYhOkZLWSWAkBu8qLI2wVX8nBZmoEiYNvxxIQ96Rc
         W+qg==
X-Gm-Message-State: AOJu0YxbY/9STHENcUVpPI5eOeGtS1nycFv9F8YaWZkjx9m0Ibeyweht
	Z3OVQ9VGHf5KTXuOjjmZpDKu8YuRpSL5VF6IoN5H9bGbguCDoRRlxdSRSIovaYHoxdtgdxfxz2Z
	HoxEWFVKN10fdc7MdUiNpasyX6dKYrOPPVtIx
X-Google-Smtp-Source: AGHT+IHnLHXZNcbMXm4/pyV9sKf1lkpL3ZT5WagZ+5/aVIbKJQcmollNZSQjHxCY6hY/l4tsQS155BB4J/oVAOoGvcU=
X-Received: by 2002:a17:906:4ad8:b0:a38:576a:f070 with SMTP id
 u24-20020a1709064ad800b00a38576af070mr6189593ejt.32.1707764648413; Mon, 12
 Feb 2024 11:04:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
In-Reply-To: <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Mon, 12 Feb 2024 11:03:57 -0800
Message-ID: <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Trevor Gross <tmgross@umich.edu>
Cc: Conor Dooley <conor@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the late reply. Sami might be the best person to answer
this, but KCFI (not CFI) tests are lowered by passes that are
architecture specific (see https://reviews.llvm.org/D119296), so we'd
need to add support for RISC-V. There is no additional work required
in the Rust compiler besides enabling it for the new target.


On Sat, Feb 10, 2024 at 12:13=E2=80=AFAM Trevor Gross <tmgross@umich.edu> w=
rote:
>
> On Fri, Feb 9, 2024 at 9:18=E2=80=AFAM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Sat, Jan 27, 2024 at 02:46:38PM +0100, Miguel Ojeda wrote:
> > > On Fri, Jan 26, 2024 at 11:01=E2=80=AFPM Conor Dooley <conor@kernel.o=
rg> wrote:
> > > >
> > > > Is that even needed? We already have ARCH_SUPPORTS_CFI_CLANG and AF=
AIU
> > > > rust supports it if clang does, so a second option is superfluous?
> > >
> > > From a quick look, I don't see it enabled in any RISC-V built-in
> > > target in `rustc` yet.
> > >
> > > It may also still be the case that KCFI needs some tweaks for, say,
> > > RISC-V, before the flag actually works, i.e. we couldn't just test th=
e
> > > flag in that case -- Ramon: how likely is it that RISC-V would work i=
f
> > > KCFI works for aarch64 and x86_64?
> >
> > Well, there's been no reply here. I'll do sa you suggested and add a
> > depends on !CFI_CLANG to RUST.
> >
> > Cheers,
> > Conor.
> >
>
> I asked on Zulip and it sounds like Ramon may be out [1]. It
> _probably_ works, but going with a dependency to not be blocked on
> KCFI is probably reasonable for now.
>
> - Trevor
>
> [1]: https://rust-lang.zulipchat.com/#narrow/stream/343119-project-exploi=
t-mitigations/topic/KCFI.20on.20RISC-V.20questions
