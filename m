Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A292C80
	for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 08:41:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id f11so5249190pfc.12
        for <llvm@lists.linux.dev>; Thu, 21 Oct 2021 01:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2szSRJSYc8e5G8aReqvAdlYT615SY5Xyth2O0S9i5EA=;
        b=R/JFIIO71DC4B8FZT8SFlh35ESr/rDqgqIK6hU47HaqbrWmM/nlRmVrw1TliFJaQGp
         yiLgscqGcddHyPxF2hDyQyG0PnwyOc/NOGVUOzkeiiki0GFxNvps5YgUTC7bFxHAmz9o
         RENSzgGLKiClC4kSVQcVmr146m4MfifdzsQ+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2szSRJSYc8e5G8aReqvAdlYT615SY5Xyth2O0S9i5EA=;
        b=stM2yeXzxEnv5a7ap2nozwirIKatqUQ/8Yn3pcFb/XHLIT3Z3rJsNUDK90XHFYILU2
         W7hS/iqhBQ4MgJHbiEIdQm/CDlCOSCFEx/1TFiU/sVds70Y3EhOnJdmGxpWr1/p3y6bP
         SHtvW5lJxssiHHbYXHvXM7MadyLMVlpWE3ID7kUwQlATX3JZoEqUj4DDbPRpDamSeaqa
         tKGxzd1Pnmo2PIyDynAefnDonXkDoG65qD4zIr75y4BjH+eyyxaCaLaaZMtd0xBm5SIz
         9ihMHurnDUDGgYki7PNYFiBc4wpjDoAivcifoekc0uMPCk6bd97abxKC2wTxylbKhMnz
         BTHw==
X-Gm-Message-State: AOAM533WE6orHSkHKnVWS/6vqlFC0W4e4BQu2Qfp3AzTvnE2xlG93gJv
	nd/xa4gRbeg0NSfwTCGhdoG64g==
X-Google-Smtp-Source: ABdhPJzZ0IduZ0HmTOr2ADCd2Oyhef9o1xjVVfDk02WNxKb9rfMRhGXQNRmXtjIPZWN7AdZYyRQUMA==
X-Received: by 2002:a63:d60a:: with SMTP id q10mr3402711pgg.335.1634805692575;
        Thu, 21 Oct 2021 01:41:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h13sm4441922pgf.14.2021.10.21.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 01:41:32 -0700 (PDT)
Date: Thu, 21 Oct 2021 01:41:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>,
	Arvind Sankar <nivedita@alum.mit.edu>,
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev,
	Ard Biesheuvel <ardb@kernel.org>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] compiler-gcc.h: Define __SANITIZE_ADDRESS__ under
 hwaddress sanitizer
Message-ID: <202110210140.D42185CAC@keescook>
References: <20211020200039.170424-1-keescook@chromium.org>
 <CANiq72ncBda6WE6ZTF9WDssHkMmM+JC5q8vkdNwiXFXTsSrnwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72ncBda6WE6ZTF9WDssHkMmM+JC5q8vkdNwiXFXTsSrnwA@mail.gmail.com>

On Thu, Oct 21, 2021 at 12:45:02AM +0200, Miguel Ojeda wrote:
> On Wed, Oct 20, 2021 at 10:00 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > I'm intending to take this via my overflow series, since that is what introduces
> > the compile-test regression tests (which found this legitimate bug). :)
> 
> Not sure if there is a particular reason I was in the `To` field
> (please let me know if so), but the patch sounds good to me!

Well, I didn't want the "To" to be me, and IIRC, you had sent a review
for Arnd's prior version.


> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook
