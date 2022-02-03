Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390F32F2B
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 17:15:53 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id r59so3012256pjg.4
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 09:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eCxgeYKdwlKt0oqnTuPB4zw2ANgtkFxZ4Jnzg7Jm2aQ=;
        b=c7TfdBKWq7b7RwXKegDo7mrxtFQaaMbFoWobJsoFragv/CCi7+NaQgykHUP9fODpAh
         zDUYUZfAmM6XrgVppNUw1Zuu90Gp2iASFyev8WnefWTyjFibflL2S1CNcWlwjQx2YLCW
         rvlQn7kFjydRTsZ1iGN4NjaGbVymOO3oSxaoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eCxgeYKdwlKt0oqnTuPB4zw2ANgtkFxZ4Jnzg7Jm2aQ=;
        b=7et8fsScemNb5HR2nKWxQVsVHhEI1MKiQiwQtko4kYCfmXE9SyGAQPWSxV01Rxgrsg
         rFmqAkmw2Tf7j7eWNhertkoXRLuW4CRjBomISup7MLBGUtbr5Ta7rLHo67HeCmdcUbLn
         AJd7izx+1+nTWessbvnSc2WhwnBVGycvsNL6ISklWeV6Fx1NVMSeyio8aw4+AdKlRWJR
         9IYmhSdZN6TvY8JVYqrSBHzY4jN8iUINeSoclAoAJjKhf8WgI3LhpMtQbYdBApapZPLe
         VR0RBUWiZ9PY6/v4RXtZ8GgvOqO5g1DsPmTkzphh/HQUtwAAXravBR41mClXJTH011Yi
         uhDw==
X-Gm-Message-State: AOAM5302VCAOhUK8yBeJGxk1IZcbfhs5WrEDT6K5SWAxyAH+8+rUybku
	ey+VsvuT+EmNiQ4cqhPvlZuGQQ==
X-Google-Smtp-Source: ABdhPJzJUGd7ygya4e6M/1Gh2HV6OhdW0Ix+MHxpkRCd4Y5gQDZhB7ej+H+RwMQeV6zcPMjLwU3ZZw==
X-Received: by 2002:a17:90b:3a87:: with SMTP id om7mr11784961pjb.196.1643908552517;
        Thu, 03 Feb 2022 09:15:52 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u18sm29699773pfk.14.2022.02.03.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 09:15:52 -0800 (PST)
Date: Thu, 3 Feb 2022 09:15:51 -0800
From: Kees Cook <keescook@chromium.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>,
	Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
Message-ID: <202202030911.4914709E@keescook>
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net>
 <202202021237.487D3DE73@keescook>
 <5ff18cff-6cfd-1f85-da74-1e5660a1a250@roeck-us.net>
 <CAMuHMdWssK2=NFc6NO-inQg5dWxZP4Wv41K3J3RqRXThXatovw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWssK2=NFc6NO-inQg5dWxZP4Wv41K3J3RqRXThXatovw@mail.gmail.com>

On Thu, Feb 03, 2022 at 09:04:22AM +0100, Geert Uytterhoeven wrote:
> Not if -ffreestanding, which is what several architectures are
> using nowadays, to a.o. prevent gcc from replacing calls to stdlib
> functions to other stdlib functions (e.g. strncat() -> strlen() +
> store, strncmp() -> strcmp()), which breaks linking if the latter is
> only provided inline.

Hah, for i386:

arch/x86/Makefile
	# temporary until string.h is fixed
	KBUILD_CFLAGS += -ffreestanding

This "temporary" is from 2006. ;)

6edfba1b33c7 ("[PATCH] x86_64: Don't define string functions to builtin")

Removing that appears to solve it, and appears to build correctly. I'll
continue testing.

> It works after dropping -ffreestanding.

I wonder if the other architectures were just copying x86?

-- 
Kees Cook
