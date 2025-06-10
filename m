Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3F522ACF2
	for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 11:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749556649; cv=none; b=pT7JExjvhT+N1fcCIQ9eyQ+HCZjgH2GhVl0zwNoQleMV53g8qUvnyAOmxG88jHe4R7ciIe0mcwr4PAAXQJgVrVcDoUc8pdDHgY/jEPKHTe3Qcbcvy9XIXEoCbo8G6hXU02Alt8YgglcMXT5Ikma7zOC+IFh5z5vjD3dHSjvZiI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749556649; c=relaxed/simple;
	bh=MPeqqbg76lu+Wb+e45oYflxMl5SJ7ctjBNdciDd/NSo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5+VhPPJ53ffutifJz9tasnSXrlhikQZMnudvRDsGZxNZUobsNLy+mqw+JVs0v68OCD7ENg9/XxZqD4dS8uF7naCTJs0hkdp+fq/L/g5IZMakiP8iON8vzB/ll1cvAqYDI9r/NVTdsN0Zhgl2dodiDzqmegwjMH3fzyyP5xwYXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q76rYjFX; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q76rYjFX"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a522224582so3282064f8f.3
        for <llvm@lists.linux.dev>; Tue, 10 Jun 2025 04:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749556645; x=1750161445; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m1tPKB3aQq3zXEcMGGtGtVzly+alYokN147Mvu6MtPk=;
        b=q76rYjFXFpk5TwQ/gcbnfMLnpWRTkmctIwNC0PEIFI6hKUxSVyGIclOnr4Ws79YR3J
         kMLZA4W61kv6/wl/XRNUXY6K4gppRB8hkHoroMH4tRo/+J76sCqaaG8sUnYni22BBGMk
         9PP96lLjT5JgFe2OkqCMIvGDPvjFuVQJIwq19fvCW+8v+qubwekLUAUGNsFTEn7JHYfM
         pNQE/VglR6YbiW8sPXM6TPP83pmJCHhncI+Qm2P7gwtSCABm8cXlC3cAt8Y8+nBLsbJj
         W6B0ZyCWTICS7c1MbSCL06fpdpWo/2ULveYqnzKEzbpgqn6dvKzc/k88/1wFf213yfbV
         JUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749556645; x=1750161445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m1tPKB3aQq3zXEcMGGtGtVzly+alYokN147Mvu6MtPk=;
        b=JfJM9Bze21QOnSkfvndeM06VpKcw6MbAKc/B31bitDzo1e87zrCQzhtAUDyJaaqke6
         L0GW8BYCxk+lIadseuHtpWmffYmXVLyDBRlixU7XnZTloMsZl3M9HWo2IU8T5Bqp55Pr
         3BAb1R+4Sv+baFEXEac2yEDVskNiYr+9EZ6lXxR4R8fcF3Vg1emMoWQUKc654WU6Gx6t
         TUK7YDeaiND4fkc88fWaQaZNgvqVeYt1xMdtGHMxjM3Y5iIbfB5TT+iIoTTqdKK3gdXt
         sMt1C+XrfWStxw/+q0KYduKDMKYOnyLnoVeZqnTObKhO9K/ytgcNjELZaMiqpdnhWMuQ
         KUhA==
X-Forwarded-Encrypted: i=1; AJvYcCWVHVPY73U+K+F/WP/zAdgBKguQWgpL4GLe4Ec6u5SabwYL2eSZC38eElKE3LaU3HBat1Bi@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8qlxpJqmycIRYRAY8Hs9Ofw/qpJuuJkPuMsZIx1xvbKBbJSvt
	2bBuDeX6k+KfDAyjFl4KC72ZJpv+BWWGiuF9q8jO0Mut6SPgPZ4s0sPIwo2AfMbkxsY=
X-Gm-Gg: ASbGncvnwJ7D5JXYpVpfgF82RKA8iQChsYnv83hNIn9/fZ2+rpCf7nSIcvLNwUx61T5
	RFBZBrOZjnOuksNK5vFOPJpFi/nH8sIofBtvvdsVjSgsr1nKGZKkRVFJZBG5jlGADaq7I0TZLW/
	yNhbzxvrcPKMy7w8XuYxjWqnDxXuUzU6DwWR3jjLPgGsSiK7f2bq2tWeP/gsziiriiFoQiEYimD
	LjLwNNBEGKEP6PPInyLNg6weNO0zmFLslPBPZP5mvWObjNYwMUHJXzTQTCDpOLq5GHqKak9wc0g
	4hI1wUqD2UicvQkRZBggBk2SDsVrAR2m0pk33J5XROsmSucXGCxowLAIE+Bi2pdXizY=
