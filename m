Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D7A2116FE
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 21:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748638894; cv=none; b=p4xRXPBQTjES4rCJaI0mD8MxQ2F07K6D4zfLOe2Mc18hnB00AlnBy4h9AWs130KWWdphSHcHdmZW3LkfDQEbpbDNswxYjmJlZCndEU2INmfgDPUdOmf+vvluYyfrEUHByBtVF2ebA2l78IJbWVZ8OM3PqvCkUb8VvvBZsLtLuiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748638894; c=relaxed/simple;
	bh=d4IfK2ka6jjEmZXTXqL1lPng2l65qiPmf5r7IC9XgXE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t8C6st8oa1rW+DMQ1M2WHR78eva0db3DbbhgVX+PmRjuole5IQ5OgaghYPPvMvdguzkrLjjmGxe3/1N1F0zfXLfR3kp/Tx/3nI28kdjDZelLNMcNGgCR46zhGuUg10Gjs8opFSbVmvwqGnAuYMcndYoLuiylDCR0BJdpwlCharQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVnHCJKY; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVnHCJKY"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2290232f8f.0
        for <llvm@lists.linux.dev>; Fri, 30 May 2025 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748638891; x=1749243691; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rOiB56y4MoyS/CzvCmU15wdJwiiHxlOhTBulQb1MiCk=;
        b=IVnHCJKY5nVefvIjzujCkrjjxUEYTgRde5PhfLjOIFNggbCwTz2RXDs+mPB/HqRDTO
         awfrCzrm8u5tABI76A75rzf+fp2+fAnKAkf6NaHUBJn3m8tV+RZoUR1xSKn4XC28J/5z
         fm4bcio2dFcROZpX5jZ+wZdch3BixBVAoVlKFw+6sazynXxwygVQoGham6sXKZVdDx2L
         jHUJufMvFr8RewcTc+vCRgOIjCgONkVNq8Az/dXFkLkQw0ZBl77ziYfPyInINmvmz1Ao
         2HxgRjwwXxYmBDEIYsAwsYf3qcWsJ8slc/AuKMqaW+cc67XJucIGIm5NimCwEh5cSPZn
         3HWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748638891; x=1749243691;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rOiB56y4MoyS/CzvCmU15wdJwiiHxlOhTBulQb1MiCk=;
        b=K+yI1CbtlqpLmVQcwAk/Ng7Y0Pmqv84X+HKsZ/TzMnzTNTn01p8sM+ZxcIjCdpejzx
         j6AYO0jVPNymPOnrJnak/R0EqGdQhCFysWb0uzEz0Pq45ZPyyO2uw2hf8ldXDgbqK8MW
         TEhp+IypMHxq0tKIIPnE74fWNyZzAKoq5FRDdj7By7B72PH3hG0YGGM9805VOut11HvB
         crOyYlfdE/fYMjAHaB18ORDhYIIo98zfhFESvZ/NSZaLapybpLQ0Yc0PEf6ra5OZnI06
         ky6LjvCIQvCZ4e1QT0kCAgw+PkDTEzN/hkxI8eIewGzc6URZjwP1Fkz3S/KkxJg1GyT4
         n6EA==
X-Forwarded-Encrypted: i=1; AJvYcCW4mSm8ElAYKY4O2hTk+nHU8FNhKuUz/FDXV33WnDpdMMsCrZSlKSjMqHynW3CpWGBS5tAC@lists.linux.dev
X-Gm-Message-State: AOJu0YxRhxSmeFtQJQj4Lj0nSOqYXkE5DVXwLK120L6+czPgqdiuTvhB
	5pVxZJIPBzOQs11g/BL2gdIIk3pTxPROJpHor5A6+WJWnBfyWlAE+EIe
X-Gm-Gg: ASbGncv6deKMa2RGyvP1GqCxM/2HEdlCTFPWZ8bUCpYHlkB9CjFxS9PEFksHS8f6dZj
	NhfBmjxY33aPgxc3/IgbOXtIXMXTKAewckX/hKanB2WJPHeqbG6LUX2moT/l0kJWl2ebEKNCIpB
	dt3vghx6P2P0rWu9tpF96KQtzUm95UbTSPiMdkJHBt2uEzOMH3fkhg+C7oezx4CDZrrhimHO/hV
	6cWfLpgOFlotwVCtAsnAunCeIcbXH77USqGclMOlk9u8xVu2QyT7wFxLqFm2iEBqo7Dyp8T5H68
	2bcI+yBum1R6e5bB2WzlFRV+hEAaS5nhSgwJP0LbsgSqujtHA4s9q8AG/vB/+GhD
X-Google-Smtp-Source: AGHT+IELYtMr8G86T/WDXfoL8a0eG5NyCgP5oG+4rgfVuvLxB0Ejdrd4sfjXgfEArS/dX/IBihHZVA==
X-Received: by 2002:a05:6000:2890:b0:3a4:eb43:6003 with SMTP id ffacd0b85a97d-3a4f79e9846mr3851759f8f.29.1748638891290;
        Fri, 30 May 2025 14:01:31 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a13fasm5797576f8f.98.2025.05.30.14.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 14:01:31 -0700 (PDT)
Message-ID: <013f62b1-c015-4382-89ba-2104892a2b96@gmail.com>
Date: Fri, 30 May 2025 23:01:30 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
From: Christian Schrefl <chrisi.schrefl@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Sky <sky@sky9.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
 <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.05.25 10:22 PM, Christian Schrefl wrote:
> On 20.05.25 11:26 PM, Miguel Ojeda wrote:
>> On Sun, May 11, 2025 at 8:21 PM Christian Schrefl
>> <chrisi.schrefl@gmail.com> wrote:
>>>
>>> Signed-off-by: Sky <sky@sky9.dev>
>>
>> Apologies for not noticing this earlier...
>>
>> Since this is a Signed-off-by, the DCO applies, and it requires that
>> the name is a "known identity":
>>
>>     https://docs.kernel.org/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
>>
>> Sky: is that name one you use to sign paperwork etc.? If so, that is
>> fine (and apologies in that case!) -- please let me know. If not,
>> please feel free to ping me in private if needed.
> 
> Since it seems like Sky has not responded for 10 days
> is should be fine to just drop their COB & SOB.
> 
> I only offered to add it since the upstream implementation
> that this is based on was entirely done by them.
> 
> If you want to wait for some more time that's fine as well.

It might also make sense to wait for this PR [0]
and use the new code as the basis for the kernel
implementation, since that will change `UnsafePinned`
to include `UnsafeCell` semantics.

[0]: https://github.com/rust-lang/rust/pull/140638

> 
> Cheers
> Christian

