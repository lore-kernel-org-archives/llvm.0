Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3022F24
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 03:18:05 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id i65so1043216pfc.9
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 19:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4QtPGJsJdjtleT4SCvDltRv0MUxS6HLkC+/jHaWkak0=;
        b=JGtI0UZ6Ck0rSbexL4Ad25l0q5f+gKaACzYjSkD65cN3hv2n7lC8GRTPAt3pmfHCyb
         Wf9YGN1zv874GvRTML77HPoG8fJ5LM0e8i2CXvMNyXiPrydyVDfkVz0S+AVM/LzWWTLX
         o4bOgZ8bo/WHDcNzDyY5pA/pQtGAfaasgfirU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4QtPGJsJdjtleT4SCvDltRv0MUxS6HLkC+/jHaWkak0=;
        b=T2Z0a7lkAJIwbMGM/LRdBDcnaHSdDaBy6aXzESPJiOoVApB5F0T3gqcWS2QX+gTlw4
         g3xNTbtRIY1Co9HOAB7HPkjSBqW4he6hMkjg4Ua2dVLGjlppIPr+Sah95tEV2d+W5nkz
         BOiOr7o+c47gsZcG083fwGELr0xA76Zk7fWsrShI1B3J6bS7V/ImcpDXCrrMBD82Cs4E
         XCKNmeHDAbfVYi2Rt1FD4GlMO6RU8gsxpyd/TJ9jJeJNOBe2SWPmVaNQnKYhlfv1m/Lj
         TEqUXPC+dNg8vgzL6JGC3fdlYFwv/QhjqR+D2ynOV0FE57yo4NibvAbJ99jyYnBSAPgl
         OSFw==
X-Gm-Message-State: AOAM532ybTZm+E0+Y9h19MEw/G7J4llBoiWbzORtDiA3jJUhI4CIB4zc
	Z3SKLYoYKSEmO/jBsrm59EXj9KaTfJUpLA==
X-Google-Smtp-Source: ABdhPJw6xMNyvSowwi3MnsmqNRcX44gydSmfXvKKmKbpkqwqzSvA7MVZmoUU5NQNycnkiWAt/5IKCQ==
X-Received: by 2002:a65:6d89:: with SMTP id bc9mr26747916pgb.260.1643858285384;
        Wed, 02 Feb 2022 19:18:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k15sm27170877pff.39.2022.02.02.19.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 19:18:05 -0800 (PST)
Date: Wed, 2 Feb 2022 19:18:04 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH 4/4 v5] fortify: Add Clang support
Message-ID: <202202021916.9606A43C88@keescook>
References: <20220202003033.704951-1-keescook@chromium.org>
 <20220202003033.704951-5-keescook@chromium.org>
 <CAKwvOd=icTwyFb39U3OO5i_2YNJMiCMteeNTrVe-Q0tcmmnBJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=icTwyFb39U3OO5i_2YNJMiCMteeNTrVe-Q0tcmmnBJQ@mail.gmail.com>

On Wed, Feb 02, 2022 at 01:27:11PM -0800, Nick Desaulniers wrote:
> On Tue, Feb 1, 2022 at 4:30 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > +#define BOS    const __pass_object_size(1)
> > +#define BOS0   const __pass_object_size(0)
> 
> A dumb bikeshed, but would you mind naming these BOS1 and BOS0, and
> perhaps consider adding a comment or pointer or link to something that
> describes why we use the two different modes?  I recognize that the
> code already uses the two different modes already without comments,
> but this might be a nice place to point folks like myself to so that
> in a month or so when I forget what the difference is between modes
> (again), we have a shorter trail of breadcrumbs.

Sure, I can do that. My expectation was to entirely eliminate mode 0
usage in the future.

Though now that things are so close, I'll just do some builds with the
last few users switched over. But maybe memcmp() was a pain? I'll go
check...

-- 
Kees Cook
