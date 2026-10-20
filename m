Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792520558;
	b=EPjpgK3o3GbEH+AW37QvHcPu3vLbWPgJi4TQn+DY1vb3knbFjmsBZUHqnPbYbUbokw7R
	 abngqsZoqtCbVxjJDI3Vv/XW5TB9HsatkzPT/Hu1I7jWGiSE6Vf2/NACs5f9Mw+LUpaqm
	 KURetnatHujes25pU1BgIto9IOYoReOg293rIP8KMMF/GDwp9w6REaBSHkwqCckXW6AQb
	 A/MwQdxGg1+Gb2haRFY4mvaTNA8yweS2eGYQ/OClQq9Ly8Ylc2jMZ1LQnUrJIGCh09H7F
	 XW+WIhtNE+oWhOUAVYr4Fy6V2mzOsHIXlzbzaMEU9vfJ1E+mamgJ3PNn3vm5KLhhZ4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520558;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
	b=zsIs0cGmocRYr4Ze+yok25ciD/KQNpPiENQseRBgrMx93LqZE2pnMYxB1RESUD6jsAsE
	 v3zak4F1ml6RIrPclGfGq1Qx7E+pgZMA5kEkkIEG4S0ZPePau+hmwuKx4AMNZHYPpJAsF
	 o6PzETnrSToGSqyNJs1agRvKziAJ7SqZ8eGnJnWS8YWwy6T/kmF2y6QDh1mzWi/LrrWDW
	 x3M9I2EvY8zRdAzhu4hNBoL51EaHGBnKokL7TsmLxe70FWmzgYJgzD8ft+d+9hhNhGCop
	 YiIPBp5+5E2C3uujLMOQikL4S7lh4xYlAXvh6NSuY2n+BazoPvM82uAFPS0skm0mk9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GyoawWS2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88F9606A31D
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A88F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GyoawWS2
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-679e6ab6471so919560d50.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 11:22:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792520556; cv=none;
        d=google.com; s=arc-20260327;
        b=JFoOWWGwDxYEQR53w7OTn51i8AFNL2Ba4c/Gre2sILjyOG1lkSrXH2l5ujUy0j6i78
         0cJuy9QTMI0uo5oATQKRvVa78PKdwQ07Y5sIWM4WFV2DnPs8RF2N+6FJF0sdZxBFX+v9
         CZGN7lue5ukJP2h1Yfxc9isxWJTbEs71t5U2W2MOCvjlIKPWGEUFGk0twpKJjiS5gsFr
         hSUKSZFjjLbAaV2Slz+2z5CLSrjbrXyq5u/Zy86kQx8sekitS0rsDqdx6YXHFgc0qF3Y
         o4LunI8alK8kH/u8yeCjVQtEaNVkLQE80s3NfiIzd8MNEQ22wftuf8Eu/71uaOID+uQ5
         ZmSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        fh=0K7ofW2x9qIYLXp+X8ESOjUsZf7sZKIox0zRO2Hc7uk=;
        b=DfnQAVu92QOlhWkWFcSMGOwVuz5GRGaj62xbWu8xT/KZawVwvzUuWJMFiHUnYD3/0r
         67hDuRii8+bZez0xoThwPzGeXe+QptUKfC0VG/WA9KC8NvmCR4lMpKUcFE639q6FnXmb
         r6ZVhWhHeX3L/FYFMzYvFvamF8WahN81DZHaFZShjLNWir33lyEgPWpZM7QNew3TlWMQ
         Id+d9jRBjUOGjfbJhuOLyB77Z3Les22aI+HXnLKu874v7SQb3Ln/KW/NZTiF7rTCCA0W
         VrQsQilY8hqAlYfO86ojZgrkRMj/CJkqCiZkym1th7Xp+MkQdnvQB6wvAG1my2AHLfwE
         L3Qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520556; x=1793125356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=GyoawWS2N+8wIsQXcECzcgXYYWJHbHyUGrwgIZf7cgHic0dhmzyAfFSURFnN9Pi6Tt
         S2n/H75HH9egSTiWwSG2eOUN2qISyri/Cg3d5gtEXX99eY9AYL912w+9gwG++54D9nbZ
         OWyhokgPAzN7G6eYiANTVxw1YgNwuHcn3J0Umbu4SVM5ySc7ErBAbUPp/F2dVs3iWG2C
         Sh90afqogg2rhMfx+gH9JV80XcgX+Gt2GVOKPVeJ0ks7jeJ608TUxMoPeADzc6flGBOL
         ieEirCMG3W0UXHHqyPobiQCmIZpPRUTaGe1tLhcYKl97b0UTk+r9FVXQ+JMEfuSfRpsg
         vmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520556; x=1793125356;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHLyyCKYeuOzEypTTHpByT6eNu3x1tlDaVLz6hUSTes=;
        b=zwC+M4J+pVyvEdFccTakgg6cCw1jacn0jG4O3duo2a0fgI1h6c9lUmYCSw7R6HpP5o
         zzjs5wn+rJ9EK5bzy1HtTcd3y9iFAuc/Fw/Yi3YKQWAyshKo3wFdIWTF4j3meoFDcrsK
         bHFKJUM7xGVXEN4xP5sjYpREmbYCEBi8PFv4OOjqABCaad05n7K+9qzcdWo7Sd+8TpmQ
         qrQLUyqLbo+o61dpMoeidZFfD7xCg5NyrG7r8rXrpa/EUlwz454HAros3Zy5vnJxu1lR
         tVM014zfBNFwfNOKeREYqrKR5tWbiuQ3Q914tKILFqbHNHV3+FZAMu4XDf43DA5PkVCf
         R22A==
