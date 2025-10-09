Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8B42D3EEB
	for <llvm@lists.linux.dev>; Thu,  9 Oct 2025 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760001181; cv=none; b=mNaotCLr3R1td0LnsdGOr1XIablq7GNMaChcsaHkBC/9APtPUaBq0n6ZWID+yhnnjuxem37WYsXCFzVXGf14T1qg9j8gNr8vUzquulltNM/BLRfCya/vNll701qpdgEWS4Ob8xHCGKFe1CS13U/JBNOPNoL65Uw2Rd6a5YzLyFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760001181; c=relaxed/simple;
	bh=7ov7X+H76YZ2kZPkU1rlQnIlT1HTKwdYcsZHXhrLcLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWFG9koA99Q8P5e5qk16/dA+72Vhgcfsmce7gYp8nc7XsATeWfGKnFhdZJVpgEnmCvvuYl9TGfZOUY8nbstfUtg9p3MnVKc3yS0i6vZjKQvPhyJzKrFp6kpzMYify8mtko202iei/lOy5HMcpoFzlQE2+PWBZl+DiORMXPJih10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xwqkt3Ka; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xwqkt3Ka"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-271d1305ad7so11925275ad.2
        for <llvm@lists.linux.dev>; Thu, 09 Oct 2025 02:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760001179; x=1760605979; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=noGJIDsEGpbT4mVPtLItOHBIizt5I7YMxK5vpTBOvYc=;
        b=Xwqkt3KafqLsYtB4xPcKBDQMT5yJzlQ00SYF9G+vQdCBoqWp2GzT7eil5Bl0g9jWA7
         ovXKZfAIeo0j9PV30w1RPcnVaGAv3nMm1seqvH9KcLsp6rDe3lW/RAc5fWQURbMPEwGG
         YfFpXAJFnh2bdqjNeZo0S66kSh4/N+l7guijzfe7UOGaq5zojzzbW76mL6xdpwoQwu5Q
         Fp/fU+jHlrCmSZCIZGBpdj6dNKB5VwPuIG+19HAkTGorKtQIhR1DVAmnbrvuK/CCtLSv
         A3Yf0ehaA2KFGBt67Tf//yV35xGyhDnsibX8ir6x8K23Ws809Y9Ayp0L6ZQ0ZSiJihv9
         EuOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760001179; x=1760605979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=noGJIDsEGpbT4mVPtLItOHBIizt5I7YMxK5vpTBOvYc=;
        b=NPwsLOkyXMiqXvOY/I5oeFGl62aDJzf1QI4v7vOViDbvcu3rcrlg94lSFd4DIHZJ9r
         jts0rLTECy5sMhhSFWDku/Fdazq85oniBI++eY0uPnW/doj8+foXz+st06wZ0H2rRJ74
         ZSvxfrgA5MSaRfYnnKcfAcPEUbkZz1N6B5j4ZzizwaNXGfPVvHMHdNoEL0DbC7aGPrFH
         c2XUhbbw+y7F/WuNFCSYnDVMeJIKY130g4GthssdpYisnp7dLVq2jsi3j0MvuRrKLKcy
         38CMWhadLsEApsGDcMFOX+kG7jIixWi/OoJKLLcb7jBa8lQm1hjGCs5xjRHFRQLSic0w
         PTcg==
X-Forwarded-Encrypted: i=1; AJvYcCV5VXSx+vrnVJgbY758/CmXeWPoc1MJahoFwwS8BPxfQqpkpaN+zuc+4eRLQIRQvLfRbcZ5@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw0aiSjUDK3FXGmdRtKwlsLrhrHs750eyBrUSv/p534tnQ8PPj
	InFJ/IWyFZTqIT1EIx4jw20Q+gAF5zBAU2xvn0fUxmt3oN1pzmpz1wX3
X-Gm-Gg: ASbGnctD19HItqU7eCmfAgLdTqWrdy6XUflik2ymcOjHBRjh8Bzd/q/7lV1Nkblkcbv
	iKNocfa34XQfMT/yvDel+2OYie+lEho9ZtY0lwCQ/UlJtTGcpOWp0W47uT+PGSYTPOrvDhwF+zv
	fMrkFlOqNMgyv+kJ0n4xR1dyLHjwBmiy38fXhuGuyFhKp6sf3AmoBz/GpBwEcvMKpNZL9vYUsmi
	x7g+oyTyaFix6ij2lWfJoLRCzRPI+3M85KkZ3iT8oGbEGwqKGdQ6Ip8eP2Vib35zF/4oVqZxvZz
	2qRgO9FC1WF689Osj5TkV0gX3CakAIY7dV79c7F4BghLSMdlxLzgbkMnOPA/M+BhLKAozwZrCPs
	YijG74hrLD2qrfwi+7XTnH0YkFrc5auMx3l5aIJn9lm2j4WdO8WyTT8niHzo52g==
X-Google-Smtp-Source: AGHT+IGgc722wX6cnZ4WMCp7pNtwV85yDs1WMyb3Ue3/XLDo0+KBsbutwCUcBiVTue/uMgVkYBWZbg==
X-Received: by 2002:a17:903:8cc:b0:267:9c2f:4655 with SMTP id d9443c01a7336-290273ffcf6mr78713905ad.41.1760001179036;
        Thu, 09 Oct 2025 02:12:59 -0700 (PDT)
Received: from localhost ([45.142.167.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm22026565ad.92.2025.10.09.02.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 02:12:58 -0700 (PDT)
Date: Thu, 9 Oct 2025 17:12:50 +0800
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>,
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
Subject: Re: [PATCH v6 23/23] MAINTAINERS: add entry for KStackWatch
Message-ID: <aOd8kvWYIROq99vx@mdev>
References: <20250930024402.1043776-1-wangjinchao600@gmail.com>
 <20250930024402.1043776-24-wangjinchao600@gmail.com>
 <3913273d-12e2-426f-aec7-263b7f49008a@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3913273d-12e2-426f-aec7-263b7f49008a@infradead.org>

On Fri, Oct 03, 2025 at 01:50:43PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 9/29/25 7:43 PM, Jinchao Wang wrote:
> > Add a maintainer entry for Kernel Stack Watch.
> > 
> > Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
> > ---
> >  MAINTAINERS | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 520fb4e379a3..3d4811ff3631 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -13362,6 +13362,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
> >  F:	Documentation/dev-tools/kselftest*
> >  F:	tools/testing/selftests/
> >  
> > +KERNEL STACK WATCH
> > +M:	Jinchao Wang <wangjinchao600@gmail.com>
> > +S:	Maintained
> > +F:	Documentation/dev-tools/kstackwatch.rst
> > +F:	include/linux/kstackwatch_types.h
> > +F:	mm/kstackwatch/
> > +F:	tools/kstackwatch/
> > +
> 
> Add entries in alphabetical order, please.
> 
> >  KERNEL SMB3 SERVER (KSMBD)
> >  M:	Namjae Jeon <linkinjeon@kernel.org>
> >  M:	Namjae Jeon <linkinjeon@samba.org>
> 
Thanks, will be fixed in next version.
> -- 
> ~Randy
> 

-- 
Jinchao
