Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974752BEC5A
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769001013; cv=pass; b=ckuR6p3r6tITX75TupnT+vED0S1KBFXxhSRV2H5hqkqxxeMb5/7iiLU3oso4mkcSt/82r9zwV2iMMNu4/U+c8jeoBqraclAtC9r8pML+tEQcrs2jFkDLBYkf+DNJf8gaGVN+uXe9bJaJn5g1toAm8J0jpTpi+FpAOxqp9v54Le0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769001013; c=relaxed/simple;
	bh=/B1jEPlElOZNhNSdkMUyAwdIAc+OFvKri5E6BdtheSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGMMq4ZldYqgTGnWFaFkN1VSNu1lYeTGQCJs1WuyHA9JTale6SU0VR/BN/+2mOlL3lChX1pP+FFOHTQgBC/MFBa5CO2b4miV/K3W4jgT/UeS2CiShUz8v5GnaHp0gr7iB7tQffP0CScD1uneIGzu8y2Mk0icx3OJlrtrVgvufNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xR7/nwE3; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xR7/nwE3"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12460a7caa2so4610044c88.1
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 05:10:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769001011; cv=none;
        d=google.com; s=arc-20240605;
        b=SEPlaW/zbMfGvf3l6w7e2Yj4nVHEJ8Puo8dysnxDJe4Pae7xe3TGa3i3oM1w9Xwyo1
         EO4eLlzyt7ZeRf1bJQLqy1qqDa/CbpzyCErBcAdEkkPzrQnAFxK9PU26mT3eY6HrWri0
         s2+DTLx9yLXQlsTu4yZwE3VcxVTs8Km3bcgtnrjMpIPDRBxYHQ5Ot7FFNs1kb3fH5HrU
         QyqtQ0dRTZUbSTh3JwMYkEBpVIYUhNA0l9UDImM8GTBDaK4WPzIOV9VxhJPEdOmx86Qw
         wOWNuzzIlCkYURlaBVTjg94J77f2CbvF57sxqp5zls6hOzo2WjeLqRbpArI6yZPc2IK9
         AxGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ben6bGu5AHpnsFfREI2hM3W+OdR4qmoL0ILJvtycj4U=;
        fh=nr4o8qrdbz4UWke6mzFKqqRvVRmnQISRlzfvHOjXe1o=;
        b=VOPhkMp4gjKh7lxnNJIhV94qwYCko0lLnTt9B4dm4rBXEwNMZoP9H2wXylwhwj90hh
         F/yvvPu+hzjTwBH6NJs4MR1Use8Lf/JiiZe/Ji2Shga0KlkdFOrEcMmj4gRr4dKqKXWH
         qFmRJ43r/hvJtzGNOJRyMDPfw3ASqJsIo+KcrjKIMIjH733Cmt2IdQOXea1vKDkbHDfU
         PiWl8L4xCk8RmK12D93r+jawmcvRa6grhsd4FLrAqUjkrfiO1Z9mB+gGyWbopXvpvFB4
         D0NR6QwioDrwL0hvrK8LJVUb/QzFwwG0gxV3S7oGPbHG6vaYMK3agRugDQLnXhOpeLgA
         cAhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769001011; x=1769605811; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ben6bGu5AHpnsFfREI2hM3W+OdR4qmoL0ILJvtycj4U=;
        b=xR7/nwE3xL1Q894rw9GGi4/E1VpQl3icjHt09TFg9fMoyfLl2x7XZLgnmovefszMop
         eHoiGV7++8XAV4QpmXva79LUyRa4Tw4Ec7MsIdlM+Adi4h6+LrHbkenRsfvUqUCvMwQU
         MTE6abSc9z926xs87j+mPUcx0d0x7VlmtMUzUxnLQKKVdNJ8y1+BNYHiotsvHNoxHDZL
         zsXzlBcfZbuPa2OudF3QYKVHCqadoBcFiVHJxroutsHeF/mQuQ6dDQ8Mh1BrdTHWpKwt
         frMOWps8zyFLNCjBjv6oFSXfu0yiGNdOz50+CyBP6gdQyLLxVQIr4b51zbBUJMsfq5s9
         EHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769001011; x=1769605811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ben6bGu5AHpnsFfREI2hM3W+OdR4qmoL0ILJvtycj4U=;
        b=IrlNtuVx4r/6tqqhSz32U2wzTmPyz2ZIg5xuDCK8gCphVXCh1cPelhjJ8nf39QOyTn
         7HyNCBfQ275H6BfflnWEQeoHQ3dKdgjnLJVon20Qi4mpz7R0OGHlUfN+a2YX21IZG3mr
         DcSgVZF8EGapA+U2VhB/aWODqfkMqnbeBK3CEgvkkPFX2wJf4lKlQgAWkf6kXSDKz+2I
         BDAPptpNY9ORWK/YycdpwxM7eOwMpAfAJsDq36YeBMHF2mQ9MmfIjwvy/WZdRJjAc22H
         5mswsFHLcK09V6UDfkmz16zaoBYKiPPBWlBia+geqQpc+1g2jCZFPOF7bZsGqqROdZBP
         aSFw==
