Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503AD35280
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 14:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724163606; cv=none; b=E3a9kbCjhfGFjyOELvJrZ45B1gbML1jFYtEseKYy0IB3b9l51c9jE86fCo3hSbn0LfoC0cnsfBfEQdvC6Euekrr7B/l4O7I0yBUX9PxSCHZE9hUYrE++SDdeDu9nVS4jpsp7uje/EqUz/76Xwwbrd9jsiUlKTaN1lfR0kD3zPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724163606; c=relaxed/simple;
	bh=DxvtxL+Ke8K6Pv8l2dm3nQAgwg0QSGFXf5KSkc+OWOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E0xnRAlq3E5hz+DMh6RESw7JOQEt26d44vdr8+O0lm1l27GXggTKxq5tIxgVvPll8E/w2BH4hHbWyuBNGNUdvfVdcrTXqCdLNmlqXK4NhNlf1IXA6/Lft2nOFvfxxnyNenxPmTA/gymWz2ub4BwLF4GlJ7BQkGpwF7Hrbe+krwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWi76qd9; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWi76qd9"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3d486d8bdso810482a91.3
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 07:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724163604; x=1724768404; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxvtxL+Ke8K6Pv8l2dm3nQAgwg0QSGFXf5KSkc+OWOI=;
        b=NWi76qd9rhMLpwLqP49+gWCG+BhCyYqvDQS65RfqZEJQKUeKScLmcjMXQk8OxuR6qC
         MibYyc835NTC4YzdDo/V5s3eg0BiKJRg417gJ8L1EmRE3GYG+TwnD552z3pTPmBFRHo3
         73pJmUK8t7MYODRLQOhO8MIQKl8X2k/jemGW93ilzL/SoPMw8Lc3NdS3P7TiehoH8aaE
         0UBwQXYJRqqvKQqA3U4Keco4bFTuWbEQ1xmoMUZakwl/E/JoqvxeTwi4jqM5ixKb4/UB
         Ztf+aupMc4ORvMqKEZdAlU73+FYNZbb01pXwWnmfBr8UXck6dybd/Vq4NruCDhL8CjYJ
         2Mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724163604; x=1724768404;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxvtxL+Ke8K6Pv8l2dm3nQAgwg0QSGFXf5KSkc+OWOI=;
        b=A5BgdZmK7VN0rLu1zfW6nxRLj6yF0kzjQIBZJP9nbxfr2+caVUJeeZu9phj628fmNt
         nl5SlPbplqjeL9Yvhhx6+UViNLGcoZW/UHzumO7NYUH8v4C37V//AUwZ4pttve3Xm9RE
         LXxL7YeJrMGJDV3XYrWIpCS4PwMt2RsnfPtnIv6G/xv6h/ZGEx3o1KksWy0T+kS14CVK
         QQUF6N/6+43hahfzHqvO5RH5+TXBoUp8tKWR88XjA+NC6oroEiHdWDIufgyQr88lYV52
         LKBmZW8Oq8qqCQDCV8t3YW82FWnCJhLL2PoID1PbdKtCXRk9GCMlbVWDR8hIWM4s8YPv
         5ccg==
X-Forwarded-Encrypted: i=1; AJvYcCVl+hGBZ72KmWL4iWpprQbKWe7Adx32DEkn6/qOpIE6CYO1j8fawuxj+yjhMLWGEJ8YZEQIEsk6imq/Nj1RJifAnhkRVQ==
X-Gm-Message-State: AOJu0YxNk9ra76zfoKnl/IpKrhhD8tQzZh0jEw2/9D7UmZCS3pdpo6Cy
	rJPN8lNrkYBAXVM9+nhB6i536iRNr9OFFVUsocZ7JQ15tpO1x7hGNvgzbOf78zKWitZgIRfc5/b
	T9lnQYoCMMuEyVoQ2m40WDAxxVYU=
X-Google-Smtp-Source: AGHT+IGcjKB+JSUz6XR3WY1V11DyPhrE/IyS4AaYf/2qlwuLxWDuMQ9CXaBD7CrEUv4damSxx/lF1wlKrveyCZDI6Zo=
X-Received: by 2002:a17:90a:9a9:b0:2c4:cd15:3e4b with SMTP id
 98e67ed59e1d1-2d3e086417amr9595929a91.4.1724163604537; Tue, 20 Aug 2024
 07:20:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Aug 2024 16:19:51 +0200
Message-ID: <CANiq72=jxS-LtTMPdtFCmO0T2ajNZO+XLywqeevE4FyNhtyNBA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Rust KASAN Support
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, samitolvanen@google.com, 
	kasan-dev@googlegroups.com, linux-mm@kvack.org, glider@google.com, 
	ryabinin.a.a@gmail.com, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.com=
> wrote:
>
> This patch series requires the target.json array support patch [1] as
> the x86_64 target.json file currently produced does not mark itself as KA=
SAN
> capable, and is rebased on top of the KASAN Makefile rewrite [2].
>
> Differences from v2 [3]:
> 1. Rebased on top of the maintainer's cleanup of the Makefile.

Andrey/KASAN: whenever you are happy with this series, assuming it
happens for this cycle, do you have a preference/constraint where to
land this through? I am asking since we will likely need the
target.json patch for another series that may land this cycle too
(Rust KCFI). I asked Masahiro as well what he preferred to do, e.g. if
he wants to take everything (KCFI, KASAN, SCS) through Kbuild, that is
great too.

Thanks!

Cheers,
Miguel
