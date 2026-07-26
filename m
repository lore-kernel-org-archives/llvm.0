Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815434908B8
	for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 14:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785075221; cv=none; b=WB2249MVlUm99lfURoSlJ+OgPfGA5OIGVbTLqbDvANY+tj4iahM/AkLpfqvJDt5akOmsn2KFGrGEs/diQkXC2wLT77ByoRuLNtd1TT8EAn6L88Zqs+Y5/7zu5Fxls7X+APKi23epkWkl+OrxEEGSIFAxrqJwB1kCOHdgNev9bqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785075221; c=relaxed/simple;
	bh=5EVN9kcvU5gVRWVLO/DSXXNw7Y1dcHFYAtzffkegbYM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPMGdR+JdFAAMC40ncwFCaI4k6Sclm8NYiRnCaloWm6MiIJsLRAU088Jua6gCGRGxAUuMguZBVnPK4Kh6yLWuz0UUO3YGN2s8T4Q7/NVCc6yvWncHUv9K8hBr/igURM6ujb3kZj5J2CI+4VsBYboHeBxzxoWA3U6gOzOAMF21MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tnxrnh58; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tnxrnh58"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f84023916so1905346f8f.3
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 07:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785075216; x=1785680016; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K4g2kK4jDWITUw2uejvAMiPY148LZbRyudfCDbQMRog=;
        b=Tnxrnh589oqMIxPmyDrta04592tXuEq3e5T4viwtC8pRHA7VR7oqAWYkYUeEE46KwR
         XkJcHUHdD4qyVlxyf2YWHrkI76c4GvJXy7okkYEkPAw8Fqy2R4u/Qu0uGUGINsOeIchB
         OIzPGvN7mdov0NoSpHL7rU0EXTjzcvyXNtle+Oe8RHvC1j+k6mJLGhlm6La2vis9+jU2
         CYV3YBsLAuceCekRrYuuwaXyqKxfwDsy/O+9emgMLiyM1jFqIcme4PuWusjJoffLMPWn
         vA0iQkGMefHFZEP3Myooc3/FfMOlZymfHSZAHMVjK6k/Hm0NVZfH1tFJM3hMQNCdWTPG
         cazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785075216; x=1785680016;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K4g2kK4jDWITUw2uejvAMiPY148LZbRyudfCDbQMRog=;
        b=E2K9mfZKuN4xj3zjZEHqIbFRE//be0ZWCTNFX3X79pCSgG1YSzt+oGbsSraVNY2k27
         Wt0VvMmAGi5f6+QH+fliQIjecPPtTP930vbg+2HJFzG8K6d7CQKivwdyeu1Q0s0mi8l4
         sfB25PKjjOVrvcKzmRs3Mj3NKK0r1t0Nkuc46iCX+vigISQG+aR79Qhw1Q4s+kGmT0z6
         eJOZfGom4mxiN2lc34M7jLn5NurXWh6DY84L9kpiCebGCT+y08z+ara08ES3JwCOXVUM
         06n9c4mJVmnxJc1y1UyZKOaMVR1O9Cwad1yJrgF7bw7IfRyC05e2/0pRmpOPW/zb199x
         g2+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr/+dU1TUnxfG6wobT93uSdXsozr1+jn7NU7/THkJOZgZ49efvu7MZGWUYbvfALoMbECDfk@lists.linux.dev
X-Gm-Message-State: AOJu0YxDo8/Llaa8vJHK6H+hTSNk5LBcoCQ7/55dTrD17kW2qvmYXWb9
	XSm5UUHuSePblVE/VHxezScLoWpVHi9APgfLUQXxie4L/Po/Q5xM73VJ
X-Gm-Gg: AR+sD12558CqYDYlcAFqvFIjnruVHWNvJnJ/YmHsvWk6taJtA05K+qJBglTWugy3Lld
	okUtj8CFIhrr1mJt4tnJ5uDIxVfPTuxBnlb6XXd36Cd3F2hRHok4QjCXmPz6/mEbvDoSBpkjDbD
	2Fnu+ktsTSc42nSNmO7CK8hn9smM7yQdNYTqcfUKmPbxUR3kqFEbnN5MZh5Ymht3onCRDUmoNZX
	TGyz4fjPhDVgvJwDsuMQqD3i/HckmCSWLiVXor/5uEWKxfDN4KlXHz/sfn964Dk3wRZY5PJd7Fu
	5jTbgaxcHlPJT9V4H6wvdVGfgsm4M1TTJeJqV6nCzCTNxGzIIaCUUbwRJxb16JX8JiY7+ylmQhS
	Qk58FZI+P15yu2/fdaKMLOrhoVlGfdrtC+M5ErPzougUgqKlK44QKIM/LLGMr4XOLUdqd4YjsKS
	IljhTimJkHdLRzaJ5TViz1qhQ5ApSNAV825UFblas=
X-Received: by 2002:a05:6000:188e:b0:47f:921f:3a37 with SMTP id ffacd0b85a97d-47f9fea4346mr6495997f8f.35.1785075215987;
        Sun, 26 Jul 2026 07:13:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6dc25sm39925390f8f.33.2026.07.26.07.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 07:13:35 -0700 (PDT)
Date: Sun, 26 Jul 2026 15:13:34 +0100
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
Message-ID: <20260726151334.4c1ec6f1@pumpkin>
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

An alternative expression is -(j + 1) - 1
gcc (and I think clang) optimise it to just -j.

	David


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

