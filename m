Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF3D7C
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 23:16:46 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id j10-20020a17090a94ca00b001bc2a9596f6so576543pjw.5
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 15:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qcyuF/rJ3v9adXS1wD5x79Nrhi3MVFgnMBiDVeVK628=;
        b=H84ukViLP1I1WQwJ555fTIX5iY07fF8mJhYhLLqFrxRU/v/5c13BT2oHieKtQ28QtB
         vTu/WJ1QzVGt7t0JrWP9EZxzFSuISG7rgQ18dkd1w1PdOvc/6kHgHln31L/hqrFgSqbN
         iT+TUK5ORx7x3+XzVmrBCQtrgm3FCzB0zo30Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qcyuF/rJ3v9adXS1wD5x79Nrhi3MVFgnMBiDVeVK628=;
        b=TaC1uby8gQTyIJlm3nXEO0+b5TQ+Mqw4oO5R6Xxnpf2H+7WFvx5a3rZdSFmS4T6/03
         bI7qXfdT9lZWJuJVKWrqZE4KtDGYFkcvIyA8+zTS6tRyoaERJ/Bo+2nT5XU1CYpxEbaC
         izuLhXC+qMbGLsNuTM3R01x5ISe6K67ks2dG7++WJfpEA4bUIsSp19iP0y758gqwNpH3
         jJErMyZ7ofyEuFNwoyuGpfrI+sPyC0ZH5oJvGPboTyAqait/yJyRv7ZR7c3gznGjdH0b
         a+mkZ7q4NO2yaPLEucl8Ib3hASlkUNKrcTVUIHkJs83EnSgcI3rZal0FbfBjLc9SxWI1
         ST+Q==
X-Gm-Message-State: AOAM532xQFLzf7YrGYFUW4xHeFiIFAq+OWrp3zCK3t0wXl3vRfD9l4ge
	xuDzVCDbINGNPvOrVThiIcbP1Q==
X-Google-Smtp-Source: ABdhPJyUO4WdPD4D+EwN7uSB3399f8EhL9c8HcIjeCpMcQrsQdmLfXFfXqDsDs2KAc/EYgd95j5zzQ==
X-Received: by 2002:a17:90a:6542:b0:1bd:149f:1c29 with SMTP id f2-20020a17090a654200b001bd149f1c29mr13946279pjs.240.1646090206307;
        Mon, 28 Feb 2022 15:16:46 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id np11-20020a17090b4c4b00b001bd4aa67bafsm774491pjb.3.2022.02.28.15.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 15:16:45 -0800 (PST)
Date: Mon, 28 Feb 2022 15:16:45 -0800
From: Kees Cook <keescook@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, Marco Elver <elver@google.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Daniel Micay <danielmicay@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] mm: Handle ksize() vs __alloc_size by forgetting size
Message-ID: <202202251823.45E09CF@keescook>
References: <20220225221625.3531852-1-keescook@chromium.org>
 <20220225154518.0d1159fdc6f37ee38e39e90c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225154518.0d1159fdc6f37ee38e39e90c@linux-foundation.org>

On Fri, Feb 25, 2022 at 03:45:18PM -0800, Andrew Morton wrote:
> On Fri, 25 Feb 2022 14:16:25 -0800 Kees Cook <keescook@chromium.org> wrote:
> 
> > If ksize() is used on an allocation, the compiler cannot make any
> > assumptions about its size any more (as hinted by __alloc_size). Force
> > it to forget.
> > 
> > One caller was using a container_of() construction that needed to be
> > worked around.
> 
> Please, when fixing something do fully explain what that thing is.  I,
> for one, simply cannot understand why this change is being proposed.
> 
> Especially when proposing a -stable backport!  Tell readers what was
> the end-user impact of the bug.
> 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1599
> 
> Even that didn't tell me.  Is it just a clang warning?  Does the kernel
> post your private keys on reddit then scribble all over your disk
> drive?  I dunno.

Yup, sorry. I tend to get so deep changes like this that I forget to
give an appropriately detailed summary. As others have mentioned, this
is trying to fix a miscompilation issue, triggered by what can be
considered either a mis-application of __alloc_size, or a failure to
correctly disable compiler optimizations in the face of ksize().

-- 
Kees Cook
