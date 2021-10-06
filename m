Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A322C80
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 03:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633491113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=klvfB+c7Wo6KIpJwCuQq3+3jeJR2aoZYpNscnzsRBpk=;
	b=CxBGNty914ANORZcDTYbqi0u3g8niNobm0a9t5x2l++UwICmyYj+njuNzhSksDThMK/Yk3
	Nyhg/3INF4KfKrRBC4YSYUO87PaZpIWuAoHSwtvO5YxFoyVuVcKunBTlyS5Tk0nvZc7AQ6
	3LmAAARQYPe9KRDU7ZUFp40VSuBhs4c=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-ZPJpW3ZROzynuJ0HhIlc3A-1; Tue, 05 Oct 2021 23:31:49 -0400
X-MC-Unique: ZPJpW3ZROzynuJ0HhIlc3A-1
Received: by mail-qk1-f197.google.com with SMTP id bj6-20020a05620a190600b0045e164b4576so1194834qkb.8
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 20:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=klvfB+c7Wo6KIpJwCuQq3+3jeJR2aoZYpNscnzsRBpk=;
        b=yW6e0BsIQ6p6c3namDQEexz9U/7/lXVJwIIUGf9fH0/0nELPp0D9NYN8pYY0TNi+45
         QOS93EmudpOWeR/YuvYcYb1kJUfrW0u61ePUzY7GzFJgCgq9gQFJcyorC2F9ZdLWtgXr
         IGQTwgNumJHpdZEZqXNUrsEvgLlLILgDUsG9wp0QUnU7uDZrb4X/sPTRD4O0qkpWNL//
         PM2De4JwvnO42M/Ck/KMcbWNOEHBvAy5Sumikb8yIFfZ5ojM5KVI9c+mOcDnVxbLGjos
         QAvIVf0w6Phal1BNxFwC5ZCLTIBmyuJlot9KZcZRayrQCj8D6xP6cBMDzkAecpwfxLap
         jVjQ==
X-Gm-Message-State: AOAM531XUiJQxkCxaHslDlsykk+aOucwobJS2HUtU8pFkDvu5Rs02OQZ
	VsLtELydYIHYr5piduIjagdqRmNT7UCSSWpphZR9xRiCNJON8wFwPF571DQos2TfVutNohcmSMm
	8+A3px0Y1SRWMZw==
X-Received: by 2002:a05:6214:226c:: with SMTP id gs12mr27130778qvb.58.1633491109032;
        Tue, 05 Oct 2021 20:31:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQ51LcW+PGg8/N2ibZ65de7tUVyCn7EJP78U0da/Hdc+K9Wr4qZ3/pkogDkVkmVCVNtTWrAw==
X-Received: by 2002:a05:6214:226c:: with SMTP id gs12mr27130763qvb.58.1633491108843;
        Tue, 05 Oct 2021 20:31:48 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id b14sm11013513qkl.81.2021.10.05.20.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:31:48 -0700 (PDT)
Date: Tue, 5 Oct 2021 20:31:45 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 11/15] x86, relocs: Ignore __typeid__ relocations
Message-ID: <20211006033145.vcj3ohkekv5rexpo@treble>
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-12-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210930180531.1190642-12-samitolvanen@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Sep 30, 2021 at 11:05:27AM -0700, Sami Tolvanen wrote:
> From: Kees Cook <keescook@chromium.org>
> 
> The __typeid__* symbols aren't actually relocations, so they can be
> ignored during relocation generation.

Then what are they?  It would be good to add that information here.

-- 
Josh

