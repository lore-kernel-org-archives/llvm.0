Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C971BA4D
	for <llvm@lists.linux.dev>; Mon, 15 Jul 2024 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721058382; cv=none; b=bGQucrZzmgNXkI0uSnzA2Xlbf/uSpmSfnK+oFSA4rDi1n4/dgQRT10lyF+Vkx/9u04D2fR+r8xhtHAC27Ohe9h0siLeIsYPv/BoSKrpRYcblBo6Bqnvuy47xDiQGD/Lvb7/9p+YanVM6gEdSKiw22HJN0sOJ5KT4+T3ivqnb4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721058382; c=relaxed/simple;
	bh=oLiaQ1klWwSQIumg3AhxoPfNz0aYuW3gA3TqWpED+g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E6ygxA8egmwchsJ9y4kaTAwzxwgxK5YjnkzvoveMJP3ofTBN/uoOkGiQfZqLFRZJ9PPcKb0gijCNEvrzG7AcbydMSIxp5LjzgmmvMQ8YB/sakrW/JolSLKpHpP6vW16wX2NLl+hjJo1wzJ/0RY4SAK05gWf70xON+VHKyWe6CMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Da9B2ofY; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Da9B2ofY"
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-44af23cc0edso28034601cf.1
        for <llvm@lists.linux.dev>; Mon, 15 Jul 2024 08:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721058380; x=1721663180; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L02Bv3qTm0KPSZYoQ77x+hSiHLw/7P4AfHH/o8NuIjE=;
        b=Da9B2ofYinSvwH1bOgxHEXbHw64JxhCVlFac3hhB3w1LLg8474Tbkg0NBZGz0syCpQ
         gm3RxCZmznKrgAS/+Bd0eSrr9V3bE/nNbcdtXi1q3Jc0i6Pishc5TxFVyPImIyb4ICof
         Wi6Ja/WzxzcPESg8N+h5sbnDeBzjCgp9AFdSuyvSLz+Q4wcVT60afjFBB8LoXbc/Xj9m
         GaDz6SJtfa1zLZDq3F18wnU5Yb+HOqAMhs6nzNhPDJNrC8EfJEUfAcGDKZ/s6TrXOg+E
         0rPUetlVA93HDH3lclOLlRsDvAsuSe2CLBg7ODKf2mU4xRwr9pWYVBSxDUXzRc0P+xk7
         Fctg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721058380; x=1721663180;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L02Bv3qTm0KPSZYoQ77x+hSiHLw/7P4AfHH/o8NuIjE=;
        b=UHy0yWYB0mBMu+wgz0hoPzuSyj5FQ+NzLnkMOClHPn5denNCKAWzAzG+ZPC/w+rsUN
         ij4+WwHcm2V6hXAjy9p+5Nzk2wSMO3AZz9oWJR6iJOQIASsFng2qEKQpkX9HnYgow8ZG
         ytAQuI/ut1VeM1IHjPJ5CA4m4BZArlGSEOt8Tf8MVaxpS3S2NTkRqmnzCh5LMwGLgvZ9
         c2DVr3r77WWtGd4wdi7fA8UI/HQbdTn3ikoJB8dIQpzwjq2eTWV1WepDDDOmJMWe52vQ
         kuit5Y7aTKBVi2N3SZtnduFgN2+pXZzbRqb4lLlXCGOf1nVLdvg66H2+wiCvGmrjMICs
         bb3g==
X-Forwarded-Encrypted: i=1; AJvYcCV8yvWS/rsS06/D9NIlhNnlPjTgdNCHNhyH0YlzF8xs0cTi6wt+cez8OW6L/w6T9dUe+VkShjjXnOLEt/P16fd8CvQ4Kw==
X-Gm-Message-State: AOJu0YyeiI564YFMrG1ueqqoljnD5swQZ9vlRuFeFjXk6LiJ6B4Vo3Bd
	0IratwRhgVfBgy3aGekaqsHh6ixQQMOXsxCw3vKgulOHjrN5vfKq
X-Google-Smtp-Source: AGHT+IGVHJOL20G58t7+WWacMZ8rb/Ay90S6Qtca9nWqRmAF8WjfdCNlo9MnaJe+xxHT3FB1TPsI7A==
X-Received: by 2002:a05:6214:226b:b0:6b5:4288:7e94 with SMTP id 6a1803df08f44-6b77de52af9mr980926d6.8.1721058379788;
        Mon, 15 Jul 2024 08:46:19 -0700 (PDT)
