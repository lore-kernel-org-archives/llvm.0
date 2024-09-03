Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1D118E043
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387439; cv=none; b=QvNY0L1uqrfQun3/N/mYTk70fyFgVjcOdflXRj5o8aHPKqLWFF/5I+wKihfb2jqSbYZuIpRqlYogv+PUKKdgkixSIEas/mu0bYch4RF7RtqvkSSeA7+2fcEUdOSg9j5WpiuAdnNfTPNayTMMwcwsZv5QAHyssK0twqZcVUC/vMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387439; c=relaxed/simple;
	bh=72SwK870brWuO+1H7M3ZgRnMKAN3mk5VB6H1CyKczVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=glfAPuT0mStrDuJdUktejeWm46u/JYnYuhFBU57Jw96pabtztcncZQfXCAVOzj8nPuPoM5nhevEPHmkVZ5aS1hFMHh3JnjwHTF2pEzQM5MaRnU+fOM/bWaKwMkZYwcwtwnnVMo/AWBeyctQTFD9nErAbvx4wnBXYJXbSTu4LGD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxTOx++9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxTOx++9"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2d877d937efso290026a91.3
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725387437; x=1725992237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCRq6ERVuiYfqPwMIYcT8lbPZnFxke33M5BuFbK5HIg=;
        b=mxTOx++9weSFWCodjcPVqvtbu5LDvTkeGy3z+jn2JGHkgSzRNpOLUB/Y1gnEsSYbZI
         KZNX5WEzipdRMNCl6SVZxuT6szG3hwgaEniAYKO0UABuXlP8tSeApT13mBJ18d0wuosL
         PZNOLl6i6bB9uiEAoltr5gV0TImT/xu4mQ9mv+W6JKRq45HMi5U8B2FCXLWCi1tk1s/a
         KS5kC36cs1eGq8pwKR196wYJl+2jAUuupL5HS9nSgea95YxMy4otHEfJB1Dd3eR+vunL
         qEcWNbJzIB0/6NE3AA2d3V+RlvSgJ5ROVavD4XlSOgB9GL13MN4yQ2hNyoxQlcDUNboY
         ynIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725387437; x=1725992237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCRq6ERVuiYfqPwMIYcT8lbPZnFxke33M5BuFbK5HIg=;
        b=DAK8pFDXv8QboEyKRLzOu0rHsppfxAJkEXh71jPaf+WRkWgqrJxZIT3e/KqziAgQv1
         O/9WkR2ZVXjuK/MavCL+HTgEbGFwYK4aWbulzEMF8uP86K7JLzIBFpbfy1phDM51JMfs
         Y49uw1jgJg7MZRpgUe4IOB29bLKX9DlGJLJzM+weuGhjvkfG032qAHTgVnJnYOpDr6Eh
         cmAVugtBaGWVJj1Abs8X0M7Obg38UTLzsUBUb6GrP5KI81e+/Xy8Gs/du93KijaSXsc3
         nMHk5PKTbqdHMbOf8Ipaad1wgap7OizhHnhbL35gJjE1kb7PAggZAcIo1zEIkYTQyenn
         SM3g==
X-Forwarded-Encrypted: i=1; AJvYcCV/l8SNwhHAvcDFli+i5qPU7wWLyz4piSeAZs/vmFPBizBYe1k9unJVq+Xfbpx0WhMYf9kQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzuCOdvtHHxN2jKbTi3lrY8h95xd9pYUm1dVWb6VpSpDFdTfwOY
	VbgTtsdxTgMEyjP0Lez/LLehALi9ic6rRjo9o431bGse4cKOUnCKZmOhK++TDBtdOv8amFxdUx4
	v6tvR7ZRT4jdPunJjfZv2qyyelns=
X-Google-Smtp-Source: AGHT+IG32aDLtHKi6AhxBeXK5jquJ2AWi/0PseceBjRwkozuKShq4rru0SzsbIiSg4LmaHN2BLYJYbySTLJ6lDehrcs=
X-Received: by 2002:a17:90a:ee8f:b0:2da:5aa5:5d5b with SMTP id
 98e67ed59e1d1-2da5aa560f4mr2043322a91.3.1725387436834; Tue, 03 Sep 2024
 11:17:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com>
 <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com> <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
 <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
In-Reply-To: <d9591a84-9a0f-4046-9b2a-437061f6882b@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 20:17:04 +0200
Message-ID: <CANiq72m5iFcqRU_qdUCZkoV8ayPhtQQq3TTEDRUYfMEsnNqTDg@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: Enable for MIPS
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-trace-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:53=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> Thanks for your review!

You're welcome!

> Triples defined for MIPS bare-metal target is surprisingly lacking, we do=
 have
> little-endian 32-bit bare-metal target mipsel-unknown-none but big-endian=
 and
> 64 bit variants are missing.

Hmm... Sorry if this may be too naive, since I have no expertise on
MIPS, but I see some triples that match the LLVM ones you specify in
the patch:

    rustc --print target-list | grep mips

> Also, those triples all assumed +mips32r2 as baseline ISA, but kernel act=
ually needs
> some other ISA variant features.

I guess you mean you are getting the warning about the
unknown/unstable feature passed to the backend? i.e. `rustc` knows
about those LLVM ones and forwards them when enabled via
`-Ctarget-feature` (with a warning):

    rustc --target mips64-unknown-linux-gnuabi64 --print target-features

So they would need to be added to the list at [1] (or targeted flags create=
d).

Until those do not emit a warning, it is fine using the `target.json`,
but I wanted to understand if there is something else you may need,
since we will need to eventually avoid the `target.json`, so it is
best asking upstream as soon as possible.

Thanks!

[1] https://github.com/rust-lang/rust/blob/d6c8169c186ab16a3404cd0d08666740=
18e8a19e/compiler/rustc_target/src/target_features.rs#L368

Cheers,
Miguel
