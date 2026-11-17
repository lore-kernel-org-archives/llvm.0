Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949112;
	b=hmGBy1c4OQg/NUQ6SFJhpdeSIjo2ci3F+tTcAyffafM52b16iY7Vt04UCErF9SN1XFG7
	 X6xjydXG4GJUZNGtQl5xjyVv6iK/OzOnctdQVezOMq9tqCf7UrCHwZ9FMlomoLMkdqimz
	 gTnutxBTfTiAaxp/otcfUfyA/hz0NE2A1xdzV0hQrAovM1NalUxQp8ekvzRqMGvzyaG7X
	 Oz/sQktYcNOY2qFDUyfCOo8ADThFCG6/7zjhXnORyXBMOL/sqYKvRKUZJisvguSxJ4NWq
	 Hkln6v3VrgJyz+XpmMO+CFnI+OemcKLS0cfbJPbqzX/rZ1Z1HVOxWPWoTAUaiHG618g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949112;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
	b=bJ2f2p3m8PZxgIlLePiHnh8BFX+mAK5LpT9ksLyMzCgDWa7qdIZo2dYVZbRvpezrcKw+
	 +w+3AlDWRuofDC2OH/Wy2780ubOvx+bmoljnew5jVBGw3eJOs9eYTzpiMGk0BVTtObH+g
	 iomJW56rV6FKoD0RMDPKx7PtOCsO5qSmzxpCjberEysh+VYiKKYAIS+j5lHKzmrcJegji
	 HzL6AYYzLtOoizWIgbCYx4GpRw4N9UnIrq9j7pq9+nXIAVVo9jzvhdTxcw6r7j8GsXuCv
	 y3hF4ukjKJslA5chdO1q8x7MeUIompb8lDFFr3EeDgKsEbG/XxMzqZnW+EFSyO8N1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pZIJNrcH;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A3606A32A
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 20:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A2A3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=pZIJNrcH
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-492d47f142cso79355f8f.0
        for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794949110; x=1795553910; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
        b=pZIJNrcHNybpIz2Pzlim+u6h4zbSfC2OsPye+eUa9zax/GWdF4blk81+wwauGz7sXj
         sp2AtDrDcp9ZKEMaSOct0Kwa6139ul/jAz0KpqY1Y3gT223EZ7Sxk1PPfP3BQpX/+oUt
         wlPFOFy4krB+iSImuEY4kL94NR9yPPYWU/LPkqfQe0PUdmOEoXXu+IWBrPzQNEJsqT+U
         90s/laD8PYrtYHzfbP07C/SP+CZV3KBvj2OvrYzACPjZP75SBWotNodSd9I2KtaNRbqK
         h1zB/ux10BkZ7wV9qv5xEsT2wzvxscYX3L2RL6qthGt176BHpD0y7Lc3ypSUVZpbBjIm
         tyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949110; x=1795553910;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IQjnSpWNmOsfjWunLKeggnYLNfDLqDBiq6etlWznrnc=;
        b=nRwTOLS7whmKYFAAodlmwn5eTKvVCzmGEluibZ8IwsRkb6aFO45p1YrgWIiQ/mtYCn
         yHV2sIfpVVHtna6i+1g5PtNZlRdZloOBbAmlcshl1MS/cJwEgc+R9jsTkQbD+6AJbAA4
         3Mi9rSTgyspGZbijeFiZdHrCKHazCb54NDBKIN74YRyKSaZqWu1V1/622es5xwFGhlWi
         cgzd6GVJcxl4/3Slwwz3tE4X5hrwAt5Tx2Xf/+lWlpF044dAKSSPal6beAGMTYoc2g1W
         rcByZCUUTaXe1iFdbaI+uapBA0RfpGO3IgW78c+ERyYozWxrocLtbkNZL7+j4xjy3yYR
         ZQsA==
X-Forwarded-Encrypted: i=1; AL+hErHvoZnRio08xL+cF46/A03Bc2F3rdD3dbx3p0ZAXBEgTuP02gI0S4y47cC8yPxyPkieOKNL@lists.linux.dev
X-Gm-Message-State: APuU4Z824F4NUisq0oFzYBjAwex6xZhbuB6mWncEL/4SFp28r1NEZ9+x
	mcfwjochwFiGLKB9+r2g1C80Yx95R4onRp51OSoD9lAq2fx2rqjfsr4PdP59W5gWWW6wYLDH8pL
	u+XPOiJPq9DDFOE8QWA==
X-Received: from wrcz19.prod.google.com ([2002:a05:6000:4553:b0:497:e67e:6f53])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4a01:b0:48e:7833:2e7b with SMTP id ffacd0b85a97d-4a36c30c79bmr8397843f8f.1.1794949110053;
 Tue, 17 Nov 2026 12:58:30 -0800 (PST)
Date: Tue, 17 Nov 2026 20:58:29 +0000
In-Reply-To: <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20260820135733.37121-1-gary@kernel.org> <DKTW8F3C5TC1.BE0JLOWMZCTX@garyguo.net>
 <CABCJKueCgEZ9XePNnJhbxbOP=v5X6-PvFg4poRfo=j6htovJFw@mail.gmail.com> <CANiq72m9v0V5Nnc_E1LUt24ofUUGxbRZdUC-UBz2NEbY_MA=Rg@mail.gmail.com>
Message-ID: <avy_9SPRaPSKD8b4@google.com>
Subject: Re: [PATCH] rust: cfi: disable function merging if CFI is enabled
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Gary Guo <gary@garyguo.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	kernel test robot <yi1.lai@intel.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 11:20:18AM +0200, Miguel Ojeda wrote:
> On Fri, Aug 21, 2026 at 1:43=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > The LLVM fix itself is trivial, and it looks like a pull request for
> > it already exists. I assume we'll want to drop this flag for fixed
> > LLVM versions when they're available.
>=20
> I will link it in the commit message when I pick it up soon -- already
> did in https://github.com/Rust-for-Linux/linux/issues/1132.
>=20
> I also added the `-Z` flag to https://github.com/Rust-for-Linux/linux/iss=
ues/2.
>=20
> The `-Zmerge-functions` flag is internal but has been there since Rust
> 1.34.0 in upstream commit:
>=20
>   b91d211b4030 ("Add a target option "merge-functions" taking values
> in ("disabled", "trampolines", or "aliases (the default)) to allow
> targets to opt out of the MergeFunctions LLVM pass. Also add a
> corresponding -Z option with the same name and values.")
>=20
> so that should be fine, but I will ping upstream Rust so that they are
> aware we are using it.
>=20
> And, yeah, agreed, we probably should remove the flag conditionally
> later on, to confirm the bug is gone etc.

Function merging should also be disabled with gendwarfksyms. It causes
faux::Registration::as_raw() and Page::as_ptr() to get merged, which
incorrectly causes the former to get the CRC of the latter.

Alice
