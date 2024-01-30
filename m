Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659367E6D
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706611776; cv=none; b=iBAnib6nhaybJFEIabuZSDS5VB3NrTWsRZBqpVPvaWtJVVo3XulhfhBHaCDGD8QzjTYb0fz8QQRgrhVC+LHpmAndJDlAG27rIKQ9dSpvmmoQsyt93WZaOTNVc2zmksrVWmc5ttGnN7jzj9wqWkV5YQyXbfkNIrZSqofuezwlcYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706611776; c=relaxed/simple;
	bh=vbFKDC0D+QXAEVrlJwZgowqdMTDh+yh17HAwRs3/hso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi7/s4iYM5pp7nK1e9en4uRaiugFSL0LZ2j/dN6kfy4a8JQcheX8SujciZD+nnnBefvOPxVVWGtWDcJaqoS3Fi5z9njt7RuyPg6WD3JGYJEEo2saXvjsyT9cky6XuF7Ra2aHfmeFLDLbI2DHbbpfn9GPRkpVe3WwWWxFwx9WUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcRAc2a/; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcRAc2a/"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cf591d22dfso27091551fa.0
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 02:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706611773; x=1707216573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vbFKDC0D+QXAEVrlJwZgowqdMTDh+yh17HAwRs3/hso=;
        b=XcRAc2a/99aPDu7u7jaqVhsUwEwkmskQ+OfPWcHxhTL+0JNDu8tUmOPhtq8IAfUfxE
         XiJvFIxDEAjIbjXeMToMLuDI4QgqmWiv2x/r8ixqKapDtxOacUvl9gQRGpwA+cpFhmG/
         tLwt/q8gYyuPW8+l6lLErhK6Y0gZBCLFpwDin/cIk9XAcYhFhziytVnJP+A3huT64Eds
         uH5e5n7X6OONFgEzOimFp/PivvyV3+DrpEHyWMgXWQl0FQbTXo8vfkk5Ct4jA9ZfA1Gi
         TXbUprd/giHBXYYW+A3xadDZAQhHzLGPXs5Ysjl1OKq5uY9b7YhToPSOVjvxZBAvG5k6
         aR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611773; x=1707216573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbFKDC0D+QXAEVrlJwZgowqdMTDh+yh17HAwRs3/hso=;
        b=s0npePWdA7t1fEheBcnTc+H9p9XbBFwN929Hb+iFU2CgnbNoDwgjqPByvdAKXzSqWQ
         EiZCXCVhzDmyglHeN2KhjVzR9t0aK/YUk3Fj0oWlw4cSqzZ+zWObte4nmWpP4daOVOLK
         xyc21sjLXtOM+PjPCOFYD/HRglbVnNDvcHzo6OxCoY224y4h8EsbOChgfvMvSH2TMXmI
         pi5YPjmR8ct53jjKFdl5LSH6VnwwAKsviiwi3U+JnQ2OMA7TKXrQlcZZ6RTDjsz8Pr1k
         urkLkL5XhVaxxHssjDJF3Md3H9gnM4uiRV68MHXydnGgd6un3WAzSSAFhEATDBiS5zy/
         aBvA==
X-Gm-Message-State: AOJu0Yy0ewj3mvsseqp/zX95ZVB6BOKj/Fg6fehob4PPU12rwNI7izKB
	jO2ol76jr+/55h8bM1BEPDVntD8rnWY5e/ElovY6zGv7GwPKvWg7Z2iZknHMcGUPdEoL78bx6/v
	DOkJlib2g3E5ISrERXJ0gO059yhQ=
X-Google-Smtp-Source: AGHT+IE9amhBbFX1P0c31Oaco2uh8AYrthPbebZ8QRQVeeYeFl2rpWrJju3O9v0GM+Nxqtsb2aqTYAittrgK6BIvJes=
X-Received: by 2002:a05:651c:b29:b0:2d0:54ef:1dc1 with SMTP id
 b41-20020a05651c0b2900b002d054ef1dc1mr2169264ljr.25.1706611772436; Tue, 30
 Jan 2024 02:49:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+icZUW0GvM1+A3NKDYRrWhW+eXZj7s0uksR75FMCChkAqp_2A@mail.gmail.com>
 <20240129203518.GA1851901@dev-arch.thelio-3990X> <CA+icZUUWOLA7YU823tuuTVCkWh7dBVF8zOMCREuLVEXFnT2izg@mail.gmail.com>
In-Reply-To: <CA+icZUUWOLA7YU823tuuTVCkWh7dBVF8zOMCREuLVEXFnT2izg@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 30 Jan 2024 11:48:55 +0100
Message-ID: <CA+icZUVmuP4MNyvd1Q3XijFwGRcuhUzbTghnQdk-ax1EXF4dPA@mail.gmail.com>
Subject: Re: CBL issue 1984 - AMD64 segfault during LTO building linux-6.7.0
 with clang-17.0.6
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	Michael Larabel <Michael@michaellarabel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 10:14=E2=80=AFAM Sedat Dilek <sedat.dilek@gmail.com=
> wrote:
>
> On Mon, Jan 29, 2024 at 9:35=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
> [...]
> > LLVM 18.0.0-rc1 should be coming out very soon
>
> Released!
>
> https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.0-rc1

OK, Nathan uploaded a new optimized LLVM toolchain v18.1.0-rc1.

@Michael: maybe worth to point to the link(s) in your article

-Sedat-

https://mirrors.edge.kernel.org/pub/tools/llvm/
https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-18.1.0-rc1-x86_64=
.tar.xz
https://mirrors.edge.kernel.org/pub/tools/llvm/files/llvm-18.1.0-rc1-aarch6=
4.tar.xz
https://mirrors.edge.kernel.org/pub/tools/llvm/files/sha256sums.asc
https://www.phoronix.com/news/LLVM-18.1-rc1-Released
