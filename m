Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CD960B98
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 20:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707856647; cv=none; b=ErSm1SlvOeJBHw3TuQiogpbPmyEPGn8WMbZnclU3N1bz235b2vZAkHW6UQIrz3s4RlpWG3VxCsHRoUVLjjOepSpZSbCrYE+HqDQ2cdWGzl/57Totgwly9ys6kjwwDD4DXZv1fNxfM3Iz+n1Z/XLAz71rwhVaGYtrR5fV3luYanY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707856647; c=relaxed/simple;
	bh=VRorOrRrHwUnyd7C3zuIEQ0wDQxSEzrfZUP7At+3iIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K0HwCWSydjpDx00u3mjMJzwuNcwWOCZNY4s8qEO5t9DCF00jsi011yjVLTdccNWRPRo3lFSIhtSv92sdgpKuMkUz1v7wjLn0r63N7gRf9jyZMvlDdQXP7uWb8wfNh2wPxT+4zhSzx9cTw394N62gGml4X1M9y8K8u+miXNIU7LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUyzqB2y; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUyzqB2y"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so1938775276.3
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 12:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707856644; x=1708461444; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6UcSSahlv+A2iZdYbarvJ/03s3/9UcPgDdNSrpGp9I=;
        b=iUyzqB2yY7nSn93LwXPwSkFPkgI8RUwDrfaMcc7kS3O1b2Xf4QssFB0M8lrmIYBHFq
         hyKGUpGGExnCe1xijEX4zko4cP66PvuKkiCcv9I7XOGRR1C5HReiyndVvUTgpY1gOg7O
         U+2yD4LDZLPq5ErZZxDLlhQj0QvjF6fnls1fcY3eMeeIXr5r7MAm3WbfxVL5Q+SqHEI/
         vm77kJHrLZhz+rI+1DoaVeOGL7VtRl0VP+/h9qcUflCFtVq49FMC1v5veNxYGDcicgqX
         j8lqVq2ow/lD3X8Q92ABGN+sAdoS+FITHC3HiG9jl6sm8bnWHu3SzSiegM3h1aCpQzrT
         khOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707856644; x=1708461444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b6UcSSahlv+A2iZdYbarvJ/03s3/9UcPgDdNSrpGp9I=;
        b=R3rfdV4DD8mWglFvOX9rzI/oSFY3O6feXdLsW1X4EQwZ3wGQxvYGpdSK1EWWrIuCPW
         bLKyLLHu9Dd1hqoAzUf7l+hKOReQ0oytAZ0s5V/jFLfEQq6M0NB/AT3sSJCdhSJ0D68B
         W0gZ8KXT+GAQ2EnLigixk59FAp/Kj2KP81vR0pT3JLZqPm8/V+334+qjfqQMvCA0vdxj
         JXh0CSCqqia4ZenlHqDNdc5gk6XrSFLi0rtHIiwdoscg+J6eWvWj3i09MmxVfP33DCqv
         /JZj6x5PInkaGBuDAgtYEeR2fiZQpDUxupx4qnVT2oDndXGVoYZWyCywqEC5PJqVc2iT
         ks4Q==
X-Gm-Message-State: AOJu0YwJTRKeyiB5Qy8IyUee3WleC3tD7F+d/YKQoMwhNaWXZxi0hffv
	j4+J8aMEhqnulEVzQzYJbjnQVilz5VZ6jhA1Mwl/mo7lZBgHsYMz/ku6tMKPFMRf7UilGXEy1p0
	6GQS0KiMQDm6y3XS+EjYSiQP3E6krWpM/
X-Google-Smtp-Source: AGHT+IGbBIyZXOV1AimT1jfBQbzVd9NOciEat0xOiKUNMsR3PS2UX0l210eYDJoQLVYDOpviUW5vE/4orzLv0lupGAg=
X-Received: by 2002:a05:6902:4c1:b0:dc6:af04:2e05 with SMTP id
 v1-20020a05690204c100b00dc6af042e05mr208159ybs.7.1707856644542; Tue, 13 Feb
 2024 12:37:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208002841.GA2601476@dev-arch.thelio-3990X>
 <CANiq72=G--5LW-9sg2PscTL863mFVNdnX7LUQX2Xj02qZs4crA@mail.gmail.com>
 <20240212234850.GB3221859@dev-arch.thelio-3990X> <20240213025303.GA4006766@dev-arch.thelio-3990X>
In-Reply-To: <20240213025303.GA4006766@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Feb 2024 21:37:13 +0100
Message-ID: <CANiq72npYCD-zKqcXPNOAxnKiUCCXGbFQaGo-8=0-171ni+ncQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 18.1.0-rc2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 3:53=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Alright, I reuploaded 18.1.0-rc2 with libclang.so included, please let
> me know if this will work for you going forward.

Thanks Nathan, that was quick!

I tried it, and it worked like a charm. bindgen reports:

    $ bindgen --version --verbose
    bindgen 0.65.1
    Clang: ClangBuiltLinux clang version 18.1.0rc
(https://github.com/llvm/llvm-project.git
c6c86965d967886ca5a2ed8968c949cd42cdd49a)

 And I built next-20240213 for LoongArch kernel with Rust enabled:

    # Linux/loongarch 6.8.0-rc4 Kernel Configuration
    CONFIG_CC_VERSION_TEXT=3D"ClangBuiltLinux clang version 18.1.0rc
(https://github.com/llvm/llvm-project.git
c6c86965d967886ca5a2ed8968c949cd42cdd49a)"
    CONFIG_WERROR=3Dy
    CONFIG_RUST=3Dy
    CONFIG_RUSTC_VERSION_TEXT=3D"rustc 1.75.0 (82e1608df 2023-12-21)"
    CONFIG_BINDGEN_VERSION_TEXT=3D"bindgen 0.65.1"

I also built our rust-next branch for x86_64 and QEMU-boot tested it
with the couple Rust samples:

    [ 0.000000] Linux version 6.8.0-rc1-gf090f0d0eea9
(root@02f0b7650ba6) (ClangBuiltLinux clang version 18.1.0rc
(https://github.com/llvm/llvm-project.git
c6c86965d967886ca5a2ed8968c949cd42cdd49a), ClangBuiltLinux LLD 18.1.0)
#1 SMP PREEMPT_DYNAMIC Tue Feb 13 20:14:57 UTC 2024
    [ 1.788925] rust_minimal: My numbers are [72, 108, 200]

I have hooked it up into my small CI to keep using your toolchain in a
subset of the builds :)

Not sure if you pick tags for this sort of thing, but in case it is useful:

    Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks again!

Cheers,
Miguel
