Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB8B2E0914
	for <llvm@lists.linux.dev>; Thu, 25 Sep 2025 02:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758765936; cv=none; b=VP7jxM3HllY6pd/LtpFeknsnXKfFMl4bVi8QNmrPKoqXi7AjW2n+FNa/8lOf9IdasPBzW/A9VUfCbRLazM87ZrI3UQarFr/8zqE20Qqc1M7ZM64RkzJbZWpaCmVWT0UoSKFHIUhyyLoV9cPXkpncf2NzqeMx57yX8yQ8fUy3fX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758765936; c=relaxed/simple;
	bh=c7OOe7lcw1oi9g6/DwjJWKSlU0/KgpD3/2hH1JCaeIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TmQyQMZBh4ZikEq3f5xckbmWseh/04O6TGY/iuPXXN20PAVV9MzpzmBwn14sfZgXOK+o6GHMGbjMktTeobuvbOCc8CZxSKiife6gtl7Buad0vt41qzcJEQWiQn+K7/Low+crt/Jzgv3JDP2MZ6hfHggdKZDa7nXCh4kdrcdE/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYMI4G31; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYMI4G31"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso290623a12.0
        for <llvm@lists.linux.dev>; Wed, 24 Sep 2025 19:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758765934; x=1759370734; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JHHL33LsFFZTfiqVPHubJTFh9Ll2HmMvlyBTNdInq0Y=;
        b=RYMI4G31VIZXfJz+TZOKL3eJGnvvzMt9VXU7yLAQuEucWW4JkHH5WkN3j6eIdIT57h
         rPR2m6KcUmE3ABzVwKsWClWBO7s+7ZkoLgZE621u/apvU+KgZUO2qcVAiIWzgCY5mUgj
         O5Ee64WylZcrXv3iPDDed1vXkrBsh9tm0EROcdpNdri/tNL4gH+IklmHbnyL3C2rE2HG
         5XSpzaPgpAKJRMdalVt7c1mxzZYHz75E9CB3oTGT85G0VxVtGde2oQj9ziYnd+4rDk55
         smzJ6n2ZnWpLMC4qJnDJWYh/yA2rlZa0nF9Qg1IDT4U/aRNoH7aMi045JFjDqxw6y8Wc
         f7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758765934; x=1759370734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHHL33LsFFZTfiqVPHubJTFh9Ll2HmMvlyBTNdInq0Y=;
        b=dwTWRlcZ7apZquzr8CRd75QSQQai2MVqV2GZ6w9qig7Q4QWmx6sEaUyBRqSNsA5EXt
         pagcW9FGXvdFH3a+i8UUzey9GYrKTnHDENrITJUK5iXzA8O6/bvfIxrMqhWvqzz31R8C
         pf4G5kWYVjvFo2NaRTKx8581LC7fHKWjn+V1lMqeLm2KJAhcgn+IoR+YrUI8b24LizFN
         2Aq0H6YzSegOYOz9Xyn8E+N2HMtOoes+s0/X9vlTUTxRlSVdYkG3a+p9NLjQNn98uy9h
         aFFLanLAO5E+og7RDrhCK49tygbyDEPg/DrlpcoSX4UgqWAbUs40kYRY8Fn0vDCcateZ
         v3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVl7N0RK8kvqazkWQ9VdLpNY5PcjP/1xKw6XEQRLg0PEyqITlNMCuVzw7zMj4IPukGHBhqJ@lists.linux.dev
X-Gm-Message-State: AOJu0YyI8OB7wC9jVxA1aca6C39JcuFBJPFlCRUVynzd56zW3eg6lt6i
	f2Wkq0wPZuB6RcFy1y5Gw8jcSxMu1+m2/P+chag6ypbKGxYPR0c+Sq/h
