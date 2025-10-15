Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD331A569
	for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760523640; cv=none; b=bF3ntzvkfnzl5uDN0kfGpABlywCTMWx4snLctagq17/lGT66cARifKsmLHVHWiWE1e1XZ0UxFdUssXT6gFMa4jvvBBx/3BAuzJ87BhqcAQmmm/bTspD1QFzgB0X2VSjKu4frwSuxslD7yjwy4hCUNZPYZs94SAFZIfSvNPGDiL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760523640; c=relaxed/simple;
	bh=syYNPVw3n/GpSLvcv0QAJA46VNrVDvZJVpL7ER+csm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rc+4YOQ3tp27ucrZBQN9NmUf8dRNQ1FYQf7WTew0j4FkG3Fg/fQvdRLEmBL/W9yZY1VklUJc8gahO6zcPX/vlvxWHlMN+gctH6CW/aoOnhXEu02Oa6hgplFKy6u0oIZgLSOexOyMt71/ImnEOCm1zdwdjb7jmXkXkGTSzUzdUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K14n3IBi; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K14n3IBi"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-27eca7297a7so10453005ad.1
        for <llvm@lists.linux.dev>; Wed, 15 Oct 2025 03:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760523638; x=1761128438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syYNPVw3n/GpSLvcv0QAJA46VNrVDvZJVpL7ER+csm0=;
        b=K14n3IBiVkJyQorqb0VbmDVAaNjvOeMfxls0soGQMUwlVgDtTeFS6CWY+g2YMwwl4l
         O0vCySgs04owaOcIYHv5pCfLoEYzWjMJkqGn59OcUwbpeC8j7dYrscYZmk2TnPGB0C1G
         V+5t7i7UJL+g+ahGvXPgGzrLK+K7COPDZBjzeB9B/g+oGRM4c0lSeLBHQXKNpxu3pcYe
         SGPIzFO9NcKJm6eW+DIan6u2mOqGNE5FyeyVAS7qrbtwfqkwJ3JapgRQX6Dw1MRTaox7
         56sZiVFmmBbn7dPHBQUeo6qlcqYG5NHPCjcAL2GR7YDN9IgAoTjVkVIErzA/KFSsxlYV
         p1uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760523638; x=1761128438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=syYNPVw3n/GpSLvcv0QAJA46VNrVDvZJVpL7ER+csm0=;
        b=DHBMOx1A+7Pvg8MUztBlBGh++Yzv+9D4P8JRcpkmRna5awZyeGqXmxL6ouz2sKuwkz
         lyMW1bLjBK9BzQMP9n7RHRRObsCq8gZ9k8H/+QbOpBfCEATLP7JGZZCwmAKUZ6E0IbfN
         hGnF2WLbQ98TAtUc67l9U5cWiZmXzHOOFn1PxTy5HHMAyCnhAHdS8+ZAFiDNPlxicabq
         BZeEDS6qiE6VAIcYUqc0JC2SCPgvZOkkR1yMRyaPhOSacdOWjVxidPRLCcGH9Xo75/Fr
         1oGUM6LmNdcB6uXf0xFQ76H+gQ2mA02yqW15JvQUUeFqLLbaS4k7mRA52nRmCKYNZm/i
         QQNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqLpO7zZIVGGp4hB467zN65p7oA/sIrEQJILHDvF/QGDeA5qVZMbpOyjjthdusJ3WsSM8q@lists.linux.dev
X-Gm-Message-State: AOJu0YyJbZi/EsCGoZfCZtVdV0h9av90Nlo6g8dSwlJbTVTNWYkxaMLf
	kEVOF2SQRiboXfV8vh73iziATWUvekt9168X/8E38jVfLk/uhYfBblHQcHwuoq+Ag1aoEZ9464P
	xhpswk+kF3Vu854ZWTPtGaJ9SA5rkb3c=
X-Gm-Gg: ASbGncvgQ0iVH5XReALwXJSB26IKr4ity7a1GqE/QNWm/sukqp5gxIi/UOGJyv/CnLY
	ZFxom+jJUimgQHwrlf1hL6lb9haMVORrk46LBv1jYcPSF9jrYWdKG5P5qCxJ2RkeydufGc7c+xh
	wmB18c3TsiqJkSgeosQJFIgk50t83eAwzkCtez9WCbJnfPpLVk8yQUckdY40j5WRRuFQrd7W95d
	RrKw9Je79Q5+w+0ZuVrvR6ILVkB8QU1kNqwF3PZ/SVzHiHM+q2BzyBbd2RermL9jqO+9affEKMv
	tFE6+jKBF6z1k2et8AHD6I9beLZfBt/1C5TQ1QKzTPmBhKr0+VFJKuin2igkGRwzBtAF79trTs+
	JmYfVQEBLC5QmXQ==
X-Google-Smtp-Source: AGHT+IEuA+7KQXjMigiCtp80sJMmgdGJdPwk4cX3Jo5f+x0gzm6yiVWTi0fYh0LQRKdjtlu+kVhR87VUjMTsN2L8qLE=
X-Received: by 2002:a17:902:d2c6:b0:27e:eb9b:b80f with SMTP id
 d9443c01a7336-29027215f8bmr182642905ad.2.1760523637786; Wed, 15 Oct 2025
 03:20:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251015022037.14535-2-xry111@xry111.site>
In-Reply-To: <20251015022037.14535-2-xry111@xry111.site>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 15 Oct 2025 12:20:24 +0200
X-Gm-Features: AS18NWCGIGHAWk8P2w_fEJ0NHY0-lJvrQGuVtdn-YvHXyfUVHV1SbvXdcT-w3hE
Message-ID: <CANiq72mvZy+X2ko_sxVCn-2cnsR29boAzPDrYn=S-Tp0xSvvHw@mail.gmail.com>
Subject: Re: [PATCH] rust: Add -fno-isolate-erroneous-paths-dereference to bindgen_skip_c_flags
To: Xi Ruoyao <xry111@xry111.site>
Cc: Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	"open list:RUST" <rust-for-linux@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 4:21=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> It's used to work around an objtool issue since commit abb2a5572264
> ("LoongArch: Add cflag -fno-isolate-erroneous-paths-dereference"), but
> it's then passed to bindgen and cause an error because Clang does not
> have this option.
>
> Fixes: abb2a5572264 ("LoongArch: Add cflag -fno-isolate-erroneous-paths-d=
ereference")
> Signed-off-by: Xi Ruoyao <xry111@xry111.site>

Seems OK -- if you are taking it through LoongArch:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
