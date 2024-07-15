Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0861CF92
	for <llvm@lists.linux.dev>; Mon, 15 Jul 2024 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721060133; cv=none; b=Gt4GXYYu0iBtSSts+pL0WHxXxl5rKpoYp6YR17JYqlsXRYRwfQPgCa084AW6+PDuuZo3iWqS3VKN8Lwuf7ck4bM2Bj/dxLIb5HeaS5EV6FHRpbP0NzLVbQg76hoXWCrcLKzw8v//2kpoW88mxdDDyuLepCtv3mNC2Q1ya+PLggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721060133; c=relaxed/simple;
	bh=MNcH4FQYV6xUFbte1qhFhl/P8o5Nh+WNSfGIeuyORq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GcRTacGeisgeQPuL+x1Ifuz2KNXDu4Y9q+O582zicqQC+fSeKUYS24EKgDPK1R1e2+DNTVDV9lohwPTqUK2LEWlX0UwB2t1GE4byBv5MX9wID2zXcHgOhO8UujsLSKAlreUA0Ku+nEAEiZ4zQ0Mo6vnzFzZunCS152LjBAxc4Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwR+oHcg; arc=none smtp.client-ip=209.85.219.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwR+oHcg"
Received: by mail-qv1-f67.google.com with SMTP id 6a1803df08f44-6b553b1a159so28077586d6.0
        for <llvm@lists.linux.dev>; Mon, 15 Jul 2024 09:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721060131; x=1721664931; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B86oylWeQ/+rBCNttrbAo/LkztHTkh3FQpXO6sNcI50=;
        b=hwR+oHcg5BdZ0HQq2rNyy69lLbmaQZQCAFsfYXSHnJWKTvHUZTP4Uq/K0Ifv7e/XwE
         QMkzO5Viy2uuf0C5IVgoaX/dYR8YNcqWs9xDuYW5OzuqSE+JEjkrwa3pPDbCBnaL4RzV
         aXKnlMyAWtqglpTRrqbIXUXCCae7LdFQ4IFQXsDAYUawMOYYCbwcCB7wpGQBt7igGo7c
         4LCEERMlG9XDQc9wyt82FEu03vZhFfc6SOK/QqnOZSn747hpiugwFswKrNgF22mSAlG/
         uC4upC5dSdPPLKZqXJUuzmA6cOh6EY9wcjqdnxHlQkFksPzDkrBbylB26SDg4UwwUaVE
         Lvew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721060131; x=1721664931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B86oylWeQ/+rBCNttrbAo/LkztHTkh3FQpXO6sNcI50=;
        b=Iphc3g617K536GAFMM2V/E8Kypua9Kgcbd9W/wHGPQckUy3tmfuXRKGBnDM+xmAzqL
         JnQVlgD+2JHqu1IexcQPZq1NSkJqZqXAYqOo1aUYUeuT0njp0SXCYghH904KX+Lg5J1e
         rMhMx5iuwqDKlfuSKjHR/jFWFRtcKq3uDaUqNcZMknymNH5pat7Kg44b8LyRzZT+M5ks
         MAreT3RLhxbXa/2XcqStgGztsVcCQLQ47I60PhZMoRoahoeeuZdGFUJ0cqw4O4MJsvYV
         bU4klBFUKxZPE86ehhh7KQp5tHJayDr5sitzxHNcGR2NeHO6KRss6qR4ieqL1nB2HEkj
         1VuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4bA/y8N568BJjY/o8PZAlGdnuBKUq9sBeXSBN4ZEpZK20/l8BKZzQbVm62HfKTK1KEz+Q4Wcaa9hihgXgy6thKzcnHQ==
X-Gm-Message-State: AOJu0Yy6hH4dzN7mcq5Vo8lb1tWanmuc8f6lsw8orvfCnac7J+N5pSeC
	jLWQH5t1xFnpdzyS2Sw4RALGHVf5n9KoaYWyWNZ0W0nybGwW1QYt
