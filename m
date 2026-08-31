Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA39049CF43
	for <llvm@lists.linux.dev>; Mon, 31 Aug 2026 16:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788193983; cv=pass; b=Lh35IG/TvSfUPPxu3s3zgSI91I5nEvGqnBZ0Hx/dCaBbMRDUb8SYRgWKajWV0H8xeqCPMtEoQzrDe1320kHX3JvlusC3R1XQu4DsRQ8JjGZSTY9meC2uBlymIXzdJ+pWoBhZIhzGEuWEQVGnY9Ok9b+UwQSKFPnqKEiBsUJgM3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788193983; c=relaxed/simple;
	bh=WAb2HioeKt8yQ4+e2mWpoQ1jc7oIFNQVMnrcZ1VNVk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f/CAcnW9ceMApQDT2W3nBAdbr2c/zpiia6q74hO/VUBRRMLNts97W1e4u6LOVDVmH+bTmxfxUdE0fvCFdUNSOOHGx/NMvv8VZGgJP0ZKXoslVI246jhI/ZioYbW+F/FzTrz4s1A5WELxwVT558+kduyvpPCcyVreQQpXDQ+gI9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MgxHD8Xw; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgxHD8Xw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fec3c1adso4472145ad.3
        for <llvm@lists.linux.dev>; Mon, 31 Aug 2026 09:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788193981; cv=none;
        d=google.com; s=arc-20260327;
        b=qi7zzjatYiHY6dnux49ypIgI/K/D3sY/tU3lTCYaO+zfGOUhIC8UTYMw9C6Q3w8s01
         W5dLF1XpNCYLMbg3nOQ6/WW91DKX9JzOsLEkGYD2HP2aypMONk5T+pCCJSsb0N1uulD/
         Op92tjB9Bl74Q++UttSBPV5odKtA5LFLWI/rM3JXXp46QoSH803Qi4e/XpXw7Qb/ZK/o
         VPsJxYxSFECRt5cr0H9lZbEYLcnFp3AYKejcFHA9MGQ+Ey2j6iNKylPaft+5b90V2ARC
         97gFrzPGxZf7RP76kN5x1ZxvYU5VjDF3np2Yxnb//Fy/Pg6pGAl5JPUipkOZnjvgpiFe
         UqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        fh=3duOIBItP/B1kt+OSjt+1iTQPvZ1Aq+I/XRlAK9tL94=;
        b=sr7IAIlpe2d7aanhCRVnnDwvaCKji/UUJd/LBOhzkx7HJaOg+ezdl8GUvOXFe1fztF
         N1JA4nEgasn5GZCF8O5Epvfhh/duYCrW05qqDOOxoSt7iceheFdFNQtEKa4oo9LMmijf
         +v2uTrGqAqQ0QM8NPYZ7VHoKODcpbBjDYZJP9Ijnx7NDTHaX/JVfu8N9RWf5Qvcjxhv6
         /8P0BcujL5tMOEEmXM+s2FguBgYyQm7pqi72mLlTlELDBFv18+ndBDm5N3aT/GvX6Rrw
         PYERG0jEhjSxY+XhkWxD0pAQQB/U9l4LEvt4Thzf214sJiELWu+6ObhUdQrIKtQOmbJj
         Ixdw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788193981; x=1788798781; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=MgxHD8XwogKIRn3OYcCmJU4L4zJkMqn1aB4vN61/heGdGV6m32vtBx0C0HMozsIM+H
         w8HYpQQPXbOyAubrQ1lXHdc2g6nDPRfwDz39E18a/2LiLp7qQGd6vuivQXT5K4l9FKiG
         9rvqx6ACRHWvFEBbis+T0370IODBtoVk95D4WqvoHMlucU/6uquHfW8En7rfVqWs9d6m
         7K4qAlNirhhKmzniukZj/huU8fYrB80CzUfDjQzKpjd12qq0LexQu/gwQp4GsZzPuMQA
         WUsScBi4+s/1cditf/TcZt7c7zMVYdXwk5m90L1fv0+KWWibkmC4GnTv0zJvA4sHmwq3
         fj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788193981; x=1788798781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJzwv1wFVi53NEXZo+hKmNYNH3NbrWf4sdQ3Ijd6Mi0=;
        b=K1yhgh8fvatjJBsSfqfNyByAhUJDFIROnJrs5IOmfEgsReXV82pwLaOzVkcuLoOXEU
         key/9r9HZtD5cPA6cKGjoxd71FvZKTvf0oWVkXOEwhA8Kutnameqm7y4nJ6GasXp5TyB
         ZmsDNFpq3sv6SE1EV+lHBxO5O+fvJB5q4Bo/3nAzqkczLtzXH4RgWBd9z/+UUiIIT0KF
         uVAx9y6YfjB3f+KFaDM+KC/YBHUHZ4ZeuSiXZX0RgPaDRUxLXDoI7RAagUuMpRrOlBHF
         0FKSrBSOPvwQhHxTBqf5vQOXMGAujYYF68MC0GVvGLln/4jcGG2IblEdbqx2aq+nnPHA
         ZqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBydePXE1XM8sxpTmhH9sOPB83GB10A2SHAEms3Y8mmbK6cm/RR9N6vawc08RWRDXzelXylz@lists.linux.dev
