Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A22334C36
	for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 09:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766569414; cv=none; b=G4hfi5fVxtMZ7DXvQYZX7r0ZHTEM7Th3M7bewfo3TQPCK/885fxjAeX3jMYksvVA+NxQ5l8nBFWCEwV/6zp/6sqg4BkrnJ7Maipnapwf+B+UKNOOFretFayGX8MbnaY204Fn3ofvUv+/yhsaH/KWeCj2gfm33rSxBVH5LDc67jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766569414; c=relaxed/simple;
	bh=AXrA3sRJwnZgC6dfkQwPIf3oBdpxwqAB6RNtrpM7rKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXJQlebPz1443sUdwqLuV00bRhOygioashUC8hJVCmbf0+BRJIVpJitn/u1kqb6EvHF46xNORSTprRp53QaHk5SnrdyTdr4n+CHRGERyB5QmXDg7mPaih5rCgeTtMJojoJYCIc1qAQfp2qsGRq/wV7c/OvzatXp9CcUFraRI0+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GdXWaD76; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GdXWaD76"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a07fb1527cso13635095ad.3
        for <llvm@lists.linux.dev>; Wed, 24 Dec 2025 01:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766569412; x=1767174212; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zE5g/APfOf7Doh4n8+ohsSXdsPUU5o9q9e6BCGyON8I=;
        b=GdXWaD76qELTjBVz5YKcWmKxT8ocyqgi2t9+LaqtCeDHebaZtjl+R+fOYLJX9YWR3f
         ini6RIVEWIDUmraeBRb/kc6wGx6pwtPi25kNZMI/sXgDPQ+878JJe1vFAUt6yCyoCJ1W
         jRzV2cm4TXDYOWtDNTBsTW8mz2rpOSI6pn2MoQKAsC+82hm31lCnrE2rWG01bTwHTwdl
         NvKx1soMPvyabL7Ntfkbj3Sh4/cbhey+HkCoMN2mbgmStR7eKlGwRBtb4qoMJcjynUhU
         DYNwd4KY5W0Vfr4CR87xohK8XB7NTl0Cd993N+ARrMiMGtXkvYTbKCIWXixFUFsIGNCE
         nOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766569412; x=1767174212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zE5g/APfOf7Doh4n8+ohsSXdsPUU5o9q9e6BCGyON8I=;
        b=YYq6i4ewUlYh6WP9heKtkkWnAnhQSoIZcZpuHPkqhCm8PMfTaBgfq752X+gZFxJ0Iu
         TyTqfT4uJS4KGxHeW24i7CLrgoISYpbHd55rooZfwOj9IVAmoh2ovKHeDYke3YOBRSM3
         tgLpAYoSpK3wh9HTQ/xn6Xb+aVvEYgR5rauYCQ0ujRqjfLV28d++krhLiJ7k+cPJ15lY
         dRvR/zqJuX7w+oX+Q0/5QRE+Tmv+itRt2FJNlylfTZTqnGoIvgS+sNOc7pHmmUHLzvMZ
         srY85yyoTuZVdG8e/VRznKwUC5oJTXM7DHL6PMswfLnxJRGL/+e7sNj0OOUbQCzVAYty
         ZkwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwBoarpQdZ5KlO7T/r9SDoVT1AS+mA29UZwSuSKMdm64ty2KfdsaTD1aKT4eZdziHKF77B@lists.linux.dev
X-Gm-Message-State: AOJu0YxKHIL6AD8X7HxCRuaeg5GTNDspWv5N0ptJY9GS7yFip7i6C3sw
	aLOirEV014A4hetV5a0gayfrIH3F/thHsO6GdDbD52HfBLDc4IdyCvD2BsDbgDCDGBBK4W4h1nO
	+SlHzXyd/Dw8lRCtJOA8/UG16mJ/ky0Q=
X-Gm-Gg: AY/fxX58bkym3dgd0vgSOJauktdM6aNaOEObjeGPwxf7qyE6oF4gNomYd0vzRXkI9fc
	RoqVGAwd3ZuOymj3xfuoIJoc2Lxj1pqkrapieg7EHlVmbw7CTX0qbaNF9YavdAQ1y9UPcNqeyej
	ImNUsVV2c4cbT8OqVsDTHPKzKfOcTUp9K2DE8YhNHuVbxSsMp/QaGPQMqaaEbhKMOdEBb4gsawy
	nu70Mw2HblcHeFwEqE9B6FK5H5J3G/Fhp4DlDjeuNmxOD4SYPNnqRLUOEkzghqMDigQa9YU6L9H
	ai73hny7B7ZogLaTvJ1EwhCJ2ybD2PDT27Lb3d4XKIxxmU1NXpJHWrhhcwMrmRFCTRq9eqilsNl
	u3pYXoxUj8G51EGObGMRZHOw=
X-Google-Smtp-Source: AGHT+IFrptM25tDo6OgwVjwNE6sttK8tiJTbTeh1uLcr5AC6QnmieVL8kggrKij9zZwy/QPwpL9ycfqV/YVXijoETTM=
X-Received: by 2002:a05:7300:c00c:10b0:2ae:5d59:3ef6 with SMTP id
 5a478bee46e88-2b05ec8546fmr8341481eec.9.1766569411905; Wed, 24 Dec 2025
 01:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223175216.1353814-1-gary@kernel.org>
In-Reply-To: <20251223175216.1353814-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Dec 2025 10:43:19 +0100
X-Gm-Features: AQt7F2rBPEL7D8SfZ6Gc5tG6d1djTg5NeV01DNU875a1bSh2mPJggyCVC3K4fd0
Message-ID: <CANiq72=p9QzjApCLzbAwgUe5OMAo6qrPadthspdjE8UMQcXRgQ@mail.gmail.com>
Subject: Re: [PATCH] perf symbol: remove Rust symbol workarounds
To: Gary Guo <gary@garyguo.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 6:54=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Drop the workaround in perf symbol that filter out these symbol types.
>
> Specifically, '1' and 'l' can never be generated by nm -- 'u' does
> indicate GNU unique, however such symbols are only generated by G++ for
> C++ templates, and are never generated by LLVM (LLVM generates weak
> symbols in such cases instead). Therefore, the previous occurrence of
> these symbols types must be due to the off-by-error and can be safely
> removed.

Thanks Gary, this indeed should go away now.

Should we mention `N` which is also removed? (i.e. you mention all the
others that got removed in the paragraph above).

In addition, should we remove the `__` prefix in the parameter name?
It was added in the commit that added `u`.

For context, the commits that added this were (probably useful to
mention in the commit message):

    945f50036169 ("perf symbols: Handle 'N' symbols in /proc/kallsyms")
    4d728bb93bab ("perf symbols: Handle 'u' and 'l' symbols in /proc/kallsy=
ms")

With the notes above considered:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
