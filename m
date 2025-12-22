Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6244421D590
	for <llvm@lists.linux.dev>; Mon, 22 Dec 2025 00:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766361636; cv=none; b=loWOXzlGD9WjB+iqP/bQkaCCOZniOlxjiJVloB7EbPt73taufqOL/06kw4bz23k1WhSxrlb9V6tBHI87zuos6x7tvLoxkbCcMsxW2KuZzPLGet5XIGVvb3xdUVoFBQBISNiYjCoJe6Nl5Cf/M/+og1j+WErLcA3vG4uYB6y/nNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766361636; c=relaxed/simple;
	bh=U/EAyuONJ8CIVnN7Iyst3zvFlXpCRkIF1q3en+mKzaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m7gN58rSLsOQqhOG4sX3AKTK9wwi+o6FXgQekK/5klSGbM8tA5i1fZnQ+yGprDuVuoJIyfHwLDHMaEKQJ7HPTxPnM1FIitLoHOffZ+UpUefnPUpgpS7vGQ5g2w1+f0JIyDZankTL1TH/Hym0MoL/uHoPWW44c3hRlQTzqJwGQH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbtR2VBJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbtR2VBJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bde0f62464cso3340676a12.2
        for <llvm@lists.linux.dev>; Sun, 21 Dec 2025 16:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766361632; x=1766966432; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=;
        b=nbtR2VBJvDL7WHvksLR81w3nfvtCu8Zve4tKVXcNIeEhY0YIn/OnAXRU0E8uGJo272
         JHrotP5k4kzAoGT1vIz/oquEEPak8eSIwXkBYhGvQnkY9kiBBowtIASPY+RImatiKtMW
         UFkd+xRCEPKGRHb5HSnsn7u8mE5oIhXZLFyPgzc+YWczfuXSflUiO+/lPlZuiX8nFr0D
         ftwYT99nr5gTb2f14uQ+WBxWVdIaAIjhKvUQV16Zvw7a/6fICYOGSTOwXirthXqaGAhd
         QqNkMxphKegvfAl3rVtY9qPI6nCZW7OJDKS/O32eNF+S22LMRWxv/riAwDmEjCtfUAcv
         rEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766361632; x=1766966432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MM7RV4MA6+k2V8r5oWFH+eAF8D28f9bxG2QTbSEjJLk=;
        b=LRIq8FRtfGaTv6edHq0ETcI7j2y+DogUfL+NgJ9vBgzpCji6fUs1f+p0otWbY3CPC4
         gf9HFwxR/sxATOK47AK/+um0g/uxE4EQMcRr/nFBGhOfjkimJCkJNVBukO3CxR6nPIjI
         980Nc9pPJ2rzD7iVcUwCIcn0xrcDXdGS60BndeuFXUrD5R5GYLEyFhTNWzHXvTmnNMfu
         qCCWarUlQ04I7/M2uvlkkFbwMg7QJu0DzMR5toUr84MNKfK1cM63kvON4lSLleMR9rHK
         BxQd1cY0iZJkBMO/xKqXgntdnvnlv5oMBKeLgI7oyilCfEiyaiHdGJWqgh0w3pgvSNZl
         oObg==
X-Forwarded-Encrypted: i=1; AJvYcCVwldMLOvmcA6CQ7k5RYX1E82uVn69NxROK6IBRcuQrjuty+fZ7rmpCc2XKRgpuk92VfGdi@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9y3nHHxmMNLnFrxkm1YHi/acjYDLsgj4ZO6wToydBP0xx5DXs
	lhZiyiRqhvW2RZ4DztfBEjK4AQMMxf5DRroFxcWCkYKRqtRsosm2bVZW
X-Gm-Gg: AY/fxX5j1A2u9zoEyD0rEU3cfB+O0n2KcAzB8/qYFb1/j6ZBnWIDXxDap9Ihq12FstT
	9vlvVxg3A4NwJt9Wi9pT/Xs34KckCHtfdn8Lzhx2DIW39afjqlFwj65I4WK4KnkfaoTi5lq4x3z
	/txmNaz5EoDvs3/i12Pc3acNuAr3oSc7fQH4i1oPVcUQdTpVuRkzojX0G+2d4tS6Sk+8/nOGX+b
	WgWXlMDe/xUDTwr4y6M543p+rEuqum+F8i7PAwrzpoddJSYd4edJpy9nNSGqhxQRKt1c1CcGSlP
	Y6eAInHA3Bz/d+EViN4uilf0M3i632vgjW8pw2QT48+C7S80KVwhHpg0AyM2H0BIEeO+CwH2ThP
	+v9siu5gEtnWcqADNsRZDJ9HG8QcAxHtw/lkDdfOC68vrqIhMCIbYOClOhmWX1p6ysRb9PFllf7
	bpukqCGBgP/ACBBvQpjT3EuvoDMC7Vz4sf6ZNAeBL1mt/twejjYJFUqJOix++4sA3qzA==
