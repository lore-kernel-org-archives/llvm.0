Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B48972
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 19:12:48 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id c4so16331374pgv.11
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 12:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CFUDLBWdmnPV44bi7dVx5A56FXXnHIGNsm6BfJl0RsI=;
        b=JtQFBqmyuqUGLOJirZEnfOGRzSjyJfk76syhW8olBgTsaSJ1WrRnDKlU8xrvFkJEbB
         YZO0dY/VKA9+YDBXn7kwblGNLtajGRhaUcQJVIjGCA+DbxnLTaesnzOROD4lAa6oBXO3
         ABy/6N42oUMuboWXbEo0EIYQPT+5a/NVcybC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CFUDLBWdmnPV44bi7dVx5A56FXXnHIGNsm6BfJl0RsI=;
        b=3ExuU1vhUSNSkQ5rIoT5eaatq7B3Zup/su+c5w/iTT2R9UcX49vitCyyHMM8Y/8pR+
         IMcf6x8sLRmQyadegWh2tfenrLmVxcCOehEcoWB7gRFyCJ/xmKJrjAWzlsIryPFMNAif
         LUNkHGgxqNb6b0rfFLfJ7fIJ+/6fuVlK/GOMaHAqpPBND5tXEO077ximTBVhBNYSP7F4
         8xzgc+ZtC21c7Eiv88YXt6zLstnzgvPvta48AH3VXHJWt5xBRZKEig5n+c6hiiBWXRb4
         gZ4262f6X9R3RmNQ1b8focU1zeKX00yBEeh8B7f8RCriBtOwnTsr7P27I6RCrlIxZQ1e
         AwcQ==
X-Gm-Message-State: AOAM532z8bLxjLO/QmbyBpXzvi/85daa1+3irHCj1tpCZjpsfCwBesFh
	7VqkynYl28DrpIH0MJdgH9OopeSKLYaBkw==
X-Google-Smtp-Source: ABdhPJzl2+SAfUh6NkJ+DhCKOWmzKsU6GNvGxGf2XT0aJXU9P6UbVjWdBAkeh+PuF3DGKEHMZ/Xdaw==
X-Received: by 2002:a63:4622:: with SMTP id t34mr814413pga.293.1634757167736;
        Wed, 20 Oct 2021 12:12:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e9sm3758333pfv.189.2021.10.20.12.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 12:12:47 -0700 (PDT)
Date: Wed, 20 Oct 2021 12:12:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Michal Marek <michal.lkml@markovi.net>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-hardening@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	linux-security-module <linux-security-module@vger.kernel.org>,
	llvm@lists.linux.dev, Dan Li <ashimida@linux.alibaba.com>,
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] gcc-plugins: Explicitly document purpose and
 deprecation schedule
Message-ID: <202110201212.C155FE92@keescook>
References: <20211020173554.38122-1-keescook@chromium.org>
 <20211020173554.38122-2-keescook@chromium.org>
 <CANiq72kCQa7_3JkUqO2=mdj+P2zcjPYJUai0oip5DN7Aaq_ySQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72kCQa7_3JkUqO2=mdj+P2zcjPYJUai0oip5DN7Aaq_ySQ@mail.gmail.com>

On Wed, Oct 20, 2021 at 07:44:19PM +0200, Miguel Ojeda wrote:
> On Wed, Oct 20, 2021 at 7:35 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > +Purpose
> > +=======
> 
> Sounds good to me.
> 
> >  config GCC_PLUGIN_SANCOV
> >         bool
> > +       # Plugin can be removed once the kernel only supports GCC 6.1.0+
> 
> Since we are just giving the major in the other cases below, I would
> just say GCC 6+ here (the numbering scheme changed in GCC 5 already).

Sure; now updated.

> Thanks for adding the versions, by the way -- this is useful long-term
> and not always done for other things...

Yeah, I always struggled to find when options were added to GCC, so I
wanted this for my poor brain too. :)

> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

-- 
Kees Cook
