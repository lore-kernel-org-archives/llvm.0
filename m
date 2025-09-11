Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175DC329F29
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 04:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757565973; cv=none; b=eE1KMFtyGangBUjH1C3zcAEk72mvsV2N9vvwEBOfXUdCutuBcXX6gBq4s0x8qAXloj7mfJVGw27TE0oofYJ2JSX/DwMOCc1oHxIwOjy4ClnX/S76YXG2UfSlybdZSHsh8iigMpS9skKRl17DD4HvgNqZOTD0cTApsJn6sGBi8rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757565973; c=relaxed/simple;
	bh=ZYQmQVPBF8zKRLNJ+D4bhiIq4DL1k5MFPT2Ve8g115I=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RfFpn6h0p3WAN0YmOj0J9tZ/jvbeU0n5LywjG8fB5mbulDXSlGRMtxA+Pt2jd+8VcLVD1Q0wdiytYG5r3yJKOX2BivMH+W2HGeOpZKH4piy2Nf7gVXLGdoWAEQaDxZA3uW6CDkapW4E0YeqWuf6UiEiFIZ3Hde4aa3xOf9DLbsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dplid+pU; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dplid+pU"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71d60528734so2519267b3.2
        for <llvm@lists.linux.dev>; Wed, 10 Sep 2025 21:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757565971; x=1758170771; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OFQORNmMyhF8NqnLlI7wxOYnlK/yXDebbJxZdkpHcc=;
        b=dplid+pU7wHwcM9aFtolaKZoQUSipK7wN+sef9YPL2X/Q4LVr2vC6WaNKgLaJa7qP2
         DN7nQRNuQYKTBIcwCaFK9TI3wNENt06czzxV6iSWkFoljZOKYt7viDS6u5yRb3nY8pS6
         GyM6zuqD7pwnMCWEoiQwLk3Djp0uJx9YbVjqu/Y2yzc0ulq6T3bFLJb2yHm5V4kF8Uyt
         6Kc141kvF2Cqdar512S5lmj+0BJhCnlhY8mLN+JoVtjicJKZv42TFi83YpuIBWhve6Yv
         ibyYa/yLUQduVUFzCOLLZ6xF6cX2ENZxhk/G2eJ32rjKvju4txKUOcX/c2TlBuwVCLUC
         EoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757565971; x=1758170771;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OFQORNmMyhF8NqnLlI7wxOYnlK/yXDebbJxZdkpHcc=;
        b=L3YHlmSZu4TTT+OLsxCE/tXDAX9MINuD37FsLs6HONN9N9zUCbahfo19biVuObgUMU
         rLEQicnKiH9p0q3nnVfUK4zrDdr1ZFi2i/ANkDjf8e7SNjN0jdJgBsrE3Jx1ghXVdBMC
         sgFvGboNZOOUgL9wCrJTbd8iTHM4eiGx/aCVygVnlbrb9iH2gpv1ccGLsz/y7zsmPPT3
         ak6+IS/gjb1uNN2WaO/UJgJ4DhoLUu4MUOeOSnykWqynV/IlV/EYZr16PRvHIvtRhxfk
         qoX3aui9GBarMqYrA0u8S6Z3LtdyGjDtUaEgcfcAL4vHZBXwTBcASagpoYCUH+FBfxvp
         Hb6g==
X-Forwarded-Encrypted: i=1; AJvYcCW1wTADGSLu1ci2YXgZwc58Yb7pEqFGblVzpRYmoi8hhJ6XBx1n65aRxZD67qkF1C8cn1Bx@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2lX1hGwiuYKbW1PWeWyw9tUuikL/dhUF2bNAQbtwJFBSit8ER
	KG/oYiFNRfO+LElH2Fod1m1EYL5qmIICiO0tW11cY9qO9r/Jh6qN+o/L
X-Gm-Gg: ASbGncuLBSKQnsmOnyv0Kd+hw/QS4qhZZAiqm7COgZN8yS9NBjrjuHrCNoB1bH4Ieq+
	lB4N7+OLz3V012TEQbQ3trCECU9gMDCgcyeH50YF4ooIDlNhQXefPhN2KCiIlsizqYM/zQkPtmO
	foKAZUf8YEq1w0depB/5Y/SK813hhyZNtS/AePxzKGAm4ld9UhEVmX1nB/YXX/dkVKTYa6gZViN
	Y10JJMiqm6bx8K1dkA1keUIw5AxplJNocTKwi2KXCP4cChygP3xYePR6P54FBnHF3It43fetyA5
	j5QPN2Y9PuduAkwf81Px4ge21b945OgTcAG336ibGF6TRtBvgNOMnjztaLC+nPYZ9JeCOgPxn6Q
	zKfGmQr9LoXJqDfHRXbSq3GEPk6BiROn/IwAkAqkgvxbGEaDGbVUtgDYp63duQYGXYcv/vRFM+Q
	==
X-Google-Smtp-Source: AGHT+IE09XmvpU67NiXH7rk2LbrDMhUi3e2OWnnlWTn7trnF2NMGewy0hktXoxQgahi3Y4iKLHRnRg==
X-Received: by 2002:a05:690c:6309:b0:722:7a7f:5358 with SMTP id 00721157ae682-727f28e7503mr153782967b3.4.1757565970388;
        Wed, 10 Sep 2025 21:46:10 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f76c28400sm1130767b3.30.2025.09.10.21.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 21:46:09 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>
Date: Thu, 11 Sep 2025 12:46:01 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
Content-Language: en-US
In-Reply-To: <20250910-harmless-bamboo-ebc94758fdad@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/25 10:27 PM, Conor Dooley wrote:
> FWIW, this --- breaks git, and anything after this line (including your
> signoff) is lost when the patch is applied.

I used b4 command to prepare and send the cover letter and patch for v2, 
not sure what happened.

I see that other people's patches have a [PATCH 0/n] email as a start 
that describes their patch series, this is called a cover-letter in b4 
and git-send-email right?

> The riscv patchwork CI stuff is really unhappy with this change:
> init/Kconfig:87: syntax error
> init/Kconfig:87: invalid statement
> init/Kconfig:88: invalid statement
> init/Kconfig:89:warning: ignoring unsupported character '`'
> init/Kconfig:89:warning: ignoring unsupported character '`'
> init/Kconfig:89:warning: ignoring unsupported character '.'
> init/Kconfig:89: unknown statement "This"
>
> Is this bogus, or can rustc-bindgen-libclang-version return nothing
> under some conditions where rust is not available?
> Should this have 2 default lines like some other options in the file?

This is because rustc-bindgen-libclang-version can't find the bindgen 
and returns nothing. Sorry I forgot to mention this, it's another reason 
why I wanted to separate the script, in a separate script we can easily 
fallback to return 0 when an error is encountered.

Adding a second line `default 0` doesn't work, I'll try to fix it. BTW, 
when I fix it, if the diff isn't too large, do I need to open a v3 
patch, or simply replying to the thread just fine?
