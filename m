Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AE9278153
	for <llvm@lists.linux.dev>; Thu,  5 Jun 2025 17:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146274; cv=none; b=nJIiGc5nrTv0Ar8jHas6HxGY8TmPwB95anfdJi9GzHn9xQ8KFlc85X1TbuYiKkS9Pud2x80QIJPGgiNuA5Dg7/aXL2MfvwH03p60UckCEmOp/ExqHTErkPMI2HWb/YGyc3b5VdsTKQoMPfRAh0MuqlvE1nsHNFdwnMM6jJpZd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146274; c=relaxed/simple;
	bh=rvD48nSdgnQrRF8apaLY0OWIycvkx9NLB/OwctTjzes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0cL6xE9RtAYGvqvvQrR5uoPrZPsBZ7n5DZ9bl4RMv/FW+8ScZy3dQZd2McWbpl8QFj05nbq6MEaVbAPVySY4i5bLBwGJiBqkw+IrKfoAgQTyYj7LUASJQ4PLUrlEcrcLsgBhdVYnr49D9HuHe1IqOZbYxgIP8jnJM4v6TZfaVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVCc4xAW; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVCc4xAW"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad8a8da2376so207772466b.3
        for <llvm@lists.linux.dev>; Thu, 05 Jun 2025 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749146271; x=1749751071; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0vDdUwwKQJNe/fkcnVHvcRpEhmg0nlamAkVjZwwBZ4A=;
        b=SVCc4xAWsCRFho3gdvNmGBNsyLpf5eestJM1I6izwCTEJ9x0Tm4k1NL82f18suIWoU
         5XXAWAVhzSWTciTI2BNyXU30gSQDYDlL1E7cvnsIlcn3UAW1EK0RUpaJxd3y0vMRaTqf
         kvZwRq4l7/+IisuJdfhp0ZNPn0Zw/ITC+en4BXc1TuItN93/jH1ABUXLf93b2hIX9Mwt
         psV3DwjfU1uYQhWD984iZGjNyDu8zPUW0TrGWkTG1uqoQAlY3yuhX3IioQTK1xd28WTA
         yG1uoC0Lz6I3ZpA0xS0RlGlXFTQXgEANmcxnVDv51umMg3XxQH65bHMaTUmkxvDXGjij
         2RWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146271; x=1749751071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vDdUwwKQJNe/fkcnVHvcRpEhmg0nlamAkVjZwwBZ4A=;
        b=RbR9cXfLoZclpdy+LzyditsBefdt0ZF9IW4g5eQYLZgeeQIw1RvNFRCBKVEqX3fBlt
         6Sfj6QxPj7p1ZHrXv7Y/4joaCguC5NYhfjMJeUE+A8hd/xZIzCFDXTY2z2yuz6u8cs8Y
         ekQDID3qlJHxNPAwPXNJmxZX7KB5PGyQA3XJdbm9WmLo6ZKOwNg45kDwfX1OOEDIvRgg
         hlx8XeuUjSp0NrYSKyPbH/xSJRNRYtQRugOYQL8jH/bcLuEdZkBblIj9W6ISFswylfRa
         ZPWMpVg3PwY3NDScVh66K3fZdZ1DC7sXazaN852Lf0eOH8SKS/XFDsTf3COvLSnoAdXx
         L74g==
X-Forwarded-Encrypted: i=1; AJvYcCUFG3+cgmTn9yQgwoLOlpiMyrmjpCGyHHbjTVvT2Yt2Zq5eSXWR/OtJ441XYz1JxBWnuTrz@lists.linux.dev
X-Gm-Message-State: AOJu0YyD3Qa8OX6IYVJZddd6GZRO0oXhxoFG3e17ygVNrhV5xtxN4SAV
	Xdh4NcliMkHxZ5I37VJ/UJwo2uOImnG052chBopdCSd0sWp5/WQ4wlfa
