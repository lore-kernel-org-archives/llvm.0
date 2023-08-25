Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28D4322B
	for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 19:59:44 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bee82fad0fso10110585ad.2
        for <llvm@lists.linux.dev>; Fri, 25 Aug 2023 12:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692993584; x=1693598384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hfXkR3py3xtzGZ5E6zKDB+YU9brHzHocVu0CVwLEnrY=;
        b=XNozGOYo4jJxuS0aorG33UfKcAc0XsA7KLZJCCnywdJilpUEr8P22OOiqTR9NkfCp0
         HMXK64rExV/OJPyjrj7HqLM07ScILWwI+ImqSCq1DVLoZH5UfFhi9Gm3pbRwzoesP16J
         NzQyxOAr3kkaLkmmQBjKoPTFODx0sd7a9Eb88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692993584; x=1693598384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfXkR3py3xtzGZ5E6zKDB+YU9brHzHocVu0CVwLEnrY=;
        b=O1WECggJRVBcPgQWA9MdSBhDAfLaDWqONIDzJfVDbNq7smIzY3siJKZbA1VidtVTYp
         /VTn+Ke+pwCEMdH+vSYW0Zwosp9izXATU5bsCC4ObHOIj/d+W7oib0e+iIKGd1B3l1xL
         nNK7EsdyP+Xy5F0MSbCwF90T2UF0jLspAt1rZHv9lVmc4RAE0MjZamb4Yn5M0dYIZJ4C
         b2igix5CXr91NY7pDm/YdjJfhj0ZSxbaJlIpQOaOJxr0M7iq2a/fwxpALME2E+DG6l+X
         sbU6pxUUTHT1X7XjwJKv6DMgcfDSAbiKsUA2FE3NivnH3Lv1wYEzktrzSJxKWsa71Jva
         B7Sg==
X-Gm-Message-State: AOJu0YxVUwFjqbKQsyQ0UxgIFsPD/tNNXS1cT8IqGxDSNsLn5WbfI8KH
	mmf2GMezvWyfHpEIgU38Vw2wGA==
X-Google-Smtp-Source: AGHT+IHrE71DLN0+PlhM/WsyQ3GYh0veF/xKKbQDdt0YBF3808HKNYhDMcKsZ4tObQHOn9pYcAOc1w==
X-Received: by 2002:a17:902:8c8a:b0:1b8:2537:541c with SMTP id t10-20020a1709028c8a00b001b82537541cmr14244038plo.32.1692993584299;
        Fri, 25 Aug 2023 12:59:44 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ja11-20020a170902efcb00b001c0a4146961sm2147539plb.19.2023.08.25.12.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 12:59:43 -0700 (PDT)
Date: Fri, 25 Aug 2023 12:59:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Yonghong Song <yonghong.song@linux.dev>, Petr Mladek <pmladek@suse.com>,
	Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Fangrui Song <maskray@google.com>, kernel-team@fb.com,
	Leizhen <thunder.leizhen@huawei.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH] kallsyms: Fix kallsyms_selftest failure
Message-ID: <202308251258.C6770EAA9@keescook>
References: <20230825034659.1037627-1-yonghong.song@linux.dev>
 <CAKwvOdk7knYxOzaeq4gWjTiy=zRk4wc1jgq0d6fyFS5x43Cv9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdk7knYxOzaeq4gWjTiy=zRk4wc1jgq0d6fyFS5x43Cv9g@mail.gmail.com>

On Fri, Aug 25, 2023 at 10:51:58AM -0700, Nick Desaulniers wrote:
> On Thu, Aug 24, 2023 at 8:49 PM Yonghong Song <yonghong.song@linux.dev> wrote:
> >
> > diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
> > index 016d997131d4..e12d26c10dba 100644
> > --- a/kernel/kallsyms.c
> > +++ b/kernel/kallsyms.c
> > @@ -188,16 +188,13 @@ static bool cleanup_symbol_name(char *s)
> >
> >  static int compare_symbol_name(const char *name, char *namebuf)
> >  {
> > -       int ret;
> > -
> > -       ret = strcmp(name, namebuf);
> > -       if (!ret)
> > -               return ret;
> > -
> > -       if (cleanup_symbol_name(namebuf) && !strcmp(name, namebuf))
> > -               return 0;
> > -
> > -       return ret;
> > +       /* The kallsyms_seqs_of_names is sorted based on names after
> > +        * cleanup_symbol_name() (see scripts/kallsyms.c) if clang lto is enabled.
> > +        * To ensure correct bisection in kallsyms_lookup_names(), do
> > +        * cleanup_symbol_name(namebuf) before comparing name and namebuf.
> > +        */
> > +       cleanup_symbol_name(namebuf);
> 
> Hi Yonghong,
> Thanks for your work on this patch.
> So if this change is removing the last place where the return value of
> cleanup_symbol_name is checked, then perhaps this commit should
> additionally change the function signature of cleanup_symbol_name to
> have `void` return type.

I've landed this in -next as-is just because I want to make sure the bug
gets fixed ASAP, so if this gets adjusted, I can just include that
change on top.

-- 
Kees Cook
