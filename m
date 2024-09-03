Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256318E367
	for <llvm@lists.linux.dev>; Tue,  3 Sep 2024 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725385463; cv=none; b=tHZE48avIn1dNJns8GCOseGBDjb46qliMbOeZdXMLJXx437mZqtX2U0zrubPmnme5i/NtKxtct+nZtspesGk9Hm3vNH78lYpH6TXRLJ2UtOYFo/BVp0c5hk0oiuq2y/LvWFFe0bht6L6Bcg/G+ImgYl+ZqvJV66AUnw7yeMXWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725385463; c=relaxed/simple;
	bh=DzpwJQwOT3F0kC0YR4xC7AP8eabN0PyPAbZ0DqFkPfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lSyZ3WMDy4B/gqYRKLqcHOWcvEv68ltdbgsUm/IT86oyWYmhtbfHcIg3rlg/5UHfr3aB6jucYP8vC/TsYdvMCI/GecM6od3ll7qES73FIi3z4nYHio00GvlUhvEDnIf4l6yC/mItxgMs1OZ+2W70W7aKFvr1rGZZAT1gHvoqboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuDRV/Fo; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuDRV/Fo"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7144135c842so293848b3a.1
        for <llvm@lists.linux.dev>; Tue, 03 Sep 2024 10:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725385462; x=1725990262; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzpwJQwOT3F0kC0YR4xC7AP8eabN0PyPAbZ0DqFkPfA=;
        b=iuDRV/FoqTkaPBgOoGQilQ5hQ+o21ZcrTVwxHFDX36kEpx2LZ7ZFMV5AB3BGY9ECB0
         2DFFHQOdN+mgg4KG8nlX0ylcxTkqjlLQDbjaMWYt5HrV0FFXlI+fqMmYMBaq1ieBmNbh
         p/IATP19biMXunJT4gWtvlQgx5CfWq4Owsm45BoeHAS34x2Z6kvma4XHQfNzpBT33dOX
         OmAGf3pECFj6WQJsjVR0GIjvkU3B3taio3JLfA8qbVwjf3EiwIaxKIWiDqP98gjVe8D8
         swklOGYi+EEdvDbZJMlUTolhTq8Y2AUkE0W62caJl3PeGOQAhb12NHahWwsOyvA2ZZOV
         VGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725385462; x=1725990262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzpwJQwOT3F0kC0YR4xC7AP8eabN0PyPAbZ0DqFkPfA=;
        b=UCU2uyXdcdBQtYg++YQJdr7+t8BNBlfzwI4lBDKrvNiBDxIHp+T6JzVWOEsn1vg9kT
         WYb/AJF0QU+hyHfZ1MDxM43/dC9eImmdxQ2mdDuGvrBQZeO+zOl4bjQru48f63ZyMLTy
         sGWuAYDnviw+rcglf8Y3OpHkVSHVZ24D/8qmF+epboxRA5AgvDGbcXJQqbXieWWmtC6g
         3cq0CGApz8vUjJXGA+8CHugltASyoBhFVM4zNzfNEzNjkKVJDuueyZO+p8dBF1d//W1f
         7Z96yxEib/wyGwx87kBgB8xhpawwPoqVeX+jPKreB7u2YFZr3DXrNCPaf7sbJMVpHRnn
         u6KA==
X-Forwarded-Encrypted: i=1; AJvYcCW6WbpQmdoslQwTuqT1OB3idBpb/Zf0SUO1uHvzlhUW2hD0ezXhkf9V1PUQBTlshFGTF75X@lists.linux.dev
X-Gm-Message-State: AOJu0YwKe0b0qq1E/tx1JgOHSX72oSQLrIdUKWp4UEjsHsDGPmVWCrrP
	WJxjsVPnjFCe38OHLr6TpDlTS1DJ3nuXjAXypw2/fvtcX5u7Tb2BTLSNmDf0wNb+D1ejy8nUa7l
	fYptxDP1EG0OvYWfqv8ZhGodqxS4=
X-Google-Smtp-Source: AGHT+IEr2msm5yg48J8o10JFNcKqa18Qf0QpuKetck9mzQgqKhHQ/7Pg+OEHdxchtehB6dyn3bXmyxfB4BSsSfVqxbo=
X-Received: by 2002:a05:6a00:1816:b0:70e:acd0:d8b6 with SMTP id
 d2e1a72fcca58-71730458903mr8460968b3a.0.1725385461577; Tue, 03 Sep 2024
 10:44:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-3-0fdf0b2fd58f@flygoat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Sep 2024 19:44:08 +0200
Message-ID: <CANiq72=z1yJm-B_ie=GfueOF1qksaSD9txgFU1YQo2tZx0qQPg@mail.gmail.com>
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
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
>
> We don't use builtin target as there is no sutiable baremetal
> target for us that can cover all ISA variants supported by kernel.

Since we should try to go away from using `target.json`: what was not
possible to enable via e.g. `-Ctarget-features` or other flags? i.e. I
see the `+mips*` features there in the supported list, and from a
quick test the data layout also seems to match, but I assume I missed
something.

If it is not possible, then we should definitely ping upstream Rust about i=
t. :)

Cheers,
Miguel
