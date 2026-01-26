Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311542FD7C6
	for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 11:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426208; cv=none; b=TGbbLEUnxQQ5weHtCZwuNvM7vE+g0D0ZXJni0WN04ptQuYWPZdgJftffnp5vlmTUUwZOyRaofMorEVWrYSB51aCAyXfQ3F7MrLhLyzjDkFypdDRNZ4l2nmyG2oL68KLAfDH3rqrFUHQ2SWKWuoegtFNqHRWftkxzQJ9JL1mxx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426208; c=relaxed/simple;
	bh=2ZPNkFD1GYPg9REcGzzprNZfL5xqiLr3nO094G5OXpo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MpNQU8PEghKQNjsW3bUgtCg7Wnln9hC/QcpABS9gUy/Y9/EPwq8oxa5BuhaAdLr8MFeDXtr/sxUkPAPtBHJOY4LMreLkVe4FenqXM/UTE2A8jPuOpLk5ybtB/jj+pYKcoh1htW0m3MyHQlCJppDvAhju/Nubn2KxeZl3nPyTY0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epkmrVPC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epkmrVPC"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb5810d39so2766128f8f.2
        for <llvm@lists.linux.dev>; Mon, 26 Jan 2026 03:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769426205; x=1770031005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HAjYG+JlexRkGuXEPqUsDPk/vmWfkY8Y8l3nBpAyV6M=;
        b=epkmrVPCFVkC/b6q8iMhn43883CFAphZz3F0VoHfNUCB0BwyfrmNhdFirNiCm0FVXB
         VnSlhn8Yp/WzamfIyTXgd1vriPfzb7pnk5NFKQZ874s1gtmMUbdu85IK5TuB64iAzIDA
         HR6vI+WDG4bzlQZgZsT+QuSA7RIqhsl62ilBGzxAizsZQYj0epEUzXGOSBzN+i4SMAp1
         tpBhxP23NZzUF36jkjwNIAO4NCN8P0h57yV0mvFaISI8NkQe3f4TCr/GGYXRkFbqbevn
         JtRKYTGxCpPVuMUKSZq66KDsOXsUAwEAAbvdmOyf68QQdn2DCnWvVgh1OiXgdfCWcWL2
         ynCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769426205; x=1770031005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HAjYG+JlexRkGuXEPqUsDPk/vmWfkY8Y8l3nBpAyV6M=;
        b=xIkpXZsLAOkfr1rsL7gOovt8zfdtce/H4pglMRHglZBV0LiMGECCcc3qbD7EnO27xN
         J5NTGLNjtIyaHab1BVGtK1uaR+RKDkza9q0W/r7EwTLpB7NxNlNwobwLpKgDwt/GOnPV
         wOFN/bMhXcUPkImUDTwTmUCGJzKzVkjYtUKyWpYahSSBJqwtck0tECQRsM59b1U6W37R
         63rMDd1OT9p7NeM8eP1EIGnSnJ8EJ9CPdATxTtSrnBSS/JkM0jMZ/mfU/PRTnMpMmYF0
         QzGc/rgAQZyf8qIV8BBdXUy/LVyi50puAkRMQ/HxkBtC8uT1OV77V1G36qEYl8OXF899
         H2iw==
X-Forwarded-Encrypted: i=1; AJvYcCV8PEEbi4GN9rsv4r32l762CAOPA9gBlcp5/ZA2qQptO5NghQNA3zqgsCwTKeG5Mra7CGpc@lists.linux.dev
X-Gm-Message-State: AOJu0YxG9jPxWYQcMx6D3/4+7LV+hCpJlaSD+/eZy1w/5BuyH7NKEZfx
	qffwiRfGJ0hBEGW3jiLTLiGLht2zBdGFb3H+3i85Cplw6mZy2Ray3zSR
