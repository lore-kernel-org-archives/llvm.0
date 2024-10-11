Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4531319923C
	for <llvm@lists.linux.dev>; Fri, 11 Oct 2024 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728629952; cv=none; b=aGsZ6NtALi1rZvyOMGXlmj0Oce+qeSRSqTuxm8oHcwIAB19W0bvlEamTj4hOS3AlenRAARWNfL68vCBIuuTWDnZox3Mn0UcQidEfQ6ViMd741w2eaVWoacsfyVDzf3R2Zm6YMP4GM8z4wHobjUhXfWzjGm/+yYgu/b4KhXvx8OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728629952; c=relaxed/simple;
	bh=AnM7XamNLc2M6oVcml7mvgQSLuc6IQzUUi2epLGB8ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P7WpuQXVzjWDXeDchODyreBqHpIixL5/IF6+FxM6i2AkI1lOK3gxiZVMJWJfI9d7DrsPP7WcKpMvTwz/pE3lTSOM3H4LJ6h9XThH8KNEAk/OMzor0WRcgqs7mGXhFKQOpLzdFBeNXWAOoqMlAeBhZ8jc/A6eKe1TNaQhKurY+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U7bFziMG; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U7bFziMG"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71def8af0d9so132961b3a.1
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728629950; x=1729234750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNprZDujeJLDJHdRYQpNiQJhs787CFLT9EgNyD54pMo=;
        b=U7bFziMGvHqEQpiphD3GFlmbHadzbLsQr8O+2/AYcQ9QV8W9YGIMVpIkhRgoEdI1KJ
         SQLEuJXTdKZYmd/kWJfFRXKYP6/W8TzEd2cevKN0gtV3C6YdtHsmg9d52N9oAkAvYmSy
         eyxxrJ/JK/sDaJZzgvLDDCzb/vmbHQ7NEG+JkPS84IfZ4HMs8e+iZ3NAoE8NIILyaD/Y
         BZ2PW9a8GcZ0iPSwQ5xyCZwPR8jCt5Dojo1B9SJvPKAg5g4KiKpy50Nf2re9QHAkF7Ft
         wLVlWSSdWbdvFXkhJ61jywJ3BXss7FEpJ8YdBcI9yIC0sbTRZDV7j5ThLRsV/OTNAq1Q
         sssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728629950; x=1729234750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aNprZDujeJLDJHdRYQpNiQJhs787CFLT9EgNyD54pMo=;
        b=sjgQhmbXP6unTUQPl7B0Zo6LQuIFN0HYiHnijtmQJrrkLe+7fJCaSUvrBXgV4wnIlm
         I8Eyr09MZss8Wb3ooaDJeodUxNL+CJE93mCeQM2v+7yIAqMarbqPo8cYZjpLfUVKuRRo
         fz8Tw/EFmTEut34Nq/aI/choEu+AfSAvbq5ArOOHUXCtiGVb/zzukkQoCtBIiXf+eA9g
         DG8uTqw0Qnjy3GGyKXEQGAsXYGUyYjXpxy+Nkr0Oo6WwLctdQahpMSN6134QJkCBY5vW
         KACa/baPyHDxU++47RmXdpNuYTPb719PWWm/flrw85QzTAPB872Z6tbPo8pWJtGVU42N
         kn3w==
X-Forwarded-Encrypted: i=1; AJvYcCXXVLu5RmGqHdPcFC/C0l43XFLE/mOqHiCBoABJJW48miXVXVq2QKQ1f+1gD5oi8EPRoL04@lists.linux.dev
X-Gm-Message-State: AOJu0Yz08bmSPxY5IziWk1fRXF8YTytsG0cAWjiIhpF99wbIp+OmGFRV
	ON0XGMUIXRiglTisK6KoL4n4wKaL+8w8PPlUhG7fVQ2cMouzfM2uV/7GOiGs24zA89KsNximaXb
	HfqDjrFnyvbWPpqH6eLXyJrAcUJ8=
X-Google-Smtp-Source: AGHT+IHfgp+RekBe+a33lrGFkLogwB1v4IcRvG8U0x5B9hHpF2h7NSFqzr4UUZhb7LVoGtsHegM+6k0gaj2E+Gka+m4=
X-Received: by 2002:a05:6a21:32a0:b0:1d8:a203:95a4 with SMTP id
 adf61e73a8af0-1d8bcf12481mr1225502637.5.1728629950384; Thu, 10 Oct 2024
 23:59:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
 <20241010-icall-detect-vers-v1-1-8f114956aa88@google.com> <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
In-Reply-To: <CAK7LNARBXt=CWy5CgtHqdePw5L6EtD15emS2Fvre4QWfm_LjUg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 11 Oct 2024 08:58:57 +0200
Message-ID: <CANiq72km-hEBvt-T9CEp6kLJMvemcW99g1hd-E62Xi3H+NX2RA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 4:04=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.o=
rg> wrote:
>
> Please notice there is no reason to process
> rustc_version and rustc_llvm_version in the same script
> because they are completely independent.
> It even invokes "rustc --version" twice.
>
> If you implement it this way, you do not need to
> touch scripts/rustc-version.sh at all.
>
> If both rustc_version and rustc_llvm_version were
> retrieved from the single invocation of "rustc --version",
> I would agree "OK, it makes sense to implement it in the
> same script". But, it isn't.

Yeah, I think we can do that: one is `--verbose`, the other isn't, but
the verbose one should (hopefully) always contain the non-verbose as
the first line. Since it is in the first line, we can directly do the
`set` without having to "extract" that line -- something like [1]
below?

Independent scripts would be simpler, so that sounds good too.

By the way, this is a prerequisite for an actual fix we need, so I
would like to send it as part of a `rust-fixes` PR -- your Ack would
be great!

Cheers,
Miguel

[1]

if ! output=3D$("$@" --version --verbose 2>/dev/null); then
    echo 0 0
    exit 1
fi

set -- $output
rustc_version=3D$(get_rustc_canonical_version $2)

if ! output=3D$(echo "$output" | grep ^LLVM); then
    echo $rustc_version 0
    exit 1
fi

set -- $output
echo $rustc_version $(get_llvm_canonical_version $3)
