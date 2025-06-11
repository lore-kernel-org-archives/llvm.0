Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022E41A5BAC
	for <llvm@lists.linux.dev>; Wed, 11 Jun 2025 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749666607; cv=none; b=JSl9Yi88QqHQtt4l49HuqBuMg0kKrm/kiI6t8RdQP+6PGL+Cm9fAWoTdpmxithRZmoI+k7pVmcQ6np4Gxy1K33UGTK2l48Sd/eUl4pPZpX+sGWz1ip4cVMW6V5xmTRjpkm0HofDK+CGBkz5/f9r7uqhQJbBs/J7K60tCqOHnCiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749666607; c=relaxed/simple;
	bh=JiBEW9GnpC6nphMw1Nmi6/whGvQxkUqmaI4odvdQYMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwoJDlWVn71YEESzy3iFMwXhaYP9pwq0Gkg7/f8q4bXVNKcpuZa12Jb6+skSMuv35izj5psKVWo5ciMdwJBJj80lILfwrG1GjF1I/JUrmzMjy+kD4C8x6ocRZxqT4yPyKymkL8cSZLNhyeb0S6PmQm4YKRBBIV/Mv/sMWWr2xUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBDMkrN4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBDMkrN4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-451d3f72391so981815e9.3
        for <llvm@lists.linux.dev>; Wed, 11 Jun 2025 11:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749666604; x=1750271404; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZUFhp39dTZAMXovncJ1VhLVfSRWQwMXUrqA+mPJGfc=;
        b=bBDMkrN4M7QY96NZGKAdZOgPS8sgtQq8fRsOhC1Qh6WFF9nSYiBF4f2h3nIt088xM0
         5gFvCXBga9pL2dxDaLvLssGnXrvhNGjR7aOPih4rBPqRxL+nnbINIkyRyuP9hxeTyyQ0
         MSWCy6z+krcpF4xX/CER4LXdBPeoXPPE37y8aSkt/9llqZCATbbuTN95p9wlB6F/qMKf
         AvKdobxGYQRFZffI+Lg4Pr60CIt3iFVksefsK+eC3dpZd9KXV90//ePpC69y/9Rsfc+G
         AymNJEtNHrClehBmQgG0bINPjtfKBpa2+az5ZyJSqWkElDiAAq3NYcXkkLLFoSsGqT2d
         Z+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749666604; x=1750271404;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZUFhp39dTZAMXovncJ1VhLVfSRWQwMXUrqA+mPJGfc=;
        b=qob6EZjBg2pYGlEPEH0kP5fDyDRoH6PyiZSMCCP5pD56TuvOuR+wYOwA8uuHOFIs4I
         +MiHq/UZgtNQI4lXSHGEqWsUIn07GQ86IVGYD+Q/f8bKMEueh29Amb0ePnxa8vTzQiVh
         TSlQ0hJ+BSSMDcVZfui827+l2n6bW6lgNZAH8u8A4/tsPfKtrRjhm/BCOHgGAA/R++4z
         Jxyo6N7VCj+wm8GTwKoKawfp3xMCoZmTjwOthepe0J8LYyoH8wVmk0+SOQvTV5ZKJrk+
         9rXwiSeBBW4frRDZiUuJhZ86jonBrGYKrVC04WeM+ykO+g5dYfxlMDCDXpOptHpdKyik
         9qog==
X-Forwarded-Encrypted: i=1; AJvYcCU1FRoTqhSFBwSVGjVhFqogJAylFuRRXIatpPtNYaFqJQk9qEaTBlkbpaMN5aHKxJkXW2Ar@lists.linux.dev
X-Gm-Message-State: AOJu0YxTivbrHXZgXHHYbAFhkTRHewgkzLI71yn5fqJ07BWjX77rlCfp
	i3axPnKL52yPh1M+GN4BqUpT4dCGkvgKPyuMMqhaajCzLYmvJk7uufGXsRktC2bXS2k=
