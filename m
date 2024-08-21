Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9499F1A4B6D
	for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 13:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724248067; cv=none; b=suqc9LTYmlyVD/qxP46lY3IDfRbdg3eiEzV0wcy6S5g7QvicP6d2AVLP6wtEMNGUbplw6UPq2zCPRVNt5klfFiUS5an99VlELjFtvnZFJlPNbuCrmvkkxT5a9kaCwbQU/7QacRaOA4qEJCsiyoKHWPQLBUPgbYTE3xsOh5alg80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724248067; c=relaxed/simple;
	bh=gwLjHNTsXHMmlKgeIfCrG8pO4t2Y8x/pcVf6IX7HJS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N2Gx3jp14gTp/VkAs81aM2zt41N4M3QtIiTgj1g+xVv8ldMeLo+DkgJYn/Yb8A9CVt3pw3lQoqx6P1K2vZsvekwU/AwlCvqcuSAhiaC5CSbJwnA3k0naMMUMKphelHYcUFWhZeruzX4uanCdiJLQpInPsodk+4ePrSxpa5t8Frg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bVAmfe42; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bVAmfe42"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-428119da952so54501755e9.0
        for <llvm@lists.linux.dev>; Wed, 21 Aug 2024 06:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724248064; x=1724852864; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ZR2V02XpqNEW9fvu30UGOqjOdE3SQr9bcH8M/YKkZE=;
        b=bVAmfe42gro10OyHvP0XW+sLLvm4tFmrMCBP97uMbztns0Bxiw46DRCaeGZGNjtUbp
         rO7HJavJwbFrBkjDYpwPEGM2/UDiuAZeAK0zkbuZBwLInOZy+5z4byhb2JwF+PF1TYdr
         UKWr8e6FrFY8S19c8Z/8z9Pblbz+dCcgjLYrA+ZLiAhkG9SxaLkgVScaI9peIsqctiHL
         46sojjWOukC9I3xxko9A/lh2N59Efa1dKrcKzGCyVqzIBQ6DiwPg/nCHDKojAbOQCGPe
         6O9UgFOtw9zJQTLO2K87/WD5hITtbwQPonfwWtUccNQV50qrbAhnIqaDa5h8iC5YxMsS
         AFvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724248064; x=1724852864;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ZR2V02XpqNEW9fvu30UGOqjOdE3SQr9bcH8M/YKkZE=;
        b=wkEfrvr8Wcw+Vjvd73Sap39NvK7Ir5EfvmfgNG5tEklUt0K/rDGC8R6RNl/OJNZAwF
         95Pkyr6uMqL1GtlA64eZkHZDzijIgRuYZ9CasXMQY64ywqKHEkXysJ8MLCsKRMO6yJIC
         kmisbeA8gyHsKVObr7x2cYyYTRLq//wu6Ec0fpbSeIlUJptOg517wjyPWgAsHDh9VdCw
         0lhXDLEmyUQw+OuWtUiMh69xczQWwHGxOifVuAcp26rYIwiwP9D3r+fRqBlwBDM+ekOS
         IhRBSGni9q3qLgpZhAXj4uMW+tT4IEqSmmiNk0lRKdGrgdhn4R6BUsEkRqAPXBkl0wQ0
         9nkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNg66UPFtBAbrWEqrypZ/dWQHSc6iiLDoVmBVf6ouommqfKX/V8XwK9k2TXAfSur4XRf5u@lists.linux.dev
X-Gm-Message-State: AOJu0Ywkmwr0/gNLzRYkYIjDiz/aORv9f13gqvccwA2VwJppczgfW3s4
	DWwbtGpdrQnRlONlClk+phuwIb2H4Dj7j+hDoma9P9fQCir+k8ohz/T2Ilz6lO/BeWQQqUjmgHX
	lzblk/WcI2qkbOLefd6fIpAcDjH3DKTdyutP+
X-Google-Smtp-Source: AGHT+IE+WRPQ5cxJkts/8lQ1Pyrz4IDfgbmZOe9kRkxkJ6+Ctq49hnrFtuGR4cuPoH3txY4c4UXweZZ+1LQnmVHuF+A=
X-Received: by 2002:a05:600c:4e91:b0:426:6f5f:9da6 with SMTP id
 5b1f17b1804b1-42abf096794mr15321995e9.27.1724248063553; Wed, 21 Aug 2024
 06:47:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240819153656.28807-2-vadorovsky@protonmail.com> <CAH5fLghOFYxwCOGrk8NYX0V9rgrJJ70YOa+dY1O0pbNB-CoK=w@mail.gmail.com>
In-Reply-To: <CAH5fLghOFYxwCOGrk8NYX0V9rgrJJ70YOa+dY1O0pbNB-CoK=w@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 21 Aug 2024 15:47:31 +0200
Message-ID: <CAH5fLgiRPOVRsF5yz6d-fOciHg1EcwjD21eAgu4sSynSSsgf5A@mail.gmail.com>
Subject: Re: [PATCH RESEND v5] rust: str: Use `core::CStr`, remove the custom
 `CStr` implementation
To: Michal Rostecki <vadorovsky@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, 
	Rae Moar <rmoar@google.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Finn Behrens <me@kloenk.dev>, Manmohan Shukla <manmshuk@gmail.com>, 
	Valentin Obst <kernel@valentinobst.de>, Yutaro Ohno <yutaro.ono.418@gmail.com>, 
	Asahi Lina <lina@asahilina.net>, Danilo Krummrich <dakr@redhat.com>, Tiago Lam <tiagolam@gmail.com>, 
	Charalampos Mitrodimas <charmitro@posteo.net>, Tejun Heo <tj@kernel.org>, Roland Xu <mu001999@outlook.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 2:08=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Mon, Aug 19, 2024 at 5:39=E2=80=AFPM Michal Rostecki <vadorovsky@gmail=
.com> wrote:
> >
> > From: Michal Rostecki <vadorovsky@gmail.com>
> >
> > `CStr` became a part of `core` library in Rust 1.75. This change replac=
es
> > the custom `CStr` implementation with the one from `core`.
> >
> > `core::CStr` behaves generally the same as the removed implementation,
> > with the following differences:
> >
> > - It does not implement `Display`.
> > - It does not provide `from_bytes_with_nul_unchecked_mut` method.
> > - It has `as_ptr()` method instead of `as_char_ptr()`, which also retur=
ns
> >   `*const c_char`.
> >
> > The first two differences are handled by providing the `CStrExt` trait,
> > with `display()` and `from_bytes_with_nul_unchecked_mut()` methods.
> > `display()` returns a `CStrDisplay` wrapper, with a custom `Display`
> > implementation.
> >
> > `DerefMut` implementation for `CString` is removed here, as it's not
> > being used anywhere.
> >
> > Signed-off-by: Michal Rostecki <vadorovsky@gmail.com>
>
> A few comments:
>
> * I would probably add CStrExt to the kernel prelude.
> * I would probably remove `from_bytes_with_nul_unchecked_mut` and keep
> `DerefMut for CString` instead of the other way around.
> * Perhaps we should remove the `c_str!` macro and use c"" instead?

Ah, also, please add this tag:

Closes: https://github.com/Rust-for-Linux/linux/issues/1075

Alice
