Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8126A2F6939
	for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763736289; cv=none; b=FgCHUvliUsHK4YU06DBx1I+K2qf9418AS3S5XIxnft8jMMEII6bD6I+5+k9jtgkNkd7vXQz2CvGuCFGO2Wp1SleUAo3k7kAd/VIqEf1RCUwrgnpDYcKFRAUfSi0XzHxmXTsVXfF32ts3Y1l26KV0hKEMJyaQwKjVpcRD4wtBdow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763736289; c=relaxed/simple;
	bh=jf0MUkL4tIbtqWkRDzQwWqsb1FwWCg1QD88ryDNp9Sw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h6psq84zOU71P2JIV5pw7iccsB8W21yJn28OPKrKxFKGl+Mc4pQrQENOQQuCdQbUV8DJDNm6BrOVZl91euD7Jj2/hymorkHugWIvF7c3MuaJIqwp9w873y3mEow6gcOGh/kUU5/zKR6Hve5GZt23/NT3Z5ePxtnMSRThVYByhhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HSTYdIa+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HSTYdIa+"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c93a28ebso1466203f8f.1
        for <llvm@lists.linux.dev>; Fri, 21 Nov 2025 06:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763736285; x=1764341085; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1QAZpL+0ZA3h0j+xdSuby/FpO90CIo8pYiVHFO//mU=;
        b=HSTYdIa+i/YFItDWQ/Rkf5ZpGqdG/Ymomwls0PHIkWW8kRFGa+juxk1arKPnGSY/DC
         UL9duxudCXi6kB5FMXaxlmSwEd9fw4nzLhoQ/0pc/J70KwXyjpIXLUHqEuUmCwusSVwl
         SjmpX0vHMNzQf4+/qIfyg+FkX3m17NaCjkdAY/hGFNAiNbiMBKAQrj37q6GBPQ8lcKPm
         bI46rotBEemVzW25Uz0jyn/RbQG7anbVZXj5cWT4ai2szIPc3RjZVSARDUX1FjGVNNRV
         iJYSh+vuPoi/wjTZBwGiSINE7qgSn+jP+G3FJmjrvRthcOKFctcsykpKPSB6G+gtMQWv
         4kkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763736285; x=1764341085;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A1QAZpL+0ZA3h0j+xdSuby/FpO90CIo8pYiVHFO//mU=;
        b=MRlOmraC1dE7Q0QSZWPPJMwAI3xefvxfjaHp3xzEYp2MVZdmHTwVWB/npTEbav6Jwf
         A26Hl0Kzo48QL2tR3xLBHoT903gU9/cua4yc2W8aAbd2m43nCGqwvMPvYKh/6USqOJcz
         Snkws4It8PkQtHFBU5x6r1qLDMhSCRNADHw7/71brQ1eZ/pqbfhXzSKaWn+KZst8xrCB
         AUXZJnssc5Pj5NX39VirP115HtosvHcHlODIcUeujS6NditdHx3koW1PPnrXpUCtFc2r
         FUbec8oxRA6tIMme7OVBd2MWz7VzwcC3VrUtzlE4cCLudLmlmUjmzXIToc/1Aj/e/COg
         hYJw==
X-Forwarded-Encrypted: i=1; AJvYcCU1xDOtwT6v/2xVy4HpSIjuAzDNiQfTLNBZy/gBqc87q28EGwFSBj/P2TnA3FDFo8fgGy+5@lists.linux.dev
X-Gm-Message-State: AOJu0YySJRREBr3jxbJMZgdznSD31xv3E9uPwIxkhgwqJ70KrrvUwFw0
	0BQS9BWj2QW87/U3PZUitvv9b3hr0HyVEwt1m+lYiPg9rszmTwFTTpLfktYagaRwu9rsaUeWm4t
	1bXKlT2fmZjsYTpe0yg==
X-Google-Smtp-Source: AGHT+IHrpgh/ZK7CXrgoqMkP7DULMySwAw/WxuzbsB2IFNQDbv7OS2Xae9d+od0jIzSYckVozIpCUyyJpXN4mnQ=
X-Received: from wrwy4.prod.google.com ([2002:a05:6000:1084:b0:42b:3129:d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1ace:b0:3e8:b4cb:c3dc with SMTP id ffacd0b85a97d-42cc1cd5d4cmr2871358f8f.3.1763736284612;
 Fri, 21 Nov 2025 06:44:44 -0800 (PST)
Date: Fri, 21 Nov 2025 14:44:43 +0000
In-Reply-To: <20251121143008.2f5acc33.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com> <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net>
Message-ID: <aSB623GKVDR2TBc3@google.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 02:30:08PM +0000, Gary Guo wrote:
> On Fri, 21 Nov 2025 15:21:45 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> > On Fri, Nov 21, 2025 at 3:10=E2=80=AFPM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > This kind of thing is why I keep saying build_error() is too fragile =
to
> > > be used at all. =20
>=20
> The case here I think is a perfectly fine use case of `build_error` as
> it's completely by-value and does involve references. If compiler can't
> figure out, it's either a compiler bug or a source bug.

The thing about this particular case is that it should have been

	const { Bounded::<u8, 1>::from_expr(1) }

or similar.

You say that this kind of thing would be a compiler bug, but I don't
think the compiler devs folks would agree with us on that at all. I
mean, sure, it's a bug in the sense that it's a missed optimization, but
it's not a correctness bug.

If we used const eval, then suddenly it *would* easily be a compiler
bug, and by the way, it would also work reliably.

> > Adding `unsafe` blocks for things that should be able to be statically
> > known isn't great.
> >=20
> > `build_assert!` is just too useful, so it is best to try to understand
> > what can be done, or find an equivalent solution. Gary et al. may have
> > some input here.

I'm not advocating for adding unsafe blocks to skip bounds checks.

And, fine, there are probably a few cases where it works reliably and
has no real replacement. Such as the VTABLE_DEFAULT_ERROR check. But I
do not think bounds checks are a place where it's a good idea.

Alice
