Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732BCA5A
	for <llvm@lists.linux.dev>; Wed, 31 Dec 2025 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767213085; cv=none; b=JlXXxmAL9TuMxKvv99cJIphOr9BgUNhUdXKvUorb/p8y1/rRL75cuYDNGDsfIaO0BhACALoTQA39P0iBe838p7/CMDLhPhbk8fYnkL2tot+T/zit9VSKtHLyIzTWcyYfkaaq55ClioMDVER7V01o7o8+2wgrYgK6tfNKIFx6DMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767213085; c=relaxed/simple;
	bh=rpAyc043Ax5VQr8+dHc0LhLszXtoHwy4eiOIzYipxz4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PHjWW3VzjnNuj7tt5XLYOqkauvNkqYF+vftyyHXcGl/DzofsauhiEGEY6HLfIzCEdRWMWuuNincqj9tfFNRkOQbP2VmoEs5TXoOUOB3yL/kKPRf8sADy+TK5L5hfZZKDA3PscqpVU99WSA4HOBLo/64CT5wxmtPPR/asr59+uJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fcwke/Ef; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fcwke/Ef"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-3f13043e2fdso3681447fac.1
        for <llvm@lists.linux.dev>; Wed, 31 Dec 2025 12:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767213082; x=1767817882; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CkgP3P/JOmmU4SQIzQRxbAxKStjjkyO+o9UMdLOwKAc=;
        b=fcwke/EfYlncebRI8RqrYTBvO1x0XA7ayv1ic7phH9ahRQ/92zxGvLLNP+O5Kk3s/l
         Hy99Cgl31ypAkZBdH8/+SDrtAGnMR2wcoHdmLc4EohZxOTS7ezSrXvTpLjQalOkPHvMR
         G5v2i4U2mACqIEvUo1M9jrheoGwW9eE2UNWIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767213082; x=1767817882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CkgP3P/JOmmU4SQIzQRxbAxKStjjkyO+o9UMdLOwKAc=;
        b=ia6kxLdxPKwt074xN4Lj+XYqE7o8cAKW3kmQulk0UeOCvRzgcjIn7TxNJOAy3ptp2t
         zfO9qxvtnkibgBOqtQw7jiAtekKRvj09a7LDfCghByp4Sg9gAtm7R8dOpWGbGTB/QPWi
         LZMBoHO6FY/JuuUuBsojqCS4dJ+AHBjuKN1JQAK+AUVJgk+UvtI9FYX+qsSzMiMoc7Gg
         xOPAhH/LDHb3pI9Kc4z56RtrGeD4QnHceQVDM7Zm42/vDz8wKkIkb8AWswTkzP9ANVz3
         0YYVYZuBZWCIsBXXsHcYePanqIEhWcWnKd4XggbcyeQbrLa0s50bn89NLjkwHw7PyHAc
         k1yg==
X-Forwarded-Encrypted: i=1; AJvYcCXafpCMeWgReKo11gcOkUypmC8yzNOMpboJkvHuEmkad1xmjiNIvxJy6rcOcdCDDXPx0efj@lists.linux.dev
X-Gm-Message-State: AOJu0YwbeNBbhAcaVrag/qE6Xi2ZUvx1GKhSLHWmJnSGv4eZZXUAiEM/
	iS9VBU/UOZAfwPqaYcMLnBPAXiIDu74yolt1nKfPfBInygJRO9Hw8GidD4Atb+Ogj2I=
X-Gm-Gg: AY/fxX71NPEFMbdIDxeEgMRoldXhxHDyqGMMYBeDpUJsPRrRElEvVyn1AE6+tlZtlF0
	XxDrCC/tQ5+jqe6xcB3FCN0qJ1g5/dFveR3cgpWa/BXiqR9fS4VK7RQyeCVhHJustK9rZX/sZGw
	r66SmAxDQffHmL3wm62CSUSSbsVGXkaUvPb4POFlAzv6GkkWI5IqbMscqygzNSu6wmOzyhIFTqO
	IGQ3iYgo7UyRtsrhEebCMUF5ySoryYpIoxhcvdFUdy5WyIBTU0mBXrHzG0aCoPGSmJNbQrJJZv6
	1NzdVJibBZeRhxtn4p+V4HiklWJOhpiwjbxYxU5cOXpagSyz1RrT/FmHoI77nqwHLDW5tEOwqI6
	Nb2GD15KDy4We0hnc6zukx3W3kwnlNpSqBzhmi3JUG7FpfNeQeDWJUhYFI73nZfJU2lXaJvoSYh
	4XG/ffYkLhICg65SkWKkivyEWRMagH6p4/1Q==
