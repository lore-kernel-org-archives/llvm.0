Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF562C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 19:02:16 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id y1so2462056plk.10
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 12:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XYUZdSbtY3yILKq30armlw/nLFSTpxD7xzR0LPRYz80=;
        b=gpYKK9FHVxBdFJtwWQViBwA6f8A8yxtHj5zqNEzFZ+S0843PtoWAyD5MADhc+CKcZ4
         5ngK1kdS6dIScpdJWiiYbns6hn+I0/aa3zc8aYsrcaVwjDK/PyNeqgmgGZSw1ruKlLVJ
         KmTGnrOq0PccZ2Svs/+X9fiN4LSaKncO8PW8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XYUZdSbtY3yILKq30armlw/nLFSTpxD7xzR0LPRYz80=;
        b=Kydwc0xnf2kM/amAAmuFnC+MV8ZCjCxtnZzD1lxSYbBlItExEBVN09BRmi78p8dSLi
         Sf25vKY190FWQimgE5HNUOKEXbJ5h2kQhJv/DwjQsmOoTBzCC6IuM2K2NRZUHPHj96iE
         /tW318Du0ELzbgJgJ2SDZpT1rjGVrMsUqsAlWeGgSFJbLXswGo14GR5Rsngdix06IXP2
         vg0bA6XHl/7c4BsryWVzozyHGMDiPDWdOYCRUBWTH75SMQdZgkhAMg4bLFL+7BzFvhDb
         HUhuLMluoVW7nIu22L20Gj3IX0Ksfv0COFOGb5y6tf454StCQTwjX9EPf9J48IG5QZZD
         WoXw==
X-Gm-Message-State: AOAM530U5n7s5cmwmxP5YD3NP08C8Xc22wkz112fbRFWP9/ZUsB44wZ2
	NJs2Y4IM47SjZHzY9QFqY5chEQ==
X-Google-Smtp-Source: ABdhPJzr8pB5JKBpq4Ks8L5I/+V7O+fqmjtmqNIRDwvNRhToQtzGptsraxsDs7uoU+If38Zs1gAazQ==
X-Received: by 2002:a17:90a:1548:: with SMTP id y8mr15961214pja.151.1634151735724;
        Wed, 13 Oct 2021 12:02:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d138sm251374pfd.74.2021.10.13.12.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 12:02:15 -0700 (PDT)
Date: Wed, 13 Oct 2021 12:02:14 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 04/15] cfi: Add DEFINE_CFI_IMMEDIATE_RETURN_STUB
Message-ID: <202110131200.5D551C2D@keescook>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-5-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013181658.1020262-5-samitolvanen@google.com>

On Wed, Oct 13, 2021 at 11:16:47AM -0700, Sami Tolvanen wrote:
> This change introduces the DEFINE_CFI_IMMEDIATE_RETURN_STUB macro,
> which defines a stub function that immediately returns and when
> defined in the core kernel, always passes indirect call checking
> with CONFIG_CFI_CLANG. Note that this macro should only be used when
> a stub cannot be called using the correct function type.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

I remain a bit worried about this exception infrastructure, but it's the
best way forward right now.

One thought: add DEFINE_CFI_IMMEDIATE_RETURN_STUB (and maybe other
things to watch closely) to MAINTAINERS:

diff --git a/MAINTAINERS b/MAINTAINERS
index abdcbcfef73d..2c9a24fd6a3c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4553,6 +4553,7 @@ B:	https://github.com/ClangBuiltLinux/linux/issues
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/clang/features
 F:	include/linux/cfi.h
 F:	kernel/cfi.c
+K:	\bDEFINE_CFI_IMMEDIATE_RETURN_STUB\b
 
 CLEANCACHE API
 M:	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
