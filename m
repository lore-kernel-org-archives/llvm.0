Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0126226A1B6
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 14:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734923; cv=none; b=FDFUk+du/nGw6W8CvabrR492eLZhVqDGAgD+U/n5yYfKzKH4SYZ4USy0xCRIajI3yoKiqIva7/2/x8Xf/jP+8lziHVnSYUphE35++S3hDttV/6ef6RPPQjil+oaVHml9MXkacPfrZ7KlEEY/it+OemxNkxH10G31s5pYzbIr1DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734923; c=relaxed/simple;
	bh=RFR3V1kjpvSdxAsPiYx8UtQOBKC0WuXfpNS4qKQz+TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=noVB8Gxkz/QBoRk8wGgS/b6apsSXAdnKJrLNbQ4Ig5xCVAcA13OEO86M4xLGJW7bSTBdKFuE9Tl2KFFPaxd/VgYUQXpsFwrLJNQxQIblfLI6YzjW9l7vJdTXESMvvT27kJKRcmRHkLOQC+FIEKi8J0DBx72hgwUtYQIUicESFok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZSnCFJh; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZSnCFJh"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b8b33cdf470so49338a12.0
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763734918; x=1764339718; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFR3V1kjpvSdxAsPiYx8UtQOBKC0WuXfpNS4qKQz+TQ=;
        b=VZSnCFJhOaD4DKI9PJIc/XoJEuv/3sLQD/eC7AbXR3DmLO1UZRTGvaBC9/paep2SXt
         2BaVHKGmAwN2diC/2xarIMb7FLcVhq5Kim+2liOXCdRCWBVz+x06rcTL0irJHX9BB0Bb
         N0Fq2vd0LHNfU6vrBU61MZuOO4yQO/E++Qs7TTS8Kj42DvNwTKZu9gBF5QscGxcjC+n2
         4yc7rQtD2pxMu1YA4dCdMQh1evvgm2dXvx8Yy78O9s1RPyY+NkDe8oUB96hiRbDgN7HS
         a4n93Za7y811gxXJMK1LbsJ+i8vc9zxlY7DtK/vnGMHCJML6QgG2+X0VwWZ9XAf55IME
         3tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734918; x=1764339718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RFR3V1kjpvSdxAsPiYx8UtQOBKC0WuXfpNS4qKQz+TQ=;
        b=oHbUBFJwHQ81KnfrriAempBO9R2r2qEelWieY8T6LWl0us6zf4272Y1ZubpYWxuz1V
         BpDaU5KUvUCVQc+pvRlAnCuTACwMBAulQ/V9FPTSvyBkcrIPAtO0Q8ps5vLyVvl+bJjI
         uOinsUD+zo9YuWPb0NmvOnDqY2ogBMd0lHPcMpAHOraLk2DmEA8qblHLwvDKeTXkbs19
         vNAuD09wzL3SNOnJrUsWfjmwwRKyWrZR/L1zlQKIm80IW5okZb6fR4O8o4nnKDoEhXEe
         WZhz8SGHNEjgO0c2A0Va4GtSYNLx8XTTiHd1UWcY3YQeQA/rUmAPKZ3lTBy6OvkH74K0
         FSSg==
X-Forwarded-Encrypted: i=1; AJvYcCX53JM2A5cmf1gJVD4Fhl81/u1tDrjwys+PhKq1XQ1D9pRsGahqagD6tFOdsEVAm2YtaMb/@lists.linux.dev
X-Gm-Message-State: AOJu0YwISlba2BiafKfFRWSquFm9wJGIROXa14Inwqdy9MOhtWCouSCn
	roM+wyTQ1THVbvIem2G1BL+ohFXIoWwTbp2Kqv3RGF74j40PQlZjKqw2uZn9uFkS0KXePDGGKf1
	Bkd4btxLEfw8fNSAAK7CYPcqFpKpTfm0=
X-Gm-Gg: ASbGncsPNPLyYlMjtC5ENa1BJpCBKiGpA0HqtMRveBGNkEFdyjo/+tWlF69pdyHxBpt
	LvvJiFVD3Or0uxGOzxemvEgV1IGMTsZUyftDoeQ9DAO/lcCtt3gFtuP5YiDQwvdTxQYXyMAgCo5
	Lwq5wy7+dHwEbq6o6ALhPUGo9k2dIqF6n67Ton8l0O+AMINUbjIartQPQkiSf8UICb4UG6HhdvG
	y66drJga9tAGYKAnvjLCGcFST+ZnJ3oxyRHBHAyNKCGxHmF6sDjL4lT2sFawN2DOmrcbOrEUPSP
	mmK0URcSYy6XuPOy2krkAh7mP7caYBk5PTqrJfHPEzGb/9xpFBKegfm+7exyLafg0qP7vCTdTwD
	RpK8YYCxfU++iJg==
X-Google-Smtp-Source: AGHT+IGxgGStt/Y22K+JAx7fQyUc5IwSKSdul7Ur4fV9rcsaVu624t/wqTaDPbm6gJD4VZMySt2L8cgvvFVuT+BFc/E=
X-Received: by 2002:a05:7300:ec16:b0:2a4:5129:fe99 with SMTP id
 5a478bee46e88-2a724bc5450mr573676eec.2.1763734918154; Fri, 21 Nov 2025
 06:21:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com> <aSBy3HQ9Z-h2LbB8@google.com>
In-Reply-To: <aSBy3HQ9Z-h2LbB8@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 15:21:45 +0100
X-Gm-Features: AWmQ_bltZJf8aT4AG5SSFuJR5htkKbAvAmWm-6LDkIIZH4sdUIX3MWvzZ0DLe6k
Message-ID: <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> This kind of thing is why I keep saying build_error() is too fragile to
> be used at all.

Adding `unsafe` blocks for things that should be able to be statically
known isn't great.

`build_assert!` is just too useful, so it is best to try to understand
what can be done, or find an equivalent solution. Gary et al. may have
some input here.

Perhaps we need to resort to a macro, that would at least be better
than adding `unsafe` blocks. It is what C does in many cases, after
all.

Cheers,
Miguel
