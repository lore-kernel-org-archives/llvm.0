Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480448823
	for <llvm@lists.linux.dev>; Fri, 16 Dec 2022 13:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5715C433EF;
	Fri, 16 Dec 2022 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671195774;
	bh=Zqx8PemfNkIgR0VSjlq+cSSIc1mNqP5HstKuh5k7PvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BpC4XSYaVer0QbtlOxiYn/qwe6V2XeUXMVzBAjZy3fz9wIQ4vZYOtx/SlhpFw4UrJ
	 Ar/jbSb+JqW+ms4efYSI1yfMdoil2BxaIZee6Pb4+KzxjVWx4uPTF8e7KhsE+ssFiG
	 AcgFIx6TewgsncKns95P8wb80rqcuj9dC3syZ0Bt49yf6snpzRa/tGnwfJOaxyD8By
	 iJhkjX6NZ2J7qIj2hIFrWtRpES3bffNevn4+AyqNSyuuTmnSskzWkmWeiX4ZaMWif/
	 nzhVvtxo/EE9CrXa5bY3woCBUCzQy17ORc6aoTjRybvUuTB1ImWDpSaVjO4iLWP/Hb
	 BqTiY/n9at7Hw==
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
	id 46F1540367; Fri, 16 Dec 2022 10:02:51 -0300 (-03)
Date: Fri, 16 Dec 2022 10:02:51 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org,
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>
Subject: Re: [PATCH] tools lib perf: fix install_pkgconfig target
Message-ID: <Y5xse0o0gbyFjeV7@kernel.org>
References: <20221202045743.2639466-1-irogers@google.com>
 <20221202045743.2639466-3-irogers@google.com>
 <Y5w+F+aqN5L1CuuG@tuxmaker.boeblingen.de.ibm.com>
 <Y5w/cWKyb8vpNMfA@li-4a3a4a4c-28e5-11b2-a85c-a8d192c6f089.ibm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5w/cWKyb8vpNMfA@li-4a3a4a4c-28e5-11b2-a85c-a8d192c6f089.ibm.com>
X-Url: http://acmel.wordpress.com

Em Fri, Dec 16, 2022 at 10:50:41AM +0100, Alexander Gordeev escreveu:
> Commit 47e02b94a4c9 ("tools lib perf: Add dependency test
> to install_headers") misses the notion of $(DESTDIR_SQ)
> for install_pkgconfig target, which leads to error:
> 
> install: cannot create regular file '/usr/lib64/pkgconfig/libperf.pc': Permission denied
> make: *** [Makefile:210: install_pkgconfig] Error 1

Thanks, applied.

- Arnaldo

 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  tools/lib/perf/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/perf/Makefile b/tools/lib/perf/Makefile
> index 30b7f91e7147..d8cad124e4c5 100644
> --- a/tools/lib/perf/Makefile
> +++ b/tools/lib/perf/Makefile
> @@ -208,7 +208,7 @@ install_headers: $(INSTALL_HDRS) $(INSTALL_INTERNAL_HDRS)
>  
>  install_pkgconfig: $(LIBPERF_PC)
>  	$(call QUIET_INSTALL, $(LIBPERF_PC)) \
> -		$(call do_install,$(LIBPERF_PC),$(libdir_SQ)/pkgconfig,644)
> +		$(call do_install,$(LIBPERF_PC),$(DESTDIR_SQ)$(libdir_SQ)/pkgconfig,644)
>  
>  install_doc:
>  	$(Q)$(MAKE) -C Documentation install-man install-html install-examples
> -- 
> 2.34.1

-- 

- Arnaldo
