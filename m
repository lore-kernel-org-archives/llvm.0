Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87860223E64
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734626655; cv=none; b=V/uNKp8D3zMfnB5Jj66ESqmteJJ8khWJq1vlYxCscWSFyh47HFRtLxvjf20Z0L1lUbWjGiW7yCl6K/nAuhzuXSMzYlUkGBhfv6lU9K3ZfsdGRU4xuzBKtm960s3C0dGkeR4uefB4zkaZTxopOPvKFYh8XTmVRjak0vyx/PVsKJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734626655; c=relaxed/simple;
	bh=/WzK4ZNO7fuf8BvKKn1V0JJbMvcNr4d1yJhMfBFo2qQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r8A5Y0VcpJaqtxwzbnVwscx2WlqsRtPSOfOqDxr5F05oWg0PBu1Y0LQk5lPiQFnoKMKww5gASTc01X10PkSOY+oACs0nnI3i951+lSMhH475qQwjKUTniltROxOLeY0gF5pp/udvhTWUSrGs/L5Xpmd7KmnTd8/gMWBZmjRIUT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=PV6gzofV; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="PV6gzofV"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-43635796b48so6843875e9.0
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 08:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734626652; x=1735231452; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/WzK4ZNO7fuf8BvKKn1V0JJbMvcNr4d1yJhMfBFo2qQ=;
        b=PV6gzofVrWUrl5igsba1Ef/pieZV8IbwIiVUfA3u62UZit9wFBGqiMFPZLXjbNl2BR
         /gtX6UuE4dZxe5tewO1+dfNLZmNBBVdMsCpbg8zKJErdxqgMdiw/eBpNBs2iRv8EVgH5
         yP86g0/Cqwie4MhxFLjYsJJn+0fqwo3Rukfyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734626652; x=1735231452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WzK4ZNO7fuf8BvKKn1V0JJbMvcNr4d1yJhMfBFo2qQ=;
        b=WbhxHeHh+lyBLsSziF8lHZrJh0CH8gCugfB0p36gUT/Tw948yEc2Gwdyy9853bZ7h7
         wGSLl17IVKhd9u8Q3nD3cMPzsqqooYXgWpaD9WQemmgNg4xlFsY8nWyC7nBKEQB1MfUw
         pThHXnUwfq9qz1d4oJFmT5poEbiaFNq9pIU2cJeQwwpqy43ca96YNAhs8BTMdO/W9p4Z
         z+dxKS332xCuKHLRyoRx589sN22YbuDGG7z9bCKmUecargGVfHjmY8hkVenyM0W1JZja
         2hoLzVZUoM0zvAVHHJX9IAQ1MSA2CsJOeweI7mWhyP/1mPqKFRMS7iN/xXIROncj+HEx
         SL6A==
X-Forwarded-Encrypted: i=1; AJvYcCUOtFsF0guBuV4SEUryZ4K0QgytuYX2KFMlDPO2qF6fdpZ+a68sEU1Tyx0OErRK6Z8NKvU3@lists.linux.dev
X-Gm-Message-State: AOJu0YyYj7b6u+pF0h6AClpncd4BkshVHd1l+guBpmVJge11st/yxsH8
	Qg/8HsyfsaOjU0WZo7bxwVzc64SdQj7Z36W70+axtJ/us75i4svX5LinSuiSGdk=
X-Gm-Gg: ASbGnct/1J5cKiXb3GHz5h1RTldRukytpvwqzTVniSRh1S9NDRh/wKfmnstDU/1bgIP
	fr/oa+36XEuaMp2YPvVQjdLzJUQZvSxeaxY5OrEPQgjFr6HhJfqpySLYwK6S5xo8KMBhZGzv70v
	uEgwFM0yFsrCb1fbIxp88YSFWFu6oTuAaGfzTIahnt1uEA5/pVJEsc75VzfvaZ6yt0OzFH/pS4/
	7d/XBHfv8FMwTdV1I8kUAACuFauX7ik5HYPRDrG2FScOsYe1cQuvxjKuJ5hsi4APhTu9Ra4QLD3
	5rBuJGXlACyL/+wZdJ8w
X-Google-Smtp-Source: AGHT+IGEPE2HmFwQQoALSPufvuY9OcbgJ6yxjHc1zy4vQSlpAqsTcBReairPrxguFq2h8tr0xiiMgA==
X-Received: by 2002:a05:600c:1d1c:b0:434:fddf:5c06 with SMTP id 5b1f17b1804b1-43662ca2232mr25073075e9.1.1734626651927;
        Thu, 19 Dec 2024 08:44:11 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c84ca21sm1951594f8f.63.2024.12.19.08.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Dec 2024 08:44:11 -0800 (PST)
Message-ID: <099d3a80-4fdb-49a7-9fd0-207d7386551f@citrix.com>
Date: Thu, 19 Dec 2024 16:44:10 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linux-6.12.y] XEN: CVE-2024-53241 / XSA-466 and Clang-kCFI
To: sedat.dilek@gmail.com, Juergen Gross <jgross@suse.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Sami Tolvanen <samitolvanen@google.com>
Cc: Jan Beulich <jbeulich@suse.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
References: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <CA+icZUWHU=oXOEj5wHTzxrw_wj1w5hTvqq8Ry400s0ZCJjTEZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19/12/2024 4:14 pm, Sedat Dilek wrote:
> Hi,
>
> Linux v6.12.6 will include XEN CVE fixes from mainline.
>
> Here, I use Debian/unstable AMD64 and the SLIM LLVM toolchain 19.1.x
> from kernel.org.
>
> What does it mean in ISSUE DESCRIPTION...
>
> Furthermore, the hypercall page has no provision for Control-flow
> Integrity schemes (e.g. kCFI/CET-IBT/FineIBT), and will simply
> malfunction in such configurations.
>
> ...when someone uses Clang-kCFI?

The hypercall page has functions of the form:

    MOV $x, %eax
    VMCALL / VMMCALL / SYSCALL
    RET

There are no ENDBR instructions, and no prologue/epilogue for hash-based
CFI schemes.

This is because it's code provided by Xen, not code provided by Linux.

The absence of ENDBR instructions will yield #CP when CET-IBT is active,
and the absence of hash prologue/epilogue lets the function be used in a
type-confused manor that CFI should have caught.

~Andrew
