Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8A1BC49
	for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707552800; cv=none; b=BLfxoGJQP/6V75i5oav9WXFbUllmMM6Cp+22s/g3zNmnJnKG9V3UlB1SYlKLEvaAMG9d5ILpqA8shrDOS+QyDCHmzB/9fJPJ6S0NsGUzZndf1e+CUHKlOLQJ0K83Vz7VG2YWGh/nYjF9nmcvMVVQKuZ+Rn6Oh9komUy8/a0407w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707552800; c=relaxed/simple;
	bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tzR6ZFGgZW/QSje05u5cyZQcJNCESvskfXdAMANMWeHvBRiwdDJWG0sYz903aR2Ep5f/7/dC0m4XretARdc+HNwJERMLaKac6KcHFBNlY2DkWdujpJibtrpWyfkP6zWLDD7mWhWXf2mVYZyVI9tCw5IwtxXt00hjpnsVoNXIhq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=VNcjQqnf; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="VNcjQqnf"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc6d8f31930so1336919276.0
        for <llvm@lists.linux.dev>; Sat, 10 Feb 2024 00:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707552797; x=1708157597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
        b=VNcjQqnfMF1X1xz7GrCS3i9N+0IIZW6i3GYs2VM9NFQjMvxBqTX2GAX9Sg0HVhuBwK
         s6CfFpSd/sEcA6vqpY8Fe9k6v0BJ8/kQIbdTe0l4ozideTCj4QLmMG7xK5EeSHKpvPlV
         DQ5js4q1uus3LICt0muLnUIEBllnizNroiVOQlSqPydx/RZn0SrL8BzkrrYY51jhmwhD
         itS2Zgr8NwxDI8WPW7ivm78JY5T1/guQwFlqd2NzaBvzpCBVWZGHMghkxl07Nocl+0Io
         XGul20CdD0carxplgXPdbz0hz9O53lFvpAd47zxK8VwTCk38LF/GyM2t/MU4i1jPFala
         A6tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707552797; x=1708157597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Glo99Q4rZ224bZIULXqWRKYAJ1UBUwAAGaeNDMYK3aY=;
        b=wBehK7f6fYARMwAFjA+tRx7Q6X+Y+wzbN2mM9pYUPTKC3qvI+sHXuKfM9snOp1r48y
         +6MrvPLOfFOaKjVNpV+qrjUEM4x11K1ABkLzXpRZHuz3kiJyt3TkUmjwgVVVi/sLQVdi
         djWCpBVITFZ3P3zKgvIhjMsQBhBRiEzbeoVHkkoq71tHwbdKL5Ydu4bwonAshpFZLtIX
         UjC5lS2QWMrbKdt0t3+EqiSG9OOdqPwH4b7gtjw4kLiS+gTd/hfSVM8Xo4I7aVmK+C69
         lDaq1p//p2sw9sAAXN1IhlxcGeQ6FiCxZspv03VEL/ejrJEMRsp1mb1xm3DgUR0KUFjl
         al0A==
X-Gm-Message-State: AOJu0YwPnLiVnU0hjucD7+DM2jrcBWg4JNjxHudfIWpD8fWdDZRKy0tk
	0Ou95BzNHyI0LUcxWeikbxJlKA7K7d6NIhLjYsveOD05A6bD3/TyS87VPd4GLPvpYgbkYY/nFJY
	dnLv8uYhbUcUrrbyttqY3UbnkrnHYhuJEvBrz2w==
X-Google-Smtp-Source: AGHT+IF4tUvf6ttwQdM3xfeC1VlLijJBFO5NkKyzXeExzVFNvP7Fl5D8PP7Tfno5g/OaAlhCpe9aPfGgUUtsjZouSLw=
X-Received: by 2002:a25:7c02:0:b0:dc2:201a:7f1a with SMTP id
 x2-20020a257c02000000b00dc2201a7f1amr2506701ybc.30.1707552796867; Sat, 10 Feb
 2024 00:13:16 -0800 (PST)
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
 <20240209-rage-keg-1b2982cd17d9@spud>
In-Reply-To: <20240209-rage-keg-1b2982cd17d9@spud>
From: Trevor Gross <tmgross@umich.edu>
Date: Sat, 10 Feb 2024 02:13:06 -0600
Message-ID: <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 9, 2024 at 9:18=E2=80=AFAM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Sat, Jan 27, 2024 at 02:46:38PM +0100, Miguel Ojeda wrote:
> > On Fri, Jan 26, 2024 at 11:01=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > >
> > > Is that even needed? We already have ARCH_SUPPORTS_CFI_CLANG and AFAI=
U
> > > rust supports it if clang does, so a second option is superfluous?
> >
> > From a quick look, I don't see it enabled in any RISC-V built-in
> > target in `rustc` yet.
> >
> > It may also still be the case that KCFI needs some tweaks for, say,
> > RISC-V, before the flag actually works, i.e. we couldn't just test the
> > flag in that case -- Ramon: how likely is it that RISC-V would work if
> > KCFI works for aarch64 and x86_64?
>
> Well, there's been no reply here. I'll do sa you suggested and add a
> depends on !CFI_CLANG to RUST.
>
> Cheers,
> Conor.
>

I asked on Zulip and it sounds like Ramon may be out [1]. It
_probably_ works, but going with a dependency to not be blocked on
KCFI is probably reasonable for now.

- Trevor

[1]: https://rust-lang.zulipchat.com/#narrow/stream/343119-project-exploit-=
mitigations/topic/KCFI.20on.20RISC-V.20questions
