Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67CABE49
	for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 19:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758483225; cv=none; b=pjrPiRo8Jzua/5S3K051O+ofNddk/a8Bwar5Qs5hPVwnO2ZUJ5xP614Mkt7Mxf0LyLY3Nd4kC4UUb4MkR+5/8XghhxtZSTJHPRon1M3yguguF/Qqemx7oVfh7Im2nIYcw+orGDHZf41bcOqdpSqo6TbjmaTKyXCSOH7t+5BoXaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758483225; c=relaxed/simple;
	bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DEW5/XYhM7E9watQ4BwhWP3sLWLekhd5XCBHGoHrNEW+UxmuMGDYhYqrikqxUPkguZt78yN9wcPd7etCgCdKPvo6v0Gx9oKFoe4WkzqyGMsH2YEbabHw0S6M1ERzjpHyRVrVN24YOHbSazvyeZ5+DLakIgpgSLWmm/mQxSOl3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5uRRkmZ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5uRRkmZ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b5509894ee9so265294a12.2
        for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483223; x=1759088023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
        b=B5uRRkmZy7rlQpnp843fgRutTRy+T643UZmsbC+mXQ9WNRAloDFYvrokUh0YMSqOha
         laUbk8RUicQCI7qq6VjEVR7w3/vNJ5ka3Qz5vJJAdrkqOUDqLtayR0m7l//PYn5kBQ7f
         zf9BkJsI3W2vEELGaXlcL8DaARl4+Mb9K2+e7k9SNN9IaxtGnQzuNGFuoAvkyZh7JzY7
         jsKQ1qa+p7PBpKaeDRYiPloL7hCXw1aypDtdm/HW3+uM8u8LrB2SZX2nd2GQBUky8JaZ
         0osuwrUtLZqVyN/EOkk/CbEFFNufeaZvmpVOneyAG8Rh59gKIt/scpJkdDrwwIzygoaH
         /Lqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483223; x=1759088023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
        b=b8h9p5rSbirCc8aYpyXzfAIC4xsDteemS834QxIoojsdBYdx8D5CuPo1rba8omYbSq
         BvAqkU0pg0P6iNd7ubzR/vZumGg7TKo5LnnfVPUN7m+TiBnGYAPVaE9C/dM3I7WqIBh2
         ktO9Ct+5gudmp2ie5KMpXV/P4v8O1qChSyXKRq+pnT/G8PXfh7OncNdiyvw53H1+VO6F
         VYx5GY5GvK0W6ulRCoFDdVb0vNFz8SZUdRxRYk2eQ+xwZ0zxwDGuY48acdvwylWVS9K4
         4loblgKtmB6YKwHCA9UbC1SJcth/Y73OKUG95jeM8WvR7jRao3mTQ9qPg0DFckx9dsY6
         /W2A==
X-Forwarded-Encrypted: i=1; AJvYcCX2dXI/n/ipBXis5wzKJTZ6wpo9TcJrBt6y82S7cmmwTGm5zq+C+NrbEPbAQ93ekZdag7OD@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfbfhh5ZA9zTt5PA1RN+HwfB2yOV7TEpcxi6iF9TcCLcPBnBPs
	OBhGYfZZ/b7hauZpmPzJ9OhAiFRpgtip6b3eXW5qwb7EunqEpQQrm8UHatccmbyH0IZWIsdI6ps
	SN3ct4DvDiu77sZ0qX8xh5eczWGXkpt0=
X-Gm-Gg: ASbGncvLucku0cBx9wnjoO6m0tornvuux5skDrX/VoeZTZtgvsaMTDS4vrQSkT0+rIt
	cGXiUgPDU9SOkZJYxwCxqsvnvTRxGs3DI+VBfTcwJC63/b9QyNIkg/iM95yvus7Ng9Rr4gFKxvz
	48J5ZAVuDenJG/k6RW9l0RJk4oVvIL8z1SIdMfvO/qd05WOg8FMcRc5gtz2tT14j50DMBoWHT+Q
	SnXwQX2B/F6TcGU8KhA1pmIs6rf69tUFoY7aBRY+jJcdWJ2w9xHjh2WzJA0YsG37813+YkHrFps
	cHH9qcHD8ricNMlB9lxpYqyW3A==
X-Google-Smtp-Source: AGHT+IG4kRzeiPGLm59ZZQszVAWsNaDqqCH2KI2Z0y+NJALvZL1xRg5SeR7LL082wuOV46ofwPf8NpR+imqiZxjX0Qk=
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-269ba2611c1mr76464005ad.0.1758483223077; Sun, 21 Sep 2025
 12:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com> <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 21:33:30 +0200
X-Gm-Features: AS18NWAcFs0MDi_Dw6rCzaLkE9gp-FV3yn7YymzJYRPsBMfxvetkj0p00jJxboU
Message-ID: <CANiq72n6_JdbgBiZHHiTg4vqnFHdfQhHcV2JpyQ0pz2J+KBSDw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Asuna Yang <spriteovo@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>, 
	Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 19, 2025 at 7:21=E2=80=AFAM Vivian Wang <wangruikang@iscas.ac.c=
n> wrote:
>
> Is this necessary? Maybe this can go in a separate patch, or even
> submitted separately entirely - it's unrelated to "RISC-V: re-enable gcc
> + rust builds" and would be weird to see in git blame.

Agreed, I mentioned the same in a previous version of the patch.

Cheers,
Miguel