X-Gm-Gg: ASbGncvMl6jaoXf36OXW0p1Nrg+Bu9C4eVVR90+Qh39BU02Bt1x0zVgYiS1ldH0qq+v
	kwj/huk6OtBWDoePZ4Qsei5y0lcQjKMWf3WwrYewGSVKJI8nQRC20KQS8Xx6dYtFseO4Cy1nW+2
	thEbqoU7iMRxnl4mbuAym1wprIyBgNaxyJ9iNxIctFyN/KEzZO8dNat3HxkdRJQ/YWRjjO76xgs
	EapvE6B4Rj6VVlWf60mdOhg5ZmhfqzKxRQw4D3ocIQJv/+sWUCjaoCPx5Rz8MflJaveHUImxMr6
	86McxBDUnl6OUZc6hBxSAzyA1Y7/njGoUehg/T0UycFmAUKIi0H+oZx5hCmMS592tyj+n3syKPM
	/jhKZyOQqCs1DVFTNeGV3F2yNX7YoagqEHw==
X-Google-Smtp-Source: AGHT+IH7ui9TJXKQ2pJIcwuIZvxvX8PqduYqo+2cQ68cM5ywCGeSLrO3GT6IefQ6CqCfyu2awBs3nA==
X-Received: by 2002:a17:902:d50a:b0:267:da75:e0f with SMTP id d9443c01a7336-27ed4a06dd7mr20974665ad.11.1758765934070;
        Wed, 24 Sep 2025 19:05:34 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c26faasm387777b3a.93.2025.09.24.19.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:05:33 -0700 (PDT)
Date: Thu, 25 Sep 2025 10:05:22 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>, Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org, llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com, "David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5 04/23] mm/ksw: add build system support
Message-ID: <aNSjYrXXO2BjYA87@mdev>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115124.194940-5-wangjinchao600@gmail.com>
 <3504b378-4360-4e55-b28d-74aabd4308d7@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3504b378-4360-4e55-b28d-74aabd4308d7@infradead.org>

On Wed, Sep 24, 2025 at 10:06:10AM -0700, Randy Dunlap wrote:
> 
> 
> On 9/24/25 4:50 AM, Jinchao Wang wrote:
> > Add Kconfig and Makefile infrastructure.
> > 
> > The implementation is located under `mm/kstackwatch/`.
> > 
> > Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> > ---
> >  mm/Kconfig.debug             |  8 ++++++++
> >  mm/Makefile                  |  1 +
> >  mm/kstackwatch/Makefile      |  2 ++
> >  mm/kstackwatch/kernel.c      | 23 +++++++++++++++++++++++
> >  mm/kstackwatch/kstackwatch.h |  5 +++++
> >  mm/kstackwatch/stack.c       |  1 +
> >  mm/kstackwatch/watch.c       |  1 +
> >  7 files changed, 41 insertions(+)
> >  create mode 100644 mm/kstackwatch/Makefile
> >  create mode 100644 mm/kstackwatch/kernel.c
> >  create mode 100644 mm/kstackwatch/kstackwatch.h
> >  create mode 100644 mm/kstackwatch/stack.c
> >  create mode 100644 mm/kstackwatch/watch.c
> > 
> > diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> > index 32b65073d0cc..89be351c0be5 100644
> > --- a/mm/Kconfig.debug
> > +++ b/mm/Kconfig.debug
> > @@ -309,3 +309,11 @@ config PER_VMA_LOCK_STATS
> >  	  overhead in the page fault path.
> >  
> >  	  If in doubt, say N.
> > +
> > +config KSTACK_WATCH
> > +	bool "Kernel Stack Watch"
> > +	depends on HAVE_HW_BREAKPOINT && KPROBES && FPROBE && STACKTRACE
> > +	help
> > +	  A lightweight real-time debugging tool to detect stack corrupting.
> 
> 	                                                         corruption.
Thanks, will fix in next version.
> 
> > +
> > +	  If unsure, say N.
> 
> 
> -- 
> ~Randy
> 

-- 
Jinchao
