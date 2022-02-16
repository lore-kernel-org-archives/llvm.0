Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DAC1FC7
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 22:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645049614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GInsY8EWMmzWnfSQud73Z6xT/DOtOKlNQiWr2Elb/hk=;
	b=fl675JxTZgTbBucqo+Nzsk334blOKLUHliJr+sjUB/Dzdr+F0tHISroTyMZssOSQuZxLqw
	POpVO22kBY/Yoh1bCR3BOVh+QUnfd5iNDPH+aH90GJ/cJK8s9A3SdCZ8HALTJd8LGdRIwq
	wYzbgPntI20qQ6HDqVyReqM+Q4kS/QQ=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-LC6_aXFnNu6vBEpEsvbwxg-1; Wed, 16 Feb 2022 17:13:31 -0500
X-MC-Unique: LC6_aXFnNu6vBEpEsvbwxg-1
Received: by mail-qk1-f198.google.com with SMTP id t10-20020a37aa0a000000b00605b9764f71so2423490qke.22
        for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 14:13:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GInsY8EWMmzWnfSQud73Z6xT/DOtOKlNQiWr2Elb/hk=;
        b=ch3RUhr6YbjwLHQRBbTfabSM6u1HbljlIZZS3vL+XgXMiqis8X+2/SnRy8yVzgzZ3W
         siP9F5DsFN7tzrTLw0GU8PcYKOyWNjpdsI8YW/JcIojAnPQkCJvrWVR8gK0wZenzU58E
         zhM90/DAV77u81PbGzigtthv1e+QdqOOqD0UEffYoK6yfuu26V6RSgzzwbrMv7GH0Kg+
         uIlccouHISq178eKINf9eHvinSQIhYfoIfBgu99TNxZlBvW6lUc75G2sfaJ3+jIot2/h
         zSJegQOtUO3Lprl4by1VRyMTlRnTbPJWfDSTyt5ZFiyrmtLy+M87PJpkFWv3iUgqZAvN
         m2Nw==
X-Gm-Message-State: AOAM533vSHelSHPHiAdIe6yIogD0MShiDnzSZuGIAcxirFu4aiATzNFR
	PvMi9x/EtCjwmVDfptzGy5cDwHQRBeJbt8lVfohmmWYCB/JBDjOzj3k+VORnr77Rl2VDqTmVW3D
	TrVvTnf5kE1gH3A==
X-Received: by 2002:a37:bcd:0:b0:508:19df:59ac with SMTP id 196-20020a370bcd000000b0050819df59acmr2498053qkl.227.1645049610690;
        Wed, 16 Feb 2022 14:13:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJylNMRi17SxjrpZK57rI6C9v3gwc8m6LOiygd1+pTiydJMqSsqj+XSkhj9zykPsZ8CKxgwdIw==
X-Received: by 2002:a37:bcd:0:b0:508:19df:59ac with SMTP id 196-20020a370bcd000000b0050819df59acmr2497996qkl.227.1645049610346;
        Wed, 16 Feb 2022 14:13:30 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id m22sm19966780qkn.35.2022.02.16.14.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 14:13:29 -0800 (PST)
Date: Wed, 16 Feb 2022 14:13:24 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>,
	=?utf-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>,
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
Message-ID: <20220216221324.4b4avd5l3qdmqfcv@treble>
References: <20220209185752.1226407-1-alexandr.lobakin@intel.com>
 <20220209185752.1226407-3-alexandr.lobakin@intel.com>
 <20220211174130.xxgjoqr2vidotvyw@treble>
 <CAFP8O3KvZOZJqOR8HYp9xZGgnYf3D8q5kNijZKORs06L-Vit1g@mail.gmail.com>
 <20220211183529.q7qi2qmlyuscxyto@treble>
 <20220214122433.288910-1-alexandr.lobakin@intel.com>
 <20220214181000.xln2qgyzgswjxwcz@treble>
 <Yg1fab6h1rTjVbYO@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Yg1fab6h1rTjVbYO@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 16, 2022 at 03:32:41PM -0500, Joe Lawrence wrote:
> > Right, so we'd have to abandon position-based search in favor of
> > file+func based search.
> > 
> > It's not perfect because there are still a few file+func duplicates.
> > But it might be good enough.  We would presumably just refuse to patch a
> > duplicate.  Or we could remove them (and enforce their continued removal
> > with tooling-based warnings).
> > 
> 
> You're talking about duplicate file+func combinations as stored in the
> symbol table?

Right.

> ...
>       6 OBJECT core.c::__func__.3
>       6 OBJECT core.c::__func__.5
>       7 OBJECT core.c::__func__.1
>       8 OBJECT core.c::__func__.0
>       8 OBJECT core.c::__func__.2
> 
> We could probably minimize the FUNC duplicates with unique names, but
> I'm not as optimistic about the OBJECTs as most are created via macros
> like __already_done.X.  Unless clever macro magic?

Good point about objects, as we rely on disambiguating them for klp
relocations.  Luckily, the fact that most of them are created by macros
is largely a good thing.  We consider most of those to be "special"
static locals, which don't actually need to be correlated or referenced
with a klp reloc.

For example:

- '__func__' is just the function name.  The patched function shouldn't
  need to reference the original function's function name string.

- '__already_done' is used for printk_once(); no harm in making a new
  variable initialized to false and printing it again; or converting
  printk_once() to just printk() to avoid an extra print.

- '__key' is used by lockdep to track lock usage and validate locking
  order.  It probably makes sense to use a new key in the patched
  function, since the new function might have different locking
  behavior.

> Next question: what are the odds that these entries, at least the ones
> we can't easily rename, need disambiguity for livepatching?  or
> kpatch-build for related purposes?

I would guess the odds are rather low, given the fact that there are so
few functions, and we don't care about most of the objects on the list.

If duplicates were to become problematic then we could consider adding
tooling which warns on a duplicate file:sym pair with the goal of
eliminating duplicates (exculding the "special" objects).

-- 
Josh

