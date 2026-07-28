Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D75371897
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 08:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228392; cv=none; b=sS2Qlfp6cYw47chq6BOVHf3QhB+W/upb5pafZSeye33VoBFDCqNgwWgdK52y6cdNq+L27EV6VuN1jC6hWnR4/pPo9C7hNfFce87eUlcTbC3XBKh4TeCROFdPc3dP4sFkmxNhO8nDetfzY7s3TP06VCSAYFxoXFW8VrXgrGqPejw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228392; c=relaxed/simple;
	bh=DLea7GDB+WBJ7RoAC77zyEKX0QnwByXNUQOxrZdvpNM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KYfqxU/o7L//S3rWw/xo0Ov0BSTVlpkFBP/hSO8XklnHheV+mitaKLewYkGSI64Ee5ixMlLB7ght4FTHdD1FRKvMVmADEglXD/JuDLlCz1bwpzkj6/5ylRRlwrBFJ7sMT75JZgFP7szpzIJQxK/8oEH/BraupetJLIbWmcs1eTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAg5lH6a; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAg5lH6a"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4955de8797cso22567315e9.3
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 01:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785228388; x=1785833188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TY5i83xUXytTq3W3hDjBOHFIBU26TkcCDfOy7gh1KLI=;
        b=rAg5lH6ai/HbFUm7QkaMJGYPXprexb7uMVmNc1k2gfkE3eeIwwk8vtgkqMR13Djib6
         2owNYwcKj7j5AR+XKal6JFjEthH23gNeKeqSZc1ju2s2FYEtYrb0DoFUrBWwvNf9nIia
         OpAphVC5ELY4dhQTmklKdSLKFFwDBqo1JMqhr054v7NM8PvQ70WTHFY9lkb+V0dMN+WK
         QNxXoMSzGZ4/337eaSyc6LGb21jUXnLCo1AoHwZKA5bBdADsRDfMRA7EWRfRnoJL+wJx
         3FIxS2lMF2aXOqdMd8VtuAqjVKhu/Whk9tOXQ4fJwSi2abwDcGIfQJygOuci311ebtD7
         X8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228388; x=1785833188;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY5i83xUXytTq3W3hDjBOHFIBU26TkcCDfOy7gh1KLI=;
        b=Fdy8wxS5WMfheV/XnJFbrY9luhLCzDc7T9EHI45gLl9LSLbSgwzpsJFKOWY68ZCV96
         MdB9QmHqiD35eJVp/p7JvdRdVBCYSqra4T2anwufOULnC6dpSbCsaOn4jSS60h0bXi8k
         cVVlwOW4Q4376wGBnmMNLkyrYo5lpbTyGKiwlYCiRHAbVSTdomTX5DWcTTqFbuRRVnF6
         TKRF1t31MUpQahcXEXl9Ur3E0mzr+VtcXzxYIFha3km3/1bV9ueSenX5ajxpCT54sQEy
         rw+zUsAx5s+J9Cxllo6Jj/lbyomIXeC6GRaALxGXZZUtbQmjnuUeFSDBtF/9lWi7ve2+
         v9Ug==
X-Forwarded-Encrypted: i=1; AHgh+RpDpeOAwuYnb/g+A+Wq6rPXTWahuAYvgvGMTlRyGRc2sKxSLRGqzXtSMbysBY57Y4fePscs@lists.linux.dev
X-Gm-Message-State: AOJu0YyE+7ilASdOI/s45yiqVtEMZZSqPUZ8E11yha1k7Cdryomuxbsb
	nm7fNSQF7aUItMKqxVdaCeILGW1xNInrurFzotyX2gYF/j6Qufh3lyS9
X-Gm-Gg: AR+sD10B8inEuw/vUCJeV9JeYDDyheHoDB/WuJhjUoiXNUGuhgmc+oFme2oyveAub7Q
	B8EtIDG5PGYlmdTzYJw4SGdOzJmX3Wp4YyN7QEdRSNdsaEFW/m4b8li9WDVokrp9WA/LLPTsWsm
	Wj8HfntFgOfQxrBXq+YmtJ9QjlzWVSAxOCQWylUIFNRtbe55A2fnQpuEtToddhbm9Cvf0OJBDGr
	Yf0eKCqO/y5bPLkU+MDWZ+t2ubUddNtIz7B163/eaLw+V6E1HkRFOBXPRke8iQ7qnCleb376rcP
	Mb+/1pNm9Pe/egjest8TdogPS7/Wf4sRqwaRLA3Gia2IN2zKFAj8PCmOmgEAWHvrsbGUI+R4gwo
	nR5Z846eFXJfeQovuKIRcl0rOrlKLW3fHmc5wKPF/WBXRDy/HZY+Sr491Qrewi53DmmFUztufCS
	CCjgG+r21QKzHITeotVONFzk7gC5R3lgTrZQ/QyLAHY/tcFsR4Pg==
