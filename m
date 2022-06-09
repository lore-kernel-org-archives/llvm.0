Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584857A
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 16:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E91C34114;
	Thu,  9 Jun 2022 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654792483;
	bh=Z+8881I4lGsavWzdw6DGjO9wRYbLtT/CZtArIVyvZaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c4Uz+6A+2OOmdOhCtufOjwLRgEWGfXzyZ8jao+p0kgecuiArHgWdmUAlciS4UWhFP
	 VqqxlcQKwF8fxvxaOPv653HqMr0xYDtqUiUViRXvwCXrTA4sEeOYamoS2xapoQmpBQ
	 swqkXvhfnnLMtYy6ivQezK+H4KvvdFGT4eRRwsGbvSHN7GPW6JoDCqeExAAvNz767r
	 8a33RldnDFm8dsLV9u0t0Jd38YwmeGWokosVNzov4z21KdATX11BebY+mrFvQPsDne
	 ZTV++N4GGGNVwfba6OPP0NGn1sLNGT/SUfODp0hnx9DS2O5tY6EPKdqniH2XUByKBB
	 aUmgNH187oG3A==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id A4ACB4096F; Thu,  9 Jun 2022 13:34:40 -0300 (-03)
Date: Thu, 9 Jun 2022 13:34:40 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Fangrui Song <maskray@google.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org, Sedat Dilek <sedat.dilek@gmail.com>,
	llvm@lists.linux.dev, Sebastian Ullrich <sebasti@nullri.ch>
Subject: Re: [PATCH] perf unwind: Fix uninitialized variable
Message-ID: <YqIhIHQVh7s52Fap@kernel.org>
References: <20220607000851.39798-1-irogers@google.com>
 <20220607002658.zkbs4c37ihmivcmn@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607002658.zkbs4c37ihmivcmn@google.com>
X-Url: http://acmel.wordpress.com

Em Mon, Jun 06, 2022 at 05:26:58PM -0700, Fangrui Song escreveu:
> On 2022-06-06, Ian Rogers wrote:
> > ret may be uninitialized on error goto paths.
> > 
> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> > Fixes: dc2cf4ca866f ("perf unwind: Fix segbase for ld.lld linked objects")
> > Signed-off-by: Ian Rogers <irogers@google.com>
> 
> Thanks. Sorry for my mistake...
> 
> Reviewed-by: Fangrui Song <maskray@google.com>

Thanks, applied.

- Arnaldo

 
> > ---
> > tools/perf/util/unwind-libunwind-local.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/perf/util/unwind-libunwind-local.c b/tools/perf/util/unwind-libunwind-local.c
> > index 37622699c91a..6e5b8cce47bf 100644
> > --- a/tools/perf/util/unwind-libunwind-local.c
> > +++ b/tools/perf/util/unwind-libunwind-local.c
> > @@ -174,7 +174,7 @@ static int elf_section_address_and_offset(int fd, const char *name, u64 *address
> > 	Elf *elf;
> > 	GElf_Ehdr ehdr;
> > 	GElf_Shdr shdr;
> > -	int ret;
> > +	int ret = -1;
> > 
> > 	elf = elf_begin(fd, PERF_ELF_C_READ_MMAP, NULL);
> > 	if (elf == NULL)
> > -- 
> > 2.36.1.255.ge46751e96f-goog
> > 

-- 

- Arnaldo
