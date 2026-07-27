Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4EAE2F49FD
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 01:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785115987; cv=none; b=sBWl19ECqWoTy0zjW4mIf0f/1olUNRbbNn0PosTI0aUOjgHkLyBTuXWvrCxKOYD4k3tSqPeptI97CqvL1NdXL1x+TrsB5E1lZdwkb+p5HCR88uhxVQMm1FjDyDiADoJJmlevb5uMU6czqzffnka9peTyOvZBetiAsErACO1/8D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785115987; c=relaxed/simple;
	bh=JvhlWiHubvipXGwiyYDoGh8n5w2sId5TPv7IkZCZSf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uqejXWSKJddSlRg9BKoei4aVceezOvlQZWRZNzCpxUHJDMPi3SEULzz6ZOwvwqDPbgzM9CDGPp5DKojWy0FwwJJCuNrBmEDiUPjlwvvNz9TSLbSAF7RhMtj6U/xpCDOHRJXW8//d8GSxPdM2ppUABMye207xPe7TQzbJIGyQEjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=f7BJpFft; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="f7BJpFft"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38511175ad3so1383224a91.2
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 18:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785115984; x=1785720784; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QS8YqykbG3lvtABz9lYv5yB3o6Nx9CfZmlJ/xUd/ZDo=;
        b=f7BJpFft7sOt0pv6CoIbWml7RA9oR6WvdEClzDawDCZwIxKH5BfF7XbVHV43v60Phj
         IqReAWz96J5B2UqWImzhXZGN+PrV9pAr23fdfdF5/SRAWDk/x3qHje0UTHmTQKJ1rl2P
         7j5x+b8ojyi2Vuf6/T9wIGiDuA8Hz3suQKd2X2PH1bKrEjx5pK13ZNsjkZvUVs6k+Ndc
         3aAtC1qJG2+opsD1AbRKvD7yu1JoeXxmdN9JIjjlNq9xT8S10XiwR9Y3/KyH2GFpAY5k
         7ER7CEwgAty5xkImhf83uJiO9PxU6xpXhhmm58JtLz0PtripI3j19Er0w+QzZUSjJOOH
         zQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785115984; x=1785720784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QS8YqykbG3lvtABz9lYv5yB3o6Nx9CfZmlJ/xUd/ZDo=;
        b=IQrGySZjv5OcJoDFXpiaCAUL3GEihmAI4ac6Ax2nF1I7orKMwD/ihGkca5DYWgKJHo
         uPyscIiN2AEe39RbKiLoWE2FKg1Jmwzzq4QXVyv8wR1PMLuxqAEDHEkNDagLuk4tY+yO
         P8npoAD1UgOaBsN2wwjL1xkT/NkchkPYz6AAtF7H7SYFV1/bPlU67tZFdmQ+Y8tzRMuW
         swQ9GmvE2F8VsolQ3ZxvHmM0DdXz31gt6OfU0DYdL4atEas3y+KErGzfvp6HiGn9C9Yz
         WVhkJfMEkWRa7vlEGu/eTRQvBQ8w6Si22Z8AOG3J7n61ZCgSQZF4hKGy+zodgSWi4TmX
         NabA==
X-Forwarded-Encrypted: i=1; AHgh+RoXqqSIoqMYx5wDj6ryNnFEfysyBqFrUqB03Ysu3gpq6WceA2nAyC3gVAHF8SmL2ipQmW5Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwHQuywU542uf0mMRUuLeOcAkMw2XS0LiN+Ps16UmdbszKla+S7
	6YOrAfwrFXTydkaq1TTQyAeDEA4ksYE7+LX+gYqEvFDNdElZqiPdjyIi5ggdT+9TojI=
X-Gm-Gg: AR+sD13Xl9Tfl5Oruh4BBn7DLYRjdM3obrBPAsFC8zQMQsA17OhZ6zqApG3oj/HTa3m
	FySVJfkqudRwRvw/IeoLpMkLXNzNZEcLM2ac7DBOtqwqNCL58BZMCatoowYAd9kOZoICWGll4Hp
	ISQhcB18pe4C6TXSgyFqJYG9fk6RVpdmQoat3tk0GdYBGjrYcuzvPvnxPBNN0Moiqgsh1hOdb0V
	DfK5TuHl9d5SB5ygIwQvvGU4htLYrH6z6SI885S7eKAGpms2dadP/K+k2zH+9J+CCAoPK++f3KE
	WXBLSbtU1XmERG7N1YPvyDPMvaIwTKH7dNyVQL960boMCpPjc1PFtaLjJr73sA9xj5HXm+7TFrQ
	va6as0ls8lr5yr8AqwqdEekQVPtwGnvm1b3eU9/QbtRgwhI+p3+JEcQ/ocsz/UDRNaMKRe47JnR
	34k2yK+8tLEFDFMsXKuu/HVdyTCv5S8mPIfM725Aa0eUXx11pXXwes3v+G5mg28TNuzjBTImQ=
