Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1D3A7839
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 10:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558411; cv=pass; b=dgsYWpN/Og5F5xiPIvRlpKF7GBOggJBL2Z0cnj0YHSRE/3HKN4p3ygudGK3+vsnMt4DKJBbt+NpL8PcuY0QaCh6FQvQ8qTERyBDxJ3sTEsQySa0xSbdhVvk5UWtxzBXY3Fncs/0LYkUpouRmXVM/rlHgSipzxJShtEZ3wRzvMm0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558411; c=relaxed/simple;
	bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2MTFHKdCk5XVbXD75XUuVJW34e1/Ggq1v0RqSwNW31bKJD8naB7aXtLA/DKTUr0nshvkV1jmVI4ZEcu1Eqr+4QfiGS7MeMw7nHscl1g8p2OqQ75ell6cRMGoMDHxToweHpoCPFpvuG3Aqhe346i00q6cBXh/D2c9mgi2UMKCqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+SyfOLY; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+SyfOLY"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c1161232dso122334c88.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 03:40:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775558410; cv=none;
        d=google.com; s=arc-20240605;
        b=I1yf4g46t1mSXbyuMJjPHocdR4CHnlhaDYLWWQ519x06RDDXyCgjixkmpILR4JQOQz
         lpg0Rhxjejfu4IyNWPvlnKpSXWhRaz8x9RIUgOJHDXKnHMR5YYcExODVx7FJLQqqShd5
         Qu7L6tovBDJQcrYjZhM01vXjKIVEUetsSYpZOzrYefFLBy6W3nbsYnut5ywKqy4ImsYj
         +tmGO4A3Xco/Gm/AcgvYLUO3udQhNNvqpy+a7CYhfpniGbtSVnoaLybaW/WZekKaABjw
         9zue+jJLxp2U0/r/hOrLSzYZO1Wre6Ak146/py3W+sOZ+J76SQshephUZAtgkqMexDik
         kX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
        fh=EytF6nw2KnRKi5oMUHze7PKL2nm+CzMDVDytNajZCKM=;
        b=cgy7Yy5yr+uoVQ5m8hq5+4JlJpr1v8EUBhMYQFR6DwKqd255XY+DF0ITxJHNm+rZQs
         pJ+mzAr1HhU3J16235U88h0NvcipION8+wYKTSSFwtDz9clVOGlOiZlGuv9iMCnV9Ygy
         QFJ5BZK6FKAruK3xn2dRrQTEoV6+jOX/ISaPMG0KBt39MR+2Y92dr+Gahe6WBamDpUfT
         3NqMdB3Qa8x2qVDNFRAjdVgzp5H3zjXs/0fIizna3cPtC5hnoDoW0y7naume05MYcj3F
         t7/ShJA2ryr5UFcKYvKJhLNY76GBzhJrZ4LLSq3uYpIJkMpZ2AwwcIQVwuG1b2eG5TIP
         y0Mw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775558410; x=1776163210; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
        b=E+SyfOLYvOe9ZHZX3XJXYACqNV0RmRS1YvhKqIuNQvHYp3espAr4EIK3G0IUy5mhe2
         zOQyNR+KJtfInTCooUEPn+yQcTUgnk7ljJ26DODZtF/xcSaVme7qgdOrVu+ZdV6aoSCk
         Rja3TUQgg9Xg2/w7ZDbsZlqWG++ixUJ5UlufzKGI2cCy34x4vBWT27Z60X0+gvoSoXdJ
         i+NT9wDJD1ZUNl+RS0VytqcjXp64Nx8MIKEJt8eV8ieExO0h+WyGQHogujcCHxOXUvrp
         mzK6fk5bQADJy7dy91a6otFfF+PL1a9mZ2WMq7pAS6GVtQjyGC19V9f5jP2Vvht/f2xq
         mIOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558410; x=1776163210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXegbUoQZYx3SEeGwfYBNqgRNZ0CfKIaltHU2swuTyw=;
        b=WKH0kykwupBrPySUOuBjWqiSX/xtwbnU3CKgwWPH3wgAsvf54lydoWo1ZxYKO6XRKD
         j5woZgLcx4Jgqxu4k3iIXgnMtP27zc1+Nz5IJ3qWi4gsEACkpJX0ac2B2VkfjlVMDK3j
         CnVG2ogx0Klja6m4uU7VEYfczqsPK3TNOiHje68SJ3LAAwuS6G9ILELYY6h6nGXfbaWK
         L3h1pZnvs9Z61xBhwFk2/Wh8IJm90lRbqmODwa4aoY/yWfoH38T0zQVaxla0u5HbsVXq
         zQHJeEH6/k+rFWE79rA+YrHKDY7gXN8O36Vi/VX/n3wO/mLLVi5ZXFWJDBmM7yHwi6Pr
         CNNw==
X-Forwarded-Encrypted: i=1; AJvYcCUsyTo4YLgPkUZMcCg64fenIeXDq2KpDhoWY1GOo0D8Y0hT3RTEuk0q4M0N8oW4i6pLGOBE@lists.linux.dev
X-Gm-Message-State: AOJu0YwIFrvd6gTDq0hxCQKtk3X+oJdHEnlHCGFbF1TIjWRnhVHkMaPR
	QKnDqGbQ2k2G1NlW0i/E3JgLtSsJAINjX/hRpx09sSbBSkj27o5t4WJ/6Gwyu3JE54n42I8n0vb
	+Le3jjcPXx0Ljwu0YWbHLbT7ACMZgtBA=
X-Gm-Gg: AeBDieuYOAVZMT5o8T53Vb1XWV6w8ZQ9UZfX1TmUvNN8w5aVu8cMh/9woSEJX190VL0
	itlEFt9lQRwpT8ztG+9ILkbdV7Y0zWXGMmUBuewdbTHX+ctfiKn6Q7rX1QGCOMXk94hLha9BgAH
	qi6xYFZv02uYRDgQxfDvUconvjmFQLjtafDLdFg9hZvkjUPDhtO1XbuOSAPMKgg8JMTyBx88WN6
	40OLNatTAUTFdOXK+bZhCGXM0NXfXB+7uXKWBN8mDSE7Obr22BY5qrqXFkzHNa070NVvsh3mSuQ
	tqotwUzFgCUctdTI6Dz+MIhgnJMeW0aW+7AuyVlbHurGugIId5pUHWK3wut53UUzGOp1E8lVo/6
	10byEOjP5essI7MiJ4byLkRQ=
X-Received: by 2002:a05:7300:a484:b0:2c4:ec89:bd7 with SMTP id
 5a478bee46e88-2cbfc16e3ecmr2608464eec.5.1775558409658; Tue, 07 Apr 2026
 03:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org> <20260406095820.465994-2-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-2-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 12:39:56 +0200
X-Gm-Features: AQROBzBbID41I3ps7X_H1z6WQZ8PUlg4rMQAsQG6X64Zc6BpO61OMxIGmlgaVeI
Message-ID: <CANiq72=mCc3XQ-fpkxBdEVkjDyt4tKzrdCuWgqMkQOyqBMej3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: std_vendor: add `likely()`, `unlikely()` and `cold_path()`
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 11:59=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> +#[cfg(CONFIG_RUSTC_HAS_COLD_PATH)]
> +pub use core::hint::cold_path;

This works inside the `kernel` crate, but Sashiko is correct: we will
need to enable the feature to use it later.

And while it can be done, it is not as simple as usual, because it is
conditional.

I was already on the fence of making a single function to share the
signature anyway, so I think I will just do that in v3.

Cheers,
Miguel
