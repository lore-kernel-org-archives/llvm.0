Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C701DEFDC
	for <llvm@lists.linux.dev>; Sat, 17 May 2025 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481815; cv=none; b=UDr3DeyswPEm57OEw8M4OwBN8KLZorylel4SC33fa7Dn/3PnED8fTDwqPaXXYOg/5sjF2BY7NdK+rIH9RNMkyVY7gGQdYHjCwCRQiosI/MNXOQB7zWZzMVCeOLL1HDuerL2WPtExEfJaD88LCXcMukIjqXagt07Od7Xh/fqGl5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481815; c=relaxed/simple;
	bh=pSoqKGnGc2p0krSYaAJD10+6QUEoAx6Simgs84ngQjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwskeTazZl8iau4xxbsc+PFtJxYKB9lprWM2LnlnUueuTJ6d8pNZmzvTC2I3yCbDKeZLEH/QrB11mLN8eAYeZmzQd2y4KPhD3WQWPnuzht5s+YofYD296KY6CeK6ngQaxjS+FqLvVTH89nWwBPj/C73btaB38Uyie9vIb8O41yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bz6j+qO9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bz6j+qO9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a206845eadso1866418f8f.3
        for <llvm@lists.linux.dev>; Sat, 17 May 2025 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747481812; x=1748086612; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/SBkgLGN/MrxOQ9/67Ws3va/xYrNBLPShBPDYKH95A=;
        b=Bz6j+qO9MS+9jFuIV1gALrjQeBJKl/ksFKMkssOzxnPUFXxhmMa5jIY6WIi50CE2oO
         Sxg8yOelwc5tiLlSh5GFcPxH65tT3u8uAe2WfZ5qFwKPU5VBQV4QyoDw/QOpzamniMD4
         gcYQ8eKgmHoxcVZ5Of8lzd1gk/wm+OjalBa5ApSbT5wrEhQdYtpOPv5T+CLA0xM55wWn
         NEZYtwAqs9bv4WIGpwYWsmBjNLIgVGwuIR/aymP1IfjWtk0yh5go9EXABni1PtuFoztX
         WVg/dJd5lAuLWZb3bbCIBkWDzkeMDWN3gIff9jtYfvPUsvObq9XQD6sXO9O+giHygDKo
         5Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747481812; x=1748086612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/SBkgLGN/MrxOQ9/67Ws3va/xYrNBLPShBPDYKH95A=;
        b=vxeVbyXUkLv/qPb6VlZSNcINYmm0bV6I2OPd2LkJLwWg7KtsT7GPVfIVzELbKPT+yw
         8ZwVJjJQudZH5U/vspi5JU5ygdDSPigKyAalM9vI8LDzVwRBgodCldIrEm0mwUq8fng/
         op1SIf1NBdXzZtNu+YUM6ZQMYBOkbOjRcRAqIA4wfw+huV46BLKK6H6q+uKw9RTU+DEv
         3Rkri9B0yyQ2Xzqim1xjv3C8L2z50ySrW9S4mXxuRZU9LYDUEANry/N1YpP/twa7RcYJ
         t8R9NXkAuKmDxSu5UiLrfwyf5W+8VR7ykpTMDV79X59HjNFFR/lRdf/GADH3UfbhohV4
         dKEA==
X-Forwarded-Encrypted: i=1; AJvYcCXTsCHZIF+lWxLY8TtYiXNcVV1kDvAC5NciinFMdDVBG8yeqINBrYQLHIyium4Geqhwflrn@lists.linux.dev
X-Gm-Message-State: AOJu0YwqL9VzBwazzkoKia8No0CQ/+sekCgzzaYOhkVrlJjxqxTX9iMg
	Wtj+JK2JQIF8t9pqeXigd05CtvW0beD1X/+GVWanoUMLTd8zvqMx6ZIO
X-Gm-Gg: ASbGncvXa9OOUGXeS3bavPBqr8jx7ng2QayDslAPSkrXiGdiDEEHm1X6wTQjm9eTMmJ
	628gmrLj6Hw6VfmV8fW5P+gvtIsai25yUPCc8k0CBCkzGhdCmU8smwfJJGYzEwMIpszAWXor0D6
	QGXb7t6lx1Yg6CVLdqhBTBIcStvsgi6GsMg6wQw2RdkgUW7rC+47i0GYvHISnZ4y5dbykw4e/UO
	X39UPc/abrbeWFl8tgBciXQvL9TvG1nQ2jUzkahSTB+WiEUGixzVien9AbGSVuhBpPO0Ng4REAl
	0/in1KJych6PqVgK8NUosRAqghuW29ms/oqPedU24lazbuUc2iN+5LZKhXZn7i3v
X-Google-Smtp-Source: AGHT+IHboaz6cQmQDpSINZLHFCnqDghYEBpSBtLox8/4UmeCSrlpNWFx/umCN9OyzxZOPBm2l3mORQ==
X-Received: by 2002:a05:6000:1866:b0:3a3:4a1a:de6f with SMTP id ffacd0b85a97d-3a35feab1bdmr4932224f8f.26.1747481811545;
        Sat, 17 May 2025 04:36:51 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::171c? ([2001:871:22a:99c5::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm6063226f8f.90.2025.05.17.04.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 04:36:51 -0700 (PDT)
Message-ID: <19fc74f7-b292-404d-a48f-4dc3bcb5af3b@gmail.com>
Date: Sat, 17 May 2025 13:36:49 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Sky <sky@sky9.dev>, Alex Gaynor <alex.gaynor@gmail.com>,
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
 llvm@lists.linux.dev
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Benno,

On 13.05.25 10:51 PM, Benno Lossin wrote:
> On Sun May 11, 2025 at 8:21 PM CEST, Christian Schrefl wrote:
>> `UnsafePinned<T>` is useful for cases where a value might be shared with
>> C code but not directly used by it. In particular this is added for
>> storing additional data in the `MiscDeviceRegistration` which will be
>> shared between `fops->open` and the containing struct.
>>
>> Similar to `Opaque` but guarantees that the value is always initialized
>> and that the inner value is dropped when `UnsafePinned` is dropped.
>>
>> This was originally proposed for the IRQ abstractions [0] and is also
>> useful for other where the inner data may be aliased, but is always
>> valid and automatic `Drop` is desired.
>>
>> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
>> as a unstable feature, therefore this patch implements the subset of the
>> upstream API for the `UnsafePinned` type required for additional data in
>> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>>
>> Some differences to the upstream type definition are required in the
>> kernel implementation, because upstream type uses some compiler changes
>> to opt out of certain optimizations, this is documented in the
>> documentation and a comment on the `UnsafePinned` type.
>>
>> The documentation on is based on the upstream rust documentation with
>> minor modifications for the kernel implementation.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>> Link: https://github.com/rust-lang/rust/pull/137043 [1]
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Co-developed-by: Sky <sky@sky9.dev>
>> Signed-off-by: Sky <sky@sky9.dev>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> One nit below, with that fixed:
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 
>> ---
>>  rust/kernel/types.rs               |   6 ++
>>  rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 117 insertions(+)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546578f2f04cdf615e 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>>  /// [`NotThreadSafe`]: type@NotThreadSafe
>>  #[allow(non_upper_case_globals)]
>>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
>> +
>> +mod unsafe_pinned;
>> +pub use unsafe_pinned::UnsafePinned;
> 
> I would put `mod` to the top of the 

Your sentence was cut off, I assume you mean:

> I would put `mod` to the top of the file.

I can do that, let me know if I should send a
new version or if this will be fixed when applying.

Cheers
Christian
