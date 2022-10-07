Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1805380
	for <llvm@lists.linux.dev>; Fri,  7 Oct 2022 23:17:37 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id l4so5801319plb.8
        for <llvm@lists.linux.dev>; Fri, 07 Oct 2022 16:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3VntPma6h9YXldWusKRirKa+AxvzlFLxSpnoOOvfbEY=;
        b=Lw5fVRNuMGTXDOBUV8sWh1sbwxiATNyFn5sU8LQHGlrdcjl2RO1zQMGM4h2Tmbbrg/
         dzR4AX2LEsdqHpEtq2VXT1AktDCi/eAxuoTHKd+2004AmAbkDVEQ2gpm5lwFjwdNDPKc
         hc/pJ0qDS8e7vs4IkKY5iNoPL2VqtIZCdDMlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VntPma6h9YXldWusKRirKa+AxvzlFLxSpnoOOvfbEY=;
        b=Pyvd5BXkuWkhxlM64xXrCiEPNlw7Co7QY+IDGAnAD6MJ08Z0mgbppy8F9LZmyCypvM
         zu5J8BQTk5u4QYddPu9Ab0x+Ev8k24dlfY6FZQHvCQ1MolNZYEYpVY5N7NdHIjFtBtf6
         fmSL2mzkvVI6hEQCfby8os/QO/hC7CG1f6ULt9MytE7f3froxy4I2EpNbDY+BKbqWOwP
         ar4b9X1vI55mn4AT0C/iSPBRsEvNKuynubBYhK3raI17HCbFTNvaTNHkGk59SPnEMjfn
         OuIVMm3eqetNVM/2czLuZflwDUjca8ysoe8CmDbFuNsgLliloarCoxjifjt0Aj+kLZVx
         zo1w==
X-Gm-Message-State: ACrzQf3zH/uTS9/tTenzPCmp0PC/o6BRYk+hF3pLTNlT9gMAvNb2OBGi
	XCmlByMBqfpJdE3HTlhY3zTPLA==
X-Google-Smtp-Source: AMsMyM6dsbNeWBcjJm9aRIb7GnG5PGfyHyuEE4bQKFj2jK/3xPcKVdrwJUFENovkupK3JRiP3BgzWw==
X-Received: by 2002:a17:902:b182:b0:178:8977:4013 with SMTP id s2-20020a170902b18200b0017889774013mr6762196plr.27.1665184657464;
        Fri, 07 Oct 2022 16:17:37 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z5-20020a623305000000b00562a0c8a195sm2155931pfz.69.2022.10.07.16.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 16:17:36 -0700 (PDT)
Date: Fri, 7 Oct 2022 16:17:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andi Kleen <ak@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
	Eric Dumazet <edumazet@google.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Paul Kirth <paulkirth@google.com>
Subject: Re: [PATCH] fs/select: avoid clang stack usage warning
Message-ID: <202210071614.4297AB65D8@keescook>
References: <20190307090146.1874906-1-arnd@arndb.de>
 <20221006222124.aabaemy7ofop7ccz@google.com>
 <c646ea1e-c860-41cf-9a8e-9abe541034ff@app.fastmail.com>
 <CAKwvOdkEied8hf6Oid0sGf0ybF2WqrzOvtRiXa=j7Ms-Rc6uBA@mail.gmail.com>
 <e554eb3c-d065-4aad-b6d2-a12469eaf49c@app.fastmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e554eb3c-d065-4aad-b6d2-a12469eaf49c@app.fastmail.com>

On Fri, Oct 07, 2022 at 11:42:51PM +0200, Arnd Bergmann wrote:
> On Fri, Oct 7, 2022, at 9:04 PM, Nick Desaulniers wrote:
> > On Fri, Oct 7, 2022 at 1:28 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >> - The behavior of -ftrivial-auto-var-init= is a bit odd here: with =zero or
> >>   =pattern, the stack usage is just below the limit (1020), without the
> >>   option it is up to 1044. It looks like your .config picks =zero, which
> >>   was dropped in the latest clang version, so it falls back to not
> >
> > Huh? What do you mean by "was dropped?"
> >
> > The config I sent has:
> > CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> > CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
> > CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
> > # CONFIG_INIT_STACK_NONE is not set
> > CONFIG_INIT_STACK_ALL_ZERO=y
> 
> When I use this config on my kernel tree (currently on top of
> next-20220929 for unrelated work) and build with clang-16,
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO is disabled, so it falls
> back from CONFIG_INIT_STACK_NONE instead of the unavailable
> CONFIG_INIT_STACK_ALL_ZERO.

I think you have a very recent Clang but are building a tree that
doesn't have commit 607e57c6c62c ("hardening: Remove Clang's enable flag
for -ftrivial-auto-var-init=zero").

-- 
Kees Cook
