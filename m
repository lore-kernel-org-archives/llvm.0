Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10427288D6
	for <llvm@lists.linux.dev>; Mon, 15 Sep 2025 02:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901796; cv=none; b=JdKZXLbLfme4ZLNhPldoyjBLUt9SXzRyiZoS6vEZinjNQ/wN7oFgZ3qapo9j4ZiDRzrvabU3fx2HbE9LE/7yp68zIiNmgDPY6SS57DpbZ54gHDJnOUZTuqHAFGzsUoaiohqg5SYV1ykhgyqapIatGkgFVtDhFRs61Zs/dt1fpR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901796; c=relaxed/simple;
	bh=dwEnk+JUy+plSH589xKHA8fu3lw4UwydsjYzisg/b04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hwa2V16luiLWx60/7GJOaEKZ1T2vzfjabluFRZFcBQ5relmwLryYK+mYQE7d4gq/63oIAx0FJ+Dcc6/Z9EF46HnIscCmComlMcCzDJGOOlkn74+PbmZbobUFrlOifjWdc3SW2O/NiiO/iPERLL7HQ6aLHRSkguJ7NBdcyu6pEzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpS0VBRk; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpS0VBRk"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-77251d7cca6so3411251b3a.3
        for <llvm@lists.linux.dev>; Sun, 14 Sep 2025 19:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901794; x=1758506594; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JOygL22yeiI/c6chOsAL099+jLfX4ygYuBDAjkKbT5k=;
        b=XpS0VBRk0Qn2jDc8jP+IIoh8mBOQW3pjzPFWdzeFMpr+QiDcIccvgjLzAQpyCOxzop
         2ShAdkhmx/8lJNfTJPpKH54FoEQSZU1WYDAJd+eT/mkhCERuSYKiaKXHh/h6eMfJjYZx
         u7wRaUVLVH7n24sdQrRYuQCFJv5Vc6sdxx15VztH8ohg5+60r5+pcNdFg9vsYyiaO9AZ
         gRSMQO2UGWrVn1Ze2wsfNAfMkhTx+47c9pqE8ar64p5Z/zPsBXGYHztvVVUJtdcg+Lzd
         lysIsiUnP/rxBTr5agEVIs7i7KxkzsgKwFpHsKoiSUmwivgHmBGdD4TEjEKR1bRCTg/n
         USgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901794; x=1758506594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOygL22yeiI/c6chOsAL099+jLfX4ygYuBDAjkKbT5k=;
        b=fpMQqQurOZQAKetxYL32pWg60qLL+JWhPKgpC8zIT81xxtwxIaLUtgWYONlsw/Bhv+
         X86ybNml++wCNV0tLnY6EZXNsvTE2An5Hd1QN6eHb+IIPqHjq/mkLGfvUwVQkvMRf1EA
         qf+2eof86DiyKZL4mJDuGWyC7SRTrO06MmToPBSPhrRcHYxysSRhbgqU7K/AmHYcTzcx
         R/Z0eMRvQdYfxSD/0RI8XH7WBuNcRL9Yei5ZLTHYiiaraFmwFPTKeRVMua+2Tm8iniaG
         0h3h9BQYyWFgrhm8ekrIdKypyVvDQzUEXWVok4NtEQHqHvNg1s++V677YapJSWcAqd5Z
         WfwA==
X-Forwarded-Encrypted: i=1; AJvYcCWMW18Zd7ckE2EWozLd8Wt9LmmoZHTJMLbFRIOI+cEuG9MAyY8tJ2q5kt3eFucxmlfKcp8D@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6H+FJxKN/1t92jjTkJrY0QZMH5xbXu0uiI0UxZZaHE4vBOuJZ
	nblZqPDu6D7dndym+qXenH0XBCSb/k3UTlp9Mz+SpCasxSo+WaYnbdey
X-Gm-Gg: ASbGncs/QtMR7+alk5qG1nySIU/2Y6OEdlLQsAc1JYKy7NbLKGeuIYibanXjkB2sfZk
	8au4BGUGIzyKTty04zzTInsT/VCzXXW4rblGiwVV42OBqoXp/a6QgB0Z75ryDbD+RS0b9Q/Mrv7
	iR4m8wYEsG55CDUCC77y3j0HANoxR1G8wSbN/RNXlOHM7Fs5fUzCB2xNemS/yyDrEKCoVX5ZT9X
	SMZEbzu3oAvDdD0kPC96+Hca6zkbDPGTZlAl+BggToOn/Wht4TWOgNHbzJbjIhTCWujEAWGHO3C
	r6XncIJ53qokb/UyMtbh4Dq0BplbC8K90OiUdEUS+xklr+Xgl3MiGWAJtj33U87l5/kfCxtuUhX
	SEJvJzwXclGsgrVw0S6PnnLsudmIWP0oBQOpMP/A=
X-Google-Smtp-Source: AGHT+IEeqkh40QJM9zjJ8HL43W+1enVBlgkaCaBCrqZXNAUnxXXVQNA79eZr3zdQ3nIBlPPQ1opd6Q==
X-Received: by 2002:a17:903:f85:b0:260:5bab:8cad with SMTP id d9443c01a7336-2605babb245mr90876965ad.29.1757901794287;
        Sun, 14 Sep 2025 19:03:14 -0700 (PDT)
Received: from localhost ([185.49.34.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-261333a972dsm51596705ad.75.2025.09.14.19.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 19:03:13 -0700 (PDT)
Date: Mon, 15 Sep 2025 10:03:06 +0800
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
Subject: Re: [PATCH v4 15/21] mm/ksw: add test module
Message-ID: <aMdz2gMb5YC3G3md@mdev>
References: <20250912101145.465708-1-wangjinchao600@gmail.com>
 <20250912101145.465708-16-wangjinchao600@gmail.com>
 <69198449-411b-4374-900a-16dc6cb91178@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69198449-411b-4374-900a-16dc6cb91178@infradead.org>

On Fri, Sep 12, 2025 at 09:07:11PM -0700, Randy Dunlap wrote:
> 
> 
> On 9/12/25 3:11 AM, Jinchao Wang wrote:
> > diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> > index fdfc6e6d0dec..46c280280980 100644
> > --- a/mm/Kconfig.debug
> > +++ b/mm/Kconfig.debug
> > @@ -320,3 +320,13 @@ config KSTACK_WATCH
> >  	  the recursive depth of the monitored function.
> >  
> >  	  If unsure, say N.
> > +
> > +config KSTACK_WATCH_TEST
> > +	tristate "KStackWatch Test Module"
> > +	depends on KSTACK_WATCH
> > +	help
> > +	  This module provides controlled stack exhaustion and overflow scenarios
> > +	  to verify the functionality of KStackWatch. It is particularly useful
> > +	  for development and validation of the KStachWatch mechanism.
> 
> typo:	                                        ^^^^^^^^^^^
Thanks, will be fix in next version.
> 
> > +
> > +	  If unsure, say N.
> 
> -- 
> ~Randy
> 

-- 
Jinchao
