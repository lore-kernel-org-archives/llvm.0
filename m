Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543A206F18
	for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742294070; cv=none; b=LM6y/sEfCaOTfnSRn5Y5i/266vTFlu4UOVzY29ftq4em4Z0/xbwH6QbiQf8NT5IbT9+DVnOdeL2y/Q7kjUWWYU7es0KoSjhqTw8owNX7Bfn4tcsyqp8OigZk7R26Z1JBLPmxpZDm1lGkPHIkW9dqi23JAn3MdiuNeVjEETt84Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742294070; c=relaxed/simple;
	bh=NgqBeCgacXz6i48arteRrLxAM0fCi4tfMNMBJPzxya8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmn85aQ15SGjq8vJvWsKP0SOYdMnwqE0PU6HX0bEkfGV/ZM0z+bFZPdsG7COnGyNsuVq76hIJykY8rgQLyLhd5YJhALSaYM25rs9F4hMkItC45k4I0WQs5kJirtMEkt/vLS1OjPSYmOIUVV0FeuK9QldAGVjknBzmedOkQsJnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf6xlZ/z; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf6xlZ/z"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499ba72f0fso624768e87.3
        for <llvm@lists.linux.dev>; Tue, 18 Mar 2025 03:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742294067; x=1742898867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgqBeCgacXz6i48arteRrLxAM0fCi4tfMNMBJPzxya8=;
        b=Lf6xlZ/zcjwYnDEsZRLEZesK6OX3blMuCfNT/ozfI6AxZ+xjVNVdhhxF6p8HmHsyfc
         1lXWlF6Cax/TdPKdYC2Le3UpGRTpq74CvgBwasJBEg7mlsVvmJv2sge5l9OyHBqW+WVY
         wM9HaZj8fMkFujK9bx1tLaJ/sDoZN/73mSeRmquvU11UsW0FO+X3zxklzQG4/qeTkwfZ
         Xohbtb4NsfsZ2sATwkGtnz8+sBOEiAHRfJRr3tCdibuZeHP0TNAqvqoUZYD6lEi4mIuY
         LV64sfahDcZf0omLmDpFOhKSrTAevfdMgK/cjgqnUSwEW7fcIMLpRTqDuG143Zqhxf11
         bdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742294067; x=1742898867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgqBeCgacXz6i48arteRrLxAM0fCi4tfMNMBJPzxya8=;
        b=gUpaTjRTw2K6JyOKKwOJrWmFSQHYig6m9VjLHJjVUGfom2nINv9l6DOb20KQd6+Gr7
         bVshMxGuU5vOr+C+lDQEe6e9UsO+J/tb9EhO8igd1LK+Ye90SkN18ND6djJmt3RK2pYF
         kv3PArJLxiH+6d+zZkbbTp2ssVHWw/UUZBEHLV3nQCWqbmUjJhDlXikLfpwbtJfTzP+a
         iW6ZRlJPtqD4AA58tNXYEQZx6M7wzg0qWNl99UQDG7nNjtchOP+GggvU4ye7+785i2fA
         //aAQxFu4h+dUIzrcaVXBX6brkm6XU82spw8IsKg4DHWHqTKjBfa9a1p36Kiv1BZXVRC
         ib5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXh2dbRYPPsnljzmPHUpt3hWzgmTOlfDW0x/ZVlJPaj9Vo/mLkZISQdBzx/bAu9tFix+k4p@lists.linux.dev
X-Gm-Message-State: AOJu0YyY6/YiL4KCFU5WuTLGmKDo8ipIfafQRr1IM17isTJ19Cxr2rP0
	h7yuAVz2+pnykILUBieWqUe6V7OJxwasq9T2Dxza1pxuX2XyiCQjtSP0NIB7FhpZf1p9ZHMWmox
	WSepzzkmvyxH/YKoGu2tiZtAya5Y=
X-Gm-Gg: ASbGncsXs9fZY3/V4k7lARcIVi7qxyL7tve1VvaQfA7/mUeLLVl5J4jQQUkOXUpzRHp
	CA+OifQz9hPCyDNcAi+5ZDH1ZvxgnZZg9idYsR9Xo316T0P2w+8ZTv5U0BM6DZ7a+D+Di59y6z9
	oQTPj7Da/RZmYlxMug1G58jkWGTw==
X-Google-Smtp-Source: AGHT+IHxAhk+yKtdKU5nIrrl6uVR6NufpxuMU8l75CVlABdoajg3N6hAhmBjCkoaytwWq5YHlhBoF04wjjcy3rVu/NI=
X-Received: by 2002:a05:6512:3e18:b0:546:2f7a:38a9 with SMTP id
 2adb3069b0e04-549c38d5eddmr3549957e87.3.1742294066844; Tue, 18 Mar 2025
 03:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208-rust-kunit-v1-0-94a026be6d72@weissschuh.net>
 <20250208-rust-kunit-v1-1-94a026be6d72@weissschuh.net> <CABVgOSnwkDihbRzYF3uh3At_x0MgOB42_E8sUAD8moKwx+zjRw@mail.gmail.com>
 <CANiq72nnwopFAdETMhgkCfN9dj+JJZQ=K1BKz_A_xUViis7Avg@mail.gmail.com> <1a1ea09ae8cd82db0b8c3205bfd179bacfce4700.camel@sipsolutions.net>
In-Reply-To: <1a1ea09ae8cd82db0b8c3205bfd179bacfce4700.camel@sipsolutions.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Mar 2025 11:34:08 +0100
X-Gm-Features: AQ5f1Jp9OwqriR53SJxEyK9ZWTkGMjnsXOLnics89veDT3az8A-65eRFKbZHjyU
Message-ID: <CANiq72=8PHXBf3QuCmKwvZxtm6XbVd0qwDq=gaNRYRHojrmYtA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pass correct target to bindgen on Usermode Linux
To: Johannes Berg <johannes@sipsolutions.net>
Cc: David Gow <davidgow@google.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-um <linux-um@lists.infradead.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 11:14=E2=80=AFAM Johannes Berg
<johannes@sipsolutions.net> wrote:
>
> The list is fine, but the patch wasn't even CC'ed there, so we don't
> have it in our patchwork:
> https://patchwork.ozlabs.org/project/linux-um/list/

Ah, right, David added it.

> I was just picking up um patches, but given that it was a series, and
> changes rust/ rather than arch/um/, I think it's probably better if you
> do it, so:
>
> Acked-by: Johannes Berg <johannes@sipsolutions.net>

Thanks for the very quick reply!

I guess they could be picked independently, but I am happy to pick both.

Cheers,
Miguel
