Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D14F7A
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 17:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644601298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DsslKcWWZw1ZEXjoK3NOAcTJ9ntP6kaMA/aNOxKWKsA=;
	b=UdEf2vRp6YBaFDsxA7p3QQhiK+u/+E80YCkmISYBpbL/19lRzqkjcaihB5NQZh4/LZLHlj
	cXvolKmSNPQEXqSmFDlRgeB6wf4+LKZTnFujMHY3sWleAuBLRgI2cORvx8g4BZguE0uYNV
	lSm+UrmjXU6UO8UUTMStP+CJv9t9Sbg=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-JwZlDaFqPnypp-v19yafLw-1; Fri, 11 Feb 2022 12:41:37 -0500
X-MC-Unique: JwZlDaFqPnypp-v19yafLw-1
Received: by mail-oo1-f72.google.com with SMTP id s14-20020a4aa54e000000b002ea553d580eso6064104oom.4
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 09:41:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DsslKcWWZw1ZEXjoK3NOAcTJ9ntP6kaMA/aNOxKWKsA=;
        b=l2BcR7kmNt/JJpEpMNEvBSt62f1HKOpnLdZKI0CLSAujiptdC0xBkpIXiFDo7QnqBZ
         jg7Z9+RJ2/X2ZPs8eAWlXqiI1aNty4vg892yTSsWExLOzZe89xJMtKJLqehxmtrNS0VE
         JE25jP+NuLi2E2u9VIWn+9s/MXBGXUGz2RVJa6EsrBkKclTswD//uRayZu+2MjpfU5YZ
         Gb4KXAoDqFoSzcHY+QeBQ5PQ5aUed1ncE4+8PGr5oF0XSgoL3CUK+iMBit9IMQjddziW
         FN0n0TBmCFioj5bccovZPptRjgkAw8OcpU1hQV52xz/IpkdDdq4W8lHRe0i6sO2s8kPR
         Df2Q==
X-Gm-Message-State: AOAM53334SVzibIVyCZAb++faZRHYy7wsi1zvdRkBG0VBhczwfIk+yQX
	xrOBI9NTAuwFuxPRlbkBlYbyfoQofLoeTPs/xEel+cB5eQ+ktdvvFaf29b62Q+Fz5TsuTyKXLtP
	F3d3zXZfqa6xblQ==
X-Received: by 2002:a4a:c803:: with SMTP id s3mr962357ooq.12.1644601296296;
        Fri, 11 Feb 2022 09:41:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7xm9RS9Cg53scRBXEPeV5dlBglzJkb0Owt5LpyK2WIvJG9HWSL4pe7TqN1DSUSb+3hY9s4g==
X-Received: by 2002:a4a:c803:: with SMTP id s3mr962335ooq.12.1644601296044;
        Fri, 11 Feb 2022 09:41:36 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id l4sm9620481otq.50.2022.02.11.09.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 09:41:35 -0800 (PST)
Date: Fri, 11 Feb 2022 09:41:30 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Alexander Lobakin <alexandr.lobakin@intel.com>
Cc: linux-hardening@vger.kernel.org, x86@kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kees Cook <keescook@chromium.org>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Ard Biesheuvel <ardb@kernel.org>, Tony Luck <tony.luck@intel.com>,
	Bruce Schlobohm <bruce.schlobohm@intel.com>,
	Jessica Yu <jeyu@kernel.org>, kernel test robot <lkp@intel.com>,
	Miroslav Benes <mbenes@suse.cz>,
	Evgenii Shatokhin <eshatokhin@virtuozzo.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Christoph Hellwig <hch@lst.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marios Pomonis <pomonis@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"H.J. Lu" <hjl.tools@gmail.com>, Nicolas Pitre <nico@fluxnic.net>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org, live-patching@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v10 02/15] livepatch: avoid position-based search if `-z
 unique-symbol` is available
Message-ID: <20220211174130.xxgjoqr2vidotvyw@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220209185752.1226407-3-alexandr.lobakin@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 09, 2022 at 07:57:39PM +0100, Alexander Lobakin wrote:
> Position-based search, which means that if there are several symbols
> with the same name, the user needs to additionally provide the
> "index" of a desired symbol, is fragile. For example, it breaks
> when two symbols with the same name are located in different
> sections.
> 
> Since a while, LD has a flag `-z unique-symbol` which appends
> numeric suffixes to the functions with the same name (in symtab
> and strtab). It can be used to effectively prevent from having
> any ambiguity when referring to a symbol by its name.

In the patch description can you also give the version of binutils (and
possibly other linkers) which have the flag?

> Check for its availability and always prefer when the livepatching
> is on. It can be used unconditionally later on after broader testing
> on a wide variety of machines, but for now let's stick to the actual
> CONFIG_LIVEPATCH=y case, which is true for most of distro configs
> anyways.

Has anybody objected to just enabling it for *all* configs, not just for
livepatch?

I'd much prefer that: the less "special" livepatch is (and the distros
which enable it), the better.  And I think having unique symbols would
benefit some other components.

> +++ b/kernel/livepatch/core.c
> @@ -143,11 +143,13 @@ static int klp_find_callback(void *data, const char *name,
>  	args->count++;
>  
>  	/*
> -	 * Finish the search when the symbol is found for the desired position
> -	 * or the position is not defined for a non-unique symbol.
> +	 * Finish the search when unique symbol names are enabled
> +	 * or the symbol is found for the desired position or the
> +	 * position is not defined for a non-unique symbol.
>  	 */
> -	if ((args->pos && (args->count == args->pos)) ||
> -	    (!args->pos && (args->count > 1)))
> +	if (IS_ENABLED(CONFIG_LD_HAS_Z_UNIQUE_SYMBOL) ||
> +	    (args->pos && args->count == args->pos) ||
> +	    (!args->pos && args->count > 1))
>  		return 1;

There's no real need to do this.  The code already works as-is, even if
there are no unique symbols.

Even if there are no duplicates, there's little harm in going through
all the symbols anyway, to check for errors just in case something
unexpected happened with the linking (unexpected duplicate) or the patch
creation (unexpected sympos).  It's not a hot path, so performance isn't
really a concern.

When the old linker versions eventually age out, we can then go strip
out all the sympos stuff.

> @@ -169,6 +171,13 @@ static int klp_find_object_symbol(const char *objname, const char *name,
>  	else
>  		kallsyms_on_each_symbol(klp_find_callback, &args);
>  
> +	/*
> +	 * If the LD's `-z unique-symbol` flag is available and enabled,
> +	 * sympos checks are not relevant.
> +	 */
> +	if (IS_ENABLED(CONFIG_LD_HAS_Z_UNIQUE_SYMBOL))
> +		sympos = 0;
> +

Similarly, I don't see a need for this.  If the patch is legit then
sympos should already be zero.  If not, an error gets reported and the
patch fails to load.

-- 
Josh

