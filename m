Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269181BC57
	for <llvm@lists.linux.dev>; Thu,  4 Apr 2024 15:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712244328; cv=none; b=byt7Tg/wB85fdIjo8bAyLdiLwVN4c4CqBmjy5FobHP+k90JkIdNEK9IU9Lzxs5zqlgzQl24MekZ1u6QQvb/JjTNaFYdEl+/tGdNEwq0Enp1RwVs2rum28TW54cXFlFUdTwNFoNIZwY6Ruw6sp5RS5Cs2jBNw6E79qmeOuLBD4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712244328; c=relaxed/simple;
	bh=ByPtciC+URhiVQn652U1XVXGfMYChxV1rxw8MNlXaIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fZsX6eTvyEyP7gNgbO3/TUMP8ETxd+XA/4PaShYBzkwK9FIPPOrVIc1w4cqLlXlee2vaoiKrMjZBFMTAdX5Ij5hwDLysvX1QvEUBoJ+A/0gJCzddDbzboG4gCp5U3SBLzrlyxQUqR879SbTU7uwEGqklq7m2lhB4/HIxcPZxWsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSQSKcjO; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSQSKcjO"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-56e0430f714so12807a12.1
        for <llvm@lists.linux.dev>; Thu, 04 Apr 2024 08:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712244324; x=1712849124; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ByPtciC+URhiVQn652U1XVXGfMYChxV1rxw8MNlXaIw=;
        b=fSQSKcjONJ1RUe2aXSVih7IkuKKEyuRFSqRZQE/nFdf9KsBxFgXteCMlz6RrlYlv5H
         y7DIWzfK0MevbkjpeRKv1H2/TPRHDKU5ukPOHfoEyUiMICaZNlwJqADARnva8lW34pBb
         jS24t2shnyB6EsveEMQSboLLlQFir6J6JeOqfX0ZoidYMcwYnYO/GtThkVSn+ib4Nm+e
         beEHFYsU7ei2A2sjuye0x6rOCv9beX6cfZgajDLb8NtfZqoktW9oVZ8PAxmyvtSwAc5N
         8ZgZs+PjjBpDsvbwhpmnVETfa2Fyw3enYHoCt/zTQJPoHHVmUhfo3BFESvQTQC9JptfS
         2W/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712244324; x=1712849124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByPtciC+URhiVQn652U1XVXGfMYChxV1rxw8MNlXaIw=;
        b=ngR0tKPUewdO1fhuQhR9x/GhliRDonHddMWad4O2eMbD9qvUYE4isvyotHvKOq+T9v
         pO6lSh8q1LgUAnb/sn0oVRFCA6mN945IgejDQAunch7Ho7a33jcIAl3PSmh9/w7x9ViI
         /m3L9PEFkqR058DGcd5JU0KTSfhblABqA7OrUhGUm/C339zms1X+ahhzV2IXAqeIdxTx
         06CxzYvnTB8ahObGaobyL7/T+M8AIWRDP1YvMQRzCAM4KCg7bekR2qsvrpxwGsS9x1Oo
         m/O2dn5TPDNY4Kn1AYo4dUJOOGPfd10fhcyiWfrMa7TEC66taCpAsMOqHJSRkYa1BJB1
         5BKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7Ro+nXApqjDELsAeBSyCQvvVHfyD1/TL0YNG++agzYoLavMy40RgSsPQaLZRCGLJhOHJxdeyVIlzj193irSLxOS67cQ==
X-Gm-Message-State: AOJu0YxVtLDftRLVmtxi3J9VcmXoXrjHDr35y1vG+13NxZdXcsC8SeKo
	sMxsrF0tVadk/hZpkIsqnCU8NTKjwwtnL4I2omZIQ2T3jlj/VtTu5pYwq73k1uArH6ITSKQnXZJ
	qz4Fe+N0c+5NolrTTkMhlNynb5mYSww+Jp6nK
X-Google-Smtp-Source: AGHT+IGu/Cr/TzqDAagcQzAh2crALYKXnU9saXFMj2Uan9qVNOsYqiQC9yQvytlJZqCQ8hhUrVOQhul4utm/mgjk4xU=
X-Received: by 2002:aa7:c38a:0:b0:56e:234f:b44 with SMTP id
 k10-20020aa7c38a000000b0056e234f0b44mr71333edq.5.1712244324404; Thu, 04 Apr
 2024 08:25:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240404-providing-emporium-e652e359c711@spud> <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
In-Reply-To: <CANiq72m9YAu=dr1=WMSHOqfpszj4S6OkMEQ05vqbv_zKO5pOsg@mail.gmail.com>
From: Matthew Maurer <mmaurer@google.com>
Date: Thu, 4 Apr 2024 08:25:11 -0700
Message-ID: <CAGSQo024u1gHJgzsO38Xg3c4or+JupoPABQx_+0BLEpPg0cOEA@mail.gmail.com>
Subject: Re: [PATCH v3] rust: make mutually exclusive with CFI_CLANG
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor.dooley@microchip.com>, stable@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Kees Cook <keescook@chromium.org>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"

>
> Cc'ing Matthew & Ramon as well so that they are aware and in case they
> want to comment.
>
> Cheers,
> Miguel

This patch is fine by me - the last patch needed for KCFI to be
functional in Rust just landed upstream last night, so we should
revisit this (in the form of enabling it) once we move to
`rustc-1.79.0` or later. In case anyone wants it for local
experimentation, I have a backport branch [1] which applies these to
the 1.73.0 compiler and enables it in the kernel [2] (not upstreamed
because the feature isn't yet in kernel's `rustc`), which Android will
be using for the Rust binder driver. This patch will require a recent
(last year or so) clang, as it relies on
`-fsanitize-cfi-icall-experimental-normalize-integers`.

[1]: https://github.com/maurer/rust/tree/1.73.0%2Bcfi
[2]: https://android-review.git.corp.google.com/c/kernel/common/+/2930616
