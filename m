Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1C17E
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 18:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644604537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J8HfLfxVfcNiEkSEpweyJmi/8GyqJBZOj2yEwh6I5kQ=;
	b=DPIUuc92rhtDlcr85TDrzAzHgmpBK+X5Lvp6cXpFZF/AwKN9DoFSpTxRhZiGVm9WCqZYmr
	pKtUAYGacpMdZR3gb8u1D1d0NTcDGnJQwBCe7EkhhKPWawtbC4FuzoPD6xf4bfx1j4Jdan
	mKiUdQ/SUn9ikgOw5V0MgX6xQbrTyhY=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-NJwk2SZpN1C85Cz5PTBsYg-1; Fri, 11 Feb 2022 13:35:35 -0500
X-MC-Unique: NJwk2SZpN1C85Cz5PTBsYg-1
Received: by mail-oo1-f72.google.com with SMTP id y20-20020a4acb94000000b003185ebeeffdso3381329ooq.15
        for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 10:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=J8HfLfxVfcNiEkSEpweyJmi/8GyqJBZOj2yEwh6I5kQ=;
        b=N7CgEdY8UdZB1qStE4ikw87jTJMtPO3GoCJW2MYgXToe/bgK9E6RqmI9hyhwMxx70R
         sIMsDJFK6G/DpsfTm/3PlKK81nmeAve59xhXBd2DIG1E+Da22FP0J2Su3tpQXxYWT1qw
         n/L6SwzE4cfMwnz9cytBhWrSx4jysjk2Kx+CN7sTAnSx1lEtCVwjXx8MrJej0Du7NsCx
         lCYAmsQRaNwsizXDV3HnWg7j0w2PoWK7nKPNaO7sTZnhIWNp98TTEXeiVoNOUnHqHh5S
         gZVWLZ0P8fMi5LnuLue9dKAuZI1d1JvpARMzXhyc9g7Y2A2eDvPR3S3e1T0nsLaMih9h
         5WBA==
X-Gm-Message-State: AOAM530193Bl4qPousi+9FTuKLnPYfiIMczJ5kQtikEyu99dAAlZIfL0
	djZRNKn++CraRXk5NVphNZ8UlSq6JiJ/S8HQ2gfwKrfTlk1h0P3MD06/fK71BYkWezyvHc0GnpI
	2LlIua77h1Tj3Fg==
X-Received: by 2002:a05:6830:19ed:: with SMTP id t13mr1078567ott.83.1644604535033;
        Fri, 11 Feb 2022 10:35:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwvxMA3qcq86xXsncmpwHUMHF94120N5jKw3TA/bT6HNPqEH7OwmhO+43BhJzSDitpUEbLUcg==
X-Received: by 2002:a05:6830:19ed:: with SMTP id t13mr1078522ott.83.1644604534752;
        Fri, 11 Feb 2022 10:35:34 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::35])
        by smtp.gmail.com with ESMTPSA id m7sm9451958ots.32.2022.02.11.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 10:35:34 -0800 (PST)
Date: Fri, 11 Feb 2022 10:35:29 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
	linux-hardening@vger.kernel.org, x86@kernel.org,
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
Message-ID: <20220211183529.q7qi2qmlyuscxyto@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Feb 11, 2022 at 10:05:02AM -0800, Fāng-ruì Sòng wrote:
> On Fri, Feb 11, 2022 at 9:41 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
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
> GNU ld>=2.36 supports -z unique-symbol. ld.lld doesn't support -z unique-symbol.
> 
> I subscribe to llvm@lists.linux.dev and happen to notice this message
> (can't keep up with the changes...)
> I am a bit concerned with this option and replied last time on
> https://lore.kernel.org/r/20220105032456.hs3od326sdl4zjv4@google.com
> 
> My full reasoning is on
> https://maskray.me/blog/2020-11-15-explain-gnu-linker-options#z-unique-symbol

Ah, right.  Also discussed here:

  https://lore.kernel.org/all/20210123225928.z5hkmaw6qjs2gu5g@google.com/T/#u
  https://lore.kernel.org/all/20210125172124.awabevkpvq4poqxf@treble/

I'm not qualified to comment on LTO/PGO stability issues, but it doesn't
sound good.  And we want to support livepatch for LTO kernels.

Also I realized that this flag would have a negative effect on
kpatch-build, as it currently does its analysis on .o files.  So it
would have to figure out how to properly detect function renames, to
avoid patching the wrong function for example.

And if LLD doesn't plan to support the flag then it will be a headache
for livepatch (and the kernel in general) to deal with the divergent
configs.

One idea I mentioned before, it may be worth exploring changing the "F"
in FGKASLR to "File" instead of "Function".  In other words, only
shuffle at an object-file granularity.  Then, even with duplicates, the
<file+function> symbol pair doesn't change in the symbol table.  And as
a bonus, it should help FGKASLR i-cache performance, significantly.

-- 
Josh