X-Google-Smtp-Source: AGHT+IHWxQn5FbGuPZ3qckSgTAqf30C61kqhNqlZJurZtR2onEq7xRmHaWycfSAgCm0Rr0YlSZPrjQ==
X-Received: by 2002:a05:7300:ac90:b0:2b0:310c:529 with SMTP id 5a478bee46e88-2b05ec050d0mr9843513eec.14.1766361632052;
        Sun, 21 Dec 2025 16:00:32 -0800 (PST)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm25703154eec.2.2025.12.21.16.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Dec 2025 16:00:31 -0800 (PST)
Message-ID: <aa453636-dcbc-4ac1-8733-d9d992de82ce@gmail.com>
Date: Sun, 21 Dec 2025 16:00:30 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ARMv7 Linux + Rust doesn't boot when compiling with only LLVM=1
To: Christian Schrefl <chrisi.schrefl@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 llvm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
References: <1286af8e-f908-45db-af7c-d9c5d592abfd@gmail.com>
 <0705db10-3cbb-4958-a116-112457f9af6c@gmail.com>
 <1910f4b6-db74-4c86-9010-28ab4462c5a7@gmail.com>
 <20251219211147.GA1407372@ax162>
 <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <0169d4f7-1a31-4ec6-a456-a6dfe2d99886@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,


So it seems that the boot.img size was getting too large for lk2nd (the 
bootloader) to handle and was giving these errors as described. Seems 
like lk2nd can't handle ~21 MB boot.img.


After removing networking from the Linux kernel (as it was the simplest 
way to massively reduce the Linux kernel size) as well as building the 
rust modules into the kernel itself, it seems to boot fine now:

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 6.18.0 (root@9e6cbc09906e) (Alpine clang 
version 20.1.8, LLD 20.1.8) #4 SMP PREEMPT Sun Dec 21 23:44:57 UTC 2025
[    0.000000] CPU: ARMv7 Processor [511f04d4] revision 4 (ARMv7), 
cr=10c5787d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, PIPT instruction 
cache
[    0.000000] OF: fdt: Machine model: Samsung Galaxy Express SGH-I437

[ ... ]


[    1.487035] rust_minimal: Rust minimal sample (init)
[    1.487297] rust_minimal: Am I built-in? true
[    1.492632] rust_print: Rust printing macros sample (init)
[    1.496873] rust_print: Emergency message (level 0) without args
[    1.502244] rust_print: Alert message (level 1) without args
[    1.508439] rust_print: Critical message (level 2) without args
[    1.514025] rust_print: Error message (level 3) without args
[    1.519702] rust_print: Warning message (level 4) without args
[    1.525592] rust_print: Notice message (level 5) without args
[    1.531239] rust_print: Info message (level 6) without args
[    1.537037] rust_print: A line that is continued without args
[    1.542440] rust_print: Emergency message (level 0) with args
[    1.548348] rust_print: Alert message (level 1) with args
[    1.554069] rust_print: Critical message (level 2) with args
[    1.559470] rust_print: Error message (level 3) with args
[    1.565177] rust_print: Warning message (level 4) with args
[    1.570458] rust_print: Notice message (level 5) with args
[    1.575829] rust_print: Info message (level 6) with args
[    1.581444] rust_print: A line that is continued with args
[    1.586893] rust_print: 1
[    1.586925] rust_print: "hello, world"
[    1.592188] rust_print: [../samples/rust/rust_print_main.rs:35:5] c = 
"hello, world"
[    1.598511] rust_print: Arc<dyn Display> says 42
[    1.598542] rust_print: Arc<dyn Display> says hello, world
[    1.606445] rust_print: "hello, world"


[ ... ]

Welcome to postmarketOS
Kernel 6.18.0 on an armv7l (/dev/ttyMSM0)
samsung-expressatt login: user
Password:
login: can't set groups: Function not implemented


Sorry for wasting everyone's time. I appreciate the helpful responses :)


Thanks,

Rudraksha

