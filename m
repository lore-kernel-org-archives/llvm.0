Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6702C82
	for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 19:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642533783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=szFzYuqp/rVABkm8mkSgMpFZFDViwmtCeMvEqr1ilK0=;
	b=aX1IXfXmQJFF8VIUSpouTMpgF9g+Kraim2peX5SqvRofhNvFX7R2gz5LjbbmbSExrQblf+
	GNEPMn9SZlALcsl+CBLyKZo63mZTLWTz2itTD0ri8eL4FJtWH52zxVD7vGOJ/oZhjzgx4t
	4ACfDcitZK+SJ6in1I/GhcUrTf5jMsg=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-bcSCp6fFPFmMMY1t-uNAPg-1; Tue, 18 Jan 2022 14:23:00 -0500
X-MC-Unique: bcSCp6fFPFmMMY1t-uNAPg-1
Received: by mail-ot1-f72.google.com with SMTP id 49-20020a9d08b4000000b0059bd1411628so117999otf.8
        for <llvm@lists.linux.dev>; Tue, 18 Jan 2022 11:23:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=szFzYuqp/rVABkm8mkSgMpFZFDViwmtCeMvEqr1ilK0=;
        b=f/KSvv24iPG/Uq2X71AYlb6MKJBgzFY3VW51VvFRjCnJ0pBCQTel1DCx2r0QXH+BEi
         XeUYd/EqAhe3aBZxiHG6/kxlsJWSjEtD/PEIMss4cTo6mkZC9Q1axeZT7CB3tpR+3XHO
         RKa2L+zHe0dgFMITnUfw0tVD1citmgTatUJx0WTlciiSu2h/shT16M+Y615qenV5ggSx
         OsANbBG+GkybjPZdYeVy4dPjoPTluzslVto2iA7b/6A6tPgUJo8L13vroU5IfcYwk/s4
         hF9goQmDdtYEzDy30yYyIXWafsaUrjm6UnuF7AlytxbEH6iB6sWocLrr9q1iL05ZVvtV
         a29w==
X-Gm-Message-State: AOAM531tNMyNfp5b2i9r9/qVNMhwT1dIJVuuaPl0rgxHPNqijklSqATG
	v0khjGvwRZBkE/S2QTJdG1L0a1DHQLhaAI70iUVKJFLI0SKoMNp4r6NwO/XRon1wl2oA4STLe0o
	UbnZf3V6J0fTsQQ==
X-Received: by 2002:a05:6830:148f:: with SMTP id s15mr12549734otq.242.1642533779971;
        Tue, 18 Jan 2022 11:22:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwzr0wpP0kkTCgrhkGxkaIaWoXrzgt8LpYDiF/kTrxf2zstxk5uqrspsrdw765/b9E+vg16lA==
X-Received: by 2002:a05:6830:148f:: with SMTP id s15mr12549720otq.242.1642533779776;
        Tue, 18 Jan 2022 11:22:59 -0800 (PST)
Received: from treble ([2600:1700:6e32:6c00::c])
        by smtp.gmail.com with ESMTPSA id i25sm7472390otl.8.2022.01.18.11.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:22:59 -0800 (PST)
Date: Tue, 18 Jan 2022 11:22:56 -0800
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, x86@kernel.org,
	llvm@lists.linux.dev, linux-sparse@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] objtool: prefer memory clobber & %= to volatile &
 __COUNTER__
Message-ID: <20220118192256.jzk5dnceeusq7x7u@treble>
References: <20220114010526.1776605-1-ndesaulniers@google.com>
 <YeQei0xNzMq7bFdg@zn.tnic>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YeQei0xNzMq7bFdg@zn.tnic>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Jan 16, 2022 at 02:32:59PM +0100, Borislav Petkov wrote:
> so I like the local label and how it is more readable this way.
> 
> So, provided the memory clobber works (I wonder here if Josh has some
> concrete failing cases which could be tested with your version) and
> after the nitpicks have been addressed
> 
> Acked-by: Borislav Petkov <bp@suse.de>

I think Nick was already able to recreate the original issue.  I'll run
it through some more testing.

I wanted to make this change years ago, but couldn't because of legacy
toolchains.  Here's hoping this is the final solution for those @#$%^
macros.

Boris, thanks for looping Nick in, I should have done so to begin with.

-- 
Josh

