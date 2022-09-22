Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5601FBA
	for <llvm@lists.linux.dev>; Thu, 22 Sep 2022 03:46:50 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id v186so90437pfv.11
        for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 20:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=qyywbofJe0eyuZ1xhJp6fm2W5D3XouXfRrTFYq94Fp4=;
        b=Pw/f8KQsfXL0i7dI2WsLILA87LJmHWktVmMcNk02AdJw7OYwyfgFBp6OV5I7L2z+jK
         VT+jdCOhM59bxVoafw7uz7OyCyVKqc0ozDJVlZBiaOzy9ANYBjVgH5FdxsycfdmNd5Kb
         FCweeMeThswnUmgdalb60X24AzKQnx8Ym9Exw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=qyywbofJe0eyuZ1xhJp6fm2W5D3XouXfRrTFYq94Fp4=;
        b=U7NR502viiCPTNzd/MImOcFyxy7C/Od0nPIzZpfhj2dI9qJUjrqVzLYm5jtCxu1Zw1
         ji5QXbb4XT9vA1Or9EVqgZ7Dcy3AKp+vLfTNt7UDHkJbb4+vS0pcHpNsCRyqSjJ9iWQA
         14vZuEky6PQK+a/GaX8GvOyyTxzRqZTl6mpbsF2cKFCQuCKKbuRGUPG86JnZ2/QKUprk
         ynC+cN48bGm6637ebSsqNpiXg/ngf2CNxxaWytMuHCPAEnA8kmSHKC7mtiZhFiVl08k8
         mbkCrFbrxgvpVcxKoEBShKTje0K4sCmdzArbUpXNUn2QYkTVMTYLHn4Iu0hq1X1pm1uZ
         SKPQ==
X-Gm-Message-State: ACrzQf2VY3tfrYJsb9FMY6O6DY4c6weBY9L7QGBKDpfAld0AbU9uLyny
	pquuMq+KNYHPo5TUwiYj6jLHFw==
X-Google-Smtp-Source: AMsMyM782q4XStf7lFdBqwxNht8rRT7HLS72CIh1Ml4+FAknLR1yMkKJwakD2mYyJVOufVODYI0FsQ==
X-Received: by 2002:a63:ba05:0:b0:43b:e89b:da2b with SMTP id k5-20020a63ba05000000b0043be89bda2bmr1299435pgf.209.1663818409568;
        Wed, 21 Sep 2022 20:46:49 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u7-20020a17090341c700b00174fa8cbf31sm2837874ple.303.2022.09.21.20.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 20:46:48 -0700 (PDT)
Date: Wed, 21 Sep 2022 20:46:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Siddhesh Poyarekar <siddhesh@gotplt.org>
Cc: linux-hardening@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Tom Rix <trix@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/4] fortify: Explicitly check bounds are compile-time
 constants
Message-ID: <202209212034.16D9025882@keescook>
References: <20220920192202.190793-1-keescook@chromium.org>
 <20220920192202.190793-3-keescook@chromium.org>
 <b8f5f716-3ee6-87fd-d0e2-b1c35c98e0b0@gotplt.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8f5f716-3ee6-87fd-d0e2-b1c35c98e0b0@gotplt.org>

On Wed, Sep 21, 2022 at 07:48:44AM -0400, Siddhesh Poyarekar wrote:
> On 2022-09-20 15:22, Kees Cook wrote:
> > In preparation for replacing __builtin_object_size() with
> > __builtin_dynamic_object_size(), all the compile-time size checks need
> > to check that the bounds variables are, in fact, known at compile-time.
> > Enforce what was guaranteed with __bos(). In other words, since all uses
> > of __bos() were constant expressions, it was not required to test for
> > this. When these change to __bdos(), they _may_ be constant expressions,
> > and the checks are only valid when the prior condition holds. This
> > results in no binary differences.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >   include/linux/fortify-string.h | 50 +++++++++++++++++++++-------------
> >   1 file changed, 31 insertions(+), 19 deletions(-)
> > 
> > diff --git a/include/linux/fortify-string.h b/include/linux/fortify-string.h
> > index ff879efe94ed..71c0a432c638 100644
> > --- a/include/linux/fortify-string.h
> > +++ b/include/linux/fortify-string.h
> > @@ -80,6 +80,12 @@ extern char *__underlying_strncpy(char *p, const char *q, __kernel_size_t size)
> >   #define POS	__pass_object_size(1)
> >   #define POS0	__pass_object_size(0)
> > +#define __compiletime_lessthan(bounds, length)	(	\
> > +	__builtin_constant_p(length) &&			\
> > +	__builtin_constant_p(bounds) &&			\
> > +	bounds < length					\
> > +)
> 
> So with the gcc ranger, the compiler has lately been quite successful at
> computing a constant `bounds < length` even though bounds and length are not
> constant.  So perhaps this:
> 
> #define __compiletime_lessthan (bounds, length) (	\
> 	__builtin_constant (bounds < length) &&		\
> 	bounds < length					\
> )
> 
> might succeed in a few more cases.

Oh, interesting! That's very cool -- I never considered tossing a full
expression into __bcp. Yeah, that seems to work just fine:
https://godbolt.org/z/xrchErEx1

-- 
Kees Cook