Received: from [192.168.158.7] ([207.35.255.94])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b76197c6e4sm22487286d6.39.2024.07.15.08.46.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 08:46:19 -0700 (PDT)
Message-ID: <df092baf-03a5-4b4a-ab8b-ee7a5677c172@gmail.com>
Date: Mon, 15 Jul 2024 17:46:16 +0200
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
In-Reply-To: <S-L4QE4MFYzY1ba0fdkJYuAVIkZHxxYB6Jk9XPFuo3ZdbvNxtfN_mCFc5oNPfTu2X17vvyPUStAviAUAzeKlCGxwRM-VbC4aPUGBGtDQCcU=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14.07.24 19:01, Björn Roy Baron wrote:
> On Sunday, July 14th, 2024 at 18:02, Michal Rostecki <vadorovsky@gmail.com> wrote:
> 
>> `CStr` became a part of `core` library in Rust 1.75, therefore there is
>> no need to keep the custom implementation.
>>
>> `core::CStr` behaves generally the same as the removed implementation,
>> with the following differences:
>>
>> - It does not implement `Display` (but implements `Debug`).
>> - It does not provide `from_bytes_with_nul_unchecked_mut` method.
>>    - It was used only in `DerefMut` implementation for `CString`. This
>>      change replaces it with a manual cast to `&mut CStr`.
>>    - Otherwise, having such a method is not really desirable. `CStr` is
>>      a reference type
>>      or `str` are usually not supposed to be modified.
>> - It has `as_ptr()` method instead of `as_char_ptr()`, which also returns
>>    `*const c_char`.
>>
>> Rust also introduces C literals (`c""`), so the `c_str` macro is removed
>> here as well.
>>
>> Signed-off-by: Michal Rostecki <vadorovsky@gmail.com>
>> ---
>>   rust/kernel/error.rs        |   7 +-
>>   rust/kernel/init.rs         |   8 +-
>>   rust/kernel/kunit.rs        |  16 +-
>>   rust/kernel/net/phy.rs      |   2 +-
>>   rust/kernel/prelude.rs      |   4 +-
>>   rust/kernel/str.rs          | 490 +-----------------------------------
>>   rust/kernel/sync.rs         |  13 +-
>>   rust/kernel/sync/condvar.rs |   5 +-
>>   rust/kernel/sync/lock.rs    |   6 +-
>>   rust/kernel/workqueue.rs    |  10 +-
>>   scripts/rustdoc_test_gen.rs |   4 +-
>>   11 files changed, 57 insertions(+), 508 deletions(-)
>>
> 
> [snip]
> 
>> diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
>> index 68605b633e73..af0017e56c0e 100644
>> --- a/rust/kernel/init.rs
>> +++ b/rust/kernel/init.rs
>> @@ -46,7 +46,7 @@
>>   //! }
>>   //!
>>   //! let foo = pin_init!(Foo {
>> -//!     a <- new_mutex!(42, "Foo::a"),
>> +//!     a <- new_mutex!(42, c"Foo::a"),
> 
> That we need a CStr here seems a bit of an internal implementation detail. Maybe
> keep accepting a regular string literal and converting it to a CStr internally?
> If others think what you have here is fine, I don't it mind all that much though.
> 

The names passed to `new_mutex`, `new_condvar`, `new_spinlock` etc. are 
immediately passed in the FFI calls (`__mutex_init`, 
`__init_waitqueue_head`, `__spin_lock_init`) [0][1][2]. In fact, I don't 
see any internal usage, where using Rust &str would be beneficial. Am I 
missing something?

Converting a &str to &CStr inside `Mutex::new` or `CondVar::new` would 
require allocating a new buffer, larger by 1, to include the nul byte. 
Doing that for every new mutex or condvar seems a bit wasteful to me.

[0] 
https://github.com/Rust-for-Linux/linux/blob/b1263411112305acf2af728728591465becb45b0/rust/kernel/sync/lock/mutex.rs#L104
[1] 
https://github.com/Rust-for-Linux/linux/blob/b1263411112305acf2af728728591465becb45b0/rust/kernel/sync/condvar.rs#L111
[2] 
https://github.com/Rust-for-Linux/linux/blob/b1263411112305acf2af728728591465becb45b0/rust/kernel/sync/lock/spinlock.rs#L103

>>   //!     b: 24,
>>   //! });
>>   //! ```
> 
> [snip]
> 
>> @@ -840,9 +375,10 @@ fn deref(&self) -> &Self::Target {
>>
>>   impl DerefMut for CString {
>>       fn deref_mut(&mut self) -> &mut Self::Target {
>> -        // SAFETY: A `CString` is always NUL-terminated and contains no other
>> -        // NUL bytes.
>> -        unsafe { CStr::from_bytes_with_nul_unchecked_mut(self.buf.as_mut_slice()) }
>> +        debug_assert!(!self.buf.is_empty() && self.buf[self.buf.len() - 1] == 0);
>> +        // SAFETY: Casting to CStr is safe because its internal representation
>> +        // is a [u8] too.
>> +        unsafe { &mut *(self.buf.as_mut_slice() as *mut [u8] as *mut CStr) }
> 
> The documentation of CStr [1] is very clear that the layout of CStr is not guaranteed.
> 
>> Note that this structure does not have a guaranteed layout (the repr(transparent)
>> notwithstanding) and is not recommended to be placed in the signatures of FFI
>> functions. Instead, safe wrappers of FFI functions may leverage the unsafe
>> CStr::from_ptr constructor to provide a safe interface to other consumers.
> 
> Is there any place where this DerefMut impl is actually used? If not it should probably
> be removed. The liballoc version of CString doesn't have this impl either. (Can we use
> the liballoc version of CString too just like this patch does for CStr?)
> 
> [snip]
> 
> Link: https://doc.rust-lang.org/stable/std/ffi/struct.CStr.html [1]

Good call. The `DerefMut` was not used anywhere, removing it works.