X-Google-Smtp-Source: AGHT+IFZAkPcKJ2uTeFxS+roZ678AbK78d+9mfwo6bn/TTYmxsIJ+R5E5wssgjSFb8Ze3mX//4DEXQ==
X-Received: by 2002:a05:6870:d691:b0:3f5:d9b0:567e with SMTP id 586e51a60fabf-3fda5666a5cmr18296581fac.14.1767213082037;
        Wed, 31 Dec 2025 12:31:22 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3fdaabbadacsm22960637fac.15.2025.12.31.12.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 12:31:21 -0800 (PST)
Message-ID: <3ee8406b-1789-4a18-8637-120fc0c62a99@linuxfoundation.org>
Date: Wed, 31 Dec 2025 13:31:20 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kselftest/harness: Use helper to avoid zero-size memset
 warning
To: Wake Liu <wakel@google.com>, tglx@linutronix.de, kees@kernel.org,
 shuah@kernel.org, nathan@kernel.org
Cc: luto@amacapital.net, wad@chromium.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <871plslxsw.ffs@tglx> <20251224084120.249417-1-wakel@google.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251224084120.249417-1-wakel@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/25 01:41, Wake Liu wrote:
> When building kselftests with a toolchain that enables source
> fortification (e.g., Android's build environment, which uses
> -D_FORTIFY_SOURCE=3), a build failure occurs in tests that use an
> empty FIXTURE().
> 
> The root cause is that an empty fixture struct results in
> `sizeof(self_private)` evaluating to 0. The compiler's fortification
> checks then detect the `memset()` call with a compile-time constant size
> of 0, issuing a `-Wuser-defined-warnings` which is promoted to an error
> by `-Werror`.
> 
> An initial attempt to guard the call with `if (sizeof(self_private) > 0)`
> was insufficient. The compiler's static analysis is aggressive enough
> to flag the `memset(..., 0)` pattern before evaluating the conditional,
> thus still triggering the error.
> 
> To resolve this robustly, this change introduces a `static inline`
> helper function, `__kselftest_memset_safe()`. This function wraps the
> size check and the `memset()` call. By replacing the direct `memset()`
> in the `__TEST_F_IMPL` macro with a call to this helper, we create an
> abstraction boundary. This prevents the compiler's static analyzer from
> "seeing" the problematic pattern at the macro expansion site, resolving
> the build failure.
> 
> Build Context:
> Compiler: Android (14488419, +pgo, +bolt, +lto, +mlgo, based on r584948) clang version 22.0.0 (https://android.googlesource.com/toolchain/llvm-project 2d65e4108033380e6fe8e08b1f1826cd2bfb0c99)
> Relevant Options: -O2 -Wall -Werror -D_FORTIFY_SOURCE=3 -target i686-linux-android10000
> 
> Test: m kselftest_futex_futex_requeue_pi
> 
> Change-Id: If4fdfe6ffcbe9736fbd8f66b2453e8cbbb95e25e

I removed this before applying. In the future remove these
before sending the patch - running checkpatch.pl prompts
you to remove it.

> Signed-off-by: Wake Liu <wakel@google.com>
> ---
>   tools/testing/selftests/kselftest_harness.h | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
> index 3f66e862e83eb..159cd6729af33 100644
> --- a/tools/testing/selftests/kselftest_harness.h
> +++ b/tools/testing/selftests/kselftest_harness.h
> @@ -70,6 +70,12 @@
>   
>   #include "kselftest.h"
>   
> +static inline void __kselftest_memset_safe(void *s, int c, size_t n)
> +{
> +	if (n > 0)
> +		memset(s, c, n);
> +}
> +
>   #define TEST_TIMEOUT_DEFAULT 30
>   
>   /* Utilities exposed to the test definitions */
> @@ -416,7 +422,7 @@
>   				self = mmap(NULL, sizeof(*self), PROT_READ | PROT_WRITE, \
>   					MAP_SHARED | MAP_ANONYMOUS, -1, 0); \
>   			} else { \
> -				memset(&self_private, 0, sizeof(self_private)); \
> +				__kselftest_memset_safe(&self_private, 0, sizeof(self_private)); \
>   				self = &self_private; \
>   			} \
>   		} \


Applied to linux-kselftest fixes branch for next rc.

thanks,
-- Shuah
