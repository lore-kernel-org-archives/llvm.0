Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEA7F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 14:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF90C433C1;
	Tue,  2 Aug 2022 14:56:47 +0000 (UTC)
Date: Tue, 2 Aug 2022 10:56:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Tom Zanussi <zanussi@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] tracing: Add .percent suffix option to histogram
 values
Message-ID: <20220802105646.50819088@gandalf.local.home>
In-Reply-To: <202208021438.2r5RXlo9-lkp@intel.com>
References: <165932284978.2881436.13536997915615710506.stgit@devnote2>
	<202208021438.2r5RXlo9-lkp@intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 2 Aug 2022 14:49:36 +0800
kernel test robot <lkp@intel.com> wrote:

> All errors (new ones prefixed by >>):
> 
> >> ld.lld: error: undefined symbol: __udivdi3  

This is due to this:

> @@ -5190,18 +5202,34 @@ static void hist_trigger_print_key(struct seq_file *m,
>  	seq_puts(m, "}");
>  }
>  
> +/* Get the 100 times of the percentage of @val in @total */
> +static inline unsigned int __get_percentage(u64 val, u64 total)
> +{
> +	if (val < (U64_MAX / 10000))
> +		return (unsigned int)(val * 10000 / total);
> +	else
> +		return val / (total / 10000);
> +}
> +

You can't use '/' on u64 values. You have to use div64*(). Otherwise 32 bit
architectures may use floating point operations or glibc helpers.

See the other divisions in trace_events_hist.c that do so too.

-- Steve


>    >>> referenced by trace_events_hist.c:5211 (kernel/trace/trace_events_hist.c:5211)
>    >>>               trace/trace_events_hist.o:(hist_show) in archive kernel/built-in.a
>    >>> referenced by trace_events_hist.c:0 (kernel/trace/trace_events_hist.c:0)
>    >>>               trace/trace_events_hist.o:(hist_show) in archive kernel/built-in.a
>    >>> referenced by trace_events_hist.c:5211 (kernel/trace/trace_events_hist.c:5211)
>    >>>               trace/trace_events_hist.o:(hist_show) in archive kernel/built-in.a
>    >>> referenced 1 more times  