X-Gm-Gg: ASbGnctEXdWgWOd+dKknCJePsoWASLEU5OMtlpbO9SCu2lk0QucyfQEo5OPr603/ZB2
	/MdRvOI00mkANBQOc03ef5HLHHMyES5iJ5lEO5AW5Ahi0wwPSgN0RP8D0OsXtmod7XfBrzmAAqW
	cmyGECnQxJFkxu98D/7Nm1+2VIQYfI0XTtYGKc+PxZUyR7/zuCx80YrcgSM7jIW69CPqZVJzjCG
	U+HXJS3mLiotoLPBmRReDLdpM/kgsXsksNgo7QfyKaYg1tDazl3LlakEaHntjiD1SMNDT0xyy/r
	Pl1GQwX2kPOvC9+aSmXHwUOCDqcKNUKsiIn+U3L3i5EFBIT6tVft3KP57JGn
X-Google-Smtp-Source: AGHT+IG54aLW+rl06pwJxjOcQ8r1a2fqNltqry+pbYsiFNt2bOWt1+fRbHMPH2wnbkY+c3e8hyAwPg==
X-Received: by 2002:a17:907:1c8e:b0:ad8:9466:3354 with SMTP id a640c23a62f3a-ade1a9e9335mr15216766b.54.1749146270897;
        Thu, 05 Jun 2025 10:57:50 -0700 (PDT)
Received: from [10.5.1.144] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6abc2sm1294282566b.173.2025.06.05.10.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:57:50 -0700 (PDT)
Message-ID: <63f92378-dde9-4bee-b2ae-b994052e8fd0@gmail.com>
Date: Thu, 5 Jun 2025 19:57:49 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Sky <sky@sky9.dev>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, Ralf Jung <post@ralfj.de>
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <1553eea9-9ced-410a-b6e7-886e11e2edba@gmail.com>
 <DAES0YHHTRQS.3EGLTCPLP3SK3@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAES0YHHTRQS.3EGLTCPLP3SK3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.06.25 7:30 PM, Benno Lossin wrote:
> On Thu Jun 5, 2025 at 7:03 PM CEST, Christian Schrefl wrote:
>> On 11.05.25 8:21 PM, Christian Schrefl wrote:
>>> +/// This type provides a way to opt-out of typical aliasing rules;
>>> +/// specifically, `&mut UnsafePinned<T>` is not guaranteed to be a unique pointer.
>>> +///
>>> +/// However, even if you define your type like `pub struct Wrapper(UnsafePinned<...>)`, it is still
>>> +/// very risky to have an `&mut Wrapper` that aliases anything else. Many functions that work
>>> +/// generically on `&mut T` assume that the memory that stores `T` is uniquely owned (such as
>>> +/// `mem::swap`). In other words, while having aliasing with `&mut Wrapper` is not immediate
>>> +/// Undefined Behavior, it is still unsound to expose such a mutable reference to code you do not
>>> +/// control! Techniques such as pinning via [`Pin`](core::pin::Pin) are needed to ensure soundness.
>>> +///
>>> +/// Similar to [`UnsafeCell`], [`UnsafePinned`] will not usually show up in
>>> +/// the public API of a library. It is an internal implementation detail of libraries that need to
>>> +/// support aliasing mutable references.
>>> +///
>>> +/// Further note that this does *not* lift the requirement that shared references must be read-only!
>>> +/// Use [`UnsafeCell`] for that.
>>
>> The upstream rust PR [0] that changes this was just merged. So now `UnsafePinned` includes
>> `UnsafeCell` semantics. It's probably best to also change this in the kernel docs.
>> Though it's still the case that removing the guarantee is simpler than adding it back later,
>> so let me know what you all think.
> 
> Depends on how "stable" this decision is. I haven't followed the
> discussion, but given that this once changed to the "non-backwards"
> compatible case it feels permanent.

It seems pretty permanent, from what I understand its hard to
define the exact semantics `UnsafePinned` without `UnsafeCell`
in a way that is sound and because of some interactions with
`Pin::deref` it would have some backwards compatibility issues.
See this comment by Ralf on github [1].

[1]: https://github.com/rust-lang/rust/pull/137043#discussion_r1973978597

> 
> How close is it to stabilization?
> 
> If it's close-ish, then I'd suggest we change this to reflect the new
> semantics. If not, then we should leave it as-is.

It's pretty new, I'm not sure how long it's going to stay in nightly,
but it's probably going to be quite some time.

I wouldn't change it if it would already be in the kernel, but I think
its probably good to add the current state of the feature. This
would also reduce the difference between docs and implementation.

Cheers
Christian

