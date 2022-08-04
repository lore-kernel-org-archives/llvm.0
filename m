Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0012585
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 14:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F6FC43147;
	Thu,  4 Aug 2022 14:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659625044;
	bh=zW2Uw9CcLUDu0rPEZ2EXejDGYI9S642u10ffHL4EaKo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CMO9J/0GWDuTTzMdJancXEVLoNw6AVi6eeR88zBaHQ3qutQDYggpNhg+W5hs8Chzy
	 uIWLa65y1CCJ1s9mlunFrRx2FrLSIQXmqoOOVaOYELhwOEQgKzNfx/qp0KgdITvRvf
	 uo3X+bVDdIvKApfzwFWpPUyLhrB4kxkmqEDlZqjfKablDPvcZxaMsiC87+yylN+fm6
	 3LtjsRNjRs6ILyVG9Y3THdAKO2Wzo+x4ZE8ErVe5eHyxHUVrvLTBkRUL2IeYYbMpuy
	 car9/jVva80Nl0iISOQZbeA3OxaGPmMwcSvRDFnz2/hs9TllriNYfavJuMvzaCO0mj
	 C8u/caRd0iP6w==
Date: Thu, 4 Aug 2022 23:57:19 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>, llvm@lists.linux.dev, kbuild-all@lists.01.org, Tom
 Zanussi <zanussi@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tracing: Add .percent suffix option to histogram
 values
Message-Id: <20220804235719.d9fdd769212455958a721df9@kernel.org>
In-Reply-To: <20220802105646.50819088@gandalf.local.home>
References: <165932284978.2881436.13536997915615710506.stgit@devnote2>
	<202208021438.2r5RXlo9-lkp@intel.com>
	<20220802105646.50819088@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Aug 2022 10:56:46 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Tue, 2 Aug 2022 14:49:36 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > All errors (new ones prefixed by >>):
> > 
> > >> ld.lld: error: undefined symbol: __udivdi3  
> 
> This is due to this:
> 
> > @@ -5190,18 +5202,34 @@ static void hist_trigger_print_key(struct seq_file *m,
> >  	seq_puts(m, "}");
> >  }
> >  
> > +/* Get the 100 times of the percentage of @val in @total */
> > +static inline unsigned int __get_percentage(u64 val, u64 total)
> > +{
> > +	if (val < (U64_MAX / 10000))
> > +		return (unsigned int)(val * 10000 / total);
> > +	else
> > +		return val / (total / 10000);
> > +}
> > +
> 
> You can't use '/' on u64 values. You have to use div64*(). Otherwise 32 bit
> architectures may use floating point operations or glibc helpers.

Yeah, I forgot that. And also I have to check "total != 0" here. 

> 
> See the other divisions in trace_events_hist.c that do so too.

Thanks!

> 
> -- Steve
> 
> 
> >    >>> referenced by trace_events_hist.c:5211 (kernel/trace/trace_events_hist.c:5211)
> >    >>>               trace/trace_events_hist.o:(hist_show) in archive kernel/built-in.a
> >    >>> referenced by trace_events_hist.c:0 (kernel/trace/trace_events_hist.c:0)
> >    >>>               trace/trace_events_hist.o:(hist_show) in archive kernel/built-in.a
> >    >>> referenced by trace_events_hist.c:5211 (kernel/trace/trace_events_hist.c:5211)
> >    >>>               trace/trace_events_hist.o:(hist_show) in archive kernel/built-in.a
> >    >>> referenced 1 more times  
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