X-Google-Smtp-Source: AGHT+IHT78LgI19wps2RLAxgCax2XEyj6SW9H06cyh7CoTL43upSi0hM42iNIXeFEbo/SBCPg4jFxg==
X-Received: by 2002:a05:6214:29e1:b0:6b0:8e1d:f720 with SMTP id 6a1803df08f44-6b77df2b7ddmr1305126d6.59.1721060130683;
        Mon, 15 Jul 2024 09:15:30 -0700 (PDT)
Received: from [192.168.158.7] ([207.35.255.94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b7733ee169sm11594636d6.26.2024.07.15.09.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 09:15:30 -0700 (PDT)
Message-ID: <be2586e2-8d85-426e-975d-6f57da4ccf75@gmail.com>
Date: Mon, 15 Jul 2024 18:15:28 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: str: Use `core::CStr`, remove the custom `CStr`
 implementation
To: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Trevor Gross
 <tmgross@umich.edu>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Finn Behrens
 <me@kloenk.dev>, Manmohan Shukla <manmshuk@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
 Laine Taffin Altman <alexanderaltman@me.com>,
 Danilo Krummrich <dakr@redhat.com>, Yutaro Ohno <yutaro.ono.418@gmail.com>,
 Tiago Lam <tiagolam@gmail.com>, Charalampos Mitrodimas
 <charmitro@posteo.net>, Ben Gooding <ben.gooding.dev@gmail.com>,
 Roland Xu <mu001999@outlook.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, netdev@vger.kernel.org, llvm@lists.linux.dev
References: <20240714160238.238708-1-vadorovsky@gmail.com>
 <S-L4QE4MFYzY1ba0fdkJYuAVIkZHxxYB6Jk9XPFuo3ZdbvNxtfN_mCFc5oNPfTu2X17vvyPUStAviAUAzeKlCGxwRM-VbC4aPUGBGtDQCcU=@protonmail.com>
 <df092baf-03a5-4b4a-ab8b-ee7a5677c172@gmail.com>
 <T4cW5BFYytkMlTR5e2C2FfFJ5Z8P5XPw5dEsTQ2V-hoAo5yZkeYLSU3GvVCTH1Ga3f-mbPvEKZxOEWT7E1-xWu4EDE6-jCoQj3If-qCKCHA=@protonmail.com>
Content-Language: en-US
From: Michal Rostecki <vadorovsky@gmail.com>
Autocrypt: addr=vadorovsky@gmail.com; keydata=
 xsBNBGYJcUEBCAD3ciAzHQ8NElYQtsiPZ9NjsR7ttfihe0FM+PDT+6cChjFLQ8qO/1zEL5mh
 YaLbkjitrIYARhmo3lRDq3+G4L5+gRVExm9Rd98PcQy2P9F8shxI/msC50i1Fb9N4D0pP8Hx
 hhZ/or+2mbokZh8Qc9RdjynXRXAezhOFN4+0L2jkN7fjTO1IArl+TirXx+cvhQUbwKyyJlGL
 Kldvue2EqU4maZ+KIUs5di3kZgDPLILzvBqX9TLtwEMAkNY1uMCKK+C2aihap19OjoK0qOYj
 IahVHjqGL+Mb/Ga7jxMGr2TFeQEcwIgvdRiVVLtu+uiaRKqULGokBL3l9gprtBZWdLq7ABEB
 AAHNJk1pY2hhbCBSb3N0ZWNraSA8dmFkb3JvdnNreUBnbWFpbC5jb20+wsCXBBMBCABBFiEE
 3RZt3oLrB5kpFLy14qU49yah1xEFAmYJdCQCGwMFCQHhM4AFCwkIBwICIgIGFQoJCAsCBBYC
 AwECHgcCF4AACgkQ4qU49yah1xFuDQf+NE2Oy6zF+uVh3vtidkfacCSMnu1QxojJHB8C1/Ep
 g4JU5hPcG9hC+HrMs5/Hqs7DOike9bZjhpEmnW4DIeI7Wy3t1Qf7A8EOzS0nrMgbX8TnkEon
 zMBBqiNp3VVVcltRJtc58xMP8K3yu6Ty2Q8e6GWdL5bqDr9gshb+vWu8inh5CullsGRJFJl0
 BfSdDKAbpH3NdEoWnL4JvFphpouh2vhd/ScvfNAQcuyBn3cbCyQdjNTgRVBkBNDEYCaWLVqP
 r4IU0JNjgk+cTLbyFmgn2++bWoIICGrAeWGruSpl7UGJ2PdJokWI9zp5UqSCezejDS53yhkU
 GsCrF7LrTceB6c7ATQRmCXFBAQgA2yrqjTKvL7VJKi/NNcpQ7EvAEm6omO+O4wQltdpybaxe
 mbLT0vZTH6rjZba28ixZmFHtwOjzNNtabmb4uK+nxs0BkVBpRvJNJ0LM1ydGYZQ46Sbvr1dE
 7yWDkkG1CjmXYGd5I2iqx+ATbdrtzDGWLsvDXd/yEaO9dxAR+LqGOg1HdgE9Hhmuv8BRYSCL
 vnXaMA7Orq9oAmu+Q5q9TT3aZGMdBFdcoUNSVPX82uIYXjDaXj0Del8tluAHLf3oV7ZXEgOx
 c6OpRY3+8Pr9//UtfoaHNOjoKFNyPaIUf5U1+E9J0UoDm8m1usrwnghg6yRyPhczhCOvbYNL
 hQ6TiImvowARAQABwsB8BBgBCAAmFiEE3RZt3oLrB5kpFLy14qU49yah1xEFAmYJcUECGwwF
 CQHhM4AACgkQ4qU49yah1xHetgf9FpI4Y+okwFRIqRa6WJ8jhz6us+oYKedftr313NwerUB5
 8nnhK0YWkZWZMuu5B4LCMiv71Ugqlc7ahBy5sQx/acRPe+NiYpwiN/pWrv7njaA6evDieXL8
 jc3j+xy4fsi861BWJXaurWQtLMXyHBUmdJ+StU7tscYTPe4fN1fdkBh0SreZxLfvp/+SMRQk
 g9PmXb1BMZdw8gWghPAbYg5bfCzXF9iZp4bmjuCENfwG4zmnYJzR6uTI0reqECo6Ee7NjOQ7
 qKy29wW+kVnEjX481iCEUmqKHEaQB08Ueb45If09fThw1baHLAk6bFk5cabMtD3JbWEifa6M
 RS+eXZNwwQ==
In-Reply-To: <T4cW5BFYytkMlTR5e2C2FfFJ5Z8P5XPw5dEsTQ2V-hoAo5yZkeYLSU3GvVCTH1Ga3f-mbPvEKZxOEWT7E1-xWu4EDE6-jCoQj3If-qCKCHA=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15.07.24 17:56, Björn Roy Baron wrote:
> On Monday, July 15th, 2024 at 17:46, Michal Rostecki <vadorovsky@gmail.com> wrote:
> 
>> On 14.07.24 19:01, Björn Roy Baron wrote:
>>> On Sunday, July 14th, 2024 at 18:02, Michal Rostecki <vadorovsky@gmail.com> wrote:
>>>
>>>> `CStr` became a part of `core` library in Rust 1.75, therefore there is
>>>> no need to keep the custom implementation.
>>>>
>>>> `core::CStr` behaves generally the same as the removed implementation,
>>>> with the following differences:
>>>>
>>>> - It does not implement `Display` (but implements `Debug`).
>>>> - It does not provide `from_bytes_with_nul_unchecked_mut` method.
>>>>     - It was used only in `DerefMut` implementation for `CString`. This
>>>>       change replaces it with a manual cast to `&mut CStr`.
>>>>     - Otherwise, having such a method is not really desirable. `CStr` is
>>>>       a reference type
>>>>       or `str` are usually not supposed to be modified.
>>>> - It has `as_ptr()` method instead of `as_char_ptr()`, which also returns
>>>>     `*const c_char`.
>>>>
>>>> Rust also introduces C literals (`c""`), so the `c_str` macro is removed
>>>> here as well.
>>>>
>>>> Signed-off-by: Michal Rostecki <vadorovsky@gmail.com>
>>>> ---
>>>>    rust/kernel/error.rs        |   7 +-
>>>>    rust/kernel/init.rs         |   8 +-
>>>>    rust/kernel/kunit.rs        |  16 +-
>>>>    rust/kernel/net/phy.rs      |   2 +-
>>>>    rust/kernel/prelude.rs      |   4 +-
>>>>    rust/kernel/str.rs          | 490 +-----------------------------------
>>>>    rust/kernel/sync.rs         |  13 +-
>>>>    rust/kernel/sync/condvar.rs |   5 +-
>>>>    rust/kernel/sync/lock.rs    |   6 +-
>>>>    rust/kernel/workqueue.rs    |  10 +-
>>>>    scripts/rustdoc_test_gen.rs |   4 +-
>>>>    11 files changed, 57 insertions(+), 508 deletions(-)
>>>>
>>>
>>> [snip]
>>>
>>>> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
>>>> index 68605b633e73..af0017e56c0e 100644
>>>> --- a/rust/kernel/init.rs
>>>> +++ b/rust/kernel/init.rs
>>>> @@ -46,7 +46,7 @@
>>>>    //! }
>>>>    //!
>>>>    //! let foo = pin_init!(Foo {
>>>> -//!     a <- new_mutex!(42, "Foo::a"),
>>>> +//!     a <- new_mutex!(42, c"Foo::a"),
>>>
>>> That we need a CStr here seems a bit of an internal implementation detail. Maybe
>>> keep accepting a regular string literal and converting it to a CStr internally?
>>> If others think what you have here is fine, I don't it mind all that much though.
>>>
>>
>> The names passed to `new_mutex`, `new_condvar`, `new_spinlock` etc. are
>> immediately passed in the FFI calls (`__mutex_init`,
>> `__init_waitqueue_head`, `__spin_lock_init`) [0][1][2]. In fact, I don't
>> see any internal usage, where using Rust &str would be beneficial. Am I
>> missing something?
>>
>> Converting a &str to &CStr inside `Mutex::new` or `CondVar::new` would
>> require allocating a new buffer, larger by 1, to include the nul byte.
>> Doing that for every new mutex or condvar seems a bit wasteful to me.
> 
> The names passed to `new_mutex!` and such are literals known at
> compile time. This means we can keep adding the nul terminator at
> compile time without allocating any extra buffer. Basically just
> adapting the current implementation of `optional_name!` to produce an
> `core::ffi::&CStr` rather than a `kernel::str::CStr` from a regular
> string literal is enough to avoid having to explicitly use C string
> literals in those macro invocations. This way users don't need to
> know that internally an `&CStr` is used.
> 

OK, good point, I can indeed handle that in `optional_name!`.

>>
>> [0]
>> https://github.com/Rust-for-Linux/linux/blob/b1263411112305acf2af728728591465becb45b0/rust/kernel/sync/lock/mutex.rs#L104
>> [1]
>> https://github.com/Rust-for-Linux/linux/blob/b1263411112305acf2af728728591465becb45b0/rust/kernel/sync/condvar.rs#L111
>> [2]
>> https://github.com/Rust-for-Linux/linux/blob/b1263411112305acf2af728728591465becb45b0/rust/kernel/sync/lock/spinlock.rs#L103
> 
> [snip]
