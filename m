Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCC5A35
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 18:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644865078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zw0m26jmgL5PSZbxc9F56RhQG8aGfeQzkdtSIlZWESE=;
	b=Xf2cLs7g/FISg7dGEKywiC5cCg7Frnw8s7q4SlHO+At5U8nxi5m2AasucNU5ij8ZAyxjRM
	0COPl9gBfQd+1aaFsksxnNdkVhdeSO5pLlrmpp0OZ1r0WvJ0T57/g+JBtHPSi85xszrbiU
	P8HtondCAFcxTMJ4dHnu4DoxHPDkJTs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-Ws1QMo1bO_qKX86CNTDJZw-1; Mon, 14 Feb 2022 13:57:55 -0500
X-MC-Unique: Ws1QMo1bO_qKX86CNTDJZw-1
Received: by mail-qv1-f70.google.com with SMTP id kc30-20020a056214411e00b0042cb92fe8bbso4900159qvb.8
        for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 10:57:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zw0m26jmgL5PSZbxc9F56RhQG8aGfeQzkdtSIlZWESE=;
        b=Wzmz0XYu8lgUAX2pcH8da+Z5YoMo1zzemyMJl81O1HW4oZVV6D5zBEmeJgH17ArB+d
         Iht7K13fQRHGhvZGprh43ObZjspwtRSQ/Meo51sP75pClsuidlxHR2JR1Jm9v95NbGX+
         eDWI2b/h4nrecmzxPodZS2uEjpzeFq4/wtab7BL+EblkXs7R05qMnRuOq1TudKa8mU6u
         Fmma67oKemDYHmPf+hHP2zeFqC/AfeBVm1PgCpiAoV73Z1xR69LdWvRcY5NEs9P1F/IW
         6CYK5E067mn58AlJzxs3YjWiZfxFajCQbqtuLlbJIuWqwQ6yKYn5N2sZfGoF73Q395SJ
         iH+Q==
X-Gm-Message-State: AOAM531d07k6FgkNYuIupb12Ci4XuLhz+yqI/onOywGHPLLVvPm013y2
	VRYssmPTC3x3Mn6wnf3D0kb1ckTlu8PbHdQhhYM7mOZfYlRp+sI5OE+QsAPkFmYKK+tnYTlxoGG
	XxcqeWYeuKP1F9g==
X-Received: by 2002:ad4:58f1:: with SMTP id di17mr81627qvb.36.1644865075191;
        Mon, 14 Feb 2022 10:57:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJysuyQMRiLKO/pEhsQy4DxLU5S9UbooAkR2s9LJCJ+c5txevugMskSZ+48nNPU8AiQWi+8+Lg==
X-Received: by 2002:ad4:58f1:: with SMTP id di17mr81584qvb.36.1644865074915;
        Mon, 14 Feb 2022 10:57:54 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id i13sm16244149qko.91.2022.02.14.10.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 10:57:54 -0800 (PST)
Date: Mon, 14 Feb 2022 10:57:48 -0800
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
Message-ID: <20220214185748.ite4oxkaynrvjj34@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <20220214121447.288695-1-alexandr.lobakin@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220214121447.288695-1-alexandr.lobakin@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

NOTE: Maybe -zunique-symbol won't get used after all, based on maskray's
objections.  Regardless, I'm replying below, because the rest of the
approach in this patch seems all wrong.

On Mon, Feb 14, 2022 at 01:14:47PM +0100, Alexander Lobakin wrote:
> From: Josh Poimboeuf <jpoimboe@redhat.com>
> Date: Fri, 11 Feb 2022 09:41:30 -0800
> 
> > On Wed, Feb 09, 2022 at 07:57:39PM +0100, Alexander Lobakin wrote:
> > > Position-based search, which means that if there are several symbols
> > > with the same name, the user needs to additionally provide the
> > > "index" of a desired symbol, is fragile. For example, it breaks
> > > when two symbols with the same name are located in different
> > > sections.
> > > 
> > > Since a while, LD has a flag `-z unique-symbol` which appends
> > > numeric suffixes to the functions with the same name (in symtab
> > > and strtab). It can be used to effectively prevent from having
> > > any ambiguity when referring to a symbol by its name.
> > 
> > In the patch description can you also give the version of binutils (and
> > possibly other linkers) which have the flag?
> 
> Yeah, sure.

> > > Check for its availability and always prefer when the livepatching
> > > is on. It can be used unconditionally later on after broader testing
> > > on a wide variety of machines, but for now let's stick to the actual
> > > CONFIG_LIVEPATCH=y case, which is true for most of distro configs
> > > anyways.
> > 
> > Has anybody objected to just enabling it for *all* configs, not just for
> > livepatch?
> 
> A few folks previously.

Why?  It would be good to document that here.

> > I'd much prefer that: the less "special" livepatch is (and the distros
> > which enable it), the better.  And I think having unique symbols would
> > benefit some other components.
> 
> Agree, I just want this series to be as least invasive for
> non-FG-KASLR builds as possible.

But in a very real sense, this patch is making the series *more*
invasive by complexifying the config space.

Adding -zunique-symbols could have kernel-wide implications.  If there
were bugs, we'd want to root them out, not hide them behind obscure
config combinations we hope nobody uses.  Effectively this is
destabilizing CONFIG_LIVEPATCH.

Beyond "least invasive", we also need to consider:

- What makes fgkaslr most compatible with other features?
- What makes fgkaslr most palatable for wide use?
- What's best for the kernel as a whole?

It's much better to integrate new features properly with the kernel,
rather than just grafting them on to the side.  Otherwise it just adds
technical debt, with no benefit to the rest of the kernel.  Then it
might as well just remain an out-of-tree patch set.

> > > +	if (IS_ENABLED(CONFIG_LD_HAS_Z_UNIQUE_SYMBOL))
> > > +		sympos = 0;
> > > +
> > 
> > Similarly, I don't see a need for this.  If the patch is legit then
> > sympos should already be zero.  If not, an error gets reported and the
> > patch fails to load.
> 
> Right, but for both those chunks the main idea is to let the
> compiler optimize-out the code non-actual for unique-symbol builds:
> 
> add/remove: 0/0 grow/shrink: 1/2 up/down: 3/-80 (-77)
> Function                                     old     new   delta
> klp_find_callback                            139     142      +3
> klp_find_object_symbol.cold                   85      48     -37
> klp_find_object_symbol                       168     125     -43

As I said, it's not a hot path, so there's no need to complicate the
code with edge cases, and remove useful error checking in the process.

-- 
Josh

