Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792523381;
	b=qnc3PbRXf3f4w3enOF865iQuXEywDqPhYkyBbzVYUCmRseSByceaCQ4YMsBc3p9yoy+9
	 sOdwGuvZpnZULt45NHrCi8P/rZIXSOZGd+74TrSw13CCjBBZBlUv1bI8tu57AbgK8uEsS
	 ML7v3SHd4L2n0HcPHy4emz7fPf8dCuafy7eAmfpe8U2or+C7zWtQwn8CNTcMBe1uHeGKh
	 +7DI51j1/lnZyqmtT9QeV7GK3lbQGi16Iz0vu7FyPdOIDPYGfYrLu1K4qlDxxuN4S4Bhx
	 JCgDVuqPLxKwKQ718x7Fe8o4a3YxSlMSR3h+6+Q55YPAM94PnFJxKabbhim1b4pjWaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792523381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
	b=m4mnlvqVBn4xo3HGxjAWU8ZU27o/NL4ExARSDb+w9ZebB2pi+XhdaQO/9HdaBFY9I4Ha
	 Ym+fp3GE0w/R1YFOT2FAxoPl9sEhnZPXZPIdXnlxx+LCaYGa9EtQX9RNd+Y8Z+aQH6Yz9
	 Lx52DBQLAOfPB9xM/ioa0dshXrec+LnJwgpUvgO2RFvoFxGebctFO22jeDRXx3x+m44ca
	 uWTte6B2B5Fv3xKULgilXrcnJdcu+ycYwhULZJ5hvrMZ7HHpAP8l2nQtU0l0/kqrcEKJO
	 nvsFPH5jSQDTakpW+9UZej/iKpmyaF7jaXhEFePMqBzXNn+rz3lSIVsdBVmmZti/7xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGwwDJ+a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CAC606A31D
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 19:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CAC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGwwDJ+a
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15943c9be84so174906c88.3
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 12:09:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792523380; cv=none;
        d=google.com; s=arc-20260327;
        b=e33jL9LiDj99HGoU7B3VSSP3Ijity8CjaZmWy6eecZuQPt0UhqFIlWw+IOfIM8OT9y
         yXgw2zfcpedlEgZRS5uAAP+bQO5IEALh+rd56eoCRhAl+BfWsGwjsw4R0h11yPdN+PxZ
         pqpXuJuWVUaguog926zNrnmHA//bFrBkT0R9ANNcrUf1kVbaea2enW3wVBDH2JMZX4R/
         /Ui2ovxNbFrD1v0BJOaODjmJbbtapIre6tufcEea+dDDImnoNZsjD/lROHdegYjxnKFl
         wxUMxjO9Kbi0SisO0kXMD7YRGlgZ5GF53MUpzqfcovMkLZ7AzJQJp7+ejAkzQ65YRhwn
         kcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        fh=MiPiAqMuNuSP6xKnqFpT3vT9SdyU9bzi0YXoEUKsyT0=;
        b=ExEKZ/unoY3MYLZ+l972H6P9fobRH5VLfsKLdeYXoc71Vgla6sEs6V1BWWjZyt2sck
         fcG9yRDuswPSyR8hpwdoluC/2TfZf3af8sP7LUb7l3uuMpK91SELBauRLY6CFByHyZEG
         ooAvc/t3zjiO85/JMNUns9XU+4Mni6e0mVGjXhNQAvV++ZoMQYtEgGQQkIRDWaDAUKlI
         vWG55ONnczYE5IzKtUVKBLpI1XWMw7zC03aeWFYS/tKv0tOMQAq9YhqCflXby+TMnMxZ
         O97L3Ya1ZoNrBDQOmvzlTg8hu/LdxxmxD2rp+l/x9Jo6o6pqzU0gC5oNFd5pY/oqPIVd
         ivqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792523380; x=1793128180; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=TGwwDJ+akpywq/BGNHyaVNM+hWX30nAZPBpYoLCnJDqv9JqmPlEX+fpdDQFXwlnEEg
         WyHDWEklvIdTJpG29PIk6n+tDhRdktP+2yg9IY09pLZ5pgtjN9/HflTsphjIMoxAOY/P
         MyWtoPH7+gtL9uLP8cxoiBUW1LAGWpN/qXbYJyDevrDT2BVOMtvOAx9UlGIsiVtn7XH8
         6waU9uyi0Yjz7jMlXuabAtw03DpmxmmjjMIEQ+N6uzRbBXWhc23Njg/jUMFnd+0WsTH1
         suHVLeSKP+t0CS+Ay5D5oGsDiDgbuYyr7BiTAupwD+fLCj+euhcD6w7+pyLTgwLKVzq3
         4XvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792523380; x=1793128180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahczx5djr+c7p6mzXUGX/QvBdodUDaN77R7cgymXnO8=;
        b=pIB6TwWzPlguCdrwJICpw8ReTlDpkvqJaZcpK9K081kNg++rQpSeUxL+Iyn2fYnha8
         qDlDfYEEHPRM/VECKEM25JofgELbgGeTxPhXptImfkS8bP5TuqWEoHQw5i3O37wOz5Zy
         sp9SOHEvg/UoUDUll1IeA2eijW7AjzDWTO1BBiXzRmwXueHhA3WXyA0lNLNSerHtQjb9
         pLBH2RkmvmR3NI2bhcgQ/+VTMHHlskKl9EeexgvTFaUynM989GGnyaqs1nKS6rgMlJLF
         /DOohFdZL6riCgSbuhTgKxqagzJ8gKcz2A17Ifk/LSrrxUil42Rxh2yBj5C6F6xi7oV5
         5o4A==