X-Gm-Gg: ASbGncuKyFir4zUz3nnyrsg2y496MUROpKyc9HuoFq9S+aR+zt8fCTRitmdxBoIvE39
	7kaHGbsUUlrvHMe9e25EWasUvqQYn2Y5PN58WdUuyY+7tm0FZUvdvrCZbKCmkqOtngyRgf1cZMF
	dBnoJNm8CirEcMX/g54i+IohxkFHHWEw6fWPFYxMg1TTl3t8fmRIBWoHwUGmRwCvYXS2ZGebp93
	pFBrkPXD2PYk9xx9azxhBpfKX0OnLJ8pkb4WrGMhBZU2ldZt8sncySmJodemXxcWxWuYBQD3OuZ
	0BFSNXCLBZVy2GAN5LvhHU/t7cwAebFWYy10M+5Jsir+zwL6/NVdfk1B0vWOUSGKGi0=
X-Google-Smtp-Source: AGHT+IEOnrEhGtLnO/aBJWRPFeQDku4c9EmVz/spaw65LaaOkpsBO4KbA6/7mK4y3l0ElS0ayRNSyw==
X-Received: by 2002:a05:600c:6612:b0:453:8a6:d8de with SMTP id 5b1f17b1804b1-4532b8c5819mr8416435e9.1.1749666604214;
        Wed, 11 Jun 2025 11:30:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5323b6612sm15852258f8f.41.2025.06.11.11.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:30:03 -0700 (PDT)
Date: Wed, 11 Jun 2025 21:29:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jeff Layton <jlayton@kernel.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	lkft-triage@lists.linaro.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>, Sasha Levin <sashal@kernel.org>
Subject: Re: selftests/filesystem: clang warning null passed to a callee that
 requires a non-null argument [-Wnonnull]
Message-ID: <aEnLJ0CkfrHieKrG@stanley.mountain>
References: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>
 <aEmzK5B4pbF5MZ6Y@stanley.mountain>
 <20250611175052.GA2307190@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611175052.GA2307190@ax162>

On Wed, Jun 11, 2025 at 10:50:52AM -0700, Nathan Chancellor wrote:
> On Wed, Jun 11, 2025 at 07:47:39PM +0300, Dan Carpenter wrote:
> > This seems like a Clang bug, right?  The test for _Nullable is reversed
> > or something?
> 
> My copy of unistd.h has
> 
>   /* Execute program relative to a directory file descriptor.  */
>   extern int execveat (int __fd, const char *__path, char *const __argv[],
>                        char *const __envp[], int __flags)
>       __THROW __nonnull ((2, 3));
> 
> so I think the warning is valid in this case. I will note that
> tools/testing/selftests/exec/recursion-depth.c uses execve() with a NULL
> argv and disables -Wnonnull so maybe that should happen for this test
> case too? Or should that NULL be changed into a ""?
> 

Oh, huh.  The man page for execveat() says _Nullable but the headerfile
says the opposite.

regards,
dan carpenter

> > On Thu, Jun 05, 2025 at 05:41:01PM +0530, Naresh Kamboju wrote:
> > > Regressions found on arm, arm64 and x86_64 building warnings with clang-20
> > > and clang-nightly started from Linux next-20250603
> > > 
> > > Regressions found on arm, arm64 and x86_64
> > >  - selftests/filesystem
> > > 
> > > Regression Analysis:
> > >  - New regression? Yes
> > >  - Reproducible? Yes
> > > 
> > > First seen on the next-20250603
> > > Good: next-20250530
> > > Bad:  next-20250603
> > > 
> > > Test regression: arm arm64 x86_64 clang warning null passed to a
> > > callee that requires a non-null argument [-Wnonnull]
> > > 
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > 
> > > ## Build warnings
> > > make[4]: Entering directory '/builds/linux/tools/testing/selftests/filesystems'
> > >   CC       devpts_pts
> > >   CC       file_stressor
> > >   CC       anon_inode_test
> > > anon_inode_test.c:45:37: warning: null passed to a callee that
> > > requires a non-null argument [-Wnonnull]
> > >    45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL,
> > > AT_EMPTY_PATH), 0);
> > >       |                                            ^~~~
> > > 
> > > ## Source
> > > * Kernel version: 6.15.0-next-20250605
> > > * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> > > * Git sha: a0bea9e39035edc56a994630e6048c8a191a99d8
> > > * Toolchain: Debian clang version 21.0.0
> > > (++20250529012636+c474f8f2404d-1~exp1~20250529132821.1479)
> > > 
> > > ## Build
> > > * Test log: https://qa-reports.linaro.org/api/testruns/28651387/log_file/
> > > * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/
> > > * Kernel config:
> > > https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/config
> > > 
> > > --
> > > Linaro LKFT
> > > https://lkft.linaro.org
