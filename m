Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA771E4929;
	Fri, 21 Mar 2025 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742583563; cv=none; b=rVDMLMZUwxcb+kgCK+YPqFaxfxnZf1dxT4ZbnOT3rU1YzXLJ3P6CES0yZwBYGmKQFRrIygkW7vuFkfpmjWOoBLjJ+mGsiD1MYFBQVttNOujeTzVWr4/M8GUrpJWHTuP+IfDXNlwkcj06YktBKuQghcZ6aCFdT66+bQwbGGFGy+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742583563; c=relaxed/simple;
	bh=ygPQW8tbUTmdJrqZEgpDb8uggfJx8S4P4KR69j0L3yk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V/38N1aWFaprsqUCliL4W6peAWHYDRwvSSacPyvE0Xw1H3GButuVo6ozVHrkucSijDe7yyPLckPW+nx+S0lq9/pY3+zrOeaQ3lJGvKDmYz3fAT1m/sRu1WdLKqnMYrnwSUCZQ8x+TSwJXjdAaxvS2tE0gJ3jWFmF2/1df0bPgig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBN/jHy/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBN/jHy/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224172f32b3so4245565ad.2;
        Fri, 21 Mar 2025 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742583561; x=1743188361; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WJ/vT/adxKWtOd7X1FiYMTVQZCBQfkBp6IciAkLtWI0=;
        b=ZBN/jHy/8V+YtxsM2WF0C18G2F5CtVs7MX4blIXPzaVoWrexQksnJOljt8Rexe7E0n
         wj+2YKOvtxOZmrxjh+QjuQlOuc/VqzhFQ3+cC4HhGQQ+Hs+mRJs2NbHnWAPVF+1DdZ9H
         gXz5hgAsXvlK6ZgBiD4A+8v+6fIve3k4IjyHthn3nHAVPGuTW/gYGF7pPuY1QZLy8tc1
         7FKRpOG9RTSzaffA6JFd0QatdCaNpZgre+fDTeawSjtLX3Ej1MN3fs6q61QHWs2mHdHN
         ysVuNJhqWk09rg6gnGDAFx4RsRDHXVl9KgKqM0JMLdP1332IKMtHFKyQfyn09wl9bEhd
         0uoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742583561; x=1743188361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ/vT/adxKWtOd7X1FiYMTVQZCBQfkBp6IciAkLtWI0=;
        b=EEj1h5Sag4n5cdb8X7mUVraykfsL5zw+A8Wf8ALag+XmS2GvGosexbNj0NFKgtRMZh
         7RP2Lq5zp/kWeuJ3usslHNVwyrqm3d8fsVgY0YCvGU8vwFx8gmlcvOYzRJ4qF9pJK1oz
         uZX27apDqejavXrQ2AUvB8VvZ0kkhLElp1akn5uOb8z8/IEmVvVYa8vzLv3VrRWQkYT5
         sNnv7ovzqJcxpVXJYiCdjxnDqC9X94z00w6FnUQ+8bh1pX2zxIOysElMDh10hWlaxsdU
         hOLgNH9Wgbouj83CgG2cgu16pf/ZSTsnJy2LRD4vsridgeOJMpDrV0iatT43RxWLDDx+
         TgiA==
X-Forwarded-Encrypted: i=1; AJvYcCVbRdvOs8jYDCKJ9ZD2EuY07Dy5UiG7Dm1nVA68MDYwHdlaefL2mrVyADNcC5qHAEUuPC7xQ669eyUCM0jaYw==@lists.linux.dev, AJvYcCXLV4gR3bsinj2nQTumAZUNUUVyA5KhHu45DBhUSGD+qYESO2RS4X583RW/GSgpZPdvCWpb@lists.linux.dev
X-Gm-Message-State: AOJu0YwfQAfI/J/NEmZRel3FGLkNfzBHqOrR11TL/stIbxSL7ZrC2JkJ
	u1JpZPL1a4bCgoH83grF7SnYR/I3IvJ81Wan15BGzqlVxfgKVSupNn15vepa6pYlqHcUlQY5BMQ
	CdSqu6PwfbHPavBzTRuoqrYM2p3g=
X-Gm-Gg: ASbGncvhZGg/qgxnZ1raD24nrJ2FnSUpLb8DH7XgZDF/OC1tIRYyAnbKMBWL2uKtFA1
	Q6B68MgJ1dY5rWx4p2ucK5kUd0Kenu51Gjoo7Kan7l1iS8lSdh7u4Y/SbrOeJngXtCtL7pjpWon
	Zrw+UKWNM8i9q9rQb75YPjtiw2eQ==
X-Google-Smtp-Source: AGHT+IGAhuxfeZ6SMRo9eoFdQod84Rl9u+2lNK2X9LUSh8QQLFr055E6+3UGZR4aL6UGNGhtlqOrJBGyvyBKGkMk4TE=
X-Received: by 2002:a17:902:d489:b0:224:e0e:e08b with SMTP id
 d9443c01a7336-22780b9c1c1mr25632305ad.0.1742583561013; Fri, 21 Mar 2025
 11:59:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250320222823.16509-4-dakr@kernel.org> <202503220040.TDePlxma-lkp@intel.com>
 <Z92ldvI4ihlm0HJd@cassiopeiae>
In-Reply-To: <Z92ldvI4ihlm0HJd@cassiopeiae>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Mar 2025 19:59:08 +0100
X-Gm-Features: AQ5f1JqE3UuC3lvXEQjAanveB2Yg9Z53_egm0hdBd5uAqUk-Rr6bLA0unz11U68
Message-ID: <CANiq72=s3rQwRt-TOr0_n=EKHwJSQSGmKfu_4TtoEhSTc2Fvqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] rust: pci: impl TryFrom<&Device> for &pci::Device
To: Danilo Krummrich <dakr@kernel.org>
Cc: kernel test robot <lkp@intel.com>, bhelgaas@google.com, gregkh@linuxfoundation.org, 
	rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 6:44=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> This requires an unsafe block for compilers < 1.82. For compilers >=3D 1.=
82 it
> turns into a warning *if* using an unsafe block.
>
> *Not* requiring unsafe for this seems like the correct thing -- was this =
a
> bugfix in the compiler?
>
> I guess to make it work for all compiler versions supported by the kernel=
 we
> have to use unsafe and suppress the warning?

It was a feature, but it has been fairly annoying -- it affected
several series, e.g. the latest KUnit one as well as:

    https://lore.kernel.org/rust-for-linux/CANiq72kuebpOa4aPxmTXNMA0eo-SLL+=
Ht9u1SGHymXBF5_92eA@mail.gmail.com/

Please see:

    https://blog.rust-lang.org/2024/10/17/Rust-1.82.0.html#safely-addressin=
g-unsafe-statics

So, yeah, we use `allow(unused_unsafe)` (no `expect`, since it depends
on the version).

I hope that helps.

Cheers,
Miguel