X-Forwarded-Encrypted: i=1; AKwUvByI777qTAy7fx0r6HEfMFFA2ClfsWhz62SJkU3P5oqimewlXKjwe5zX8AgosEbODLnGu6Tg@lists.linux.dev
X-Gm-Message-State: AFq9FYL3zr57y/YGbTZ4YUZWZj/hrLDmSTnLE1c13RZphomAbEvPZCY/
	Tko+ZJwxFOKXFBgd+yVpqBz4t302nottZml7aOqCiETs7zuShRV+7TvpX6sJHe/8PoYi/uztF5d
	EQ2pCy2FHRZK/AexIpLKe0A1wTiq4x7nTQH7PDT1p
X-Gm-Gg: AYBFou29taea7JsJ2MeOz0fdqTxLq8mZF1tYXXIYOlIa4Q2D8+JhlfRe6laLQ7OYuhE
	eCUan+TDM4zCSQam9kmQWRSWDzrlrY8R+uBPo3sm/xbZo/ujHH259xaa2gHj2zXyLCJ0XPVeAIw
	gIVmhKuptmRHrqEdagAwnWP16YQrdVEG7KF4nygwcmi7NPCR4NItEmQZBt+UNAhDPFFjYG8ZXDS
	Ko85H2rDkjRBikE1qaShV9GEmDCMrUITRmEoFQCxrjDwuE3828FLUNIumRBduGO1lhaNI5LdYFk
	UcAIMh+IoFoYXCXSdk232cjS7lKBmET5iUzrO0mT/jYngC20ZTLaQ7ghLYJ16+1QHKaTHtG7B9h
	+ZCDWbFHGyAM=
X-Received: by 2002:a05:690e:1508:b0:675:61ed:ae79 with SMTP id
 956f58d0204a3-67a0e53f3camr15368d50.40.1792520555651; Tue, 20 Oct 2026
 11:22:35 -0700 (PDT)
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
 <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com> <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
In-Reply-To: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 20:21:56 +0200
X-Gm-Features: AclHuK_xIgQ2EfRpHmzLAMkZfp67LMe6ufygxtV1abJhpWdiWd3lua4TQ51kRJc
Message-ID: <CANpmjNMNo67fgFY9u8zurGJOxOY10C1CKwb1UvUbHo01cU+_Sw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Tue, 20 Oct 2026 at 19:09, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Happy to take it - but in the interest of avoiding conflicts, thought
> > it might be better suited for the Rust (or Kbuild trees).
>
> Same -- happy to take it too next cycle, whatever you prefer.

If you think there's a low risk of conflict, I'll take it.

> > Needs some -next time, too.
> >
> > If I don't hear otherwise, I'll pick it up later this week / next week.
>
> Do you mean for this cycle? Linus may not like that, but up to you of cou=
rse.

No, next cycle. I'd pick it up next week, push it to a branch the test
robots see, and then update my -next branch after the current cycle.

Thanks,
-- Marco