X-Forwarded-Encrypted: i=1; AKwUvBw9MncCzUIh7tmioVmO3iMhYjhD/dGqlPESbBvHsyCoroCm8RoHZ9mnwKXYnQCt3p5s448m@lists.linux.dev
X-Gm-Message-State: AFq9FYI20+avl8i1iHg0rEvwrfnPjgoKyCKnbh/7v9u2yS/750w6eJYy
	Ip+CIM4RFlL9AnfQUay2ZJwYPtmQXRAiRg3E3Uhr01I7wVv+2RzT9HK7uCO0pPdOAT7GLe6PfjI
	NnI7T/UQWYxRR6kSu0QBlIS3ichIjRzQ=
X-Gm-Gg: AYBFou2eKCEJ/GDwct9s3n8PQVb6N87j3Zpfrj/IHdPg+C2QQYBxWl5/txcGHa+e4G0
	RHWQL8BUq/62BDWQSNuZTHyEeOrNlhhgcGBr+YzyMSTOv8zt53RJQDb8SzpB6K+rYbVWalbqu1U
	lfEF2I7ahWKFasVhBaPjorwJKzgAOJwC6t0kROm2pXJQLjqIjTbjWwDuWzMY8J3RKf1ThPqnWA0
	IAa0ANRFpoOeUhTspWB2bxvcy9UuX0D+KEQlRURCJm90ITOVs0Rlr0Om5Vze0UPbzvCGjjqZuCl
	i/6p8Xr2PRR5ej1h+X8Msg9v1XRInXzpj6w59YCRNm5ds/5sVQ8H86ybxZBLtqVYM7NH6Bft6aD
	QGnYECmB+CTx87ZzroyZ4rZfNo2xMyMX6W58BVEL9M3Kkchx+K6m17YSVUUl1iHYLYoP+VgEi47
	p1/m6t/kg6rnoNBd2xUUqoDDFNPBOzCXbKU37Ax8+asUJ3zVNeJ3s=
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-18507ce1c04mr25464534c88.0.1792523379507; Tue, 20 Oct 2026
 12:09:39 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
 <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com> <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
In-Reply-To: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 21:09:24 +0200
X-Gm-Features: AclHuK__St0uTCw1avvWmNXKKyd1psXINLsd-c9PUmbMZ1zOmfz4IJPwzKvtrCE
Message-ID: <CANiq72mcCErQoK6wmtOcAZ+SOgRNZO2fPoZ1dac1Now6txy=MQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:22=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> If you think there's a low risk of conflict, I'll take it.

Hard to predict everything... but conflicts are generally fine anyway.

Thanks!

Cheers,
Miguel
