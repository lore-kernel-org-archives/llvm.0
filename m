Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A42213777E
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 15:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727365234; cv=none; b=rszaF1n88+YpK7OVueL+CsKNWBqtoFdhzQaQZNM9YH+0HGVN39pjkZz+xbLxVKKJQi+lfrXIhbVNoZaYLIzjocxSzhZRcFFpBezRD5G+6DW5rlGqc5lNCH+aX4/rXZwai2oKkcG0mZG96P20LRhzROuQQoj+a37/hirE9/SWRQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727365234; c=relaxed/simple;
	bh=eBWvVfsKE4lYCkR9jWhTHTt0x1qkASzl46mhvR//R7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uLmEMsnfp+8y8YpS6DJwSyAunoylZtqtVpyDLsiA/93g87B61uKG+gs3kl6qb3tQgz/fksk95kjHrMTL7utE1wPzs3W0DRwhhIwuOLUkaBNKzuM2b55Kx4ZRX7p5UCTW/O/iaYbvc10BfJaaOV3ICP23nDmZ2SfuHkh42jkw6zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwt9dUBK; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwt9dUBK"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71923694bcfso51025b3a.1
        for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727365232; x=1727970032; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBWvVfsKE4lYCkR9jWhTHTt0x1qkASzl46mhvR//R7U=;
        b=mwt9dUBKp65ZyGhWYQUb3nw+IgczMCqHBgYF7nVo/nXyflIQYmlFnp3jPupz5ADyVq
         bkAzx9mIt3gChKXiPp4jYt1d1+TGJAGi///gXxQdr1wM6ImG0xRWwZjALzMjNDuWhSkI
         /NGdP6FTKcj9TIonk98rc3oGUyJG8v7wP1pMnFv8Q8J+vvlhe+TIkpSSayLC1AKoF+f6
         rA+kn4xzRm86T1ZJ2tE56I+zU12tFbkUpth8md9kzaCEimTfFaIwxmfvZFo57U/+awny
         IFwpkwt4K2z7OkMaOvPRFTye8ApW2D0W+SuvrxG966PBL02fbhzuGG0R8uXqwi9Ojfxw
         QqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365232; x=1727970032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBWvVfsKE4lYCkR9jWhTHTt0x1qkASzl46mhvR//R7U=;
        b=YdWyRBR/OdAHr5zf9jcb9HQiUXtkoVVUhtfbN4lwzd1dzlbd3eRRdoGmtc5iG6SxXH
         FZYX3Dgi9gABfXNp5ylHZpjvmPh3N+oms3NPrAwibr+qTfklWJyNW19WY7fQoHVkdwJu
         9OFMehgs18KyRAwvXQ2stOVeslMd8qHLj6ePOOOVQFadic4qFvJm7W/R+1gypfSzAsoC
         SyxHCsbqOEJzKVd1Ld/PYfdVFQ3HAdXIFNovMmd0vosLKRWOBcMtLl6pY7LLcPMw1jLp
         T2xVixlR043PRC2Id/mcUxlyq51KzQ761peubJ9Y6L2YbwpQJzmKZ45Pcj9+iRyMnzII
         jrhw==
X-Forwarded-Encrypted: i=1; AJvYcCVb0Jj0MtUVzNUIQM95/fSfJta4sfrXohu9Y/oGsc4cnIi0sH18h0BVnhTnj9E9WvOyXR7X@lists.linux.dev
X-Gm-Message-State: AOJu0YwZInyVlz/aTJLP4fWSlMGXh5gS9pSj1mAhwoHNIIS/2gESS2DL
	gm+XmQhoHAKPiH3g1Lr0fgD1N2bIF9vMn34tBaxQwnguHHnoDQ4k+aw/aQGgat1xk8hU+uf9pum
	xN1pFr/YvIKK0tdffggCyjU5Jz3U=
X-Google-Smtp-Source: AGHT+IG0/1g5eMwIe2YWirZf4Ac8fdSnvrNHQArrRR/tnb9tehSWeiCfeqtWgbf9mBS9CWxs1mPUyKjyQDvqh0yUQKk=
X-Received: by 2002:a05:6a00:891:b0:70b:705f:dda7 with SMTP id
 d2e1a72fcca58-71b26059671mr157176b3a.4.1727365232203; Thu, 26 Sep 2024
 08:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
In-Reply-To: <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 17:40:19 +0200
Message-ID: <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix building rust when using GCC toolchain
To: Conor Dooley <conor@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 5:26=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> Yes, but unfortunately I already knew how it worked. It's not flags I am =
worried about, it is extensions.
> Even using a libclang that doesn't match clang could be a problem, but we=
 can at least declare that unsupported.
> Not digging it out on an airport bus, but we discussed the lack of GCC su=
pport on the original patch adding riscv, and decided against it.

Do you mean you would prefer to avoid supporting the mixed GCC-Clang
builds? If so, do you mean you would prefer to not pick the patch,
i.e. avoid supporting this at all? (If so, then perhaps it would be a
good idea to add a comment there and perhaps a note to
https://docs.kernel.org/rust/arch-support.html).

Otherwise, please let me know if I am misunderstanding -- thanks!

Cheers,
Miguel
