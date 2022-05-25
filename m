Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4471FA23
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 08:31:45 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-f233f06563so13620287fac.7
        for <llvm@lists.linux.dev>; Wed, 25 May 2022 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+YhgW7NAnERndezG/DaemCXMRg733gpPkur4BTgIaQw=;
        b=IuHTNa+IXAL6LEL2YyMB482iZtMh0+jmuW8i6AL7X/UkTx3yI9MdMXZ2u42WpedIx+
         Ut4PzMpqdWrHa7YgBJ9GR0D07qh65VLonZwsByiXfoSD/X1tFr7x3HZ+l9Q2JCWC/Kic
         8Y1VytjiBHSx2uz78Q9FatEcNiPyZ9OHREAgAqCcOmguatMXdh5REZcYMQrFTIjRtD40
         AtjTc95Epz41aD3RKBR+ydNRSgjZttSLLOv/PVsBBagWjLdJ8LaCi4/7AEAoQbq/5zgU
         +CQLASpfnpdIxA0y0HZ7mknsRGStXGke037bgzb3l8FStbN0MZ3ncLwP3fHwVcSePrRD
         qZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+YhgW7NAnERndezG/DaemCXMRg733gpPkur4BTgIaQw=;
        b=DoMDk8XbnczsgD2ep3Pn6wd1QsMXANye4/ZhXNXYP0fDov2B69OVDCNkmC0Dw+h0x0
         /13dRh1zrLhmLZGuoTcf6HIglkxW8HB1G8vMFJLEGIUJDB1aMH3B7GJiQk5N50vLETw0
         iAmEKyDLJaeKNISQ33sTzRl67ywij3HVCXhbDuG6494RE5fFt6iPXyz1Yp2fiinaF/9b
         YaQ0WoB81LEzArYorcFH0pMT+pxVUtTmCUtIDRRQe2VWpOHMPiFRGGktsH+h2LDElvBI
         QQz6HnLkIsA0FAz1JtDnfop1rRDrsiryEhzWskSCZ8kGXCDTddYCX+iZRvLw5uxwbmRL
         7K7w==
X-Gm-Message-State: AOAM532U5bjKkF4uPGs2xu7FV4VE2cGZ1l+2e2836xv1HW7YRc/cNaEA
	1BAkDLIkHmEDYpdYsSq9If0=
X-Google-Smtp-Source: ABdhPJwJ3Af4TljiCBdGIlzA2/8casq4cg+0HOGwnV6RwOio8P/+jdi4JWYrKmiheK3fngNatmGwNQ==
X-Received: by 2002:a05:6870:c207:b0:f1:85cd:648f with SMTP id z7-20020a056870c20700b000f185cd648fmr4747352oae.103.1653467504296;
        Wed, 25 May 2022 01:31:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k1-20020a056870a4c100b000f28d8f2debsm2114774oal.2.2022.05.25.01.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 01:31:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 25 May 2022 01:31:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-modules@vger.kernel.org, llvm@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v6 06/10] kbuild: check static EXPORT_SYMBOL* by script
 instead of modpost
Message-ID: <20220525083142.GA1952409@roeck-us.net>
References: <20220513113930.10488-1-masahiroy@kernel.org>
 <20220513113930.10488-7-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513113930.10488-7-masahiroy@kernel.org>

On Fri, May 13, 2022 at 08:39:26PM +0900, Masahiro Yamada wrote:
> The 'static' specifier and EXPORT_SYMBOL() are an odd combination.
> 
> Commit 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
> functions") tried to detect it, but this check has false negatives.
> 
> Here is the sample code.
> 
>   Makefile:
> 
>     obj-y += foo1.o foo2.o
> 
>   foo1.c:
> 
>     #include <linux/export.h>
>     static void foo(void) {}
>     EXPORT_SYMBOL(foo);
> 
>   foo2.c:
> 
>     void foo(void) {}
> 
> foo1.c exports the static symbol 'foo', but modpost cannot catch it
> because it is fooled by foo2.c, which has a global symbol with the
> same name.
> 
> s->is_static is cleared if a global symbol with the same name is found
> somewhere, but EXPORT_SYMBOL() and the global symbol do not necessarily
> belong to the same compilation unit.
> 
> This check should be done per compilation unit, but I do not know how
> to do it in modpost. modpost runs against vmlinux.o or modules, which
> merges multiple objects, then forgets their origin.
> 
> It is true modpost gets access to the lists of all the member objects
> (.vmlinux.objs and *.mod), but modpost cannot parse individual objects
> because they may not be ELF but LLVM IR when CONFIG_LTO_CLANG=y.
> 
> Add a simple bash script to parse the output from ${NM}. This works for
> CONFIG_LTO_CLANG=y because llvm-nm can dump symbols of LLVM IR files.
> 

On parisc builds, this patch results in:

Building parisc:allnoconfig ... failed
--------------
Error log:
scripts/check-local-export: sh /opt/buildbot/slave/next-next/build/arch/parisc/nm failed

Guenter
