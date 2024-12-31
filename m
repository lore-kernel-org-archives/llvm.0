Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE70381C4
	for <llvm@lists.linux.dev>; Tue, 31 Dec 2024 19:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735673371; cv=none; b=Jw7kjvPy0zA/IlA9FOYy4bGaUPMnSXN9XUN713zK2GN1AuLuzbpBfzR7UdumDsJxjUu1SUKOcgSFaNPNjOTF8/O1yxDnEbwhjeEJNI8NRZH3AS+AjH2OQqPZ3Nitdb9L5us+DjMom2CxqrBkO6rlkulhanXAlw/r00D3KR4R/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735673371; c=relaxed/simple;
	bh=aA+MRN/qnMPiZEpERcNvf80IHmrKgKfRpPnZC0qNFmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GNPmXv7t42GiG3XYp1O4411I3H8lLTDzJGKipbz74ehYKvvK3Qw7eWCZ7M92w3ShsntI1uTSWqYG1CwTp3QXZ3YSn7IDa4/EteVJd6aMD07I3qMapHubsjiH1A/Lc+CLUAYk1t+j2UB3RAIuSlqPZ3tvOsQ+uvzR83JW9wmZ27Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLgcuGRf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLgcuGRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE313C4CEE0
	for <llvm@lists.linux.dev>; Tue, 31 Dec 2024 19:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735673371;
	bh=aA+MRN/qnMPiZEpERcNvf80IHmrKgKfRpPnZC0qNFmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gLgcuGRfbbrJH2bVLQUA3jdOREH+9JfoSbp+bOpm+fdCbBsbvXwapPwA4B4JB7j8c
	 l+opeaGh/pt4g/4JP+C6a8avFaWj3IW9yg+cVNZD3BfljtEJNvbdC0Ll048kzZBSpQ
	 CI3JWQRUbmJxS0mIkGd4FAqjI0k6/sclLeQa8zpwRlGfF2hbynglJCn5JX3iIGHqvs
	 UmcKcBxP/K6+YHFaQ00WPs6kI+miosGrEMJbISjarylEcBDO8lzGe3auXJ4bAjoyzh
	 Y1pkgM3goSz/R5ZL6sp0bB1qaj4EbYrlOsMyD1iu5XiWpmNbT0aUrnbdfa4Pff/chV
	 1b/laHhtVziOQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso10569708e87.2
        for <llvm@lists.linux.dev>; Tue, 31 Dec 2024 11:29:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKk069TfAxR/wslaC2F6FM5JACdB7yWzE4lZ2Hsbc+4lukhvKOfJ14OkbKcP/hrJr/xmbI@lists.linux.dev
X-Gm-Message-State: AOJu0YwGX9OmT3GY621Nfv4/sCfOP0fxGpm3N5HBRCOnOAbKnhYXamlI
	WV23p+uFudyGJE75HbtZrG7UNH3aMmPYOrD4QT/3TsoxVE+15J6/nmcqwSPAG6Q86XWimE8qgbp
	i5N3ZzU1opNtbUPtI1wzlD1bLwz0=
X-Google-Smtp-Source: AGHT+IGA6TLoWucollQOZYV8MHXXivQXhwOLO0ATsrpLOs0avCI0W2GTpgMZTW9fD/1HHCpmdyjkNnOMJotoafl5uIY=
X-Received: by 2002:a05:6512:3192:b0:540:20f5:be77 with SMTP id
 2adb3069b0e04-54229522513mr13970974e87.3.1735673369241; Tue, 31 Dec 2024
 11:29:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205112804.3416920-9-ardb+git@google.com> <20241231100137.GBZ3PBAdixv2CR_H9C@fat_crate.local>
 <CAMj1kXGAEc92TfEO-i+9SAmsso-NqqX1HbqFf49CC-QbOmpT1w@mail.gmail.com> <20241231103510.GCZ3PI3gSuuDzkG1q4@fat_crate.local>
In-Reply-To: <20241231103510.GCZ3PI3gSuuDzkG1q4@fat_crate.local>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 31 Dec 2024 20:29:17 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEj7-PadFJ57uYUTC_TCicX6E56rSiEF8Rr9_vH_G8PoA@mail.gmail.com>
Message-ID: <CAMj1kXEj7-PadFJ57uYUTC_TCicX6E56rSiEF8Rr9_vH_G8PoA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x86: Rid .head.text of all abs references
To: Borislav Petkov <bp@alien8.de>, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, 
	Brian Gerst <brgerst@gmail.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

(cc Nathan)

On Tue, 31 Dec 2024 at 11:35, Borislav Petkov <bp@alien8.de> wrote:
>
> On Tue, Dec 31, 2024 at 11:12:55AM +0100, Ard Biesheuvel wrote:
> > I'll look into this asap, i.e., in a couple of days.
>
> :-P
>
> Thanks!
>

I had a quick look, and managed to reproduce it with Clang 14 but not
with Clang 18.

It looks like UBSAN is emitting some instrumentation here, in spite of
the __no_sanitize_undefined annotation (via __head) on
pvalidate_4k_page():

arch/x86/coco/sev/core.o:

0000000000000a00 <pvalidate_4k_page>:
 ...
 b72:   40 88 de                mov    %bl,%sil
 b75:   48 c7 c7 00 00 00 00    mov    $0x0,%rdi
        b78: R_X86_64_32S       .data+0xb0
 b7c:   e8 00 00 00 00          callq  b81 <pvalidate_4k_page+0x181>
        b7d: R_X86_64_PLT32     __ubsan_handle_load_invalid_value-0x4

So as far as this series is concerned, things are working correctly,
and an absolute reference to .data is being flagged in code that may
execute before the absolute address in question is even mapped.