X-Received: by 2002:a05:6a21:695:b0:3c3:64cc:311a with SMTP id adf61e73a8af0-3c67dd65ec9mr6364557637.22.1785115984125;
        Sun, 26 Jul 2026 18:33:04 -0700 (PDT)
Received: from ?IPV6:2402:8780:1329:2779:943f:461f:3cbe:df62? ([2402:8780:1329:2779:943f:461f:3cbe:df62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e53094d65sm18958049c88.13.2026.07.26.18.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 18:33:03 -0700 (PDT)
Message-ID: <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
Date: Mon, 27 Jul 2026 08:32:58 +0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] selftests/nolibc: add abs() range test
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kselftest Mailing List <linux-kselftest@vger.kernel.org>,
 LLVM Mailing List <llvm@lists.linux.dev>, Yichun Zhang
 <yichun@openresty.com>,
 Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>,
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 gwml@gnuweeb.org
References: <20260726101306.3772237-1-ammarfaizi2@openresty.com>
 <20260726101306.3772237-4-ammarfaizi2@openresty.com>
 <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
Content-Language: en-US
From: Ammar Faizi <ammarfaizi2@openresty.com>
In-Reply-To: <8bdacaf3-7f93-4095-8875-4c13a273fe3d@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 3:00 AM, Thomas Weißschuh wrote:
>> +/* abs(), labs() and llabs() over the whole range of their argument type */
>> +int test_abs_range(void)
>> +{
>> +	int i, ri;
>> +	long l, rl;
>> +	long long ll, rll;
> 
> Reverse xmas?

Fixed for the next revision.

>> +
>> +	/*
>> +	 * Both the inputs and the results have to stay opaque: the compiler
>> +	 * knows abs() and friends never return a negative value and would
>> +	 * otherwise fold the comparisons below at build time, which would also
>> +	 * hide the undefined behavior that is being tested for.
>> +	 */
>> +	i = INT_MIN; l = LONG_MIN; ll = LLONG_MIN;
>> +	__asm__ ("" : "+r" (i), "+r" (l), "+r" (ll));
> 
> We have _NOLIBC_OPTIMIZER_HIDE_VAR() for this.

Oh, I missed it.

> Maybe it can be made variadic.
Sounds good to me.

Does the following patch look good?

From: Ammar Faizi <ammarfaizi2@openresty.com>
Date: Sun, 26 Jul 2026 13:17:14 -0700
Subject: [PATCH] tools/nolibc: make _NOLIBC_OPTIMIZER_HIDE_VAR() variadic
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The macro only takes a single variable, so code that needs to hide
several at once has to either repeat it or open-code an asm statement
with a list of operands. Accept up to four variables and build the
operand list from them.

Existing single-argument users are unaffected; the code generated for
the callers in stdio.h is unchanged on i386 and x86-64.

Suggested-by: Thomas Weißschuh <linux@weissschuh.net>
Signed-off-by: Ammar Faizi <ammarfaizi2@openresty.com>
---
  tools/include/nolibc/compiler.h | 15 +++++++++++++--
  1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tools/include/nolibc/compiler.h b/tools/include/nolibc/compiler.h
index f2d7a81d0d7c..ed69f6d26f56 100644
--- a/tools/include/nolibc/compiler.h
+++ b/tools/include/nolibc/compiler.h
@@ -77,8 +77,19 @@
  #  define __nolibc_static_assert(_t)
  #endif
  
-/* Make the optimizer believe the variable can be manipulated arbitrarily. */
-#define _NOLIBC_OPTIMIZER_HIDE_VAR(var)	__asm__ ("" : "+r" (var))
+#define __nolibc_hide1(_1)		"+r" (_1)
+#define __nolibc_hide2(_1, ...)		"+r" (_1), __nolibc_hide1(__VA_ARGS__)
+#define __nolibc_hide3(_1, ...)		"+r" (_1), __nolibc_hide2(__VA_ARGS__)
+#define __nolibc_hide4(_1, ...)		"+r" (_1), __nolibc_hide3(__VA_ARGS__)
+#define ___nolibc_hide_narg(_1, _2, _3, _4, N, ...) N
+#define __nolibc_hide_narg(...)		___nolibc_hide_narg(__VA_ARGS__, 4, 3, 2, 1)
+#define __nolibc_hide(N, ...)		__nolibc_hide##N(__VA_ARGS__)
+#define __nolibc_hide_n(N, ...)		__nolibc_hide(N, __VA_ARGS__)
+
+/* Make the optimizer believe the variables can be manipulated arbitrarily. */
+#define _NOLIBC_OPTIMIZER_HIDE_VAR(...)					\
+	__asm__ ("" : __nolibc_hide_n(__nolibc_hide_narg(__VA_ARGS__),	\
+				      __VA_ARGS__))
  
  #if __nolibc_has_feature(undefined_behavior_sanitizer)
  #  if defined(__clang__)

-- 
Ammar Faizi

