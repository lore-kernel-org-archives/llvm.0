Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE6145B09
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714134070; cv=none; b=bEuVGWUJF8toAuIMkIoSxvsKdAnEnAXvsjKICbH92MXXsghNtOLTWybdE39FMFX4sDJTPyZHafEOnVMKq3RC3H8nVwt7odgWvX0aumr9FpQj9G4NxbhWdQ6HC1mlr4Yw63mzXpmfgrFGzeM5mV53uP3jauizhiXkuslNq9MoYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714134070; c=relaxed/simple;
	bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KGqRuRj3H2jcPPMpMYUfAl7tqhFo47V2AWe9XKNwxFZAMq+q612KNmk+GTft3B8B7v/oYh227YaLdrDInvTrAGmRPFbJMhP0D2Dzf61X/2NDErFzqlRTIY5iyLQ4Q7FKwnw3Uxy05ibvO+gHP75X869ZOIGEBha5D3rb2M3QGKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8S/WoV4; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8S/WoV4"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5c66b093b86so2383253a12.0
        for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714134068; x=1714738868; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
        b=U8S/WoV44yG8sGGhduGgX6JvLt/RBWDXKbp7SqcrGg3LRd5+fKZYtCnR9YPKbGAJvY
         fwpzISEAHykFFT8+TI2mNO6Aapg+n6oRhfmAc+Ez0Qxj5Z6o8lkRVv5cqgVJJztwrdv1
         k7fLOTNI4IQTWgNk+iSrXvofxlcSJTJDGPDq00mMMQkdMUB/s4owJXN6CN3PC3LSC2Vm
         OITa/7nvHLxddfwijfLOGKxf+XFjdpGz6zJPDEecN0Oo/Iybw/tRL1UMlwzYkiDHDTWX
         CzPahwlHhRCQKExTOqSpU5Y6hq+iSnYaqpjAsS8AekpvD77XJsF8Hn+aysRHeD0VwU6G
         tiDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134068; x=1714738868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
        b=kFtfvUOipPaV5RtEkQjY/s+PJDKQs/1hpsvpd4+b3UHNzMzBVaM1T400zuKkw4NVeM
         TlLE0Vdt17gkAAsTgTFE6PByV3hsu89mEgkHWwLhj83zgPsazS2SK+IFDV+s4k3jc6GO
         8CGf+ChNhrIwkPg8r11uWPpuDOzOCik0B/ulWXTSqRNxfsJm4d0WWZD+d1FVPbrGOy1D
         VisY01hzayc8kCvIxoFU8AyJ1eZ94AECLJMa3dvg4ddIZKyGgcHOHzlBp3DFqwf4FUvP
         of+Vgu8yzINWNnzXDo3068m/9OfUNwOpu67L1H03x7Bd1aM8Upww6E1TUUEbfFKngbkd
         3wGw==
X-Forwarded-Encrypted: i=1; AJvYcCXiYXFblwo3cGEtvxfQNFCwCw6Gjy2gvpvGnU+Q8NHEITTNOHsUH7RokJr7UbateTCdpcntGr0/1NHj1a939aBIUq9igg==
X-Gm-Message-State: AOJu0Yzfjch3VPZhxBUnE9+0G8TcuDuhRnGHM83kCG3rVi8vcTug+ex2
	+67FY3tJSd2SNAwLz8Y8NsCukGdAbcNp6AMzqeYAkm4ERP4+RVmU6etO6yNe32506h+kmBWzEAn
	2/kD5yM1SjCWEBXl2KiRtlHEEAgV8y7k/eds=
X-Google-Smtp-Source: AGHT+IHQ0i2Z+JiSphGpy0VElFmysG0D6y1RO6zJ2spHmtLaNeadT9T7sGBsWfuOBTgfYf9daaHlhTS+KLOAtOcApTc=
X-Received: by 2002:a17:90b:28cb:b0:2a5:575:c58d with SMTP id
 qj11-20020a17090b28cb00b002a50575c58dmr8343368pjb.16.1714134068133; Fri, 26
 Apr 2024 05:21:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
In-Reply-To: <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 14:20:02 +0200
Message-ID: <CANiq72=b=G3GPVWQ2XV1MT-wdT0KL4jZVQfD55Mcz_st-G7r=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 12:35=E2=80=AFPM Yanteng Si <siyanteng@loongson.cn>=
 wrote:
>
> I'm thinking that I'm two commits ahead of the doc tree, it doesn't seem
> to fit
>
> merge into the doc tree in this window, and there might be conflicts on
>
> linux-next if I splite the patch out more.

Hmm... I am not sure I follow -- conflicts with what? These patches
only change the translations and they all get applied by the doc tree,
right?

Cheers,
Miguel