X-Google-Smtp-Source: AGHT+IFRutpWq3mI++c2ze5et8BoMgRFXoiM8t3JTvOFFmUsflzqRA3Ic1DXBWG2cyZjgDJOcU/CWg==
X-Received: by 2002:a5d:584c:0:b0:3a3:648e:1b74 with SMTP id ffacd0b85a97d-3a53188a8admr13108602f8f.6.1749556645169;
        Tue, 10 Jun 2025 04:57:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45307c78489sm89779445e9.4.2025.06.10.04.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:57:24 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:57:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, llvm@lists.linux.dev,
	patches@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Avoid memset() in aes_cipher() and
 aes_decipher()
Message-ID: <aEgdn1U9j1ubbfWT@stanley.mountain>
References: <20250609-rtl8723bs-fix-clang-arm64-wflt-v1-1-e2accba43def@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-rtl8723bs-fix-clang-arm64-wflt-v1-1-e2accba43def@kernel.org>

On Mon, Jun 09, 2025 at 02:13:14PM -0700, Nathan Chancellor wrote:
> After commit 6f110a5e4f99 ("Disable SLUB_TINY for build testing"), which
> causes CONFIG_KASAN to be enabled in allmodconfig again, arm64
> allmodconfig builds with older versions of clang (15 through 17) show an
> instance of -Wframe-larger-than (which breaks the build with
> CONFIG_WERROR=y):
> 
>   drivers/staging/rtl8723bs/core/rtw_security.c:1287:5: error: stack frame size (2208) exceeds limit (2048) in 'rtw_aes_decrypt' [-Werror,-Wframe-larger-than]
>    1287 | u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
>         |     ^
> 
> This comes from aes_decipher() being inlined in rtw_aes_decrypt().
> Running the same build with CONFIG_FRAME_WARN=128 shows aes_cipher()
> also uses a decent amount of stack, just under the limit of 2048:
> 
>   drivers/staging/rtl8723bs/core/rtw_security.c:864:19: warning: stack frame size (1952) exceeds limit (128) in 'aes_cipher' [-Wframe-larger-than]
>     864 | static signed int aes_cipher(u8 *key, uint      hdrlen,
>         |                   ^
> 
> -Rpass-analysis=stack-frame-layout only shows one large structure on the
> stack, which is the ctx variable inlined from aes128k128d(). A good
> number of the other variables come from the additional checks of
> fortified string routines, which are present in memset(), which both
> aes_cipher() and aes_decipher() use to initialize some temporary
> buffers. In this case, since the size is known at compile time, these
> additional checks should not result in any code generation changes but
> allmodconfig has several sanitizers enabled, which may make it harder
> for the compiler to eliminate the compile time checks and the variables
> that come about from them.
> 
> The memset() calls are just initializing these buffers to zero, so use
> '= {}' instead, which is used all over the kernel and does the exact
> same thing as memset() without the fortify checks, which drops the stack
> usage of these functions by a few hundred kilobytes.
> 
>   drivers/staging/rtl8723bs/core/rtw_security.c:864:19: warning: stack frame size (1584) exceeds limit (128) in 'aes_cipher' [-Wframe-larger-than]
>     864 | static signed int aes_cipher(u8 *key, uint      hdrlen,
>         |                   ^
>   drivers/staging/rtl8723bs/core/rtw_security.c:1271:5: warning: stack frame size (1456) exceeds limit (128) in 'rtw_aes_decrypt' [-Wframe-larger-than]
>    1271 | u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
>         |     ^
> 
> Cc: stable@vger.kernel.org
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Yep.  I recently re-reviewed this because someone wrote a blog which said
that compilers were implementing it incorrectly and we need to use
memset().  However they misunderstood the rules and their tests were
flawed.  Using "= {}" is safe.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

