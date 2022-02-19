Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A1057DF
	for <llvm@lists.linux.dev>; Sat, 19 Feb 2022 23:58:53 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id p8so5434658pfh.8
        for <llvm@lists.linux.dev>; Sat, 19 Feb 2022 15:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pyKnh0rifNC4U8/SpWhjiS3uUcC5kmVNLLaPc0IhXvY=;
        b=eFv9LIHn5T7yu7SXdfr1xRt6PH8DYtfvvMqPlhlsZ6bZC6Gwo4CnvRkxkLGP4v1/za
         xH7WDZlsGzhKXMPVZxNtJvfV97TeYC/+z2zTWMOzSyPurTe9RIkmSZRk2tNYowdcG0FS
         fqY5kUxdDE9sZFT3ljh+x03Lnvopm2Tk7vorM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pyKnh0rifNC4U8/SpWhjiS3uUcC5kmVNLLaPc0IhXvY=;
        b=t2LlveaIRGdeCBVMlbaqZAz2M9bjbFszIu99NGAe3Meeo4DTjwBOovKZT8mnY/cg90
         IcWoAYCi2YdUlUV6i3JYcv8mgViMmyIC1hauc17ooAXqtDqeOQ4uDY0lirYGiQbLRUff
         ftJA5JQFTUzaD/Y5/Sb6n/Flq8A2gUJAHf3X8Vz+rlYzDceAMLWeh6fk4ZmfGZeWfZCB
         8oABbLNQSkYi0KV+9syGk4T8J55FHJkbEfIgzTLpwbH2a1m+UJ2qkfq0TMUPAg6EXiGD
         CGjmNB8YBdJVi0CdI4fhpHumGkh3I3OU4M6P61IiMrmkEMJKV6380NJkDss8DYcqQmir
         9aQg==
X-Gm-Message-State: AOAM531nHXdrmUyD+ywDPMaNfgKayHaK1leOcycvt8E2+GDvFFHVmh13
	xqYnpffCP9AdGqb+5K8f9/MwKQ==
X-Google-Smtp-Source: ABdhPJz2B7x/obkYAxIzuuWmK0eIrem1Iyubh1rAOvTpZqyu2/XzDhnjlP1qJpC13eAFz3bW7Wje1A==
X-Received: by 2002:a05:6a00:cd3:b0:4df:7b9e:2557 with SMTP id b19-20020a056a000cd300b004df7b9e2557mr14045768pfv.25.1645315133327;
        Sat, 19 Feb 2022 15:58:53 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u11sm7756421pfi.71.2022.02.19.15.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 15:58:52 -0800 (PST)
Date: Sat, 19 Feb 2022 15:58:51 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, stable <stable@vger.kernel.org>,
	Daniel Micay <danielmicay@gmail.com>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Nathan Chancellor <nathan@kernel.org>, linux-mm@kvack.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] slab: remove __alloc_size attribute from
 __kmalloc_track_caller
Message-ID: <202202191558.11C173F04@keescook>
References: <20220218131358.3032912-1-gregkh@linuxfoundation.org>
 <CAKwvOd=4uwMVBwYU8XPP+cHkw5V1S_t7i8psMTRySsKEcDVZ_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=4uwMVBwYU8XPP+cHkw5V1S_t7i8psMTRySsKEcDVZ_A@mail.gmail.com>

On Fri, Feb 18, 2022 at 09:19:51AM -0800, Nick Desaulniers wrote:
> On Fri, Feb 18, 2022 at 5:14 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > Commit c37495d6254c ("slab: add __alloc_size attributes for better
> > bounds checking") added __alloc_size attributes to a bunch of kmalloc
> > function prototypes.  Unfortunately the change to __kmalloc_track_caller
> > seems to cause clang to generate broken code and the first time this is
> > called when booting, the box will crash.
> >
> > While the compiler problems are being reworked and attempted to be
> > solved, let's just drop the attribute to solve the issue now.  Once it
> > is resolved it can be added back.
> 
> Sorry about the mess; we'll get it cleaned up!
> Acked-by: Nick Desaulniers <ndesaulniers@google.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1599

Thanks for the issue link!

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
