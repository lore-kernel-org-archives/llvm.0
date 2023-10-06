Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C3438FA6
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 21:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fGF/2q8H"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-59e88a28b98so23654167b3.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696626850; x=1697231650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Nc/T8mYGdG+8ih2hLlQGq5+NcAgLXntLW2uGZP0254=;
        b=fGF/2q8HiB0Xv0XSXbdtbil/JMlv30UXLJ3goXuX63zTym60n//S91/jPW+FV3LZut
         ndNBixImc4NsVlKGU1lX+sY2Gq9rSP62UbZ1qtwUwlVADYHW3th5g9Hxgu3rg9/THspY
         cIMBYkp6yw46ydoufqtphZomjqXStvQQB0dmemOrFmBcf5Hr3A+VvzBdN35dL9leh5nN
         3Td3zQ0kdgaL4Cqt7XXsVFLulD7kM2yUx44cLsBMXPDhxh/3Qr7+J7RYnzejpdr1EQUU
         E6P2E97Eqjq8VFKyk24AiecNk5QOZEvM+ee7DSMHC5wTQK148ero61y0cnLYOVoOPfgD
         M7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696626850; x=1697231650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Nc/T8mYGdG+8ih2hLlQGq5+NcAgLXntLW2uGZP0254=;
        b=Y7AlDGQPJijprZByuWJ8Ekv/K4D9R6kmUKTbV8im4GsQQH1FDPf5wvEy0Tegv5UvRR
         v7zs22tLlXYIPH40kZK7H59NqGX1e0wRNOorTZPyR6ncMgJjvrZ3ltiqOyp0XgD4xbRO
         EXF3L6MYhJKFByDDhuKJHa9KrOn8Ja6bJHlEhosh8I6WpxeUwYt9+c/DoBpQg8OIgDT+
         r+s8gjl0WQ/zZvA3xaVU5jvr1wVi2fkNvq1BKFm6j8N4H5v0SdfuXoEiYFI20g/fM3Yl
         7zR2ZrZGqyBIirBlt/gwd5CS1eYUnfI/ndbP0zuUaGHL8jxF/UEurh2r9GwVu/yHBPuL
         UeSQ==
X-Gm-Message-State: AOJu0Yw8cAwRWjshR3UXk6zVW1Cu6McIaq0YYML8ryLuut2LVSf+JqYW
	mg80v1wL4h1wSyToEI8xWkFadKACe778S/YI7RE=
X-Google-Smtp-Source: AGHT+IF93T3qsAxAkn+t2xPXukfWdiK2UF06Y+uSH9E8CpAZtB7uhKm55ZhACUZizhnql8ASfsktQognQfG1cPb0RVA=
X-Received: by 2002:a0d:ca0b:0:b0:586:a680:250 with SMTP id
 m11-20020a0dca0b000000b00586a6800250mr4368286ywd.5.1696626850035; Fri, 06 Oct
 2023 14:14:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231006155739.246381-1-yakoyoku@gmail.com>
In-Reply-To: <20231006155739.246381-1-yakoyoku@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Oct 2023 23:13:58 +0200
Message-ID: <CANiq72m3mpcJfiOxaACLtyaUfBR2j8rtbLdj5eZT08zywKzCfw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] rust: crates in other kernel directories
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 6, 2023 at 5:57=E2=80=AFPM Martin Rodriguez Reboredo
<yakoyoku@gmail.com> wrote:
>
> For now I don't have a completely working example but I have an MWE as
> following...

Thanks Martin, I appreciate it, but I don't think this would work in
the general case we want to solve.

I have been intending to work on this for a long time now, and I still
mean to. Hopefully I will have some news at LPC.

Cheers,
Miguel
