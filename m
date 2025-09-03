Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F672FB977
	for <llvm@lists.linux.dev>; Wed,  3 Sep 2025 11:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756898987; cv=none; b=DhH1U9+3oeHsZK4NrQ1mSUzRx85fwy7e8TOjS1XW+yUVQLk6K4L038AgobJlnX+kUiZof+kwOiV0XLqHE0kSFFBZH/KV3o14W5Zbq7+/ny0oNOOXqXqRe/+sejm4yuoIFrVeDHfM6i4hU6yX/uNY8oZaj468b74rP38h7vvHRg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756898987; c=relaxed/simple;
	bh=rw6wz5NQOjq/EnuLbRuHaXalQE2Zm2+zEhNAEkliz2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TtTZcMEOw4nEV6TXxqwOz0kGdUZ+TaDAgqLqyPPyhjj9+T2jBeQj+BDFO3BC2rAKPpl1oemBRwLxAmWQlfCvnCsDdrgmDLT69XknbMIjcPVQ7Zn2XgAMRjWW0uZ+BNM8uhbg31VFEPjTuiTONy1I6QNc+56WvguG+MP36nJdMyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fau6Bs8t; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fau6Bs8t"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45cb6180b60so2881445e9.0
        for <llvm@lists.linux.dev>; Wed, 03 Sep 2025 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756898984; x=1757503784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PN4TTv5XFjvH830QyUEf+r/ZdvnpoSsJPrnKjY9Ngm8=;
        b=fau6Bs8t7Ux7J8v3YprfEJ3iIFjoqKW/JeoZRB5leeiwEGH5UT4FaMFWxGhNeiItpo
         NZX5DEWeaw718VHdWhRG5wYWvMWsIRjCbLxK6Yd0vhL1N/oujgK3N+80rwGiBhMJJFMY
         M4NX5EiDnLfsHxD4I38cLZFVpinIqO6S7bS68en/vexnWORqlA0f4MjbFZTXcv6yMJrZ
         JNfqcbIJcZ6qL9fBoC3deaZWdGkY8wDQ4XYZ4DCO5mQ60O6PrP9k3fPIevm30uFvdNnR
         yqjaYPAn032C0nygxBxEVAfRqxCPgVQ49M/VuZVI8VmjTFuIhxVMFCYdMScs3DALfR7O
         Gv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756898984; x=1757503784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN4TTv5XFjvH830QyUEf+r/ZdvnpoSsJPrnKjY9Ngm8=;
        b=LOrrS23tWaQZmtF9uZF35KSAAslV0wGg/H+qK4KkqWwRaQAIJiaIC7QogfFo7sSTt6
         Malapza/aMi+nhra9WlKJEWpr2Ajgme8mR1MpjFQMW36p5LOTD/2P2I1jUhLPBHYOl8u
         4gbZi7GFIueD2CBIFkq2zD5NuN3Y0PbGhm4Cdwa0bAE5iM1Xoez6E7IZlHGqOhf3PzMS
         KsJ8KlCSVGX+Afu5pOaMZ54MN1X41G/DgtCMmnOTz7bilH6zWiCtWojRSGER8HoFcmK0
         E13OG21M5eQNuQ8qSDQqFJvEyAKJSbJeJlHOVOn80LE0KOV0VzmZWoyEi+J/qP5xDHDL
         ZkIw==
X-Gm-Message-State: AOJu0YyJeLueB5uuKVb+r4n1gA23M/ShqAqzsFC7pAV5LrhOl8j/XuQJ
	6Y8jzaYjyc8s19xnYRAyQ4xNYE4XBqxEFEdvoq+mZIxYF6DRnTKh70Qm+tBk6OuyrwY=
X-Gm-Gg: ASbGncuMJE6d2Vg/lcoWOPLDWyuVpqGdnwJ4jwKFcTnHcPYHkdLcpUTfRomAo5MJWA1
	H+jzyCcoL7cq5rLZ9vdYsW7MSuoxH22EwTjuaCM4ebT1cL3HE2C9fvG9t06dU3Ja5qLftKszb9T
	vf8fHRntnQ3lD4BaTTXUm+8OsPiRi86uCjW7nFdqCozgAVitPMdAfrbha5VdfLVHi/c24CWiPW2
	23K5mJuVW/2eijRHmSwQ853IPH6J979sKLMJ8FAuyrJPlDu3q2MBnVjaZRYi7Pb2zGCw3+sgh3b
	fywIn5R3mQ4CLWm0W/pbwSxuQSN5YZLqYGTVxpSr6uAHwGOHc0sorDwyZKBlLnlCNJM/s61gTsy
	XjqR8lnWU7b4OntcXArsxRebQrPrC1AOM+XjMQQ==
X-Google-Smtp-Source: AGHT+IGznYf+8MTlpk6cstRn1GL4tnhUVJ7amBoJ4nIX9Yue18MyS1rMtXsRUivUxsPxvksXGxAf7w==
X-Received: by 2002:a05:600c:1f08:b0:45b:765a:a8ff with SMTP id 5b1f17b1804b1-45b855333e7mr131969965e9.11.1756898983980;
        Wed, 03 Sep 2025 04:29:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b7e886619sm233540675e9.15.2025.09.03.04.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:29:43 -0700 (PDT)
Date: Wed, 3 Sep 2025 14:29:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>, dmaengine@vger.kernel.org,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Vinod Koul <vkoul@kernel.org>, Guodong Xu <guodong@riscstar.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250903 x86_64 clang-20 allyesconfig mmp_pdma.c:1188:14:
 error: shift count >= width of type [-Werror,-Wshift-count-overflow]
Message-ID: <aLgmpIlcBxH3klYp@stanley.mountain>
References: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYsPcMfW-e_0_TRqu4cnwqOqYF3aJOeKUYk6Z4qRStdFvg@mail.gmail.com>

This seems like a clang-20 bug.  It's complaining about an impossible shift
in code which it should know is dead.

regards,
dan carpenter

On Wed, Sep 03, 2025 at 03:38:11PM +0530, Naresh Kamboju wrote:
> The following build warnings / errors were noticed on x86_64 allyesconfig
> with clang-20 toolchain running on Linux next-20250903 tag.
> 
> But the gcc-13 builds passed.
> 
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
> 
> First seen on next-20250903
> Bad: next-20250903
> Good: next-20250902
> 
> Build regression: next-20250903 x86_64 clang-20 allyesconfig
> mmp_pdma.c:1188:14: error: shift count >= width of type
> [-Werror,-Wshift-count-overflow]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> x86_64:
>   build:
>     * clang-20-allyesconfig
> 
> Build error:
> drivers/dma/mmp_pdma.c:1188:14: error: shift count >= width of type
> [-Werror,-Wshift-count-overflow]
>  1188 |         .dma_mask = DMA_BIT_MASK(64),   /* force 64-bit DMA
> addr capability */
>       |                     ^~~~~~~~~~~~~~~~
> include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
>    73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
>       |                                                      ^ ~~~
> 1 error generated.
> make[5]: *** [scripts/Makefile.build:287: drivers/dma/mmp_pdma.o] Error 1
> 
> 
> ## Source
> * Kernel version: 6.17.0-rc4
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20250903
> * Git commit: 5d50cf9f7cf20a17ac469c20a2e07c29c1f6aab7
> * Architectures: x86_64
> * Toolchains: clang-20
> * Kconfigs: allyesconfig
> 
> ## Build
> * Build log: https://qa-reports.linaro.org/api/testruns/29752023/log_file/
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250903/build/clang-20-allyesconfig/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/32B39xPuITjxcbak13h2MrLZJP4/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
