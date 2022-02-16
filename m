Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00B5368A
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 20:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645041693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2VxECJm9oCcTZNF1nwOOvaIbVoK8MPKCQvBO1i/w1TA=;
	b=dI0C0GXc0qtXP+T/WKkply7dlpgjQS2/RV+HxXirJj4RNLc2bMIAVlevYu5/BZN7jCJexZ
	Rzm2TQ4d/EO3Yb2OWCo84fj/7kl5JQCwS8AmaUZqGVa+9Vw56meUk6jptajELXh3CqPvsd
	mezX2u+begvkaqakevUnDKxrJzBpbi0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-6j4rEEF3O6eBlWmE7x6JjQ-1; Wed, 16 Feb 2022 15:01:27 -0500
X-MC-Unique: 6j4rEEF3O6eBlWmE7x6JjQ-1
Received: by mail-qk1-f200.google.com with SMTP id z1-20020ae9f441000000b00507a22b2d00so2141068qkl.8
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 12:01:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=2VxECJm9oCcTZNF1nwOOvaIbVoK8MPKCQvBO1i/w1TA=;
        b=O29kjI7P5InbWEph0pJgBwcSYX2AJJR3IH2goD1K3lBpiEMaa2fgjesqsi/tc2u+K9
         YMFMG1fbWj42leu/KiH/LO2fV0Pgn/Tia1om1w6IGlYnSfOSDH3+j2EZE3HyYqrm3Rc/
         ErPUHI5VsZ0WZvkd28prrlKMKl86GHljBVOI6fyG2OYOewiASbUSFhspi3mNx2Z4lBfC
         o8qm4aIYdon/EvMGNVkR9jyfuw4Wqm1J5AaV4dCeJ135pYkVQUxpLbifZOGJeok9M1kU
         bYcdOXhsYVlaXEMYn5UBlz2UDCzES8OxGovmU8yfxWkTxOqXSsMSzdDj4DCMoflOIIs9
         le2w==
X-Gm-Message-State: AOAM530cPEg1IFAoHksgfMedcGu0fyqqM5i2L6LXVyFmHSXdvcOZ0T+R
	Jbr5J/+vqT7aGOU5OGV4SV13AQ0hqlz/kHDu8YUPqRehIEf3XNOBxAcJ4wIdi/i9YWmNlxDJ1rX
	ak3Z1LTdiTdcQDA==
X-Received: by 2002:ae9:eb12:0:b0:608:4151:c70f with SMTP id b18-20020ae9eb12000000b006084151c70fmr1842240qkg.281.1645041686710;
        Wed, 16 Feb 2022 12:01:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcmcVnXIz7khB34mtSJ5XeCHKuXXwpaasMWVF3vmW0irrcQH4GnwIH7nMDtcIH2X2ytZ5b9A==
X-Received: by 2002:ae9:eb12:0:b0:608:4151:c70f with SMTP id b18-20020ae9eb12000000b006084151c70fmr1842215qkg.281.1645041686423;
        Wed, 16 Feb 2022 12:01:26 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id p6sm8916153qkg.33.2022.02.16.12.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 12:01:25 -0800 (PST)
Date: Wed, 16 Feb 2022 12:01:20 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Miroslav Benes <mbenes@suse.cz>
Cc: =?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
	Alexander Lobakin <alexandr.lobakin@intel.com>,
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
Message-ID: <20220216200120.djt6ijjenmcxmko6@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
 <20220211183529.q7qi2qmlyuscxyto@treble>
 <alpine.LSU.2.21.2202161606430.1475@pobox.suse.cz>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.2202161606430.1475@pobox.suse.cz>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Feb 16, 2022 at 04:15:20PM +0100, Miroslav Benes wrote:
> > > I subscribe to llvm@lists.linux.dev and happen to notice this message
> > > (can't keep up with the changes...)
> > > I am a bit concerned with this option and replied last time on
> > > https://lore.kernel.org/r/20220105032456.hs3od326sdl4zjv4@google.com
> > > 
> > > My full reasoning is on
> > > https://maskray.me/blog/2020-11-15-explain-gnu-linker-options#z-unique-symbol
> > 
> > Ah, right.  Also discussed here:
> > 
> >   https://lore.kernel.org/all/20210123225928.z5hkmaw6qjs2gu5g@google.com/T/#u
> >   https://lore.kernel.org/all/20210125172124.awabevkpvq4poqxf@treble/
> > 
> > I'm not qualified to comment on LTO/PGO stability issues, but it doesn't
> > sound good.  And we want to support livepatch for LTO kernels.
> 
> Hm, bear with me, because I am very likely missing something which is 
> clear to everyone else...
> 
> Is the stability really a problem for the live patching (and I am talking 
> about the live patching only here. It may be a problem elsewhere, but I am 
> just trying to understand.)? I understand that two different kernel builds 
> could have a different name mapping between the original symbols and their 
> unique renames. Not nice. But we can prepare two different live patches 
> for these two different kernels. Something one would like to avoid if 
> possible, but it is not impossible. Am I missing something?

Maybe Fāng-ruì can clarify, but my understanding was that the stability
issue affects the kernel in general (particularly if LTO or PGO is
enabled) and isn't necessarily specific to livepatch itself.

-- 
Josh

