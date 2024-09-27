Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A044189900;
	Fri, 27 Sep 2024 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727426398; cv=none; b=jLQHPwAQoSIMJWluOFABGDbT+tP4g3jEZsMpoEGVEPWqLvotULwpnwHBbh2Ip9aoI3gi35mvP43mHiY3wF16sRlq/NcBHvDvzATuj6Q0o/AGikRMfYrWwFDJ6h4Xwzgkm5nerPtxJW6l4utAwQVyqsZwiaCo7OHLVWJy6rayv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727426398; c=relaxed/simple;
	bh=hYbImJ4Ev4jx5aCpniSYpcjeYjZwxXIkcu27iki++i4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d4ztGs1o319s331eYtyIEMFb2vlKXYj0HUb5oUCI5i9nRkUiOHtuw4BLxh2boOrc0EibIvB9TTad77tPq4ZS0QlhULOzuVcsFLAXWriN6Bm8RgHMz/JkAdagYYy+o9F/cXEuDcgX2O444Hcrvcmt61ixPsIznLmwfIBuCwyV2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0Flu76y; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0Flu76y"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2e0c2e42b75so98730a91.1;
        Fri, 27 Sep 2024 01:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727426396; x=1728031196; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYbImJ4Ev4jx5aCpniSYpcjeYjZwxXIkcu27iki++i4=;
        b=E0Flu76y85vzBAsCSfUhP7BNiLOZtN6LW2eBxlcjOUnOAGI7vU8jxlHYHx6XmdRSP5
         dbZqsvdABVL8lctxUf6HtqY4KYwPYqGyeA1GoQMObEUpbNZ8+xukackXnn5n6H6gR2BP
         LSRTs62AfA+LdWbUwoSOhIMMFVbq2iF0QQPIG6Shdh1PV/Kz6nEtQZkn+SUdccAQii7f
         WcY76aFYUs2Zn9LPca141uZY+yYgQg1oaxpzFYqy0tO/jS1xYNTrTvoLX7K3QVvkW/3g
         vHanV5jLeDjhoZyMGa3EWWhxJ5HgYIxV3xINoJxJBuaLesXc0M/T1lvlywSBsXagw0S4
         LYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727426396; x=1728031196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYbImJ4Ev4jx5aCpniSYpcjeYjZwxXIkcu27iki++i4=;
        b=ntwDaKf6DN6MQitcbfB0K4U+WtHQR0vV/Soi12Pf190qOBoTDq/mfSUP07pHsGLbQj
         6tri49I+9CMOCDuiUqUFJttwFEre/pj4+c/wLKJCU0G48fudmIRbfGb8112gSwt2X0TZ
         Nl+Eps8/Js3D6PJU/vgEKtTEqK+q5E2bdHPIpa9rK01TQiPApKWqWcu30IJRbYK2jMhJ
         3T2AgQ/BZ4whxl3Glo6C6sYxxslnLckSyV4c/qRPfBZ/m++Q8TEAlMYSmS/AzTWJUimQ
         rVDqS85IdhUYFTUr8lQvgqDNLNtzfZUxg/OlUKT7KEJbzUnno+crzJjtK1Kz+lB/XjwL
         Inag==
X-Forwarded-Encrypted: i=1; AJvYcCVqkbTXwOQpFfHQP2VnAe7kVmJS+NWDhYzD+Qc/xb8JgQlHyH6PiSdIjwxp9lS0GMp8+Ym4SEuzLlsyIssZ4A==@lists.linux.dev, AJvYcCX8o0DMqDWV7QW8v4b00dnZlIPh4+QSPO8Y/dAtZ+Oj+BJB37H/KhKB+AUDbg7gxOcnC1mB@lists.linux.dev
X-Gm-Message-State: AOJu0YzN1oCjL4nDl3NHNK4suQhPRMiXt8IjoLHb554wq7Arg8cLtFQd
	009stD09gv3WARileiYKr0d3lbkf8jf9peWhxw2y4984tYEYUBUo/fpKRmSKNh2mUVgs52Id7gM
	Uw2+HE373Qj5EbSt3eWqYpagEEjw=
X-Google-Smtp-Source: AGHT+IH9QurLB9HGk/Herxmqe5pGQY/6ke+XUcdq9kiZsDiH58lNraRrvoW/7EyVrCJ92UxX4BV4JrXtWgxtGKVARq0=
X-Received: by 2002:a17:90a:ff0e:b0:2e0:9147:7dc1 with SMTP id
 98e67ed59e1d1-2e0b8ebebdemr1237952a91.6.1727426396447; Fri, 27 Sep 2024
 01:39:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240925205244.873020-2-benno.lossin@proton.me>
 <202409270303.kUIAmOmY-lkp@intel.com> <42d17306-1ac6-4fc7-ab1b-69ef045039ac@proton.me>
 <CANiq72kXGNyLg0Ooo3Ne=KmZWBnSO9HE2tcfP=gf+WGFqnjDEg@mail.gmail.com> <1aa088b1-ca4d-4a97-b25c-96a18f62a79c@proton.me>
In-Reply-To: <1aa088b1-ca4d-4a97-b25c-96a18f62a79c@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Sep 2024 10:39:43 +0200
Message-ID: <CANiq72=-bV_=TUoH6gLnPwTcxROBqyrCpOpbumki_S+po1TPhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: add untrusted data abstraction
To: Benno Lossin <benno.lossin@proton.me>
Cc: kernel test robot <lkp@intel.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Greg KH <greg@kroah.com>, Simona Vetter <simona.vetter@ffwll.ch>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 12:15=E2=80=AFAM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> Personally, I would prefer adding a symbol. Since if we allow it, then
> it might take a long time until the code is removed once we increase the
> minimum version.
>
> It would be best, if it produces an error when we raise the minimum
> version beyond the one represented by the symbol. Is that already the
> case?

No -- that is a nice idea that I guess could be implemented in Kconfig
somewhere (i.e. when checking conditions). However, one of the common
things to do when upgrading the minimum is to review/clean the
`*_VERSION` uses anyway (and they may occur outside Kconfig files
too), and also sometimes one wants to upgrade a minimum without doing
the cleanups immediately (e.g. the recently proposed GCC 8.1 upgrade).

> Gave it a try and I also can't reproduce the error there...

Hmm... I think CE uses the Rust-provided binaries (and I guess the
playground too). Do you have a link ("Share" in CE)?

Cheers,
Miguel
