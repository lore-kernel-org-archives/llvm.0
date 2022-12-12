Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA66FD9
	for <llvm@lists.linux.dev>; Mon, 12 Dec 2022 21:04:58 +0000 (UTC)
Received: from leknes.fjasle.eu ([46.142.98.187]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mleo0-1odmn242ug-00imxM; Mon, 12 Dec 2022 21:57:47 +0100
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
	id 770693C1BA; Mon, 12 Dec 2022 21:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
	t=1670878658; bh=qnQ4b4OQQYBi41zkGd5uOCUPLtZ3tfRTJtk/z24yVwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4x5ahCDLnX1Nwswko43mNTdERhxKyMuflqrcHjLjKRvKaeLkFF/p80sxO1Leyq3vE
	 SgfxTSm+ivpt3Ilu3P5k+ScZ9gLFNObyr7D/iamJou6F57djITqC4AiietPvAb4Np3
	 tSvtnIjNRvuVhDLdwGqgJM1IZrqJwzl6wBgsXZHs=
Date: Mon, 12 Dec 2022 21:57:38 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	bpf@vger.kernel.org, llvm@lists.linux.dev,
	Stephane Eranian <eranian@google.com>
Subject: Re: [PATCH 3/5] tools lib subcmd: Add dependency test to
 install_headers
Message-ID: <Y5eVwlId2A2/pN40@fjasle.eu>
References: <20221202045743.2639466-1-irogers@google.com>
 <20221202045743.2639466-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221202045743.2639466-4-irogers@google.com>
X-Provags-ID: V03:K1:3GmCeNNSVVdhmJX5HMTzbhSdxI6R4yUF6tJQCtwPq/TnqvO5APk
 /+xEZtzMC83be00kVnu0kgC6dao9my0lKfrnr1YkOYOcQvaLg8Xb4nj0q1VtsXhowaQ/C3M
 Lp+WOdtyKO9zX/bGvpytzbjN50dCkbTyUfajmSLE/HnaMQ+J62EhxWaNErXiXf4p0QSZUJd
 LZC/vbAoFLWwVn81ixpTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:W8kwHyfwEI8=;sa17pKR9FLWrGGt6O1U/Vt9Q/qo
 LEGxpYR0Np2hKoGW7r5FEVf+xKbD+j59hQ7nxWRj7hJ5qc1YCLqed8FWtB8AUvGbXWOdnsFkG
 Wkiepge0RP3d3c+HMrmywAaxVfhglmYoOqdBMRSTGlK2ii3piJT9K16+1/l4hkJn4UZsZIFDX
 My8aemydGmMCX3lZjDQrXIraL183OOPWdeChF7a0AlEO5+ioZesPZBWTB1xbIt5tXfvkP5UTE
 D0UQHeeV3QDW0CvlWaocFQcKSuOIE3V8omtgH74gIZuzv+EYpAPsX5TB7ZZ/ZSlpv+IdAkkbc
 ok+RLXUXnlN0tCmBvcU4uzAM4d9G2dL206wKaRRoX3Gj378HAvcnLmX+rMrT2EDgNr3qKAScK
 TppyRLVe+Gd3OfX6Pji5DLJUSb6OuuQamzsfsv6Y+DamHYheW7QbnhC/WKGr6HlFSfOk/ldJJ
 w1npChbKI5dIiWfUYXjJkDBlosNILTRm+yssP1fPd0Q950N7XaOZTdHZxKdLPDHcazTmzVFLs
 7iS9bjIGbYZl+T6ItpcBnV90v52csKbkgg7sgXnHQjYa6U9Uzw46OfanAJmJbbvYIqP8YPt3W
 MnaBZB9jUfXXZOQFk2p30p2/9/WNRLi6d0P8W0lyHKoljen+tl7sNHtvbnrfNVftwxqKG/x2E
 cQr5odFLQaTnJzsBLFQ9xIVa0rjQ2utb/Uo2x/BlzA==

On Thu, Dec 01, 2022 at 08:57:41PM -0800 Ian Rogers wrote:
> Compute the headers to be installed from their source headers and make
> each have its own build target to install it. Using dependencies
> avoids headers being reinstalled and getting a new timestamp which
> then causes files that depend on the header to be rebuilt.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  tools/lib/subcmd/Makefile | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/lib/subcmd/Makefile b/tools/lib/subcmd/Makefile
> index 9a316d8b89df..b87213263a5e 100644
> --- a/tools/lib/subcmd/Makefile
> +++ b/tools/lib/subcmd/Makefile
> @@ -89,10 +89,10 @@ define do_install_mkdir
>  endef
>  
>  define do_install
> -	if [ ! -d '$(DESTDIR_SQ)$2' ]; then             \
> -		$(INSTALL) -d -m 755 '$(DESTDIR_SQ)$2'; \
> +	if [ ! -d '$2' ]; then             \
> +		$(INSTALL) -d -m 755 '$2'; \
>  	fi;                                             \
> -	$(INSTALL) $1 $(if $3,-m $3,) '$(DESTDIR_SQ)$2'
> +	$(INSTALL) $1 $(if $3,-m $3,) '$2'

What about using '$(INSTALL) -D ...' instead of the if-mkdir-block above?
(E.g. as in tools/debugging/Makefile.)

Kind regards,
Nicolas

>  endef
>  
>  install_lib: $(LIBFILE)
> @@ -100,13 +100,16 @@ install_lib: $(LIBFILE)
>  		$(call do_install_mkdir,$(libdir_SQ)); \
>  		cp -fpR $(LIBFILE) $(DESTDIR)$(libdir_SQ)
>  
> -install_headers:
> -	$(call QUIET_INSTALL, libsubcmd_headers) \
> -		$(call do_install,exec-cmd.h,$(prefix)/include/subcmd,644); \
> -		$(call do_install,help.h,$(prefix)/include/subcmd,644); \
> -		$(call do_install,pager.h,$(prefix)/include/subcmd,644); \
> -		$(call do_install,parse-options.h,$(prefix)/include/subcmd,644); \
> -		$(call do_install,run-command.h,$(prefix)/include/subcmd,644);
> +HDRS := exec-cmd.h help.h pager.h parse-options.h run-command.h
> +INSTALL_HDRS_PFX := $(DESTDIR)$(prefix)/include/subcmd
> +INSTALL_HDRS := $(addprefix $(INSTALL_HDRS_PFX)/, $(HDRS))
> +
> +$(INSTALL_HDRS): $(INSTALL_HDRS_PFX)/%.h: %.h
> +	$(call QUIET_INSTALL, $@) \
> +		$(call do_install,$<,$(INSTALL_HDRS_PFX)/,644)
> +
> +install_headers: $(INSTALL_HDRS)
> +	$(call QUIET_INSTALL, libsubcmd_headers)
>  
>  install: install_lib install_headers
>  
> -- 
> 2.39.0.rc0.267.gcb52ba06e7-goog

-- 
epost|xmpp: nicolas@fjasle.eu          irc://oftc.net/nsc
↳ gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --
