Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5FAC213E9C
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949945; cv=none; b=nZ1aHqc5TV7c3Qu8MYHVdTdrfOw/HZgB6Z2dBF1CR1xUFhr0qjVMrfrdrtHUdtR1i3RFKuO4e/wxMvSn9modzrGn71oa4r0pKzrP1iIAABm+xTsRzbkJLjKcomqVDAQUKQJiE5t93F3nMhtyyG1mmXTkuDViL1gv7G3K4Iexvn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949945; c=relaxed/simple;
	bh=byQsvqzs3+jJXLfXlRtgFq7/4U+Fvw8GjOACkOXEkLo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hSMoMZSwQCwaNudM9HxBQYahMz5Tjy+P8Xhrlx0b8snKqKvrwyV9feRnK+85wcTjIoMcd3XJjp9SXws/rGaC21y+Xd5chxU/S3u+pO9A7ulyJX6VMYFB7qhj07B/7GkNXdchZIN5ySrCfwAA+VFlm6Lrp6AEmGpeyGy3zG56VvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kv4sdbBo; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kv4sdbBo"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso3510944a12.3
        for <llvm@lists.linux.dev>; Sun, 23 Nov 2025 18:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763949943; x=1764554743; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3iOSMJ9zcmFH6xEZljPRpWDFCLxx5tCFMpn0x0652k=;
        b=kv4sdbBokmm2a92NiUSmFwr4ZkabLsm3hOUllQtT6DUg1qJCSO8d0iZSwY3s+EGJC0
         PWAEsKi9VS2dTn+kWtzNP2v+RLkI5paOim+J9Thc+fcGMyZRJLp08ZOzbDmS84k5paPT
         piPJrGAbFchgvefrlp1F6Zh5Bb6pQfGDFsFcfFD04bZy3m/cHiMPtxt+rl/sDikZ0BDF
         16TFZO1H0eSB7J7BTxVXSqtPw+lebiwMol7XCPSZW77bjHH2P+H6nNjkU6a9hJ3S3nIm
         qRQaPIajmc/ozwv/J5n8jNJzmZzrik8gRDxKvuE3N6vgFSiOpwDDWhjEKQBgaPV1HAd6
         wAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763949943; x=1764554743;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3iOSMJ9zcmFH6xEZljPRpWDFCLxx5tCFMpn0x0652k=;
        b=YxdSS3ZP16qEbFUrlhlFX7b2VP+z71p72YcvD4QdDwXylxO7ZBZaGTGWgf4WT25Rfs
         D/SkJns4mgowf/AXh5+46DbVOHJzoknInsrdB+KDgQR3y0mjCGhksv+nHgT0X3h4K8aK
         7pSp54GnVKMPXbef1yE2lOQiHTBrNz3D6l5jP7I6gtvDiPKImHSNnO6f01SQNRiG8qLe
         +S+21nLuw2md7WnSsg8l5APM1x7EsckMqX7SgUxwptw4u12LzJLHj8qpCmDE13sHoL8/
         DP0iOJ4Nqx6esz7rDUOtmP32FEQ/G28ePOnB5o9rA5QzOEdxaiGmfv2GmmymoD9jwd2L
         hVvw==
X-Forwarded-Encrypted: i=1; AJvYcCVuqcrnNH1SzkXUl9IpvooFDvf8nnTJnJ8nf3N8K57My/fp3GxbjB0hNMCdmc0Hi3T+qacC@lists.linux.dev
X-Gm-Message-State: AOJu0YzW3ts/XQ4WAbPy8g4L8JeiS9CV4zEMZZWRCTayOf/wFQiTDVtP
	QcYeWHN77KE8Ocl3nEQzTjLRZOodOKuXgcG8MUgAR04eCC44ZIF8EAvJ
X-Gm-Gg: ASbGncvbm9DO9ZqoVC2GdhThLMjC+nlUjxWRMDcK1ydJ6rNCmqmHXs1Ssp50zB57cJe
	vk78DlSLAtO9AJwm1rbWKlZsGYOoq5DQh+K61YWWNHE231hz7PIrUvsMN4un0YVFGTPNqFuUqrg
	uchOUDaRByCt+P4QEAKuieJgiyO23gbnjq/UI+ZzEzewFLFU5aeuEi1qk6xWLjv/19jdf4awe15
	blh6j8rJAm6I2SGH/ovRCM2cSZyEPoUGa5avGQEzMMcaabnRdXyYVsE6HZmXgoMFN3/ZEqFXtwy
	E8lPV8iR7yid7SRWGVKTczChmVQK3h+5SGt14cS+0k8keeDv2uMC20OmhDBnAddsoovjNwGCn+Y
	b2xmYLEDh1M1yuDWQs5rJ6ttwU0VdJS8JAJ7xDsb9xXJ0xFrzlLF/oUUeBrYQ4+Ca7FMCZNZKqI
	pJET8qchLh6735eeqwtbOb4A==
X-Google-Smtp-Source: AGHT+IFKY3YdfCmC7U4vR5iWTGdpuOG0/GJ3f4HCetsCRvAfTLhehlcgrAWCqygjrtjCVf7VO3tB4Q==
X-Received: by 2002:a05:7301:e22:b0:2a4:3594:d534 with SMTP id 5a478bee46e88-2a7195369f7mr6681434eec.1.1763949942657;
        Sun, 23 Nov 2025 18:05:42 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm67099107eec.2.2025.11.23.18.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:05:42 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
Date: Mon, 24 Nov 2025 10:05:32 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
 <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 9:21 AM, Miguel Ojeda wrote:
>> Add `rust-bindgen-option` conditions for the availability of libclang to
>> the RISC-V extension Kconfig symbols that depend on the `cc-option`
>> function.
> This is now in a different commit, right?
Sorry, I may not have made it clear. I mean all these changes.

+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=...)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=...)


> (By the way, I wouldn't mind if we started adding `MAINTAINERS`
> entries on who is maintaining particular architectures for Rust,
> especially if there is someone in particular involved with it etc.).
I had some contributions in rust-lang/rust repo for riscv64 (PR #131955, 
FWIW), and I'd like to be added as a Rust + RISC-V Linux maintainer if 
that's okay for you guys.

For the suggestions about commit messages, I will improve them in the 
next revision.

Thanks for your reviews!
