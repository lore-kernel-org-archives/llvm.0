Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9433689
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 19:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645041466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xiLxVyN59oqE7A7718SqSgkuduNadRNJgJwK2/lq92E=;
	b=YLe1zyKjBBq4/N4O04UJRwLjiPZBdNh4E6hg0Sh1QUryLp50qKmtsd4QlKa4D4Lvmcr2Bt
	hChdT0nBIolIhClL7B4EStfUXVIoQl5LwUZrHsfAvVNSpgdZ+JLfLgEt6ndQiAKnzW4E35
	/bzomFteh4+wPaQ3NKJu5TEcp31/ko4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-75P_5lZJNMeZR_bfLSxgNw-1; Wed, 16 Feb 2022 14:57:45 -0500
X-MC-Unique: 75P_5lZJNMeZR_bfLSxgNw-1
Received: by mail-qv1-f72.google.com with SMTP id k6-20020ad45be6000000b0042c82bd64deso2827230qvc.22
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 11:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xiLxVyN59oqE7A7718SqSgkuduNadRNJgJwK2/lq92E=;
        b=2feoRWeWpLI1luAmoM1oSj0nlLasvgV8wEi/V7CkgvG6iTl0Ns3u+Q67Od4UVRFxcS
         tXM7ytKhMev5HhR+Xi+7n9lexLB8Ik+f0hiuKeoReditf+H3EUdx5nubzGbF5hDqYN6y
         Ftez1iADXNQ/tRYFksR2RbYfQtjI9bYvdQfZfbYAMODff+NWxh6QCYGTURQVJwNfqTE8
         m1/fpzzOhJ5vAZMDlsxtmY/nFbx1sw67J6UphBlYp6hEDrv8eSMWiPeSzoa/HlaNv1aL
         kYTaJCC8d8kD0VFXVyAg/MYEajIz4b8U/IEn1++M32Y0JDuH39a4cSZ2L+PhOCKc1Dlt
         R23w==
X-Gm-Message-State: AOAM5325clvZV3egLFsFEj1YzjIzeryJBura5TYZWN4foREy9S1gBkXc
	xpH3ndCdiNa4Qkwhz0u/NRRx1WrPjuv2JRwfnD95AcwkKVA4RGgK43JQWgkMRq3ExkPNT7n8RgV
	Gio0tKjjR6uY7Lg==
X-Received: by 2002:a05:622a:1349:b0:2d4:7253:a515 with SMTP id w9-20020a05622a134900b002d47253a515mr3268815qtk.602.1645041464732;
        Wed, 16 Feb 2022 11:57:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygWGLG5sUSJg9RfvApTNNy6TjsndVIBgztpxG68wFuUHr83ZsEZ3BHwvjzof67oYJOV+7Ieg==
X-Received: by 2002:a05:622a:1349:b0:2d4:7253:a515 with SMTP id w9-20020a05622a134900b002d47253a515mr3268787qtk.602.1645041464385;
        Wed, 16 Feb 2022 11:57:44 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id c7sm3530034qtp.61.2022.02.16.11.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:57:43 -0800 (PST)
Date: Wed, 16 Feb 2022 11:57:38 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Miroslav Benes <mbenes@suse.cz>
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
Message-ID: <20220216195738.vhlot4udoqga4ndm@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <alpine.LSU.2.21.2202161601010.1475@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2202161601010.1475@pobox.suse.cz>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 16, 2022 at 04:06:24PM +0100, Miroslav Benes wrote:
> > > +	/*
> > > +	 * If the LD's `-z unique-symbol` flag is available and enabled,
> > > +	 * sympos checks are not relevant.
> > > +	 */
> > > +	if (IS_ENABLED(CONFIG_LD_HAS_Z_UNIQUE_SYMBOL))
> > > +		sympos = 0;
> > > +
> > 
> > Similarly, I don't see a need for this.  If the patch is legit then
> > sympos should already be zero.  If not, an error gets reported and the
> > patch fails to load.
> 
> My concern was that if the patch is not legit (that is, sympos is > 0 for 
> some reason), the error would be really cryptic and would not help the 
> user at all. So zeroing sympos seems to be a good idea to me. There is no 
> harm and the change is very small and compact.

But wouldn't a cryptic error be better than no error at all?  A bad
sympos might be indicative of some larger issue, like the wrong symbol
getting patched.

-- 
Josh

