Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0F020A5F3
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 20:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748636581; cv=none; b=gE9+jhu/CgPv4Tm1fblWZEiyRpqA9DDJzOxHve0Bl1mE+XwkMwsjIbemVbDVlQe5SDAzIypwRuTgNhwyRQFvRFMY3jMzTltjzRfkjpn1igCKDhLtMUoE5iO0Hs/MIzLNypAqGcypsjPBikTsi6Q87i1gXQT4CbK6M/4pg/OlQgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748636581; c=relaxed/simple;
	bh=fjpOAmZBAdbVoTbSpMSnKF6D7WZWE7u5WiUuXNJJZSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAGf9dV2sKfbG3HSYvivlXdLxDAfzEH5L+sa4VECk8Vnn6oJolBhAh4ARwj17isYygUxue8EeBqbjve2A9P1sHE1t/d1jJx+E5YjWVM1SPg7nF0gQseuXFfdnccU6PjU5eq7WzfAokNuuz829asmtui9lZKS12NdBwugoAImRSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9LPwvjc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9LPwvjc"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso19052775e9.2
        for <llvm@lists.linux.dev>; Fri, 30 May 2025 13:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748636578; x=1749241378; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPBFbYDATVBGoB/V8gk2ImwmUCtuFjEx3Hr9OaoPFAI=;
        b=W9LPwvjcvIZDQzw3i/6Hd+T0Os6bdoukUhPIUrhaqHwweBkWCfrPpaHakPpZKUNEbK
         RhYwhlPkFzUPzh9z8f9x1eIs7t7qX8yNUZnorLSEQoljcK3/EZFj78mJLOLeim+YHioH
         Lz9WlBFvM3OqablKwZyXsICHNR8j3+EcVvto7ypWsigCz4yzA+5aJngsu1BEhDXpGAuE
         oL35F0zhdkX+bJgwc39JpNt8BC45Dpsl5UB7gE8awqb60fUyFrdRVS7wB6HZLpO1vRJh
         hgC4sMcXu5rzcRDZ7IhQ1gnm+K4V0KEajcM7YrR7SLzh6KN1v/OZlD7ilMaFzwNAzoeD
         QkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748636578; x=1749241378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPBFbYDATVBGoB/V8gk2ImwmUCtuFjEx3Hr9OaoPFAI=;
        b=aI40dzYY9drFgyjMT06NWDWVvS38f1NNm85sd3YrNTjUdlO68OexHxnDUiwWxR+Se/
         30/zUdkgylD7oG1ee9HB40rGe7W/cc2fvqj/EbkpQ4U2xsNFU0ZgeQ+1rHXS3o47rtYg
         8ZQcW2HWsbMcG8W81Chx7SdRRGlvFNRf9j2Lr9A7nNPDOQsSaHhSxbGp4UtCXXAzCyY7
         EfB2iNP7K4Tm8T0/66TMVNSxTVarTedwuIFVME070kHsXT5JppWCruyiE4mPS6ckktcV
         SdD4d9uE8FjHKroK/DD8hpqMzL08kWRr6fAbPlw2OYltiOKvui5WKc5eDCxRE3kPU2Qf
         8x6g==
X-Forwarded-Encrypted: i=1; AJvYcCX1gOlBKGiWaKTlR0/I0TRMVFhtpwOs+jmMSoDarvpyxuetJ1+nfx9Z2qiOWbGWd1UIHh8U@lists.linux.dev
X-Gm-Message-State: AOJu0YyU7mIYE6OkGRd5BJ3k1bDL4e/EpYgEBX7oFwloaLLCpOEWnXI5
	Yu5qLAFGEoLCOALcuUNryiWONMtquIgPVCELiXmGjdRSmd2Ijr+ZRUyf
X-Gm-Gg: ASbGncsnfw2v6D8QSOW5rcJNDoaT146Qs2k6B66CdeqhWIwxZAP1VsBWzLGmpPs/B82
	04Vv6AhCbdGzqiI8Vo2+eSVANYTq+YUDHDKTRBdn9XWJjcLwKB+zYY9fNzw7NSklUV/CZ+t4UDO
	W4dPKc4632IakE/cutER5n4Ky0ME+Wfcwf46AvSSuTxhWd8NbF3lFEZ9Y0GgqmSQEncXQjNLYYh
	TTyxfxL99ALPLSMxyNAJIf7oU73U32HjRWd03hr7kasCS884cZJfpc28yBLC6qrIwarWbmMQ1Xf
	gdZfEjpQ5TESl/T2+fB3fEvdcQpJKL9Vsrh81sts3pfLib5bwIlE4PireC+5WhTe
X-Google-Smtp-Source: AGHT+IG8RDi2BeZKsFRzuE7h/ot3AqyMQo054BxblMbsLjyZX8+PqOO+XyTTQHOqF7v/XhIwYBsBRg==
X-Received: by 2002:a05:600c:3b0d:b0:450:d61f:dd45 with SMTP id 5b1f17b1804b1-450d64cef2bmr48133255e9.4.1748636577553;
        Fri, 30 May 2025 13:22:57 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:cd68::171c? ([2001:871:22a:cd68::171c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d80136ffsm27766085e9.40.2025.05.30.13.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 13:22:57 -0700 (PDT)
Message-ID: <0dfe6958-1dc8-4e36-aab8-e83a6da4d0e0@gmail.com>
Date: Fri, 30 May 2025 22:22:55 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
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
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CANiq72n0EcibX3Vx95tiPEkd04DA4hjY-TJQs9YSOmHj=VZ_5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.25 11:26 PM, Miguel Ojeda wrote:
> On Sun, May 11, 2025 at 8:21 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> Signed-off-by: Sky <sky@sky9.dev>
> 
> Apologies for not noticing this earlier...
> 
> Since this is a Signed-off-by, the DCO applies, and it requires that
> the name is a "known identity":
> 
>     https://docs.kernel.org/process/submitting-patches.html#developer-s-certificate-of-origin-1-1
> 
> Sky: is that name one you use to sign paperwork etc.? If so, that is
> fine (and apologies in that case!) -- please let me know. If not,
> please feel free to ping me in private if needed.

Since it seems like Sky has not responded for 10 days
is should be fine to just drop their COB & SOB.

I only offered to add it since the upstream implementation
that this is based on was entirely done by them.

If you want to wait for some more time that's fine as well.

Cheers
Christian
