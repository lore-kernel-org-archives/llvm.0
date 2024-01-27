Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824142557E
	for <llvm@lists.linux.dev>; Sat, 27 Jan 2024 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706363212; cv=none; b=QelFzSq2UUu3ifFOvvckPQHDALCyxrrvjpCLElqALele9TithCJCPtln0ubd+RN1YlXK/57Mdt4d0EfXXkDKglv++jv9cm1mPT5S+n6Fg1bNL68JeFuSKYJWpOes0ZO6H9swaFEKJxy6xI/3feWClXebXe+2vmPWUjeWA5VnfJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706363212; c=relaxed/simple;
	bh=j7l3zAsK78DoVXLg6iPo3Iy7at8rxO0NoQr3L4U6WXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFd8YlBvFrdtbLPrAMmUrc35QngJsQcC4tNVbSpDz4dMEzxxz/i20XZg3fYX0mqGcgqCQKZZaQXWwRULIMJlhaXOf71co2N6Ca5j+AKSgTsJ/EG8cwx8Oz9pc9nL+sbMt65u/6AjQSjH3XruNeNd97sL++oKuJCBLgY2kkkUc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQGS5vL9; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQGS5vL9"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6029e069e08so20345507b3.0
        for <llvm@lists.linux.dev>; Sat, 27 Jan 2024 05:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706363210; x=1706968010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7l3zAsK78DoVXLg6iPo3Iy7at8rxO0NoQr3L4U6WXQ=;
        b=nQGS5vL9NGvZr5FnP0YiRUb630PEDoACloUXqifBH0v73X3oZOoDVLQYRi++5avRxX
         rHg9amAr04o5VZXy6MpOVDkdlSI0VRGCzIY5mXtcX4qvCSuP/CS8Quu1telJWCH0M5jz
         oWUH5GmqsAtv8UpCh9GZmcUyHvaMdsrIvxDx70ll87gIxCsD4drfKRO0zYX85wRTogE6
         iGoPDNfZTFamQ5oNjp2mdi16F9ER5+vNZpH9pnugNOHfYO8jfuPqbsFUVoz5K478aznH
         06NWLqrZS7dWRWwDUT1K05k7M55e/ukROFy6kMVSIA0axpIGKBMKa1l20afWiIQR8yMt
         S9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706363210; x=1706968010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7l3zAsK78DoVXLg6iPo3Iy7at8rxO0NoQr3L4U6WXQ=;
        b=aFDPbbR6aIvm5pkb11pGuDdPB4JChO/IzseO/Pu17s5+T1To44uFdk1hUQsiMuZZ4J
         NmoAAY0Zq9n934eZIk8cD7hXhMT9LOd7eNPrCzYaqxUZ89D+CFHWthqpEstmuXWDnK3B
         fiwTKKZ5nmNXka5PFWDw4gRRgyqHiyE/7/wzlZKKOElHHOqO0jczDsAzZa6++iDS0R+o
         ELfXeVzgkUFgp00O4abRvwtFx/xQqAmJCKSEnsl9ggNUC7a1KR6C+j7ruxghXLBF2Apw
         gaz1SH1+uZNVJsJYiWxWlTq3zOJIB00niXL14TCDv04cu9r7DBevbaNWMzGTKtCZsmKa
         /i3A==
X-Gm-Message-State: AOJu0YzvV+PzjQSt7+71UVf8lA6jB14GLUZZnrkYqmtGZ+N22DwVt1Pk
	jSHPRo6MQrl/UOCijEfgtui+QcFHAwHK9/WIzAxA09/j/5MnUwt8okFSGQP46+8KjH3El54BOPb
	mnx28GU68DQxYC73/4LfhM8tH/AQ=
X-Google-Smtp-Source: AGHT+IFJhLQKZrKheOpp5g5ZHWB5tU803FXCdkL1IkQzwwg5UM6oxYDf7ckc24PT/Pj4gwSFC+muNtf44ryFkoh0xeA=
X-Received: by 2002:a81:8411:0:b0:602:d19d:7853 with SMTP id
 u17-20020a818411000000b00602d19d7853mr1231429ywf.38.1706363210302; Sat, 27
 Jan 2024 05:46:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud>
In-Reply-To: <20240126-eccentric-jaywalker-3560e2151a92@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jan 2024 14:46:38 +0100
Message-ID: <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
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

On Fri, Jan 26, 2024 at 11:01=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> Is that even needed? We already have ARCH_SUPPORTS_CFI_CLANG and AFAIU
> rust supports it if clang does, so a second option is superfluous?

From a quick look, I don't see it enabled in any RISC-V built-in
target in `rustc` yet.

It may also still be the case that KCFI needs some tweaks for, say,
RISC-V, before the flag actually works, i.e. we couldn't just test the
flag in that case -- Ramon: how likely is it that RISC-V would work if
KCFI works for aarch64 and x86_64?

> I'm reading back what I wrote, and I must have been trying to get out
> the door or something because none of it really makes that much sense.
> Of course an unknown option should be detectable at build time and not
> be a silent breakage. Maybe I should have written the patch for this
> before sending the mail rather than writing the mail based on what was
> in my head.

No worries, it happens. I probably added to the confusion when I
replied with the "testing the unstable flag".

Cheers,
Miguel
