Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF9249B461
	for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=pass; b=geHgDUnNLppIqtl0wChxl3NIMt+R98qpX9st81SXBgKl9zZo7CHtrpT1qgoIbgxVNOhgaE8JHvA6JwcW9uGwLNvbCgW1UmjfNYAZMKSoNaIqHzh0C+EwO6Jay4DmWk0NBlvxFEEtmx5vErmuDvwTZ8YLcWVax9QevU3ZgW9ZVsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=acXxdYNI6vj4GN6tEYHBYlbXzhzxGLnqPGYWn+EXNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsEteM8OV/mjYEAmFKJl9/beSMtwifypBlOQtIAJmCnSHPNGoGXuLonW4Z4tNhjIEgM6+aswEHFUoF34UZbJ54lCmcDXYRU8YIxyC5aPD6jFlyXS6Z/ly5Sds+BohCQK3xTLbU0PkYduyxvck3KgQHz0Wrk//M3AWCK1K/f8IAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiUq526x; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiUq526x"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35a0ae8d711so95766eec.2
        for <llvm@lists.linux.dev>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818487; cv=none;
        d=google.com; s=arc-20260327;
        b=MAg/auJmk5prS3wKVkEKnGIXbhRZyAEwjOTy7wuJGfUAIhPZdytbeCqmO5tEbQQLYN
         Sba8kfX6Svf3P/DpsF1Lh8qb0GeHcpE1j9IVC/izKOox61zjWnYHVYHXysmQZj6Ym8EC
         Hiw7vQgwCgS1pJ61qxSbNoZ3Y7rCCJAF5xEmzSuJIdt8HQu9w2sHXyVYdIbRosNvzeuA
         xXulMz4FXFhzbR05v2yJ9mYXC5we0V23bzESIXhVAJgSj95yAVnMOcsxAsXESj+yrriq
         n1jlDG2e3HyW7GY9LPmeWIHfSlu2vBhoEtp6jZ2eJOmI+LI5a4EnlFbQjUip843OhLGC
         yhCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        fh=e9YsmrMgirrTLG0bOMKbmaRHol9nCAHTb/5EZB+98gg=;
        b=VebMvyKwjamSgKofL5inz3pdoreiMMG4n5+ysFeJ7++zysxooCiXaf0qEmQdT/cRcu
         ipNcIatEkZ3h289bk39iUtfos+U07UHw1/DUvVox8E38UFeQNod/uH7cu4LRQtlk9YNm
         yi+bcPeH1FdfFcIRaNd0eV7IB5a0n7MGXHzgixjKo8lGh4cA1GOEAu5RmciyDmjYbU4B
         NunBljXXFOSQpatY5Ttvz+pNVI+M8BqvUIzLNqI5+VoHjWAoSN9fgW1sd+nPI3LtgLYC
         e/luf2EnIo1Dvc/xoACAkAdxe37buoLkP/ZdUI4ugM506grGoDAOCyPI/hiQRW8mbqfD
         4gUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818487; x=1792423287; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=hiUq526x22dm7iRhUrEBEYG9kJthKZ8CBtVWY7Alvl6FgygoG4712HltHCLSNtIKIl
         9iZoqsEQQ8ZyKl4kOQVIXJLEIyb0ywlacWbtqHGDq2ZOtIPqD0BXX72foYyCRJCF1xNc
         uCBFovOF1XfCZ0Q0jWCsnEq/9LbVHLcVrKk09y2aQlMKC8pS7k0tXo4oVXnzdo5vyj/w
         RDmVgBvtM4OWA7YoJJq5OV2gnOCIUqS/ROTVzoYpCDIVneyxI2KI4ufF1rBkfGELfxkU
         B3/M86UtE8OGGZvmqakGN70JrO2q7OQT2pMnJEbR3jODY5m3NxqF7XMndNTEOBwzIl9c
         +R7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818487; x=1792423287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=LEJuIq/heMcCDnWtMgsdBr7kXxy7MbR8Pjg12m4IBYTTq4eYuH2qCxYK6TKwzi9b0M
         GPru4JrG2GvGF6OtdutqzH6C3xNoodflRVFDp5vJV2O+EXpO0hIOnDsi1IwAwoEaqN4F
         S7EtxCZ5mft8Rf2O8sDzr2bUnBjZTgF9rwUoZamR/02A7DF5mEsLOtIAwLClc1ucU1tG
         eZSdljUWiTnBNIm3KPHJSjzE6TXGQ8s14R2tfIdQQXmRsI5HhrixVapqjpP8uOCl1MB9
         O8TdCZ6bIXMmasM3h+BBGI5T+X1f9J/3jMLdlHpS3CIHpOYPmqATWxeC4adUb62GjXMf
         imBA==
X-Forwarded-Encrypted: i=1; AKwUvBwKg4lQ5OUxNUUc5Eze53Tv4jMqcVVJZgDoTSY2M9WrOVPkiJdEbOnbSI9CGFJ78P7baqXi@lists.linux.dev
X-Gm-Message-State: AFq9FYJEVYAZ/DnofOPjikPbcfgRGt8gwe6nE+fI2197CaEwKyOQA0WE
	2arki7fl+8JGGH88LvB0jauZU4I1BNgjsZsX4Ke/NzxLlH+jTZjfSvSAlu1YpFtfBTFaTZLGmeO
	5sQ4tDXoP/rCcN5f7s/6o7Zn26n2LEts=
X-Gm-Gg: AYBFou1+U+J+8AhDXhq4+cgouugWg5xxWrWLKtOgF5ZZC5r5nbmW26l9Lo36jlSoife
	Gs4enisb8TPq8ltASbNop0hl+l8YJqVnstmGScFW2IBqgK2DCSewEd3W4Li53eg3CpfSzIIyWXz
	DwJwV4ooaRWpLmPOA4R7WD8SnF3CHothVmVTTkvJzBdOYReCD3xHKBeIEHRHIltw7D8LvZacoQe
	PrUiY0Jvk42sZiqrFmhtvOajOS5AmXSYQZmwuQOQVdkqEmL34UJIJZOkbpvRHKF9KT4KmlLr84q
	20r0CeT+HOlS/FKJFcglm7rq2w3jy5GbvxWXhUtHTbIPE0E7+IIXLCDZ5DWdqRX5DXQifLIzmIX
	hDcrPcJKoQE48wVw2XhVFMQVzuFtq26SU0CfM79V3k3PkyGSfpLITCgZlSrszrlgZKIm/GDzrCD
	KTMIyKE6frhioE2XrinvdY7X/zaa9J8MOMuAq0kHiduY8AUXJd1T8=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr22095379eec.0.1791818486595; Mon, 12 Oct 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com> <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
In-Reply-To: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:21:12 +0200
X-Gm-Features: AclHuK8qicd0EkbAG2tR809BSGa88U6FRkGTx1gJTbJF14aEuOf_oW-ieXqq320
Message-ID: <CANiq72=p6a=4K+8jhbm8=y8i_4yMszacK-fu91s3-Eg69ACejg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:16=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Oops. I guess we'll make a v2.

Please also take the chance to use the kernel vertical imports style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks!

Cheers,
Miguel