X-Gm-Gg: AZuq6aKOFQ+7zoKD6PM3uM6z82aNPMUca71c4QmGHO9bHmE29s0uJ9cUO0jQzNA0xrN
	q5MrkXu0CG9u5sKK2HqVhouEgf5zU2Nu9elGAxdRvSwXiHnSRj+TbyuNHmCr45+d8rAphzNJu0x
	6+iSOJUYvdaQ9uPJm1TTDqSEqNRnc1rTRvTergf60kU4zJCq7PZLhPQBkYKiGs2Zd4GNXJ4/eaU
	7ZeDRodmfjM/+lnUldTBIj2wfLW1NRAzBwDCIrVvZ7YOAUl8ZPKW2B7fIXRr6JHH7w/hvN98E4t
	+itUzFKoBujYHL9w0Nj9ILlLIps/paRP38BC6SmenLs9jxdxfGVnKeDwQAX05quxHIBDVzRqoMs
	D9EMkmdyVx/MoGDXGyZWREqB0jyWUsAPeiAyOzD53jsLh9hBY9SxQe9q+0EtF1W87f21nxK3Vwj
	TThARMfIg5s/geM+AnwFsOcFvUBChOjK+0usnycSPiDxlUTMGDF5mW
X-Received: by 2002:a05:6000:184f:b0:431:16d:63d7 with SMTP id ffacd0b85a97d-435ca198c6bmr7095312f8f.47.1769426205212;
        Mon, 26 Jan 2026 03:16:45 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f744e2sm31432160f8f.31.2026.01.26.03.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:16:44 -0800 (PST)
Date: Mon, 26 Jan 2026 11:16:43 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun
 Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, Bart Van
 Assche <bvanassche@acm.org>, llvm@lists.linux.dev, Catalin Marinas
 <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260126111643.534c8274@pumpkin>
In-Reply-To: <20260126002936.2676435-3-elver@google.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 26 Jan 2026 01:25:11 +0100
Marco Elver <elver@google.com> wrote:

> Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> 
> 1. Replace the _Generic-based __unqual_scalar_typeof() with the builtin
>    typeof_unqual(). This strips qualifiers from all types, not just
>    integer types, which is required to be able to assign (must be
>    non-const) to __u.__val in the non-atomic case (required for #2).
> 
> One subtle point here is that non-integer types of __val could be const
> or volatile within the union with the old __unqual_scalar_typeof(), if
> the passed variable is const or volatile. This would then result in a
> forced load from the stack if __u.__val is volatile; in the case of
> const, it does look odd if the underlying storage changes, but the
> compiler is told said member is "const" -- it smells like UB.
> 
> 2. Eliminate the atomic flag and ternary conditional expression. Move
>    the fallback volatile load into the default case of the switch,
>    ensuring __u is unconditionally initialized across all paths.
>    The statement expression now unconditionally returns __u.__val.

Does it even need to be a union?
I think (eg):
	TYPEOF_UNQUAL(*__x) __val;	\
	...
		: "=r" (*(__u32 *)&__val)	\
will have the same effect (might need an __force for sparse).

Also is the 'default' branch even needed?
READ_ONCE() rejects sizes other than 1, 2, 4 and 8.
A quick search only found one oversize read - for 'struct vcpu_runstate_info'
in arch/x86/kvm/xen.c
Requiring that code use a different define might make sense.

I also did some x86-64 build timings with compiletime_assert_rwonce_type()
commented out.
Expanding and compiling that check seems to add just over 1% to the
build time.
So anything to shrink that define is likely to be noticeable.

	David
	
> 
...
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  arch/arm64/include/asm/rwonce.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> index fc0fb42b0b64..9963948f4b44 100644
> --- a/arch/arm64/include/asm/rwonce.h
> +++ b/arch/arm64/include/asm/rwonce.h
> @@ -32,8 +32,7 @@
>  #define __READ_ONCE(x)							\
>  ({									\
>  	typeof(&(x)) __x = &(x);					\
> -	int atomic = 1;							\
> -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
>  	switch (sizeof(x)) {						\
>  	case 1:								\
>  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> @@ -56,9 +55,9 @@
>  			: "Q" (*__x) : "memory");			\
>  		break;							\
>  	default:							\
> -		atomic = 0;						\
> +		__u.__val = *(volatile typeof(*__x) *)__x;		\
>  	}								\
> -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
> +	__u.__val;							\
>  })
>  
>  #endif	/* !BUILD_VDSO */

