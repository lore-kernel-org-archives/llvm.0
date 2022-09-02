Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E5F66F5
	for <llvm@lists.linux.dev>; Fri,  2 Sep 2022 22:44:35 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id x23so3198863pll.7
        for <llvm@lists.linux.dev>; Fri, 02 Sep 2022 15:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=mIxY46m1QzJn3vOoV8Aurpr840TvHU3zLfjo/cbWqFk=;
        b=cYqFKD+l3LBaVj0Nglfk20jgUIjQ5VC+53Os9QTM/lf2Nb/TXPza+rYNtkGp0/fVFU
         B1TpRyVVK3e6ROFqWRySUfIATFBvaSxbSyCQgfXx4V2eANsSh1Gn4Z04EA83JT+HkNkG
         /ApMRwFeSuG0Yf+IZ6tm/VIIHcZKbAsYRJfZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=mIxY46m1QzJn3vOoV8Aurpr840TvHU3zLfjo/cbWqFk=;
        b=NskreR05Bl1c0xLQ3ZnYLmZRvbiZ7hH4x2yJkwnNwNc3jN7tMh+2YnSbqw+cTuayoN
         G/fv8fOxfk0G05653bOaYvjkxsCZvLeSj7gsoxKI44OeyALbuHBYgC4F4nvpUdiicvZG
         iizakyqjfPhpzPWr1lbKA7/h/ownEfGQbnoLZ8TAjr1JCtQxRo6cISMRj70xqLEyKj8H
         eq2WMECBK7K7wHGY7RRTOL2tF6aYxxpnniudB6nCrW6Q+jFv5BhvAba/n8hadvhK3LKH
         ZNmMZ/hK7NZegds3dOBGC6pUJnsu0g4X8t2VM8gWhy+cZ5FixV2vYkNOOb+8ag6OZWcd
         n/ag==
X-Gm-Message-State: ACgBeo2n+lDJMHPg/wpbXUYuh/ZydEHLmzOA4Ut3lqXpsAIqhY2Dr+D3
	Nlp2XRr5CGsvEdJCFZlQHntuug==
X-Google-Smtp-Source: AA6agR51nDiWxMdGZbsqX9QWjVEepoUFgYZiN4SZlJrqmTRnzNhGn8v/2CvIxf3CKgcYDwLWprczKA==
X-Received: by 2002:a17:90b:212:b0:1fd:e61b:866a with SMTP id fy18-20020a17090b021200b001fde61b866amr7000390pjb.141.1662158675307;
        Fri, 02 Sep 2022 15:44:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k12-20020aa79d0c000000b00537d7cc774bsm2323553pfp.139.2022.09.02.15.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 15:44:34 -0700 (PDT)
Date: Fri, 2 Sep 2022 15:44:33 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Tom Rix <trix@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	David Gow <davidgow@google.com>, Yury Norov <yury.norov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Sander Vanheule <sander@svanheule.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Isabella Basso <isabbasso@riseup.net>,
	Eric Dumazet <edumazet@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Eric Biggers <ebiggers@google.com>, Hannes Reinecke <hare@suse.de>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 3/3] fortify: Use SIZE_MAX instead of (size_t)-1
Message-ID: <202209021544.AEF73D202@keescook>
References: <20220902204351.2521805-1-keescook@chromium.org>
 <20220902204351.2521805-4-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902204351.2521805-4-keescook@chromium.org>

On Fri, Sep 02, 2022 at 01:43:51PM -0700, Kees Cook wrote:
> Clean up uses of "(size_t)-1" in favor of SIZE_MAX.
> 
> Cc: linux-hardening@vger.kernel.org
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  include/linux/fortify-string.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)

*brown paper bag*

This needs:

#include <linux/limits.h>

I will fix it locally...

-- 
Kees Cook
