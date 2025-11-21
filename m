Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0178230264
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 14:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734792; cv=none; b=s9UkBFl4XCDTtuby4BdAx8ohpt27rISzMF/S/oQuwPNMX1rJ7PQPjpEgpD8yzl6OijFx7JAdYl/NMxFU1iczU1jKqOu8FvicEt8bNYZZHj8SkZBekfEPHc3Kt/O9kzC3gRysAMbFeVGw4ps+gc6CoEYSvVzbuidpqKFgxQhKQlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734792; c=relaxed/simple;
	bh=eDgGR2698tto8NFZ+hJd3nj8gq8RooSAULJN2tTkTHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nC6sMyEyPm+bShBxbOd8ufk+NQQ56s0iAKGNFLJyYlM1hBCcT1YvbXCjncr9vHbpmoY7XLOn4ytgfXGff+tHE6wsEKC8qkeRl9eKNFwRshkSyejO2hKVksFoppkhqrkjWFdSzw+LX23N7HBATHCmINFBZMsbFXtweFj1/rzn84o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNMScjcU; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNMScjcU"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b9a5f4435adso192639a12.3
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 06:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763734790; x=1764339590; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDgGR2698tto8NFZ+hJd3nj8gq8RooSAULJN2tTkTHU=;
        b=XNMScjcUfszzWxxVofpQ9Zp06nWI7TTBG2F4HaqpWGtGZ+IFuhSTmwtwOC340kVsHl
         YyaNbzVr7NoKk8NypylyzxcWLfkSXFS0WcCqpPEHIKWBaGTsy8L/j0T0bPLsd9ubk5+w
         XZ0XDZivmzzFTjHuneaCpqc6mglLP69LuuUg1fNUdoqU8bTYCkH/QRVLPBUs0beLirOZ
         bHXqy6VRkodm6jDdrgElQfcaCMv2ReUM2Muo07izP2slVFb2XxCAJrYPAdw0EmnX4mUu
         LRhTl3DU/rX8ftbP0nfNaGsy4BscBjg4WARQXYZ6e3+VrBHoVNK/e6H1fij2lUitBRY0
         VZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734790; x=1764339590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eDgGR2698tto8NFZ+hJd3nj8gq8RooSAULJN2tTkTHU=;
        b=jlFiURnbaMMkfMw5X6DcCZzQ9563/AfmoRgdZQnuEKgCK5T0fVkhAG8mG5W9wZXBfQ
         M7ahzY2JG7pzxs6KHuvnd799PQPUFr7o6RnmUqY4kb5WW1TsqnTyCjaPxzIhOruNcrfH
         KVuGlqlICsvsC2K5GCnlKqWqCNHv86dTElBuXZMBEhPdb0I2rsxiFJQQuFAIljcq0T1j
         jZ3w42IEJRpHRkExbmf4vvfXlpaYDpvPVZbxBlJTFRyc6zy/BW58gGKq/ETGib8pR2Gx
         YShvatDRHnUM4xPqgZafyvjtD8rA0L9+fgO1P9u5T8S1ELZnC6Qg461LGCoPMBgp8iX2
         91AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXySTMnb3kjmg6t9b/y2AGyErO2XOrJpfgtBnp2lTN4UqvSzHDOxNSPX7zBMV2PJQ6gsOZC@lists.linux.dev
X-Gm-Message-State: AOJu0Yzubm2sxMOEjOV+Z93ZuTWuo5lZsCoBIEUd7GLscaXtCnLc73PD
	8e1h5gHhd6las15/M43gncQyHu7hAIB11+eSzl5J41NkCu4RsBl1zMq96HhbSrBAdICSj1RXShh
	gyktI4NyfqT6aT9Khe4wQeIqrCQ2wwaw=
X-Gm-Gg: ASbGncuzbnx6n+ArcJylTdxo2Yb1t6ftnyOA3HdqCnvYA+iy0eEo4AZUZ22tnbqXfxP
	0MCUhUuC/+7UGyJvM02BfhBYUHFdMEZz6yRhwETZvV3pSoKzAq76Hz2H7F4oBcN9Xs5a9XtDcd6
	m/kD4pwV/ZbvlksRdK5Vsg4fSlgltJo6c3ov0AbzA2qGfcxFgSmqgn8ZBAX9fq1OOPJVf16LlAk
	+3tjFhBJXO6jQa8+LDslJHtDbArehKsdLTlBH/yEYwwbBncRjtchupvwOIwk783sjOHSvbX1RCa
	dACZ8LcYCV/1weCEHm0JpbJhN3TnpJej8JmPmzgWTcwTFkukS65lbLFsQKGMtJrMLER1fV5h4hC
	EU3y6q8ed4ZVzrA==
X-Google-Smtp-Source: AGHT+IFabn2V1L94xcIH5eoxTMFF1/UMezy9Yu1wD416Wcn/cGAJMQeSVxtMH9RV2wwhe7BQFQrqvwuCetmQ+JnuRFc=
X-Received: by 2002:a05:7022:ea46:10b0:119:e55a:95a1 with SMTP id
 a92af1059eb24-11c9d8678famr565479c88.3.1763734790123; Fri, 21 Nov 2025
 06:19:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
In-Reply-To: <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 15:19:37 +0100
X-Gm-Features: AWmQ_bkQkGrI7jHz10jepK4vORe9hiqm8jjK8bT5eggMyhBFXXmFRvhTXCi-cMs
Message-ID: <CANiq72kBT1kUc6by6-v1LMKa-WnhOgNbFMLDWoAO8Kg=dpboQw@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Alexandre Courbot <acourbot@nvidia.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 2:41=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I notice that loongarch is a Tier 2 Rust platform, but I suppose that's
> not an excuse to let it not build? ^_^;

x86_64, arm64 and riscv64 should be kept working, and I also
build-test loongarch64, including for stable kernels.

arm32 and UML are the ones that are best-effort (on my side at least)
so we play catch up as time allows, but loongarch64 so far should
always build and it would be sad to drop that.

I don't see this in my tests (though I see another issue for
loongarch64; I will send a few emails), so it may depend on the
config.

Cc'ing our toolchain experts and the loongarch maintainers.

Cheers,
Miguel
