Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C011DF72C
	for <llvm@lists.linux.dev>; Mon, 27 Jul 2026 02:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785117676; cv=none; b=ev0dUf1IA+0WawRE0mVNl3o2yxpFK7V37UZ74yVlMYGm+bBbfUsb/j/hz1E9QnepV7/vm0aukp5WNLhemb2nVnR+gKQDvP+MUl8wAcdyUbJIuTkxR+haei5LG3mDg/eteZANZl72I8XnvZGMGPLzrSCMmXxTV4ixn5FKPDF46Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785117676; c=relaxed/simple;
	bh=beGwk2ll/Kvg5JK6MK4vn6gQZ/EyqfU2I1zL3w+Koco=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=avrF+fbqDcq7vqvGwWjgmSNgiA4M42Mxr1V5Tc/uMZYoMRIsQW6GQYUCeZjm88vb7GxAK2SnahOND4vGQogJQE+MqstTdqZJsfTsZuCJNb0I+ZurhSEsLDJ2Kf8r6l37OsG1lMKesy4LkYF813/kOySpE9R3OUeCiiyH/IJ/eTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com; spf=pass smtp.mailfrom=openresty.com; dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b=hzdXbh6h; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openresty.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openresty.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openresty.com header.i=@openresty.com header.b="hzdXbh6h"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f0f132f56so1393907a91.0
        for <llvm@lists.linux.dev>; Sun, 26 Jul 2026 19:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openresty.com; s=google; t=1785117674; x=1785722474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=q1yc0HP4n9/5TsAEOfrGcMa0kXz8+ZC1koTHwFdPfKw=;
        b=hzdXbh6hCweafAqmocOcGlofqjVAzDT0MsiybFGnRxG+FY7fqCCawaRy4EjL9KhjCV
         xnL7gkcvyOEYWyOLHiecVDjynzlKVR2YeLFpJJmRVcdQIqtiA84gs+NQnOk8sw0LbdAc
         CxYdaHjttCnFkumQjFM4GkVsQZrxZR3XydPEVaSivbMkeABdEJynw2G8zUp2cFTBUYI8
         lFp9X+vT0tkbqO/uGXo8bfOOLxiGE9PQc3e+cClYXRl5g2NT9WakJlxpTxx1W4OXx15B
         rQMfGnySQ/uk9dcZklE7qxEw7n1BqayLABZNJTqc6jrimvUXMBdJtstmlAMab/DlVy0B
         MkBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785117674; x=1785722474;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q1yc0HP4n9/5TsAEOfrGcMa0kXz8+ZC1koTHwFdPfKw=;
        b=Cdw1D3eKpsrDplfXR++Yu066qAPrPAU0vXp2HY1+mdjcAHlB21ue7BBa1cliPjKGwu
         94OgStQ4XT1LzEBBTxEJngIM9F2p7+W8/2Scoe6eONqYjHk2NjNqyc1hMzGvaY4gIdrn
         ec5CtNMK7+z6uWtnSZeau4OkxlVxZl2WIVKiyxoith7/U6Ty2+QF4102e6Peg19VxFby
         LS/AVZP3oZtBoRLeQuXYORSaucZifwTUxzM+nStbYCZKthV2WZ3I5qr/OXT2pMcYyjDF
         AdoRxxWUKa0O8ObvshUjiIi4OuGGybkF9VrGjMdliryv6BGssFvZRnIX+rQ4wKZCeNvq
         QY6g==
X-Forwarded-Encrypted: i=1; AHgh+RpJ94fXOQSJcRJjxoBXeFYRLnm8AAtK4+aAHQk3QwFKFH25BtXKUXVqIsncIKy+vV0RBwXD@lists.linux.dev
X-Gm-Message-State: AOJu0YzD6mFvBpMb5ALM/RIFd61DPc1Zhxos7OeahFO7fgyaFprVMBFA
	Hv1CF03HaXU0RxQdDFXNWujVr4aNbVNVRHD7CrRGDk68Ymi+neSlx6GiMBoq9NvCoW6f9wQXoaW
	A2t9Zh3n/ig==
X-Gm-Gg: AR+sD11EyBR1bRxAK7D5g6SsxLWO4G2dNly5B4jlN3akQMluz0SLweI3g9GlhPVrtG9
	SL9ZEsx8iWi9H9jEZPHr3KOZ7f5aezw+npNg1eey+yP+bkPDzghoOURj4HoJUI6cbq76gAu1Vcf
	ZWOTvCcSATSzS4v5GSexIDpol5mazAB/0M+GFuqB3+CsdyeWJZhcsmmguFUo00o/P0SeEsnZuWq
	NO+llpv8eJ82nY17xLkKSscwdnHn4o4incVovFLKV6gTEjgLGnIBxXcIsHRBkXcVIjprcnd2vrh
	2DN/LSfJiOfQojQ2jjbgRsVzop857T8LuaDfDpBndBxW7gWjmDt/R1g1nAWcKo8ankLTZyq/V0h
	aZeDB5nXZtUtsc3uPBBtDa0Cn3imPyrRz6YQqP8Yt01zE/cX9cOzQ21MZEkTrzyiAXRAUx8JFV7
	Mp2yIDBnhH3lF2QntbxaZI4JPEjgrAnNf9YeTyFgTszcJUm9L1wI2e0GLR0iJUFIh/9m6nFno=
X-Received: by 2002:a17:90b:2d83:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38f1f005916mr9214393a91.16.1785117674140;
        Sun, 26 Jul 2026 19:01:14 -0700 (PDT)
Received: from ?IPV6:2402:8780:1329:2779:943f:461f:3cbe:df62? ([2402:8780:1329:2779:943f:461f:3cbe:df62])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm44855913c88.10.2026.07.26.19.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 19:01:13 -0700 (PDT)
Message-ID: <4e22086c-8a60-4965-8d78-a946dc54eaa3@openresty.com>
Date: Mon, 27 Jul 2026 09:01:09 +0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ammar Faizi <ammarfaizi2@openresty.com>
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
 <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
Content-Language: en-US
In-Reply-To: <6a5f7481-124f-48ad-ab44-577b12d33592@openresty.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/27/26 8:32 AM, Ammar Faizi wrote:
> On 7/27/26 3:00 AM, Thomas Weißschuh wrote:
>> We have _NOLIBC_OPTIMIZER_HIDE_VAR() for this.
> 
> Oh, I missed it.
> 
>> Maybe it can be made variadic.

Oh wait, tools/testing/selftests/nolibc/nolibc-test.c is compiled
twice. One for libc, one for nolibc. The test cannot use
_NOLIBC_OPTIMIZER_HIDE_VAR(), it breaks libc:
```
$ make -f Makefile.nolibc run-libc-test
nolibc-test.c: In function ‘test_abs_range’:
nolibc-test.c:1756:9: error: implicit declaration of function ‘_NOLIBC_OPTIMIZER_HIDE_VAR’ [-Wimplicit-function-declaration]
  1756 |         _NOLIBC_OPTIMIZER_HIDE_VAR(ll, l, i);
       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
make: *** [Makefile.nolibc:278: libc-test] Error 1
```

What approach do you prefer?

-- 
Ammar Faizi

