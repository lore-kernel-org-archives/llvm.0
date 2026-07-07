Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCE13D4121
	for <llvm@lists.linux.dev>; Tue,  7 Jul 2026 07:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408317; cv=none; b=gs27CQ2yYpN5LQNlH30Kty2WFCWjIGjm3g4QItolBrkMHdCry6EO38Rr9FfeLjEerEjPmpJjVw6Rw8XPHVCr1jvAvLI5tIG42beZY/x8JNF/UEA+OPrMfgD3D1oR9uT8p5bPcUBgGn4gm8wtFbQoMz44ehb1L92zDUowiIL7vh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408317; c=relaxed/simple;
	bh=dYEdQ18sgc+rSkPRjPzl6r1N6/BcC4c2WoZoXXxoK4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5w8nFeHPBh7TdbK1nWijuFhA9QqzD1yYiYkinvsKFOAYdUCnFNe3t76iG2DYgz52RiLIeV1OSWgdLle+7+KC4kf6AvW8EhmgxQw6hpWhjH2Q9p/gaod4m8uoOebl1kiveK51v8dS9to2IFjNhSxGAhE2NDualEf9sasdg9nZgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZZ7nbI3; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZZ7nbI3"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc6dd436c6so20358065ad.2
        for <llvm@lists.linux.dev>; Tue, 07 Jul 2026 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783408311; x=1784013111; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uKV78wv3WbZUmoFpUcsGcDjAxX6ML3nr/lm0iF69y48=;
        b=SZZ7nbI3pdugUTB1Yq/GKvgl2j0mLeGiTwz5+YA2+Fbfj945FO7O8B7eXWFUTQNgXN
         961w9mn/zM4vph4+OqcrCmqb06468SJY3OBzhJNDoQTR7NvYltA84oJgFeYKo4cBHxNd
         /h9xBogvD2f0NqCy84LH1rvwdLAoc0eLMTy8Qzt8hVpsOFDlz7IpiJFXdhuE/OPJIeCT
         8AYyn8TTrW6nXD2siul45TtcnshfNobZXvMo/MViuGwr8ud9kLnJfE4zQzOVEm4JTvcN
         XAd33xd1KwgiQJ6R5SPHVu7VK4jXqLHam+Uc7ZaXN57Kn8luICYq7O3BlMaJhOci8Pel
         b+Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408311; x=1784013111;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uKV78wv3WbZUmoFpUcsGcDjAxX6ML3nr/lm0iF69y48=;
        b=mDOBOhRKnoxRqhKiVVcsIZWnsmCuEXUKCNZHyorQkiuEsoa1pZBah5CIhyo9x+5BBE
         i24kUIYItrdhklCcaa6ofPYFuchlGI/RtmBW0lr7ihJ1LgXUxCdRBe+VDzG5a+uLGFTC
         lMoK63ODG05d2UqI++gT6SQa8EuZki73r/tmGuAB8g2vqgQH+od58b1V/JaPnl3eKGXh
         OtkFeawLVg5BC+JAZnp6rWW2WSBEwpa2bPztvDkW3mpEnhZZcrN0agWtCAystOHkdbJd
         fvDYxyH2rp5cG//WjBMBITLOKx1ezb6ynxy708+aD0ZbDSIddvmk3f9wHQ4r6I+PdwZM
         uwMg==
X-Forwarded-Encrypted: i=1; AHgh+RpbINOPVihYnk3EJw1r93tsEdjcA2Yso+x5K80uounOrda8FdZMF4MF2xzq5lOOUdWUKqJi@lists.linux.dev
X-Gm-Message-State: AOJu0Yyk+GfWHFFWKGjg8yWqYdHKayyqLHUF8bWsyv+ErPou0lKjR+hH
	8FsbxZz6ytQp8ohl9LoeoIBNsBY4/LdEyT0ICsz68SKby2+IkZud2NWT
X-Gm-Gg: AfdE7cm0VpVTVB1rINSComGqwxR+Kcs8Qn6urrIfX1KmcepPL3Rz05YOIVmt6jbJxyj
	dTpj/RqQDzlmri2qSlE1uWvFhRvhoHjev1bo9pQCRpxknDD/ETWoIV/n03ED1sPjXiU1okuasBv
	LWtW0lJ1l/zCB5OhypleZPb2NiSSA+94sw94rD5hFhgNj7xY8T6TOWw4qE8nkRcEXxs2v1+Y0PR
	dztjgPinPUBkIjQQeuMJpC1sNZLk2ZlghX6TZQkhDxBqiDzAQSHJUcneorq3oKuIFYLrkIUIQDx
	OpzpAXBXYsueleaHi/nMol3jeetcwdEUoyvGiJvZQMSKvwWsnFwVABbUI6cUYkrsm+0PImEnxl5
	g5Y1P6EJL9MH+GvDVztu4OihDR5G+TxsE+pIkJC/f7hznpS5G6ezZncH6fRyMYZDYZY5yvgoKJR
	bpxrpuShZdq6ss1tAYTj+3/Q8Wpl2MVlnexZfdD5RC4KeBPRgnzlRq/0FI56TCaYfyK3ei8Mc=
X-Received: by 2002:a17:903:4683:b0:2ca:be8:62d with SMTP id d9443c01a7336-2ccbf085003mr50131725ad.32.1783408311212;
        Tue, 07 Jul 2026 00:11:51 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf74cbsm6556115ad.18.2026.07.07.00.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:50 -0700 (PDT)
Date: Tue, 7 Jul 2026 12:41:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	daniel.almeida@collabora.com, acourbot@nvidia.com, fujita.tomonori@gmail.com, 
	gregkh@linuxfoundation.org, prafulrai522@gmail.com, tamird@kernel.org, kees@kernel.org, 
	lyude@redhat.com, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <akyiZBPCaZOOyTw6@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aj4gAdy2siBxONpo@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72=EVsTFkQK3LWrT2Gs5UKKViemGkv1WuitY6NOEtvcsNg@mail.gmail.com>
 <akH6yuDH9ZwXVoVA@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mj1P9QykK6vbPK37hZkMLwd7RcgVWEcxxuE=9OL+4bAg@mail.gmail.com>
 <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akNXvfSfue7_3tyd@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>

On Tue, Jun 30, 2026 at 11:15:03AM +0530, Mukesh Kumar Chaurasiya wrote:
> On Mon, Jun 29, 2026 at 11:11:44AM +0200, Miguel Ojeda wrote:
> > On Mon, Jun 29, 2026 at 6:57 AM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > >
> > > Sure i'll bisect. Meanwhile i would still like to get this upstream.
> > 
> > It is very early on the cycle -- I would suggest bisecting first.
> > 
> > But it is up to ppc, of course.
> > 
> > Cheers,
> > Miguel
Hey Miguel,

I was able to bisect this. This got fixed in 1.87 with
#![feature(asm_experimental_arch)].

1st commit that contributed towards this is
e4f539ea17a3 ("Bump to version 1.87.0")

This caused another issue to come up while building

```
error: extern blocks must be unsafe
  --> /home/mkchauras/.local/rustc-src/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/powerpc/vsx.rs:38:1
   |
38 | / extern "C" {
39 | |     #[link_name = "llvm.ppc.altivec.vperm"]
40 | |     fn vperm(
41 | |         a: vector_signed_int,
...  |
44 | |     ) -> vector_signed_int;
45 | | }
   | |_^
```

Which is fixed by 
a78d1b092c9c ("Update stdarch")

Both these commits went in 1.87.0 and fixed the build.

Regards,
Mukesh

> Sure, I'll bisect it first.
> 
> Regards,
> Mukesh
