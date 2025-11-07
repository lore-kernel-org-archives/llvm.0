Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56FC338906
	for <llvm@lists.linux.dev>; Fri,  7 Nov 2025 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538228; cv=none; b=NhlU07baUsstqCi0/gxAz1kGN07TfVTEBAC3uRwi8KOaibTlhQ4uZ9codfg8RRJVelTONoiuDPeF9RVs+gXsRJv6ID6oHrxb0I1jtXWOHD1mT+696WZ8H3bISiMNlB2FXDF889xduks2IuaveTHLnb6x+W/BxY+rnqlPtdoq2jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538228; c=relaxed/simple;
	bh=RSvet1hGFhNMSbzfn7C2gcX1x5+f+dd1m1faFTAl1dg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFdhCASWSskqs4ZlmzMl0mYExAAZzdo9TsAVpJXvjzouk4a2xgzPxWfhYuvHRJ5zMD0IV+4fdiqF8Sff5TshjGE7XWFPfwQCsFDOAXBKXJKqQNISYRRgg961ecbfWI4mI5joWrxuQwoxB4trwBJOZgx/3CZTBpdBG8ud/y4z3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W8Q6Ux0a; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W8Q6Ux0a"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7adc44440c6so50850b3a.3
        for <llvm@lists.linux.dev>; Fri, 07 Nov 2025 09:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762538226; x=1763143026; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSvet1hGFhNMSbzfn7C2gcX1x5+f+dd1m1faFTAl1dg=;
        b=W8Q6Ux0az6fOQM9lQZ+MmSw1oNcsR/+XYklrMiHBEXt6D/7wDU1oKei/YCaQqz2EDU
         0ndCIzph2Z4u1A7SNl7ect7jAQCSfJNnMYUxZUhzmJX7HaLyrhszPWaA5QM7N9E1a1CZ
         ZiAs2R7qW0s7/S40QFoEFBTarJi+E1CDQoLCGFXx5kFqRtuSXvEpcKyOoMyj9FCd4BaX
         ohD+WmWczKeKLtX1qAsSl88KF8zbL9JWNnkQO8iI/+liXZ/h51/bJZ3Yt7/coLJmhx/f
         Fk40m0gwGNitxzyLGFeyJt2F1fTux/80vjd0SFUw+2pbU07atS/QavprMKWlGsKSn3tD
         3dAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538226; x=1763143026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RSvet1hGFhNMSbzfn7C2gcX1x5+f+dd1m1faFTAl1dg=;
        b=k/FgCojBsTe8e3vCBso00lMzDOdImvLosjMQ3hEnHMfHkNA7V8C1Pij6481IRTB0N9
         Nbu/pdoRsIjhdZzIYepE8GmUPAGaZu9JMQDwD208gtNRSlLG7XGqs4EPzyEwg4LQuMZQ
         +k9SCpAgDlcZBfTOpJal8DZluJUfhTGwNotX4YlWP6phlRrD+BBGftCNezKbE1DJt96r
         z0rcUB7anMEtdcZ6yGIkp6CWEGtw0JqchTY66Yy2ZHA3mvHYMCkUlOqEPWFVrY0FKRPJ
         lT9YN0hIHA8UILT6z9uX+MqGdY2DOjATdGPQiNYiEOXoeseIIHPGf1018C1C0Vwyv6fy
         KgEA==
X-Gm-Message-State: AOJu0Yy1Ne2r323f1zoLY7SkCeRLrN5eoWJZrlHpOcIK97L5Vh1/6VJT
	Id3q3HuW7oV9GwWGfZRbwadPiw+CBT4WHqU5cWl3G8eqdVh+CUsSRAdANCuwo8btXO+D69MPvaK
	F4Yv2tEUHPoBXxihhhlEbOnE+v+aeNjM=
X-Gm-Gg: ASbGncu6DfBevpwDccTfdx9I93KeL10QSlUHxRpb/5eTzjZ8IAIrms1T3TPBPRKGIqr
	U2Un1CgK3TQCl+iBFOMKUOQB3WYZXfskN6QXw3M9OV6IKsx7mq/hGwrPA5GCDD3LlJ77i4a9AW2
	fnPX+DvigejEYf0l8Dssw5Qm1d+2YhH5b+j9/iYlp2Bymk/FPzrorXdruI1tJtNSffbkIFc2gCN
	5pDOw/+zKXzniZNz/bOvJd1pkdcbr3frowPAiWs/wj4cw3mZtt7QIHAe/qUUd/0NHqbSENWrUnn
	yoimo+EnYRkGp8yvJEc+eqGcMjgrXNOSFQ4wdPyqxWGvX0zlijswRNoE2VaJI4Le58wMB5TfdTm
	ruMY=
X-Google-Smtp-Source: AGHT+IEcZTSN4aKwKC5egIoA0UmNDa8Z3AvdE7wthF+TinMhFsnkvRKXfrW3Yysr5BNbtNDdHJ6Gn1gp8qQM4W9Hkyg=
X-Received: by 2002:a17:903:10b:b0:274:506d:7fe5 with SMTP id
 d9443c01a7336-297c03b1d55mr20192915ad.4.1762538225889; Fri, 07 Nov 2025
 09:57:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251105062723.GA2341496@ax162>
In-Reply-To: <20251105062723.GA2341496@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 7 Nov 2025 18:56:53 +0100
X-Gm-Features: AWmQ_bkgBWAnqAXBLtdQ6YJmXoxsa98i3NTbQ_nqWrZ4cr9q1bEnykYt-XXo5rI
Message-ID: <CANiq72k3WuXTyk-X1ye+7JThf2pNcgdKnqOrFieHqxOMZD2oZQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 21.1.5 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 7:27=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 21.1.5 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 21.x
> series is no longer supported.

Rust-enabled x86_64 with upstream `rustc` works well:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks as usual!

By the way, not sure if there is a reason for it (e.g. a workaround
for a bug or you don't keep the old LLVM files etc.), but just in
case: the matching LLVM for Rust 1.91.0 (and likely the upcoming
1.91.1) is 21.1.2 from what I can see, not 21.1.3 in the table.

Cheers,
Miguel