X-Gm-Message-State: AFuF++kpnJEdbo6KjvN6CLX8SAuGFIcy/mo+lgmME8O0L8PI+D7Fb/vi
	Q/iuj48IX559wx2Gs0BqGetR2HE11GdTnN/rZrgMMNe2tBtPhpkxLpTPmIIflEJ5pGEKLZ3Cvki
	wNEpBU3zwL5eTK9S1g0l8IXhWd675dbg=
X-Gm-Gg: AYBFou1SQFWH4qQtATgy9a8z9L4XqCyy9umEbF4zRr9g5VoOs72SudPsi/W+6nS0mGR
	N0uXGvHHqYBEKXoK8Z+tnOnz5fEJg5ARRdxyH+I+svMeIC53K6qETQabjek7yGDIAIvd9nTSHvS
	u0xMW+BjrC13M29HHXZ1gxD/AkSZ/Pam2Q1r5cIK7OdvozVlwzsO8yHExH2gCoA0mGFhmNCMNrD
	Mdqz0n0TR8rfS3FYzruIRi1FptgRRYjE8xgTngBc0jZhplX+E/xkZ6vPWuNyR/eewu0HkrcRuzi
	TCu4CP1SAX3SXF6YqB6KJFXfr7hesimnAFA2wB25qpUS7SOU/Cl4KtRi4dCHij+PLmkS9qMhGxt
	Dp3x3aJnHoassIjq9o060nYqDiY3lBfzRcH8WtHLZQj12KPjWO6ckm6+CqYqo
X-Received: by 2002:a17:902:c94e:b0:2ca:de3:15eb with SMTP id
 d9443c01a7336-2d74ce5e476mr224272585ad.0.1788193980913; Mon, 31 Aug 2026
 09:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org> <20260831152523.638881-1-manuelebnerli@mailbox.org>
In-Reply-To: <20260831152523.638881-1-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 31 Aug 2026 18:32:46 +0200
X-Gm-Features: AcwNN1WxT2qUEpoESa1nnOxcvqd-4guXTylAIIzIEvrVEhydUWRkwim0NkJ623s
Message-ID: <CANiq72=TYcLdj0t2DbboS31L4BNrSg-0bRmHZe4SDnbRLeoy9g@mail.gmail.com>
Subject: Re: [PATCH] v2 Docs: changes.rst: introduce optional column
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Guillaume Tucker <gtucker@gtucker.io>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:25=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> +bindgen                0.71.1           generate Rust bindings

Should this simply say `CONFIG_RUST=3Dy` too?

> +Clang/LLVM             17.0.1           alternative to GNU C (gcc)

Should we add an equivalent one to GNU C?

> +gtags (optional)       6.6.5

It seems the patch missed this one?

> +Sphinx\ [#f1]_         3.4.3

Should the footnote be moved into the new column?

> xfsprogs               2.6.0

Is this always required? There may be others that are actually optional too=
.

Cc'ing Guillaume and Nicolas -- we were discussing Python in this thread:

  https://lore.kernel.org/all/apG3hwaPA8f7SJeI@levanger/

Thanks!

Cheers,
Miguel