X-Received: by 2002:a05:600c:3b13:b0:495:5890:8f6c with SMTP id 5b1f17b1804b1-496c653d3dcmr17415025e9.7.1785228387869;
        Tue, 28 Jul 2026 01:46:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9b8b67sm340321705e9.4.2026.07.28.01.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:46:27 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:46:25 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ammar Faizi <ammarfaizi2@openresty.com>
Cc: Willy Tarreau <w@1wt.eu>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <linux@weissschuh.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Kselftest Mailing List
 <linux-kselftest@vger.kernel.org>, LLVM Mailing List
 <llvm@lists.linux.dev>, Yichun Zhang <yichun@openresty.com>, Alviro
 Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Shuah Khan
 <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, gwml@gnuweeb.org
Subject: Re: [PATCH 2/4] tools/nolibc: stdlib: avoid signed overflow in
 abs() and friends
Message-ID: <20260728094626.0fb1a467@pumpkin>
In-Reply-To: <20260726101306.3772237-3-ammarfaizi2@openresty.com>
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
	<20260726101306.3772237-3-ammarfaizi2@openresty.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 26 Jul 2026 17:13:03 +0700
Ammar Faizi <ammarfaizi2@openresty.com> wrote:

> Negating the smallest negative value of a signed type overflows, which
> is undefined behavior. The selftests are built with:
> 
>     -fsanitize=undefined -fsanitize-trap=all
> 
> so a caller passing INT_MIN does not merely get an unspecified answer,
> it dies (on both x86-64 and i386):

Thinking more, that is probably the correct thing to do.
'Undefined behaviour' means exactly that.
It tends to be used for things that might cause traps on some architectures.
But I believe 'undefined behaviour' is exactly that, erasing your hard disk
(or starting a nuclear war) are both valid.

	David


> 
>     A simple test program:
> 
>       printf("x = %d\n", abs(INT_MIN));
> 
>     $ ./ab
>     Illegal instruction (core dumped)
> 
>     (gdb) bt
>     #0  0x0000000000401009 in main ()
>     (gdb) x/6i main
>        0x401000 <main>:     mov    $0x80000000,%eax
>        0x401005 <main+5>:   neg    %eax
>        0x401007 <main+7>:   jno    0x40100b <main+11>
>     => 0x401009 <main+9>:   ud2  
>        0x40100b <main+11>:  push   %rax
>        0x40100c <main+12>:  mov    $0x80000000,%esi
> 
> Negate in the corresponding unsigned type instead. The value still
> cannot be represented in the result type, so the minimum is returned
> unchanged.
> 
> Cc: Yichun Zhang <yichun@openresty.com>
> Cc: Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>
> Fixes: bf5e8a78bede ("tools/nolibc: add abs() and friends")
> Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
> ---
>  tools/include/nolibc/stdlib.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/include/nolibc/stdlib.h b/tools/include/nolibc/stdlib.h
> index 1816c2368b68..8d86044f759f 100644
> --- a/tools/include/nolibc/stdlib.h
> +++ b/tools/include/nolibc/stdlib.h
> @@ -32,22 +32,28 @@ static __attribute__((unused)) char itoa_buffer[21];
>   * As much as possible, please keep functions alphabetically sorted.
>   */
>  
> +/*
> + * The absolute value of the smallest negative value is not representable in
> + * the result type. Negate in the unsigned type so that the overflow is
> + * defined and return it unchanged, like the other libcs do.
> + */
> +
>  static __inline__
>  int abs(int j)
>  {
> -	return j >= 0 ? j : -j;
> +	return j >= 0 ? j : (int)-(unsigned int)j;
>  }
>  
>  static __inline__
>  long labs(long j)
>  {
> -	return j >= 0 ? j : -j;
> +	return j >= 0 ? j : (long)-(unsigned long)j;
>  }
>  
>  static __inline__
>  long long llabs(long long j)
>  {
> -	return j >= 0 ? j : -j;
> +	return j >= 0 ? j : (long long)-(unsigned long long)j;
>  }
>  
>  /* must be exported, as it's used by libgcc for various divide functions */

