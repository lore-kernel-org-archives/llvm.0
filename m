Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E611E1509AB
	for <llvm@lists.linux.dev>; Sun, 16 Nov 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763303788; cv=none; b=sY8zI0jps3oOZtV6JHpw0Laich8RdiLBaCpvmqUixPf9DwqRB4slj1Ag+UwZuee+bMT1Zm3FuHbxtD/Wm4VHDjYq6S+0PX9hERem4msljnBvEeIiNj/+8ft+MUWgCpA9c2Px1nDlQDybTNCIBZbbL7KUfgdZcwmtyEt1lEoYhHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763303788; c=relaxed/simple;
	bh=4NScxB0D32Ozgb1cjp08xR9+0LYResDTWlsurLKMKwA=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nAxFmqIMGbaruz5IImPKbgtqtpnnfdh2iB2yWV6kvpa4xiE+TKCP11MAGcD++vXLJJm5qStRq30OHiQkI1QfkjRQ5ORqleVCYt7hHktaUUw/XkaEOeghIZSLKq08FsR7JMldk8i5iodrhfzoX0MD0/TP/iYDoAr89tnuQzfLgZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hF+GzdIA; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hF+GzdIA"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78802ac22abso33346697b3.3
        for <llvm@lists.linux.dev>; Sun, 16 Nov 2025 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763303786; x=1763908586; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+F1DJD0GZc6bvHB+TDiZj6OgrECMAIQWaZ2LQwvMyk=;
        b=hF+GzdIAB7BBjBUvtxcDjibeVm13qxCmVNdFZvt/0nm3ZAjbYYnRv0jeprLS3w63ME
         XgJqVc8xTJHQi6RbLjY9uE4aIAS0FWXe/EYUlPQ3ohMvoqQn30JKhrgmFWbkkgfTOwwc
         phDb4Q9KB85gu4b1GTCjTM7QJj/8Rp7jQLI9TifK50663au6TB+Wy7a4c210r8d95nd+
         rVycxG6J2wmVLUQK9EB+fNNNbuMHaJTxnSBdNL0dRQ3yFl4ZFhnuC1wREQXqXT2gXJ2q
         VtFYEW2XUVgiy32hSL37zNUK6DeMN9QoVLH37p1ayiUfjM0iyAoK4ADk+S/s5zcABqP2
         HQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763303786; x=1763908586;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+F1DJD0GZc6bvHB+TDiZj6OgrECMAIQWaZ2LQwvMyk=;
        b=bAlbLUkLjcCW/fFs1t2H79JPy9X367p0FVGNk64xzoPfXOe9qVbD7Itn0OpQEsqcv0
         3b8K9CcWtCsjw0B8XgdYhx/7Bdwld0+N2AQUcaNlXkeRKwWq00mXWoCk8UfRJjUIvZxS
         77ArU9JOqGGHVzb0OSdj/K+vhIW7ZGwPhvIttlnk06VzZHfgMDwKaGQpvPRDP9BSK2FC
         wTAwJ2ffzdp5hxo9vlTdru9okSFjr24UMmPYN1yMubX16n7rQ5N+nSSKwU+TX0JzoDo4
         d27Il0ZnfubRwOXRWfF9yCxwIWHo860qI6osIOMOZc7UEL15MTYLWQCI/cMSL7Eztc4B
         ulZg==
X-Forwarded-Encrypted: i=1; AJvYcCVkp7EeaNPmzxV5d7137t1WwA4XMWCTqAjvJkVKFO1WgYEeepwALHE5oWM8q1EhiLfROfMg@lists.linux.dev
X-Gm-Message-State: AOJu0YzXQJ+F0HdVqvrtTYApNL6hJW/zPCMfTFioq+KXiGBVa7WIogSG
	9gfjOH/fDm4VXNpdX59Y/BOVjRXcjUF3DAbFv4hob3sN1TfZNtz5yT+Z
X-Gm-Gg: ASbGncs41LUmDihxVjdUp+5lmttW3Hu6TyLwtEHLBGg/7HkkwEN+bUOhnvzbMM6+Oxa
	kUCKOw3DNXUi6zm3cleoGUwoFXE3bn0BvB1Dy2KClfzSU4jfGfAB2caQIKoLLZZImHtW2WhFlx7
	DExSlpl7GAsrkSRGvxtihEibFZyM31thGRFUJf74rmz5FCwPDM+D+Qbve7fLq2S4/bCnRlfTBcH
	j7G8xawr6sOieVx5dNmRSjddulV1frpDEO1SNOvi+G5lqIV/PaDb2/YxV3PIEhsgON4lPVfP3MY
	8sI5zko4KZdSzn5key6Y6QII0PT5j5loz4PXLofvNjWpw6Jxel7Hb0PSrxlIjE7dP3FCKK0zqN8
	YNaGMx7Le066g7qB8q+JKcensmsi858scQQl15ciEdbg6RUVm0o5arkw0gfk3xZ5BrlewPc8Bp8
	dAAzO80cXZVx8MPQpByWZBLFgMn3XF7+kgsfHtpVB2
X-Google-Smtp-Source: AGHT+IHNIw6QIiDFPjc4EkBNFnRmBFkcbvwCydSVQ0KYuZPWWteIOQJm4rOkV5skYl/t6OkSO5fGIw==
X-Received: by 2002:a05:690c:c019:b0:788:1086:8834 with SMTP id 00721157ae682-78929e0d1a3mr64629257b3.12.1763303785409;
        Sun, 16 Nov 2025 06:36:25 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de192asm33464657b3.8.2025.11.16.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:36:24 -0800 (PST)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>
Date: Sun, 16 Nov 2025 22:36:16 +0800
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
Content-Transfer-Encoding: 8bit

Hi everyone. Sorry I was inactive on this patch for a while. I'm getting 
back into this work.

On 9/19/25 1:20 PM, Vivian Wang wrote:
> I think instead of testing libclang version, it would make more sense to
> feature test if bindgen the binary supports these flags, like what we
> already do with $(cc-option,...).
>
> Same for all the other version tests.

Conor, since you've reviewed the v3 patch, do you think Vivian's 
suggestion is a better solution? If so, I can start trying to make a v4 
patch towards that path in the next few days.


On 9/19/25 1:20 PM, Vivian Wang wrote:
>> [...]
>>   
>> +config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
> TOOLCHAIN_ACCEPTS_ZICSR_ZIFENCEI?

The word "accepts" is not very clear to me, as this option may also be 
YES when the toolchain does not recognize Zicsr/Zifencei in 
-march. Zicsr/Zifencei are always enabled, this option actually detects 
if the same flags related to Zicsr/Zifencei (-march=_zicsr_zifencei or 
-misa-spec=2.2) can be recognized in multiple toolchains at the same 
time without causing any errors.

