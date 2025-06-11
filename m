Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E17520F07C
	for <llvm@lists.linux.dev>; Wed, 11 Jun 2025 16:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749660467; cv=none; b=Wfh06iAW7eXVQocShjXLmGVF3I3VQxRBa8Ujph1Uieuu4nEdOgvGLRNCxCeth0YTUnvxxwaES8dHG1JB8rCchZP2g2Yd10PBXD/TOoy5vMVPqKFqeA5vBUiONxw6pUJ50Rrjh3jusOhRWXM9Lns1CNVxt2POuCfh/MeFZqoMHLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749660467; c=relaxed/simple;
	bh=B9MohXx4AXA4k+FrYa3U3UV1gxDApK8skRfveXG9R7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNaKjbsiwUAOaLsGLR/Kydw+wjmw8TSL29O3ou0WITXq7xOpmCVBbEzm4E9Ysgma21A1RyzCiPJbTqTYvKBxUi/70aCIfsqcedslmF4/0DXh+FmdtOLeo7ADsUwWQN87H8/b8hTnsiJ4u6E8uVeJic2WeCbXmDbECGmV0g2iSRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bf51SIfO; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bf51SIfO"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a35c894313so80700f8f.2
        for <llvm@lists.linux.dev>; Wed, 11 Jun 2025 09:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749660464; x=1750265264; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aa2QXtJbJhCTINUZzXosw2JXgzKQuhbyrlej22q07Vo=;
        b=bf51SIfO98nmMT9RXQnx2nkya+pLPbzI/xWrlHHh6RqNLR1pdtRFvWfLViJIcc6GHl
         G+aL1rKb3Pwq5FDu17pgpDUjmGoUyEsAGps56vFj5LCAC5hIwg8Ewu0u9L82chQjWCae
         qhGPnkN9Dr9z6yH4wJHkXtvFEHNFB0KattjYyk9QhrU5UeCkZji+DwV14uc4Yt3VvfL1
         WOMFzBtsTOyUUCz3BpPO4yP3rKQBX69LDqGh23v3AeIaIz9foUWEGJNax1tqDlbcD6iQ
         U5vGWtBlAhXX2yGpvgKv4qmTd8XS1+O3oJcf123zHCE3w4HGKgJdVcr2pxrLn3yRUK3E
         d88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749660464; x=1750265264;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aa2QXtJbJhCTINUZzXosw2JXgzKQuhbyrlej22q07Vo=;
        b=dTcZP2g4+Vg+9X46lZTlFaDdfZbQIv/E2nCH7hO9wPHhqXnGsizmSrp2lr7oG78otd
         WfWj8GaYdY0A+SfP0M0BM7l0k3r90iZyB78ejA6Ub7mgVL2R1frotbAgN3YrHJqwK/Kw
         yB6sDqecuQhDGgxItWTGSnMJxI9ejibHW2NT9yno3vAPM3gTrrCHWV5kNst+REUr6rEj
         2WYUn37u36gMuVSDYYt57vcePAWe2lhg7ruyNzTuYOjoToM7dS/Ry98gWcLRg207sI4k
         ApKiBVtwYDiblCHXHWJiKksqZ+dw5jkFJdLtenQ8hvVEHAVYyxtNoK1l5dmeJbxp+yzx
         5MNA==
X-Gm-Message-State: AOJu0YzOO5ruMeyN3jTse8gavhzDgPffHIkiA8bqOfEF2ydhUwkzrK2m
	4GCIyXwZshVCls5zBX9hAMAEtvMBkmUEWOOMkAwAfyBz5/64ssmUN+MPcLMZU1kM4uU=
X-Gm-Gg: ASbGncsiSX5bBeH+gDmmt67ZZ/9Gjmkb72/y8w+XLD03aXXtYp9jmz37X8i811e7UXp
	RRJvG0iRPJPF8hmFvW/2r4t6oKw+pqQqdgYCRLddd5+jMZRRTq5s71jdAicGlt8cm8iOvWjhUlk
	Jhrhhl00B47uKinf/TkplSbnsQ65Bectir5u3Hc7k63d7k00jWCr7MZYR70WRDhQxSNUhneBw4m
	x3NaEplIDBtiiKlzBW7Zs/nA6QLJdlFkfqP20DzX4qZFaqY/ZPMPvtUbbAfkeFMT9DJkR8/m5+M
	5mgtcSozVN5zhB3ti9tWalhMA6/P1fXNpTeHzTuVzZ/qrpENH/5avUaYydpCVaLzndO0D8T5XEE
	M4A==
X-Google-Smtp-Source: AGHT+IG1I4wXbndzOO2svvUjoO/b5iTEize8HjYtNFgDUXR08tLDK+qTi10v6jyEAqbWH86+wPS7Jw==
X-Received: by 2002:a05:6000:25c2:b0:3a4:edf6:566b with SMTP id ffacd0b85a97d-3a5586c3069mr3191218f8f.6.1749660463878;
        Wed, 11 Jun 2025 09:47:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53244f0cbsm15688709f8f.81.2025.06.11.09.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:47:43 -0700 (PDT)
Date: Wed, 11 Jun 2025 19:47:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org, Nathan Chancellor <nathan@kernel.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>
Subject: Re: selftests/filesystem: clang warning null passed to a callee that
 requires a non-null argument [-Wnonnull]
Message-ID: <aEmzK5B4pbF5MZ6Y@stanley.mountain>
References: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>

This seems like a Clang bug, right?  The test for _Nullable is reversed
or something?

regards,
dan carpenter

On Thu, Jun 05, 2025 at 05:41:01PM +0530, Naresh Kamboju wrote:
> Regressions found on arm, arm64 and x86_64 building warnings with clang-20
> and clang-nightly started from Linux next-20250603
> 
> Regressions found on arm, arm64 and x86_64
>  - selftests/filesystem
> 
> Regression Analysis:
>  - New regression? Yes
>  - Reproducible? Yes
> 
> First seen on the next-20250603
> Good: next-20250530
> Bad:  next-20250603
> 
> Test regression: arm arm64 x86_64 clang warning null passed to a
> callee that requires a non-null argument [-Wnonnull]
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Build warnings
> make[4]: Entering directory '/builds/linux/tools/testing/selftests/filesystems'
>   CC       devpts_pts
>   CC       file_stressor
>   CC       anon_inode_test
> anon_inode_test.c:45:37: warning: null passed to a callee that
> requires a non-null argument [-Wnonnull]
>    45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL,
> AT_EMPTY_PATH), 0);
>       |                                            ^~~~
> 
> ## Source
> * Kernel version: 6.15.0-next-20250605
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: a0bea9e39035edc56a994630e6048c8a191a99d8
> * Toolchain: Debian clang version 21.0.0
> (++20250529012636+c474f8f2404d-1~exp1~20250529132821.1479)
> 
> ## Build
> * Test log: https://qa-reports.linaro.org/api/testruns/28651387/log_file/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org
