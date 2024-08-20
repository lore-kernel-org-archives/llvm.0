Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B1D17BB7
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 14:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724163626; cv=none; b=NpA+ZWV+KbX9pD9vKORhajImLK6g4PTGqG0cuyTJttZtEv3B4zzFxMIGuwZZmzxMWYIN9G7Y/kMr8Xoh2qPaaqWtTFrRvq1lOnM+9p6Ij6aROl6X/CPc37/CXtJvBBQ0LNUXHdr9HhEaC3bJ2vTZQdQzVjHSKo/6mOFuvl9czQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724163626; c=relaxed/simple;
	bh=GBVk/hGzblmCoSDe2TbxWbPRIZfoDYNoIyTDzuwIC6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Szw2FTUdrL9o/SsJ+TZ3MNEGoQoRg7UMypVobWrc3OX6wE8QmsiuwOlDaAZrEwQ3ZQiLN91hhU/p3+nFCvbq+6OgG4XeOki+M8yIJIBKLayuQNUkoI2h4JR0NTllmO6UYtcwVrCfBGrEmj1eNLPvReN+ELKtn92NPtc4S0lVE1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mHrHMREo; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mHrHMREo"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3f39e7155so708045a91.0
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724163624; x=1724768424; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wswv5PurLM6P5IjETHMLu6CnN+eBPmZTsMYIqJvimvQ=;
        b=mHrHMREoEUSsoAGN+DPtjhpqesE0zC2Lvs5AgaEKfmx0182NufRY5q+/pQmqU8CsTV
         QQ2My1rStDFQQ1hVhbBQwb9sVmrpf87bRXMSnjTMuxcVm4FGGv/y4OY/YEY721w5jCf3
         gjIJuo/F1GFjvM+FoH0xQIOfl18TqtRJI7afmhiHEXij71Tr+eRONEvUlfYxT2iEGdrD
         PVb1jaTv9eSP4TO1zMpy7S49zlzj071fjWa4B65Em/T/bbz5WDepLn/b+wy6tppAgM7G
         wBXxXWQ8pkukNbqnhpZpkFBVNciAh+h1bVV8VpgS1FL7JEbGPWEGniKpO5wqBEvMqvq4
         RUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163624; x=1724768424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wswv5PurLM6P5IjETHMLu6CnN+eBPmZTsMYIqJvimvQ=;
        b=WcOU1LkQLCgvAVhyhT0tIn15E/j66xkCQmNgsZmZrfAB8WLsL2g/xseZK2/oj0fQRC
         0cp7R+PDJ1zcvx8mD3wH3bdZLK75ng7Jn4I9QB3fHYtVYeMBw8rjLptoLnOrjkoM0JIn
         8rqbl3WOrgrvNgs4KZF+h6lvUKCw7fq9cae4Mbi5j1fuCbbqV+4HphpjEtPLmM2VzJYp
         Ng+QMigIUEgugTxsPOCjdSOhBtkfeV7d+8Hhkd3qDZpVtYM3vQS7rqe5CRgbeHGhkZRf
         bi4h5PcOKLFDPex7t9mJI495AyEWLE80+YylLvB4sViT1ExnCgXKlmB00CeO5oNF3Mqw
         6CqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMXK3pMVUSF3byGQ/gSAJYcfPOFmgBydimZP/plIEy0CcZxWfX46TP7pESuNPvhSK1QVocQAMRx0soqtPMa1SbROS5YA==
X-Gm-Message-State: AOJu0YweP+/n6OhKH0+9UOePe2J120H/xpBCGvvoiauEGFtAXpQITcBr
	YI41l5ZNILrj5WdN3I3lxfRLi0nbKff1GoHRgx3p8z0FszOypHGKjHAF/0UTk8GFE9kE2SfcIjr
	A5uS4cEbs6k9sRh3GFGYLzeHFklU=
X-Google-Smtp-Source: AGHT+IF5iZvjFecygopv3tUhYCm+cRSOvD49UmMopVX0LjUh6PHHcP2By59cm37l0E634tMo+WI4IO/ZFx3Zyl/v7RE=
X-Received: by 2002:a17:90b:3d7:b0:2d3:c2a3:2383 with SMTP id
 98e67ed59e1d1-2d3e1733fe9mr9282006a91.0.1724163624163; Tue, 20 Aug 2024
 07:20:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <20240819213534.4080408-2-mmaurer@google.com>
In-Reply-To: <20240819213534.4080408-2-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Aug 2024 16:20:11 +0200
Message-ID: <CANiq72k8UVa5py5Cg=1+NuVjV6DRqvN7Y-TNRkkzohAA=AdxmA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	glider@google.com, ryabinin.a.a@gmail.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> Creates flag probe macro variants for `rustc`. These are helpful
> because:
>
> 1. `rustc` support will soon be a minimum rather than a pinned version.
> 2. We already support multiple LLVMs linked into `rustc`, and these are
>    needed to probe what LLVM parameters `rustc` will accept.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I had some feedback on v2 -- was it missed?

    https://lore.kernel.org/rust-for-linux/CANiq72khUrha-a+59KYZgc63w-3P9=
=3DDp_fs=3D+sgmV_A17q+PTA@mail.gmail.com/

Thanks!

Cheers,
Miguel
