Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084992C183
	for <llvm@lists.linux.dev>; Thu, 18 Jan 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705594194; cv=none; b=VyHUZLIwb6nnB5dCfOV3kIDYU9eORaoBu/EZTAHGd4KaDAMRbytWzgQGJlG7yyPy1kNGSBDYPCOSMzJjXcMqeVFZUfdRp+nrKcn18y9J9IdsmRuYLzDhO7pgwRUbGUxAfv/IW8jR/CgC3mRRZMdTJjnCJ4uyb6jP1A2bE/Vwu/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705594194; c=relaxed/simple;
	bh=sat5XVJBaEElPICy/YsSs9yFT4hHkFR3P2GPDCmg8WA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=eTwAg00DIfjAy3+eSzwUOhVdwutKOQ2+Sq+VJpIMzs3WSHy3E9ZTM/4MmEdNeT8GAi+7iUBtmsOCzo6DiHfVl4fRCJzCamvFKaNoLHOlAqvek5Lh1m+lnvGcZcB8QS8TSX1gcB8lKQpMFqTKS35NyK2HYRsROF93YQhGet/Op4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsttGpR3; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsttGpR3"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6dddb927d02so6301541a34.2
        for <llvm@lists.linux.dev>; Thu, 18 Jan 2024 08:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705594192; x=1706198992; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sat5XVJBaEElPICy/YsSs9yFT4hHkFR3P2GPDCmg8WA=;
        b=JsttGpR3M+Q1wvRdUwd7TlzNWOQbcLQpvN4Y2JaSqoRll2eRo2zqCF7oXvVkOXkHnw
         s4lBorrCGaNKHyf8Qmdq1tb7LJqFuzWmzNdZPu/oQ4T7qJY3rgJyaI2aV0GtRDfE3PKw
         p6hJ6jq4xV6AAf41JKi55dG+LcSNKjY6P0XbMeGTc/Cw/WAK+vPedsPF0AT4+s2279E2
         R2GppXHJtztXoXvapraPbN3FIs5pgVcbjvmvDwArAhj07w9qvemKD3d0wvvSjaUFCp/Z
         77Mh2VXbNOrQ7/WNnriWUKiVuz6zKfYynKDuWFWSEAWoB9qfHSpfX0hrE3yeUtXLAJD9
         CMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705594192; x=1706198992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sat5XVJBaEElPICy/YsSs9yFT4hHkFR3P2GPDCmg8WA=;
        b=XhPpxV+8V3VZcmrL+OatEHN9JozwWXVaDHs4rjldIKtFBkRox+Klnoy5FkqAKqKzvh
         Kdv80A84VHKoEhMm1M/5ouonFn7ExkfFfj3nfLt9RJvg1AKTOsy2HKIN/WN7WqUPH4V3
         lxISSvr7Gb60jXkMgjbTQG8JVQn2ZfIBZctQ3dtIcnbTKUgktl4q/iVapTRX2j4lBSgG
         EwshBQQWEpVN5+T7acZpMgek/89aQQTj25Ncz4ZrtZdXbxfjBIvhVxzMuJI6cona/NAc
         pAMGatwgMBICGmJRGxtTHPD++DciMDjwN4wZApH9L9881+jlzx5G2MicQhGuj3v2aiLW
         1WVA==
X-Gm-Message-State: AOJu0YxLZfZlxWP7c3YhaAfu1Obyq+DYCTma/KI1KhRiDSow6ZM+rPRz
	TopkdCtHOGCp8pDOJhktY6K1pF6ekTOEFA5GV6h1gglYeDDZapB6c6YWzUlqAKMDHLt3tcLLViL
	7qVxMDsC04CVybzlwb1ocrjInhjA=
X-Google-Smtp-Source: AGHT+IE8BxWk8xSUOVo/9OK4svfp7Z2O77w7n+F5xbpJMja3d2YxFrdU7cRXJ7Wmp+b8zwZAJyZxdCAh53nVnb00V48=
X-Received: by 2002:a05:6830:1e38:b0:6dd:eb6c:8c7 with SMTP id
 t24-20020a0568301e3800b006ddeb6c08c7mr1066678otr.40.1705594192185; Thu, 18
 Jan 2024 08:09:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230307102441.94417-1-conor.dooley@microchip.com>
 <20230608-dispatch-sneer-aa09bd7b2eb8@wendy> <CANiq72nnph7LS1fLRtHz8NJ91PWXPaUnm0EuoV3wrbvK398AnA@mail.gmail.com>
 <20230608-spiritism-gonad-5f5aff4c3a24@wendy> <20240117-swiftly-parasail-618d62972d6e@spud>
 <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com> <20240118-implode-delirium-eefdd86e170e@spud>
In-Reply-To: <20240118-implode-delirium-eefdd86e170e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jan 2024 17:09:40 +0100
Message-ID: <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
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
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 4:49=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> The bit that worries me most is bindgen, and in particular detecting the
> version of libclang used. I mentioned to Nathan or Nick about needing a
> buildtime test for the version of LIBCLANG being used.
> I'm less worried about this for LLVM=3D1 builds, since while I think it i=
s
> possible to provide a LIBCLANG path to the build system, I suspect that
> for LLVM=3D1 builds it's almost always going to match the LLVM toolchain
> in use.

`scripts/rust_is_available.sh` tests whether `libclang` is at least
the minimum LLVM supported version; and under `LLVM=3D1` builds, it also
tests whether the `bindgen` found one matches the C compiler. Do you
mean something like that?

For `bindgen` under GCC builds, we will eventually want a "proper" way
to use GCC instead (or possibly other approaches like querying the
information): https://github.com/rust-lang/rust-bindgen/issues/1949.
Recently, there has been a thread in our Zulip and a couple people are
experimenting: https://rust-for-linux.zulipchat.com/#narrow/stream/288089-G=
eneral/topic/Bindgen.20--.20GCC.20backend.20port

> I'll do another rebase and resend after the merge window closes I
> suppose :)

Thanks!

Cheers,
Miguel
