Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB59156F3F
	for <llvm@lists.linux.dev>; Tue,  7 Jan 2025 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245292; cv=none; b=GNCghUFt/2eZbHygDCXjP1n7zas+R4cur2L5BafFYnuIIs6KU/vs4+LKoeasIapkkDHZWXB95ZQVOwt3PhwhIj94aWI22fmyNga/56ibwoUIlAuNk3Apbc5Btq1RCaLUF6iTjUpakrnhl+sq0Fxk/Xco1Thsxvq5r60vBEi0baE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245292; c=relaxed/simple;
	bh=FRIGQ/JB661jNzhXc6tK0hhdfh1dIA4HG9B/GvPjBIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krgPfuwzwKe9SH2a4/4p8umEX/+tpN3CX10YfRZLtmaiiDst65kDUbo77UGxkcsCvn3kOC/ZR5WV5JakXYvc+zPPWQxBotSU6hwntNkoI6d5H5mzCwwyYGUN5AFkVlZwklaOzudE8hssSXVNqgGDQy9ngglXqlsCHj8134Zy70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lpQjWGLs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lpQjWGLs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43623f0c574so105549145e9.2
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 02:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736245287; x=1736850087; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRIGQ/JB661jNzhXc6tK0hhdfh1dIA4HG9B/GvPjBIc=;
        b=lpQjWGLsBXL9DfNu6mhgdq5tJkgatPVqb9GTj3lQeWCz/qzfXxpg9XqcHnPSD7uCSL
         epfvFmJZtRKCKHTmAmpHv5/J6jzLstrg+M76UH7CvPQsBn11N9vQ6u8nGshvCbxT013I
         cfVjswdf65BEb7fP3dJPttSaShF3Q8L+7ZEABdjgPhbyvu1eivzbr1ISOF3k1txGkGUS
         LqpKy0FgmPQWRvXV4at65tO1q5p0dp6S3Ik1U2EDtA0us2zGZOinAhdl/OMW0XEEos6Z
         oGpqt9fbdfIzmpu8OxqQBINNoObZO1sSR8MWstWJYmH+zLZeBBGOiD3R2foJwFLAjp1B
         uTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736245287; x=1736850087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRIGQ/JB661jNzhXc6tK0hhdfh1dIA4HG9B/GvPjBIc=;
        b=G1PWPzTP9htLxYmL3QhhAhfukeKAelF2lI5wLpdfgEMt7aoYVJPoOWpEhLpM9DQFP3
         obQmPRDmahq5lStdftEWnGTYMIXP5jyTcgQR7usSsKc6y6aCxlgm4uRaABTb3GaPMQ3L
         ssq91tTWukXfCM+TjTz0oiKRYswQp8Aw0e+HEp97GN/VE1qySz7AQpOn9b+lMw5S+J7R
         7WGq0Muo9JS6V1oBfQe0gJWTwekLKL39gnpVpKgZfYAm2lmpyyHoQVFePhTRVkQsaaiX
         2aqiUG8sBmTsBH0fKZRfHx0dZfYxXnYHfG+sIfdpbEJyK9+/32B3otx8d162h39rRmbk
         NKjw==
X-Forwarded-Encrypted: i=1; AJvYcCXRlI3yOFUeHSaI7qsJrV9d4zT7WMmQppm4g6cKaL/iHH9run26p1l9sDkSqRTH+h6R/v0F@lists.linux.dev
X-Gm-Message-State: AOJu0YxPB8XknjwrF8KTK7NE33A9jsgZezAbQRo4yZRBQAaxgKwS9jrJ
	LsuOsU0WKKyzWrVo2tXcqtdjFmvyrTlnpKDJhRDKPqOnNTlVkCX+7Ugr65NjqL4zQzI52NTZdGW
	wEis8nU1MOMI/Y/MPbKGZPMyhnBro9CnPfFB5
X-Gm-Gg: ASbGncs9ZdBg0XkBABb7q9gylfLXpPedoHLyxJPONV6ItSxpLFmv+03KpyiOApDJ1fT
	jdtMveDDeKWQ/t6Xt62wh4IkRsqLnAWJZDM4nNVhvgdSrDG9Iq5B6Z1NYAliV0QoScN8n
X-Google-Smtp-Source: AGHT+IHcS3m3JDYGwTz9T/lHb+HT4UdeoHfbIPpg3qp3MMGbxT3aBg2nIFZIvpvAU1f15dKkyLCChwrMCrXyaN0wWkU=
X-Received: by 2002:a05:6000:4a05:b0:386:380d:2cac with SMTP id
 ffacd0b85a97d-38a221f91a1mr54506465f8f.26.1736245286668; Tue, 07 Jan 2025
 02:21:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250105194054.545201-1-gary@garyguo.net> <20250105194054.545201-4-gary@garyguo.net>
In-Reply-To: <20250105194054.545201-4-gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jan 2025 11:21:14 +0100
Message-ID: <CAH5fLggUVBQytWk5d8GHBMAnBTR6MkQEwki+F62PDaeunt4qVA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: alloc: make `ReallocFunc::call` inline
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 5, 2025 at 9:03=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This function can be called with different function pointers when
> different allocator (e.g. Kmalloc, Vmalloc, KVmalloc), however since
> this function is not polymorphic, only one instance is generated,
> and function pointers are used. Given that this function is called
> for any Rust-side allocation/deallocation, performance matters a lot,
> so making this function inlineable.
>
> This is discovered when doing helper inlining work, since it's discovered
> that even with helpers inlined, rust_helper_ symbols are still present
> in final vmlinux binary, and it turns out this function is inhibiting
> the inlining, and introducing indirect function calls.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
