Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D03018C92C
	for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724174929; cv=none; b=gYLzLawK04wdZCs/xBJ4eRFqnr+IdA9O4qA8aoOS53FWxLcHIA+Z9XI4IRGG9oOzoarmrfED5sbzX3G/giHDSogUx8uYu3DMw5CSrKhxRNTTDkK6f/p2GFe3hSCd4Ew1Fth7fqrV+FJm2o0xlKLkxPwYyiQgj0Up/g7iwex4lcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724174929; c=relaxed/simple;
	bh=QEDqYF9tb9faubrQz3i+oeJSL+hsxPawYdSfJmGCtpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kX26AH6jM1Of/ZbN4vhO4y2lfdBJFrlAaJ0fv4QXZ0novdbxC2r4bQEcXAJG/XSGI9GsDFgVOE0ngFwBQo/luNmvTc+TlIKEgNTpo7oooP/swFqMG7KIGfMQha9klFrRdRF+CxqFMFRfcn6cUuvyau9EEgtjoQABRG8L4+GBSEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcjKnPLy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcjKnPLy"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-429e29933aaso44790895e9.0
        for <llvm@lists.linux.dev>; Tue, 20 Aug 2024 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724174926; x=1724779726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEDqYF9tb9faubrQz3i+oeJSL+hsxPawYdSfJmGCtpI=;
        b=fcjKnPLyvgQ2gPAkKStihRtDCpbDNXfMOubW6nRfB2i0RkBcRbikvnW7oaHdjcWnTF
         32CJK6etDLPUkXxLvJUOLIct4px29yNAg+1JcCUmZR1lJVeSsW4xn8xqLnu2Hcd+h8CP
         a2Tkn/eyFjqUXrKkAZM0GWk5G63ejosb3MJmz4NWg7aIv/PN2bucwsqUvGuHaAkL5luS
         Bpl3sAtKkO0rQK+1C1xdUmg9400D7hy/6re/dR5YhgwH4DJh0KV1U7G581+FDPVUpm5c
         IHrbesly+gqAbUwW+2sxgtjQSdCMHI1pSjBfdWM+KW27xzzid/HoiWhTnq21r83E34SM
         K7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724174926; x=1724779726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEDqYF9tb9faubrQz3i+oeJSL+hsxPawYdSfJmGCtpI=;
        b=ov+foZKJwNh1uIQiKnlDltNYuU5fOsH2kkRoueW+DkFEgpsc23Q4bGGb+R9YoKu53u
         TtoddUjvEOxXsLfh2PEcynIr0se4gSShMM91EAthk1kfiosLv6TphmHTtHrnBGRWPovy
         d6rIKBDo3ujSWMTjaxiwB0D69XwLXO7LFSXpTnqKGfk3uyP9HrF+aZzthtJrmZVAKc/t
         NCPcEAbNvvPSFvjlW6sqQi2gz+dEJYx/13KkKYEWoErJLM0J1chM0I6OxAzo4cpdMENJ
         szsP36uG59Ib0AUPhV/y+S190q+2TXKrnn01ImDOwceKBoVnK3+DA7Nl8KXO6Wv/yjiq
         YaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXeVcXmWgb5PSqM3WG7V2qgf60aHmbiH5fbjrikZ2gtszWaAH59QmKVFZ6H8jVpWyDTGu7eU2CASqMcu03r3jMDbWgaKA==
X-Gm-Message-State: AOJu0YyReGv+Qw4YuG/tvsd3786PTPs5iB/XeE+buOmjGsTWwdHQzImF
	+VIPydWC4W3TMw/87KcN/phjlJ6nPH2lx1Wr34gRZg7zriyUQxk967R1kJjSg2tzQKuzuuk7JTp
	WUtAbutTp4UOSzZMP30xU7XQKrPY=
X-Google-Smtp-Source: AGHT+IGitQHRfAd0itDJQOQ9rh5X2apcGEYOAqUE0xfkpsvvjjfPeeI7rKisTxbX8CrCHdrFTSs99yFb27u2h+eDJZk=
X-Received: by 2002:a05:600c:1da0:b0:426:5b21:97fa with SMTP id
 5b1f17b1804b1-42abd2449edmr616875e9.29.1724174925358; Tue, 20 Aug 2024
 10:28:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com> <CANiq72=jxS-LtTMPdtFCmO0T2ajNZO+XLywqeevE4FyNhtyNBA@mail.gmail.com>
In-Reply-To: <CANiq72=jxS-LtTMPdtFCmO0T2ajNZO+XLywqeevE4FyNhtyNBA@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 20 Aug 2024 19:28:34 +0200
Message-ID: <CA+fCnZfbHUJZOWBksYC8N30OWxXG8bJ=-pzkwEcHA4Jpc-b7FA@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Rust KASAN Support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Matthew Maurer <mmaurer@google.com>, dvyukov@google.com, ojeda@kernel.org, 
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

On Tue, Aug 20, 2024 at 4:20=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Aug 19, 2024 at 11:35=E2=80=AFPM Matthew Maurer <mmaurer@google.c=
om> wrote:
> >
> > This patch series requires the target.json array support patch [1] as
> > the x86_64 target.json file currently produced does not mark itself as =
KASAN
> > capable, and is rebased on top of the KASAN Makefile rewrite [2].
> >
> > Differences from v2 [3]:
> > 1. Rebased on top of the maintainer's cleanup of the Makefile.
>
> Andrey/KASAN: whenever you are happy with this series, assuming it
> happens for this cycle, do you have a preference/constraint where to
> land this through? I am asking since we will likely need the
> target.json patch for another series that may land this cycle too
> (Rust KCFI). I asked Masahiro as well what he preferred to do, e.g. if
> he wants to take everything (KCFI, KASAN, SCS) through Kbuild, that is
> great too.

No preferences, feel free to take this through any tree. Thanks!
