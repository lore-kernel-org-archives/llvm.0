Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEE3823CD
	for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 14:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708699736; cv=none; b=o0nSb6KM+GHDHzji30ing1yCXgcmaHtiri6pTZOUbZwz5WN5e3P31sUq8/9CuJ1MZ0VUlt4CPeKPQ0CrHRtYCgwquo1I3z6MVR+rMh/458EVqcsu24SCk3jyrOE01upkBcqnJgX4BIxWjPPVbe+nS0V0mCht/6tGoSOXeXw0ql8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708699736; c=relaxed/simple;
	bh=8JApompvM0J/gpnwcLTup3cUj8M9W3A4GPR/LpT+CDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TfI0ufxryYtvxpDioDs4nmLmak3BQxYv71fz72T1IBDH6Lu8SDC0xg7K3wIYMvf75WzxUnnKOicPFH+jUjfTA1d1aXSJPO8vnWKZ8cwF95r2l3gxLE91qTMl2QMNJsOV5nXkRbfzSGFthIXupyG87ZUOFlz001PiY3BE4NrvV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdEStF8i; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdEStF8i"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29a5f100c1aso708552a91.0
        for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 06:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708699734; x=1709304534; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JApompvM0J/gpnwcLTup3cUj8M9W3A4GPR/LpT+CDE=;
        b=mdEStF8i0rReRHoOBs5RcwZ+aCqSpVD/JUlruWSbOCyoKkj/rOpYXxlleu04vIJzPH
         tSt706Fq/rzdk73c879rRlxnLAr3Rnr0huJ623lbT/4VKlEMspDjn+A3G27PWQ4deAmn
         VXsaEAMYE+BX25Zgb7zMdT2BYR6XLsNZdTDEXaxJEdSA+2ErKmJ5g3KCOIctWCIoW069
         6fc7D9QFNBIcA6ck6Cb1f6liDznyttFNO/8yBT9m3cj+DqmG3dpBO9nM0zPeUQH1Pmo4
         WyoaSpGi0lQsjxJX1gfndVqrn5KSJtB4qFLw8vzYTP9SAddFjaQr3esezNqj5otumhYk
         kGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699734; x=1709304534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JApompvM0J/gpnwcLTup3cUj8M9W3A4GPR/LpT+CDE=;
        b=Kub58m5IieAPunoeg7cvbLgXI4MY0dipnRlgZwoRtEuirBai26IcGaUzoAehPPn/aF
         xShizfrwQ6JjVBW+Z62ZH88QXdBlaCakJnRnU3ccMKVpaXKhMOlIX3oxQOEVptyFUw4V
         vJLLYWo3QBe2SJPtQa82I5zN5gZMY1FXrxMOEg2wotTH5Mh723fpnqskZ1K+neKgyDxn
         r9dm+SCpsh2TmvE6I/KuCYn+k/cDfX3NudoiyjWvVpjDsc86ViddNgCeW0ByW8LU5GtR
         KTICDnVqbkWNHzFFL4Nw6qICq3qvjpqlEfMDoRKDwW/CMQeCVleMFDsSjW3Zsvkvhuvt
         BBWg==
X-Forwarded-Encrypted: i=1; AJvYcCWyXCkXqTNxK6qZ9yz5E8uNxJDU6uUPLdKQDBdS6a1ZFGUBRzRzTXhQ16TNO/rxLC2R3FK48ZIqeHdM13IfKQIvcbd5iQ==
X-Gm-Message-State: AOJu0Yw2PRPmxDw7u/9Df1q9FNbetxkCug4BL7t0SSkIqGY1N4zP0IUA
	tcTywLzV4Sra4TytaruvuC5gub9RKtOIIgSF3dJOCyV+ws7XrCvuWftSMB11ekHCVlwHqgosSt1
	YROGXXAIzjK3UMO+mZ9dy1kGLF2a4I1Sc
X-Google-Smtp-Source: AGHT+IEx80L+NjAGNZBT0jrWK6YYZABf331Gny44+Vt2581VZkWmKe7cyuzJfytUyxpNvh1A/stzEYfy6+bcfMkUw/I=
X-Received: by 2002:a17:90a:68ce:b0:29a:2788:c9d1 with SMTP id
 q14-20020a17090a68ce00b0029a2788c9d1mr7269pjj.39.1708699734458; Fri, 23 Feb
 2024 06:48:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-palatable-quintuple-ed221a517407@spud>
In-Reply-To: <20240223-palatable-quintuple-ed221a517407@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Feb 2024 15:48:42 +0100
Message-ID: <CANiq72=z+aO2cvmyHNYOVQyAXLiZeM5KV+YrMXAsCkotJFcHag@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: enable building 64-bit kernels with rust support
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
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

On Fri, Feb 23, 2024 at 2:38=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> As 64-bit RISC-V is now supported, add it to the arch support table,
> taking the opportunity to sort the table in alphabetical order.

Nit: this can be removed now.

Cheers,
Miguel
