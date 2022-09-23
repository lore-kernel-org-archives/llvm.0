Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B415A3
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 00:20:54 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id fv3so11444363pjb.0
        for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 17:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=fE8nCD0AAGL6m11CnMBfi2PNly3cqHNqiT4DGj6b5Gc=;
        b=ZcgEPa5GX4lJbCqdaQIoVzgDaAGB2ncYfRY5U+Q2yAy9IywhwFoEoy1uuMIfswt3ny
         794u3NbJDIPlXO3iAM9o8Z2XldjYuBr70GXIXXMpFKlmSoVyLitAOvWbioDxzj83ipsx
         dnX65KS5JpCN9hZliXHZZTTpOarXoM17UEoGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=fE8nCD0AAGL6m11CnMBfi2PNly3cqHNqiT4DGj6b5Gc=;
        b=FmcjRe+j8WWakeca5hBxEgCzG2gHnC6pVmKJ85YyPNPIHQ+l8v3VEWLgdEeCL3MSg7
         MvkNYkBjTMLthgJj+mt8nVvo+g6Wb/Lc7f0pH8nkMjiDYGEHcNzgYgH5fi9r2xXnuhKJ
         asYXC1+OyRo9rclYTc58Qu0ZW0ykIRAj3XNTwJQutFJ3CtDoEoq9/4zEvdE+FbEBfWLH
         tdydv2Yrx45I938/nSllbg1G3LDmVVdI29ErKSWz+aDmV4g48CPenoq2RItDjRwalD6W
         XcZWeHpIegnAIFNklQDCa5WOHDHqI7eB3YvohI1B6nltsKNxXi1ZHR+G5RCgPHhMCpj+
         7OwA==
X-Gm-Message-State: ACrzQf3+bBwjzVlrIzh2ol3AU8EdOfRwEkx2YuM5kGufcATFBYO/FYgs
	S4hw8Dwjult2PFih5/IRw+iryQ==
X-Google-Smtp-Source: AMsMyM7i+eNakcX48qpc7Mn5PvOUozzI8YxksEJeQObNVkyr/89+42nVUtZy0igEPuZyD7dfedjxXw==
X-Received: by 2002:a17:90b:4a85:b0:202:4f3f:1f65 with SMTP id lp5-20020a17090b4a8500b002024f3f1f65mr6397691pjb.241.1663892453590;
        Thu, 22 Sep 2022 17:20:53 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k60-20020a17090a4cc200b002006f15ad4fsm378261pjh.10.2022.09.22.17.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 17:20:52 -0700 (PDT)
Date: Thu, 22 Sep 2022 17:20:51 -0700
From: Kees Cook <keescook@chromium.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/4] fortify: Use __builtin_dynamic_object_size() when
 available
Message-ID: <202209221714.1D792FE6@keescook>
References: <20220920192202.190793-1-keescook@chromium.org>
 <e2a0debe-e99f-2259-1cb9-35193c387c82@gotplt.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e2a0debe-e99f-2259-1cb9-35193c387c82@gotplt.org>

On Thu, Sep 22, 2022 at 04:26:54PM -0400, Siddhesh Poyarekar wrote:
> On 2022-09-20 15:21, Kees Cook wrote:
> > Hi,
> > 
> > This adjusts CONFIG_FORTIFY_SOURCE's coverage to include greater runtime
> > size checking from GCC and Clang's __builtin_dynamic_object_size(), which
> > the compilers can track either via code flow or from __alloc_size() hints.
> > 
> 
> FTR, I ran a linux build using gcc with allyesconfig and fortify-metrics[1]
> to get a sense of how much object size coverage would improve with
> __builtin_dynamic_object_size.  With a total of 3,877 __builtin_object_size
> calls, about 11.37% succeed in getting a result that is not (size_t)-1.  If
> they were replaced by __builtin_dynamic_object_size as this patch proposes,
> the success rate improves to 16.25%, which is a ~1.4x improvement.

Thanks for check that! Yeah, a 40% increase in coverage is nice. :0

> This is a decent improvement by itself but it can be amplified further by
> adding __attribute__((access (...)))[2] to function prototypes and
> definitions, especially for functions that take in buffers and their sizes
> as arguments since __builtin_dynamic_object_size in gcc is capable of
> recognizing that and using it for object size determination (and hence to
> fortify calls) within those functions.

Yeah, this could be another interest set of additions. It seems like it
might be more "coder friendly" if, in the future that has the
__element_count__ attribute, it could be used in function parameters
too, like:

If we had:

int do_something(struct context *ctx, u32 *data, int count)

this seems less easy to read to me:

int __access(read_write, 2, 3) do_something(struct context *ctx, u32 *data, int count)

as this seems more readable to me, though I guess the access-mode
information is lost:

int do_something(struct context *ctx, u32 * __element_count(count) data, int count)

But yes, this would be excellent to start adding!

-Kees

-- 
Kees Cook
