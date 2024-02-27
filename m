Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B601B28D
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709037268; cv=none; b=uq0Jpeo65wfT7qXTp7h4wiYK5AKGI8SQ3dTUucZjmUiHshicbytDchTD5GsNlcw05cG8FwhAZKFU5I9ZVtLPly5YP8dPBezrW2fMsG8cdoX0Eui5Bo6FQe2juvYetg91NMgYAhzEwcw7cYrj/rxNBD+Dk2+/TUwE/xxCqo9oJA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709037268; c=relaxed/simple;
	bh=N9j9qlONozduTz+bniTZX4spLz7Dtuw1zBMBtIuIeC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7Ubj0NmRNuIj8p9DF3uQSh4ejSE5fSSjikLwZDOdADOXRs0VU7Z3vk5vDtcW9Z+JTF6VqLPeQidaeg35ZAShhJmyGfaUazi/ZPJ3Pbe2Y0ZP9dwLjx+XnS3g/AL3oS8QElVwt2/qkoMeDQOdIcWv04mRmO89U/4aqbYRYSTbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ3l/Fv7; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ3l/Fv7"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29abd02d0d9so1591677a91.0
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709037267; x=1709642067; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9j9qlONozduTz+bniTZX4spLz7Dtuw1zBMBtIuIeC0=;
        b=TJ3l/Fv7PIyY56BET60K+3mgnCpS56D7bvOuNtjd81yTej7N+zFbdxGg1tUCU3o/aW
         QAkM6wH2PLAsCW/d6u9e4yospfNNt8IY9qUPvFqOaAT/VwKfr8pCxiTcDnyEC+VPUDuN
         XstNYSwSrkusfV0Cc1bhJU8pLqBgKvi1R8BWC2SplRIF0DQ6ZZw/RITWcgOyhL1Q9IvB
         qZdi0tiW/ZW8dQJ/ImOysfjZciCWVMKr3AN9AHbDG4G+LtxaI7FwNauLL3HJOSxifo6v
         7/dwyJK9/4VUx+33tAoxYFUPXYbdBnQeGO/9VYZe9cPI2yZY+G0cEVFDayOAHsUZr9p8
         sssg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709037267; x=1709642067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N9j9qlONozduTz+bniTZX4spLz7Dtuw1zBMBtIuIeC0=;
        b=CsMm/2hB6scUChFbs5tZ9wSBYiF41QwS9nX0JCAjRCYEoxbEomdUUdZi9NKqq87Ji2
         Qs/iBIx2ETNHFXBqS4+iEJgu1tj70C7tNTejAmjyvq/UlStVRcOQ9dEyh/eYdEdXUYW1
         BYEOuAYgN4hNnAx/e15d5gWv2fCQkhqNcVQfW2topFLokY2DZpDvbO/CicMlycMn8e4g
         YHZfcpklYgmmez589uXfhLxcRY0k4s0wKPYMtUvCjunh6y421apdlP8tLUXuL7uusoz9
         N/V4QAhgxVq7lmS73kWRqX+vDQDwGkIHjq1f4Jqq6ZWiTYfr4Fr/6Pxcy1VJPkhfULxy
         KD3A==
X-Forwarded-Encrypted: i=1; AJvYcCWbg2acYgiPHM8cCixEmFlOzEDDkCKWg/ZwzbFRojn038c3F6qsnTRQigQNdYmgvCSdVOoXF4s0e1hAPNzDNrihtSiTWQ==
X-Gm-Message-State: AOJu0Yyk7oWDiP8jcI8FtmnOKoYUmFX+VPOmDyavhhcep4aL2FBOuBm8
	oa5mLryxIC7rEriamDpGQmKn02ZdtMDv741nyBmGwnT0QoJeVHfXdQmWeg1DG5Lhns6EPvS7l1R
	CDvgYIjXu6ntSHQF0bO3tKQB0tdw=
X-Google-Smtp-Source: AGHT+IEuXAPX9FOqOhNJb3Owku+lxeLjmPjbeDLcLvCF79H6OR73WYykC8gycjj0GEybh553JRImPRMosUkl+JhzaAA=
X-Received: by 2002:a17:90a:5804:b0:299:389e:b611 with SMTP id
 h4-20020a17090a580400b00299389eb611mr5540528pji.47.1709037266902; Tue, 27 Feb
 2024 04:34:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-perjury-preshow-fc2cf73d552e@spud>
 <CANiq72=mCnm0mKOw5K44PmZ+jF=67jxEEkcXP-E0O8CaUrps=w@mail.gmail.com> <20240227-uncertain-amaze-6197e627ad95@wendy>
In-Reply-To: <20240227-uncertain-amaze-6197e627ad95@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 13:34:14 +0100
Message-ID: <CANiq72=geBobqM0Dc2yv=NjAc3MWXhOrDHfuJ84TgQ+XVxBo0w@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] rust: make mutually exclusive with CFI_CLANG
To: Conor Dooley <conor.dooley@microchip.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 11:54=E2=80=AFAM Conor Dooley
<conor.dooley@microchip.com> wrote:
>
> I did try to test it but I ran into too many toolchain issues - my
> older copies of LLVM (pre 17) are not multiarch as I built them by hand
> with PGO for x86 and RISC-V. My LLVM 17 is from kernel.org and has no
> libclang. And then the copy of LLVM 18 on kernel.org apparently does not
> support kcfi at all. I gave up there, but I don't see how this would not

I asked Nathan to add libclang a few days ago, and he very quickly did
it for LLVM 18 -- though I don't know the plan for the others. I just
pinged in that thread.

Cheers,
Miguel
