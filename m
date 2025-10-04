Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE8E1EA7DB
	for <llvm@lists.linux.dev>; Sat,  4 Oct 2025 03:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759549168; cv=none; b=A8zxdeWEQ6YwDdU9u+4qwSQHoUfSZCLSjwlocML4H78PWiYepb7DL33JD4wgAVs6JyPti35gPh5BwaHHt3w66FrrugeKJffdY353AoO5+fFOmffMuouVDrNYGjfgf+xTNSkjD/31v2kMmjo5Oium9SDniZqwR9SQwFB41IYQH2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759549168; c=relaxed/simple;
	bh=adLGxos5qmqRuJMEHd5iRNMuue96SjLLdXgZKG7WDNU=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GkzpgPzMv9TfqLM5ZTbvUakaG8Ag5+Uo2M9FTCIgjCTFBjV8Ou0hYmsjWoK8mbxZTugW5SenlECVAaCR74Xj2RnF90Ixs0Ib/V9yZ1lVEFg7xmsJEljSThQJxUtgl6jtsTzBL2z4aAUr6UbHhtzXuxoBcgpXodyl18uqkfPXaXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjsvcV1p; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjsvcV1p"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-63470a6f339so3016002d50.0
        for <llvm@lists.linux.dev>; Fri, 03 Oct 2025 20:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759549166; x=1760153966; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=TjsvcV1p1kZM/MjU0mdQ7xImRxHll+nkIak8be2sgSBDuRpF3Yl76kLFIviae1t9gs
         fCRG5GnxVJ2Ms169ha0tqBr0ywipPwckpEyOMXKuIc/I61/mmEPf+YyXZ6OJOnQ2Sr9g
         l4ZD6pZSUPGMKJ4L5YaQqQ6r71APFP/N/rdXpUPooQR2lZQaZBdijh8Dkiq/BCFypifw
         6CIxvyByzQNBbbbPy1hJBvVN//l9bvPxeWq8YzREWZsEc+T1jCiYsuD+o8Bx87F/AFqf
         SIft3L7ztB4atUdbtvPF17cLK7c7Yhi448MawtIW1hTd65t89JDA+a1TzkkxybjyXNcn
         Xmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759549166; x=1760153966;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ9GrKZlJAkRDs8pcuNoL9OYf934YYPQgeZ31YeNojQ=;
        b=c6EkFojsMJ13Fm0LC2J9B7YVeFiE6K4l0vh9ck2wwMhQZv7f1HxGr3VvcMXMneWRMg
         h+EmUyaw3LMH1UnG0zGSegEKO5jmdr1kLI9Ub1LLPudH/K2K3oRTy48ir1Kiof+RaB0r
         ABchmYX5XcUdYmv2LmifwIVbsoWHVDLP3PJLmJGdSBb5I1YE7C7C25ab+I6S7zLo61Zb
         xeWdqjWRUzJppFRPMT7mLGONQZwzBSBFIsX0oKahOH56Zuew2ty84BM846NlgvgVG182
         NustYg/xpKBNiA3525piIJLVJ/NWOop49VBNqhFTrNtYyLRBZ8qgc0eaLW2n2uplAjMf
         cMUg==
X-Forwarded-Encrypted: i=1; AJvYcCVaozRpq9t1EB85jG/wsWovJFNyFubHxh+tZl2uFKcUzRyiXBFVBhyw2wHhQ5Uy91Sll+SG@lists.linux.dev
X-Gm-Message-State: AOJu0YzzYuyP58oA7eB8x3gLdS35qgWp9+JN2bmCg6Ki+v3KqdB2MAUy
	8mqmUTOD5SzuSW9O66fLC+f463CKOfAzYnys/f6XOLpFUTGdaTYQ0Acq
X-Gm-Gg: ASbGncvt/PuGz6OrNUT6++Eq8LsN7gulYelwMXsPttCGQmzQAGiKd8xwRcBNNkkiT+1
	sPU+M7L0NHV423aIEYz/P8ESgVtiZsDQPF4HfaqC1rF8yANPmifZLQ2+OHY+PPTwjP8bT2hM05P
	CEhbrrgmBe0d6zP5RrmluTZ+09vKze6n+BoncMvYAA4vILR6kBKyJRY/IOpbNvFDzC0fhbB7JoA
	cIsvjZ70s3gEVnbEy32z39G+p27ZRPlfHzUJDCxvlgE/7OMMPnugTOmJlMOzTnEvhGviUuT6A/Y
	cu9mMKEV3UIgox/82RroonJxt03YwkHayBgxc0dDuw65tSJrBZiPrlP1DHdwfSe+thipaZSeSA4
	3R4w7t0GUm9TuKXXXCge29S8lf8sJY/lhDpBy/fpSNLyD0u8AXZ+UEASgvLoCl+ruw/7H00Txh3
	9M
X-Google-Smtp-Source: AGHT+IEKZvWN4IhopDHTsskInMYzN0OVIkAxgqusRW8r17U6C+PiDNXpSR1wTVqdnpL2FZWd78muIg==
X-Received: by 2002:a05:690c:4c0e:b0:749:d874:e66e with SMTP id 00721157ae682-77f945ef5c3mr72382767b3.24.1759549165127;
        Fri, 03 Oct 2025 20:39:25 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-63b846c9bcdsm2324131d50.31.2025.10.03.20.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Oct 2025 20:39:24 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <b5efc638-ab7c-4639-ae7c-c0f8f8b4e765@gmail.com>
Date: Sat, 4 Oct 2025 11:39:17 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/25 1:20 PM, Vivian Wang wrote:
> I think instead of testing libclang version, it would make more sense to
> feature test if bindgen the binary supports these flags, like what we
> already do with $(cc-option,...).
>
> Same for all the other version tests.

This is another direction worth trying, but unfortunately I probably 
won't have time to refactor this patch towards that direction until the 
end of the month. Sorry for that.
