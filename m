Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87688608ED
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707854935; cv=none; b=AIdgzBwTqdEAMi4X6JkZlItcGpaRnFvusZJD5rNrhzVrZjas2BnJ9zInoeC5SbugJbV5JD/dZNaVTgzZ97RhsGpZ8EObF2Nzm+9oYKqymnq6b6odLWcqjwBzmPgL4ajF+PuWY1cUZAZkUCpLnJt8ceQFd8MXUsXop1qfPZDQE+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707854935; c=relaxed/simple;
	bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J3AFcdtIwl8yYvpi1jmaRvcGJrval1ib0ZBWT5EhmXVXIyHBBK3sMbBYXuxqAX7aTD+zwFdAJpQoCJ3hgDJdLpvOY6FiRNBUux45gbwIYAeKghJOjhsD8NvVST03lSJHbfHdS+TtM+vqA3QbpHYbT5z6mhRFU1vetOBzcVrd+mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YQIu2DF2; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YQIu2DF2"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5116063585aso6091213e87.1
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707854931; x=1708459731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
        b=YQIu2DF2YCCx095ZOdCGnEIrR/ovaJOYY7HcukDn4poYuuJIGuN1dPg2oJeHDuZMJ9
         qpT4f+TJK+DjCDvoDWpbqr8VOQg48paVk2e1eDuiuv67+VyFdBeyPHmiQj3w1PPwH2iv
         ignEwizAgkiYtReDdOIHR4nDkozUCqfTI8zoDieF8dQrPJkYRwlNY1JkhcEMlvCxzAhg
         eQ6KKYdFlfIM2QmsbXfcjMRKYulQwDgI8a4oPGqQ8FP9RPV7Nbjny4Akd+8KBf6N1bmn
         MPyhSh4ucnjtwvYCRUHivX/R9qezloAEb0RiyS1NM//jK+bHU+CFY6F2G0obH67kSSeo
         nyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707854931; x=1708459731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cpamOG71/GOjbb277hAjAxNKP85thTjz3Ni8mu6y5O0=;
        b=tj/5hvJo9o2r+ZWNaYMphxlGoWnT0LVeOE+8npH4O09Nj6NEf89d3WHpdK0PKUhPEa
         PpcOPiLOqrpVu8u5038LHinY0zS5ObF6C+TUia3KkdiyeZsl9lwKDXgxjCE0fsbQRiuD
         b7hDTJNS1agMRcZn40e2tniU6pbdtKATiUwY18RZOcv6Qu6yd8zme43/THO7XLNRNVYw
         M9yKaGKsBLzfQEBa4gJ95TeOGZbiZV4JJLRla0z+AFMG5OtYJLz+oPX6mYvqlrbiF59Y
         BkTtRPuzn8K0VaaaAWVqE/yPQRHIs27idXdK1g6/JjzJbcEEeblxQ6Df+z+TRH9xF8ot
         +l4w==
X-Forwarded-Encrypted: i=1; AJvYcCXne7IZS5RpaOmt8ycD4agJV/Rga7njfB7/qeCp3vn2p2ihsWcujDvmaETGDgouB/B96bThCqDOb4HjhwBAbFoxmIU2ZQ==
X-Gm-Message-State: AOJu0Yy8IqoPtcdGffpmsmf5iJZe7wJD7FeH1NsKnEZdkulmigh0yhQO
	tHMIBVkfWttbcMERAlR8Q8q6X4qTxxR30aTUxC4Y/Cel/lXHEj04nlvWyIh4e3GlJ9s8hQ24YhA
	x9ABad2liLi3GNmbynrx7HRnjGPXMN61bjEr7
X-Google-Smtp-Source: AGHT+IEksRyiaHyX94m2jOEP9ui0B6orCI/t9VG5pKeC7bcLR1MRBQFg7mMD33nHbUDo0Wqb4aI/q/lCjH6E4TshwlQ=
X-Received: by 2002:a19:381e:0:b0:511:9f0d:633f with SMTP id
 f30-20020a19381e000000b005119f0d633fmr342293lfa.14.1707854931315; Tue, 13 Feb
 2024 12:08:51 -0800 (PST)
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
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com> <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
In-Reply-To: <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com>
From: Ramon de C Valle <rcvalle@google.com>
Date: Tue, 13 Feb 2024 12:08:39 -0800
Message-ID: <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Trevor Gross <tmgross@umich.edu>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 12:36=E2=80=AFPM Sami Tolvanen <samitolvanen@google=
.com> wrote:
>
> On Mon, Feb 12, 2024 at 11:04=E2=80=AFAM Ramon de C Valle <rcvalle@google=
.com> wrote:
> >
> > Sorry for the late reply. Sami might be the best person to answer
> > this, but KCFI (not CFI) tests are lowered by passes that are
> > architecture specific (see https://reviews.llvm.org/D119296), so we'd
> > need to add support for RISC-V. There is no additional work required
> > in the Rust compiler besides enabling it for the new target.
>
> LLVM 17 added KCFI support for RISC-V. Sounds like it's just a
> question of whether rustc uses a new enough version of LLVM then?

rustc is using LLVM 17 since
https://github.com/rust-lang/rust/pull/114048, so I guess I can enable
it for RISC-V targets in
https://github.com/rust-lang/rust/tree/master/compiler/rustc_target/src/spe=
c/targets,
and the Linux kernel will get it on the next compiler update?
