Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B762FAE
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 18:47:32 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id l73so8592105pge.11
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 10:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :mime-version;
        bh=9s/ZIHrGES7feK2tz5dP1rmrFQ/RLT8GNy7zBmf9EgA=;
        b=f0H3TVA9AOk2uGP+1p95rEv5SaFwf75XopgpbmOxZY8zZsMWRS7/ilyAzemq42ESPm
         wlFR7t4VyV+eB83JWky1FqzO4CdSZjDePKhOC5uuKA42mL9nd98/EVdL9zpuiudJCRHG
         E/569cf/0s3ZM93xiPP35gjTOIeT6l97ECf0fifUKeerHnYhMsaBs/uZnBlqlDJvqtX8
         9zyEy2gnZm6ck0iYurd/2iReR+k7ZeFKo/nzibUUGYQkf6MeYCCb7CUMpRqjEUOum+zH
         z0+tIlA6QCpa+mIRTL/DQP/NDl3xZeu/8IIub+8KNEX5t30zXH6yiACac5mO3G2kSuAH
         2HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:mime-version;
        bh=9s/ZIHrGES7feK2tz5dP1rmrFQ/RLT8GNy7zBmf9EgA=;
        b=JWgQhryLfeBW9cfg9/0Ovz/sp9nZmGKqao2JnOQ/8AfdOcQJizPV+mszStNgtFNUTa
         xWbAfPY7ZEYKhy1Vki7SMUxi922/VfClfwcW9fgn3BdNSyXw9SPcGDONwv0FW8Z13RXS
         OrdispgIkOZMqmVu0Sl5ynRvHKAqkh9KmBAi+HmUMG6/97/zl05yeMjdTt6UqlCHtids
         ShNlYA+9uyGzTGhjFvL2H8O4/YjkvRxCib6EGDY9lo07gRPJZBMZg57o0rIq6aPkqRlm
         M0dGU9jW+ZjCgrgIYfD0gbaWsOAQGMtL8GUVeofRvQ1pWKHhfoiicwW/QvJuWdrIyCFj
         G/eQ==
X-Gm-Message-State: AOAM532LSaS2DkDfiQcDNVQT0hPXlMP07ESH/4yDk68yOB63iyPhRKbM
	XUnJBy1EeVYEc71GFdVlmSQ25A==
X-Google-Smtp-Source: ABdhPJxbZeaBnK2HPkHb7qJeePZrSd31i9bN8DyNF4o8wa3tB2DdFjfjcOKFTXhdLq/D0WfDRNYbsQ==
X-Received: by 2002:a62:3085:0:b0:4e0:1218:6d03 with SMTP id w127-20020a623085000000b004e012186d03mr9053021pfw.19.1645210051404;
        Fri, 18 Feb 2022 10:47:31 -0800 (PST)
Received: from [2620:15c:29:204:701:472c:4005:6710] ([2620:15c:29:204:701:472c:4005:6710])
        by smtp.gmail.com with ESMTPSA id h5sm3534755pfc.118.2022.02.18.10.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 10:47:30 -0800 (PST)
Date: Fri, 18 Feb 2022 10:47:30 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>, 
    Kees Cook <keescook@chromium.org>, Daniel Micay <danielmicay@gmail.com>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Vlastimil Babka <vbabka@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
    linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH] slab: remove __alloc_size attribute from
 __kmalloc_track_caller
In-Reply-To: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
Message-ID: <b8e9dcd2-5b2d-af7d-e4e6-c6bd4a7e4315@google.com>
References: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 18 Feb 2022, Greg Kroah-Hartman wrote:

> Commit c37495d6254c ("slab: add __alloc_size attributes for better
> bounds checking") added __alloc_size attributes to a bunch of kmalloc
> function prototypes.  Unfortunately the change to __kmalloc_track_caller
> seems to cause clang to generate broken code and the first time this is
> called when booting, the box will crash.
> 
> While the compiler problems are being reworked and attempted to be
> solved, let's just drop the attribute to solve the issue now.  Once it
> is resolved it can be added back.
> 
> Fixes: c37495d6254c ("slab: add __alloc_size attributes for better bounds checking")
> Cc: stable <stable@vger.kernel.org>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Daniel Micay <danielmicay@gmail.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Christoph Lameter <cl@linux.com>
> Cc: Pekka Enberg <penberg@kernel.org>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Joonsoo Kim <iamjoonsoo.kim@lge.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Cc: llvm@lists.linux.dev
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Acked-by: David Rientjes <rientjes@google.com>
