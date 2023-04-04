Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D336AB8
	for <llvm@lists.linux.dev>; Tue,  4 Apr 2023 12:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E394DC433EF;
	Tue,  4 Apr 2023 12:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680612520;
	bh=QZz3P49jyyA9udOBPFdz1yXkOaOGxvzwkSwnnEX36hM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FtpBHWdfABhDi3H8J8jaAWh5K0OQJA7hBi41/EBFBG/nwG6oqUX8zuR8tzBacmmUA
	 1J7DEN2RC/5wT4TENsfme4zGNw2YMXXC6GMYu94EP7cEil2RA8s5G5ajbMEMLpQUEp
	 8S2+vGwZJDfWYbSJ/1ZemzVLiagEv2g9TP5eST3uRQ3eL7qWXzisAlrQ3hSiFO9bsi
	 PRGf+xbRASJMr7HsGKiiUleo5du+3EhAoKyKB7kgspiU5lUlWltodfg4F5jDIyn6bE
	 /7QhB9HhILqj6kNDyfv0adqKyu4dspPyeg5EE69HCZ19BUpTNRjP6EaBe8jye/MgZj
	 /c7lGeYJGZzrg==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 778664052D; Tue,  4 Apr 2023 09:48:37 -0300 (-03)
Date: Tue, 4 Apr 2023 09:48:37 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 0/4] Support for llvm-addr2line
Message-ID: <ZCwcpfqmcB6ofIvi@kernel.org>
References: <20230403184033.1836023-1-irogers@google.com>
 <ZCs1/skb2XqDYrYF@kernel.org>
 <CAM9d7chDz9dNpB+vywLMNxyc9p=wLaJp4qUYwfu6y88tEDYLLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM9d7chDz9dNpB+vywLMNxyc9p=wLaJp4qUYwfu6y88tEDYLLw@mail.gmail.com>
X-Url: http://acmel.wordpress.com

Em Mon, Apr 03, 2023 at 10:18:47PM -0700, Namhyung Kim escreveu:
> Hi,
> 
> On Mon, Apr 3, 2023 at 1:24 PM Arnaldo Carvalho de Melo <acme@kernel.org> wrote:
> >
> > Em Mon, Apr 03, 2023 at 11:40:29AM -0700, Ian Rogers escreveu:
> > > The addr2line command is started and then addresses piped to it. In
> > > order to determine the end of a addr2lines output a ',' it output with
> > > an expectation to get '??\n??:0\n' as a reply. llvm-addr2line differs
> > > in that ',' generates a reply of ','.
> > >
> > > The approach detects and then caches the addr2line style. When records
> > > are read the sentinel is detected appropriately.
> > >
> > > Comparing the output there is a little more inline data on my machine
> > > with llvm-addr2line:
> > > $ sudo perf record -a -g sleep 1
> > > $ sudo perf report --addr2line=addr2line > a.txt
> > > $ sudo perf report --addr2line=llvm-addr2line > b.txt
> > > $ wc -l a.txt b.txt
> > >   12386 a.txt
> > >   12477 b.txt
> > >
> > > Some other small changes, switching to the api/io code to avoid file
> > > streams wrapping the command's stdin/stdout. Ignore SIGPIPE for when
> > > addr2line exits and writes fail.
> > >
> > > v2. Address review comments from Arnaldo and Namhyung, fixing a
> > >     realloc error path, argument ordering and a comment.
> >
> > Added to local repo, build testing, will be in tmp.perf-tools-next soon.
> >
> > - Arnaldo
> >
> > > Ian Rogers (4):
> > >   tools api: Add io__getline
> > >   perf srcline: Simplify addr2line subprocess
> > >   perf srcline: Support for llvm-addr2line
> > >   perf srcline: Avoid addr2line SIGPIPEs
> 
> Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks, added to those patches.

- Arnaldo

