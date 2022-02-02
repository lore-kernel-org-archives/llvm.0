Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8942F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 20:52:02 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id c9so272748plg.11
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 12:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cPEMedQu4jTNYHJmp71olOjxDB0xRf7+fA/WfqhgIVA=;
        b=EAlOPLnqtqVr6UWoSRQCQiil8xtekqy0ucrjftpEPAugnwRJaCgExC22zDJ3dLa32p
         IEtN7Zr25QITv0r/g5zMyAkjB0tErkFPXm8iUVah6oF4t6y9SojxveFQX8MkNVFtbGkl
         Y02gvbpZvq4nfuJCQ6hoiWRRvdk4dxnYiQ4EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cPEMedQu4jTNYHJmp71olOjxDB0xRf7+fA/WfqhgIVA=;
        b=x+nfSHDWMpVkLcs4UiksNh+cYCDIWxFgL/jJX7ZLqJpAwiFD0ojT+OJjpJxsjAGQ3k
         FRv+rQjTURMaqDK5f/MYxcJ/vygqhqyhCgmcRMoM6Km5TXDxFp1NCmViLvDNF4JQdU4k
         /RDYHhAS19v+8uMOFaSIAygZ3hUc6OshrUZtjPI60C+TiSoUBwFRxAMyECEBPpw8i2tW
         UGUCrsZOKEHdp62HNz8D8tNkpj/ZxP3d68dKAzY85WSkd62nrWS6/e1gZaqYqMjf2iOV
         WBkU3Xt6v7uKlslICbk8DmcPakfx76Pu7XrrVHusGQMb8B87nso5PlHKgczM75YN9SIf
         a3mQ==
X-Gm-Message-State: AOAM532tTWwQz9NK9FaWEo4cb/3TT/camOwxO3eBPuPI/ImxbQGd5xbx
	hjKobLnMsHonKk3FrcR5FCwHMw==
X-Google-Smtp-Source: ABdhPJxdd9YfV7EbD3xvSuaZUXxBX9DB7g4c3W3Ag1C9zKX/pGzoQSAo0PKxahuKofQSPv3t073cQw==
X-Received: by 2002:a17:902:d64a:: with SMTP id y10mr18742283plh.66.1643835121970;
        Wed, 02 Feb 2022 12:52:01 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f16sm28486385pfa.147.2022.02.02.12.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 12:52:01 -0800 (PST)
Date: Wed, 2 Feb 2022 12:52:00 -0800
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Peter Rosin <peda@axentia.se>, Andy Shevchenko <andy@kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] lib/test_string.c: Add test for strlen()
Message-ID: <202202021237.487D3DE73@keescook>
References: <20220130183653.491292-1-keescook@chromium.org>
 <20220202160149.GA2322037@roeck-us.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202160149.GA2322037@roeck-us.net>

On Wed, Feb 02, 2022 at 08:01:49AM -0800, Guenter Roeck wrote:
> On Sun, Jan 30, 2022 at 10:36:53AM -0800, Kees Cook wrote:
> > Add a simple test for strlen() functionality, including using it as a
> > constant expression.
> > 
> > Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> > Cc: Peter Rosin <peda@axentia.se>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> > I'll be taking this as part of my Clang FORTIFY_SOURCE series.
> > ---
> >  lib/test_string.c | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/lib/test_string.c b/lib/test_string.c
> > index 9dfd6f52de92..59994f552c48 100644
> > --- a/lib/test_string.c
> > +++ b/lib/test_string.c
> > @@ -179,6 +179,38 @@ static __init int strnchr_selftest(void)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Unlike many other string functions, strlen() can be used in
> > + * static initializers when string lengths are known at compile
> > + * time. (i.e. Under these conditions, strlen() is a constant
> > + * expression.) Make sure it can be used this way.
> > + */
> > +static const int strlen_ce = strlen("tada, a constant expression");
> > +
> 
> This results in:
> 
> lib/test_string.c:188:30: error: initializer element is not constant
>   188 | static const int strlen_ce = strlen("tada, a constant expression");
> 
> for several of my tests. I don't think you can mandate that a compiler
> implements this.

Which tests?

This property of strlen() is already required by our builds (this is how
I tripped over it). For example:

drivers/firmware/xilinx/zynqmp-debug.c:

#define PM_API(id)               {id, #id, strlen(#id)}
static struct pm_api_info pm_api_list[] = {
        PM_API(PM_GET_API_VERSION),
        PM_API(PM_QUERY_DATA),
};



> 
> Guenter
> 
> > +static __init int strlen_selftest(void)
> > +{
> > +	/* String length ruler:         123456789012345 */
> > +	static const char normal[]   = "I am normal";
> > +	static const char *ptr       = "where do I go?";
> > +	static const char trailing[] = "hidden NULLs\0\0\0";
> > +	static const char leading[]  = "\0\0hidden text";
> > +
> > +	if (strlen(normal) != 11)
> > +		return 0x100001;
> > +	if (strlen(ptr++) != 14)
> > +		return 0x100002;
> > +	if (strlen(ptr++) != 13)
> > +		return 0x100003;
> > +	if (strlen(trailing) != 12)
> > +		return 0x100004;
> > +	if (strlen(leading) != 0)
> > +		return 0x100005;
> > +	if (strlen_ce != 27)
> > +		return 0x100006;
> > +
> > +	return 0;
> > +}
> > +
> >  static __exit void string_selftest_remove(void)
> >  {
> >  }
> > @@ -212,6 +244,11 @@ static __init int string_selftest_init(void)
> >  	if (subtest)
> >  		goto fail;
> >  
> > +	test = 5;
> > +	subtest = strlen_selftest();
> > +	if (subtest)
> > +		goto fail;
> > +
> >  	pr_info("String selftests succeeded\n");
> >  	return 0;
> >  fail:
> > -- 
> > 2.30.2
> > 

-- 
Kees Cook