X-Forwarded-Encrypted: i=1; AJvYcCV4nge1+qQxdZ2/BKQIgZt//PV5n2LMfgJfag1iwqUWTIsPmvUMEPrl5AHjiCSkqGijzReB@lists.linux.dev
X-Gm-Message-State: AOJu0Yye2Yka3BQvHjNh/o3mDl/27pIgMPP/l4tQf4JW0Gc3Fd2flMfA
	LJeXomlF0DW10dWczgu9q4xWxs+72vhxqW2HEjhKXioFpBJwBvPAgBPWFqxuMywnpXiZ7OmAbHq
	HDQlAh13Sc1zmU3KrcxM+VTTE6YJ8rxeGaPUaVudi
X-Gm-Gg: AZuq6aKkf36EAx9c/WEpkzFVy0QMYDir4IpBYSEd6xK9ZFr28e23jjpQmXNFe3gPGUy
	V/74J5lgdi2DphhL3NRchFxxX73TFBYum5vdvZpKVdSCLty7IDb7TxxfgG13Dkn7GvNmk4XH3Ns
	KEU4HDYG8HPjrqg2z+wDO9Rg66/ovc7KeBYVa9F+tfmwDm9oEfey9m4AjNS0XoEeMjfIBlIlLlY
	DOYPiA7jvvG8lheiB0Pw3hiPfbdlu/Tv5lk4SpSZfBmc/pI32FHMir8/RSVXDFzlTMtsUSMprpZ
	FE4hxvv68dSQYooW5kIxqdzN4A==
X-Received: by 2002:a05:7022:e24:b0:11a:44d1:533a with SMTP id
 a92af1059eb24-1244b31ec9emr12895969c88.12.1769001010131; Wed, 21 Jan 2026
 05:10:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121110704.221498346@infradead.org> <20260121111213.634625032@infradead.org>
In-Reply-To: <20260121111213.634625032@infradead.org>
From: Marco Elver <elver@google.com>
Date: Wed, 21 Jan 2026 14:09:33 +0100
X-Gm-Features: AZwV_Qiaz5GDO3yyZ-qh5TMk8a11eEOHvH0aJxYp1zWOK0pBTU6bkcluguFFSx4
Message-ID: <CANpmjNP0u47EfcVa+WaicLBpvqhW47JCPQ5ENwh33QUWpN5=bw@mail.gmail.com>
Subject: Re: [RFC][PATCH 1/4] compiler-context-analysys: Add __cond_releases()
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, bigeasy@linutronix.de, mingo@kernel.org, 
	tglx@linutronix.de, will@kernel.org, boqun.feng@gmail.com, longman@redhat.com, 
	hch@lst.de, rostedt@goodmis.org, bvanassche@acm.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 12:13, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Useful for things like unlock fastpaths, which on success release the
> lock.
>
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Marco Elver <elver@google.com>

> ---
>  include/linux/compiler-context-analysis.h |   32 ++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> --- a/include/linux/compiler-context-analysis.h
> +++ b/include/linux/compiler-context-analysis.h
> @@ -320,6 +320,38 @@ static inline void _context_unsafe_alias
>   */
>  #define __releases(...)                __releases_ctx_lock(__VA_ARGS__)
>
> +/*
> + * Clang's analysis does not care precisely about the value, only that it is
> + * either zero or non-zero. So the __cond_acquires() interface might be
> + * misleading if we say that @ret is the value returned if acquired. Instead,
> + * provide symbolic variants which we translate.
> + */
> +#define __cond_acquires_impl_not_true(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
> +#define __cond_acquires_impl_not_false(x, ...)    __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
> +#define __cond_acquires_impl_not_nonzero(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
> +#define __cond_acquires_impl_not_0(x, ...)        __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
> +#define __cond_acquires_impl_not_nonnull(x, ...)  __try_acquires##__VA_ARGS__##_ctx_lock(0, x)
> +#define __cond_acquires_impl_not_NULL(x, ...)     __try_acquires##__VA_ARGS__##_ctx_lock(1, x)
> +
> +/**
> + * __cond_releases() - function attribute, function conditionally
> + *                     releases a context lock exclusively
> + * @ret: abstract value returned by function if context lock releases
> + * @x: context lock instance pointer
> + *
> + * Function attribute declaring that the function conditionally releases the
> + * given context lock instance @x exclusively. The associated context(s) must
> + * be active on entry. The function return value @ret denotes when the context
> + * lock is released.
> + *
> + * @ret may be one of: true, false, nonzero, 0, nonnull, NULL.
> + *
> + * NOTE: clang does not have a native attribute for this; instead implement
> + *       it as an unconditional release and a conditional acquire for the
> + *       inverted condition -- which is semantically equivalent.
> + */
> +#define __cond_releases(ret, x) __releases(x) __cond_acquires_impl_not_##ret(x)
> +
>  /**
>   * __acquire() - function to acquire context lock exclusively
>   * @x: context lock instance pointer
>
>
