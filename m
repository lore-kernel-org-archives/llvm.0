Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDF516DD
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 15:48:25 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1c723f1c80fso41591755ad.1
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696002505; x=1696607305; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHMp50cB4ZdvpcshTa5CAlEa1+mL8NJsLojoOMgbH7Y=;
        b=vrvFzcpxHhrUF4afNn1sYbs1gQjkYeKlrthVTOpcPEFDFq2CiI63hMqfXNWAokHIy0
         I2Jdl4cv5ifjOlCC0KrZiUq9p7Zh6yVkpHPoFedz08V+eO/RpGR6do1I6s73C/jSDVm7
         rBn0JNvnnr0Z0mSurBAsYhcm7XHOMJGyoSmTabccWaN+mIlf/tCWZRhT0zEhRyMeqiBT
         pu/ops6CEfvKJqN2A9GpE8nI3rd30z/217fP6e3C3z8hzFdgh4cX64B/vLfouG3+9u7F
         N6ofpb7sBCD9OrndoENP1WQdNwjBE3ZaoisuySjTaNck9eVWz4ekknRhCmjwvee0OwDM
         qnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696002505; x=1696607305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHMp50cB4ZdvpcshTa5CAlEa1+mL8NJsLojoOMgbH7Y=;
        b=vrK7UrLwaQmXpDHD2M305YJ7EOXxHpd04CQ1vNK5kTZ60bTpuTTUQZKJ1IuLHJxp2b
         vtm55qiwhfessubbXGHYntmI36hQk0J7GwV99sQDpz+uAdDKYVuGKth2uQpvh+gG1ygQ
         tT6+uHVLRThMMRj0HbhXxpgfJ6ZF5mx1mzVDMKZZZvR6rdbP7LYiuL9E0oTJeRfJpefB
         06kPvXe/AS/57cqQqvOEJxzyYZLU2IizIuk7S6hVha6Fhm9HeI02cSmVn+wW0p1h1i6j
         lLfwTMFz9xFDq/LspxPDzxMTU2NPiyz8san+oGJl8PPPSMTOxGvoMuVi1Dz54eVOxe4t
         tOkQ==
X-Gm-Message-State: AOJu0YxAI9Fu0aw7rnDwHIXqwJZWpzXAt195kb8Y1J4DST0UvnJL+jyT
	61Z/cmUedN+1w8UAYZkUVeSURA==
X-Google-Smtp-Source: AGHT+IGSW6rybcodqhav5Eb1CSZvfRX8hwpUHhP+LFazOegwW0oC3aPtjIvmXKXi3WS6FM8+P929nQ==
X-Received: by 2002:a17:902:ed01:b0:1c5:ed6e:2534 with SMTP id b1-20020a170902ed0100b001c5ed6e2534mr4325547pld.26.1696002504749;
        Fri, 29 Sep 2023 08:48:24 -0700 (PDT)
Received: from google.com ([2620:15c:2d1:203:141c:4ec5:6338:4001])
        by smtp.gmail.com with ESMTPSA id be8-20020a170902aa0800b001c3ea6073e0sm16985487plb.37.2023.09.29.08.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 08:48:24 -0700 (PDT)
Date: Fri, 29 Sep 2023 08:48:19 -0700
From: Nick Desaulniers <ndesaulniers@google.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Clark <robdclark@chromium.org>, llvm@lists.linux.dev
Subject: Re: Build failure in v5.15.133
Message-ID: <ZRbxw45Cc5wHXRXZ@google.com>
References: <e56ced8d-d09d-469b-80df-0cc2bdd943f4@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e56ced8d-d09d-469b-80df-0cc2bdd943f4@roeck-us.net>

On Wed, Sep 27, 2023 at 06:37:10AM -0700, Guenter Roeck wrote:
> Hi,
> 
> I see the following build failure with v5.15.133.
> 
> Build reference: v5.15.133
> Compiler version: aarch64-linux-gcc (GCC) 11.4.0
> Assembler version: GNU assembler (GNU Binutils) 2.40
> 
> Building arm64:allnoconfig ... passed
> Building arm64:tinyconfig ... passed
> Building arm64:defconfig ... failed
> --------------
> Error log:
> drivers/interconnect/core.c: In function 'icc_init':
> drivers/interconnect/core.c:1148:9: error: implicit declaration of function 'fs_reclaim_acquire' [-Werror=implicit-function-declaration]
>  1148 |         fs_reclaim_acquire(GFP_KERNEL);
>       |         ^~~~~~~~~~~~~~~~~~
> drivers/interconnect/core.c:1150:9: error: implicit declaration of function 'fs_reclaim_release' [-Werror=implicit-function-declaration]
>  1150 |         fs_reclaim_release(GFP_KERNEL);
>       |         ^~~~~~~~~~~~~~~~~~
> 
> This also affects alpha:allmodconfig and m68k:allmodconfig. The problem
> was introduced with 'interconnect: Teach lockdep about icc_bw_lock order'.
> 
> #include <linux/sched/mm.h> is missing. Presumably that is included
> indirectly in the upstream kernel, but I wasn't able to determine which
> commit added it.
> 
> Guenter

Thanks for the report, our CI is also pretty red for ARCH=arm64
linux-5.15.y builds. Also one ARCH=arm build we have that's using
Alpine's config is hitting the same issue.  Making note of this with our
ML CC'ed so that other folks don't potentially re-triage. Happy to hear
there's already a fix inbound.
