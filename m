Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274812F23
	for <llvm@lists.linux.dev>; Wed,  9 Feb 2022 04:05:48 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id om7so1025781pjb.5
        for <llvm@lists.linux.dev>; Tue, 08 Feb 2022 20:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T/7E7Mp6XNXqXhtlqv1x1MYPkswrBrA6+UdeF1obBS4=;
        b=LhhMh/QKAlG2POJv0ZfzUP5W8E7pnK30Hb6+s1H0+gZroVOfdcD2dWyMTlhY2fBoKm
         CE6I3mJt2iEmtOfdFnpJWyj95G8qFPl+SpqKrpwMbNdgSz8CXcqy514uSwRdO/lGjisG
         caDa9FzfI0KVEqNqIgwAy/ImzqZpuPIRBIJ0Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T/7E7Mp6XNXqXhtlqv1x1MYPkswrBrA6+UdeF1obBS4=;
        b=v8A0JUBat8pIWpvSytwYwLu0vKcBB1tkhkcXjmI8hQV8uG9QWbWQYapQ0XUtwjPNm4
         cgLG28FD9f7wgBQnbJBWkwobwyxx0Sn78nEWcIxouB9+juFEbP3l0NrVPD6i45r8bbbE
         nScz0twhI3wejSkItWtm5KL5y9nv1KiPgLcYM6AOF6pkKRflb9L8D1gvJqDKrUexn47v
         YwMneDzEf0CyeTJChEEegJyQUUkch5le+lZQCbqVNjAyicGNb5mIgyKi+L3H8Yk9zVD7
         DsFFSiAvGFZWAd8ymAuIFQY0HJO778p8GfYUcTurezvvsBW4CW7cg19QzceigqVtmwQ3
         y/Sg==
X-Gm-Message-State: AOAM530G0QbVpp0gFaZDWrV1GtCLtp95TlBjccbG/OZwQAY9b5cD1DXI
	AyNxdnOoWKo2m7Osawbg4i+eJw==
X-Google-Smtp-Source: ABdhPJzebAbGu7EAY4nH4ZIhdg023f0jz9MjXa8a8latUIqwacPOTeECC7leOgrcuGUHh/BtCMYo0w==
X-Received: by 2002:a17:902:ce8a:: with SMTP id f10mr328461plg.35.1644379547675;
        Tue, 08 Feb 2022 20:05:47 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s10sm18098462pfu.186.2022.02.08.20.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 20:05:47 -0800 (PST)
Date: Tue, 8 Feb 2022 20:05:46 -0800
From: Kees Cook <keescook@chromium.org>
To: Joao Moreira <joao@overdrivepizza.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	hjl.tools@gmail.com, jpoimboe@redhat.com, andrew.cooper3@citrix.com,
	linux-kernel@vger.kernel.org, ndesaulniers@google.com,
	samitolvanen@google.com, llvm@lists.linux.dev
Subject: Re: [RFC][PATCH 6/6] objtool: Add IBT validation / fixups
Message-ID: <202202082003.FA77867@keescook>
References: <20211122170301.764232470@infradead.org>
 <20211122170805.338489412@infradead.org>
 <6ebb0ab131c522f20c094294d49091fc@overdrivepizza.com>
 <202202081541.900F9E1B@keescook>
 <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad6c2633f39e39583bc5c5eaf7ccbe52@overdrivepizza.com>

On Tue, Feb 08, 2022 at 06:21:16PM -0800, Joao Moreira wrote:
> > > Note: This feature was already submitted for upstreaming with the
> > > llvm-project: https://reviews.llvm.org/D116070
> > 
> > Ah nice; I see this has been committed now.
> 
> Yes, but then some front-end changes also required this fix
> https://reviews.llvm.org/D118052, which is currently under review (posting
> this here in case someone is trying this out).
> 
> > 
> > Given that IBT will need to work with both Clang and gcc, I suspect the
> > objtool approach will still end up needing to do all the verification.
> > 
> > (And as you say, it has limited visibility into assembly.)
> 
> Agreed that at this point objtool provides more coverage. Yet, besides being
> an attempt to relief objtool and improve a bit the compiler support as
> mentioned in the series cover letter, it is still nice to reduce the
> left-over nops and fixups which end-up scattered all around.
> 
> FWIIW, https://reviews.llvm.org/D118438 and https://reviews.llvm.org/D118355
> are also being cooked. Comments and ideas for new approaches or improvements
> in the compiler support for this are very welcome :)

Ah, excellent, thanks for the pointers. There's also this in the works:
https://reviews.llvm.org/D119296 (a new CFI mode, designed to play nice
to objtool, IBT, etc.)

-- 
Kees Cook
