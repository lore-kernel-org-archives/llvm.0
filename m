Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28F9187850;
	Thu, 26 Sep 2024 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727385547; cv=none; b=MIgvxBQfIatvTCer5bj9xmgzxtskbNtxtXcyBKOf0TSiAY94Dp7VVDMoKUXANddmru1qEL4+dVirugrX6y7WOiereU3XSq94zgq3COyiNJh46c5HWPVeWWTDDdbii5dKajnnHFtFuPvQCrnTHWC8CYUN0UbSsZzuDKXKoY1E1q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727385547; c=relaxed/simple;
	bh=AvcDnkUmv2DqPh64tRKzMWvmnXubSlYFjN4hVlRNLk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VHP+pNWd3bJmuBCHdf2wF46p2Te+n5xXyGmRxP9TqmMcbUruXdn+bX4gojl94YlIaDkTm3cAjxlkK3gGKHyqpt4AMsm7+3GpVG4ZWs5yPr5lEZXes9/pwBaGsPcO1mEDcwwpyoqDsD5PNcTglG18MKE2XbbREHjhsu4+BIspjxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODCt56/b; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODCt56/b"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7dafb321dbcso41704a12.1;
        Thu, 26 Sep 2024 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727385545; x=1727990345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiL/43w7xPDMaXqaTLOfu6ipmJ7ueyEd94vFcLFVt94=;
        b=ODCt56/b1xYK9NNfWyw+7AXzGZRHpIV3swkJ2OiEpIA+3HyZWbp7Aa6PM7GhiDZZ/T
         EtqMDdczdJAa45+qpDikEASmOm5wgjSeAwSuBhTuGt15e0r9R5G0dg5w+LjkCMO2Ijfh
         aehtQW99oOYwO5jHjaz7FAoZH/s+d8Ie4qI7AgovL/4FnNXYlYf2JauvxjJC7qgCvjsK
         C45ibbMDl6CW/UGCs0/wLp5HlNDXcGGSIypVKE8LDhxxUobvQk7SX8h8VE1HceXD6Oou
         r/WHhOlqrhqai8i67WvhuoArAWdULO63kmzKMalIeACiV2QhJ0f11pePvk5FpaNYil6L
         L6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727385545; x=1727990345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jiL/43w7xPDMaXqaTLOfu6ipmJ7ueyEd94vFcLFVt94=;
        b=qVFb575X/wN0SDYdQ81yqAFKDydKO38sHFHeO4YFXhoZIePOV8SexSIlvX+CfHDQsS
         qrrc1f2QTqdllvNI3xUSoqVZ/1hdrdMUQxP57FxPzowETYPQZT5htewTxExGNlXcPrQw
         JB4iRkiExQL+N1Zz+GnitvIgONav373EdKRk5Eriudh9jg2kQMMN0Bpwtr6rDLSP+aEZ
         1OGAbn7mw9gy9fYmn25DAZh+DwayTs5kFWOA24YXJ4fZZgtELfg6xw7lfYvyFeo+jUNU
         l3XaSTDDZPT4QAPtZEd/NieYuY768DvTbrgXX87fxcry7f8b34GErjALd+3WMk2osYvz
         xKMg==
X-Forwarded-Encrypted: i=1; AJvYcCVeobniT7tuQzu4G62xkoyKQDm30Qdd6XQsshzLlSqmhDt/OwltqAcoicNpGseXSHNYmVfk@lists.linux.dev, AJvYcCWWsNttd58XZ1gpyHGCl5TNXkMkQcGxrkiF7mDKT8r7kBViHlYFX9/3IHqwi7tCuuqTOXYh7ewa/1AUTOHayQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVEvwCz3sppUFqZjnCnt67sB658qn61YwXF6TXNk4TJQK4my6Z
	F+lGhDI24T2jAfCNvZgdBLKVqAPOOhnrJt7JmIkIq5QdGfTAHp6NUWgi3G02Qy5yibju92KqacJ
	AdRX5fdxci1ktXoIYKP9KCOdLQkY=
X-Google-Smtp-Source: AGHT+IE6Z5Ugs5d9ud90HsPwabxzrmKDL6pJfCR6F+I4Hb2fAl23W6NAluXCqFPTFKmt/02r4eYWF2KDbgYnvtdh4g4=
X-Received: by 2002:a05:6a20:8415:b0:1cf:46ff:973d with SMTP id
 adf61e73a8af0-1d4fa78e94fmr838750637.9.1727385545304; Thu, 26 Sep 2024
 14:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202409160804.eSg9zh1e-lkp@intel.com> <20240916003347.1744345-1-gary@garyguo.net>
In-Reply-To: <20240916003347.1744345-1-gary@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 23:18:50 +0200
Message-ID: <CANiq72=qRGkXJoTin69KDgz0YHDaY8uB0vfX=GDZeR7TbhaTdA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix `ARCH_SLAB_MINALIGN` multiple definition error
To: Gary Guo <gary@garyguo.net>
Cc: lkp@intel.com, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, conor.dooley@microchip.com, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, palmer@rivosinc.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 1:09=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We use const helpers in form of
>
>     const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN =3D ARCH_SLAB_MINAL=
IGN;
>
> to aid generation of constants by bindgen because it is otherwise a
> macro definition of an expression and bindgen doesn't expand the
> constant. The helpers are then have `RUST_CONST_HELPER` prefix stripped
> and exposed to Rust code as if `ARCH_SLAB_MISALIGN` is generated
> natively by bindgen.
>
> This works well for most constants, but on RISC-V, `ARCH_SLAB_MINALIGN`
> is defined directly as literal constant if `!CONFIG_MMU`, and bindgen
> would generate `ARCH_SLAB_MINALIGN` directly, thus conflict with the
> one generated through the helper.
>
> To fix this, we simply need to block bindgen from generating directly
> without going through helper.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409160804.eSg9zh1e-lkp@i=
ntel.com/
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-fixes` -- thanks!

Cheers,
Miguel
