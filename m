Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0A91841
	for <llvm@lists.linux.dev>; Thu, 26 Jan 2023 01:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED66C433EF;
	Thu, 26 Jan 2023 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674697569;
	bh=ISaeOmOM3kCAsLFU8We6f/ym3iORXFNgcC3FJNjdmqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJTNu+nrrVNBzgOjAFb3LlVB4tHkZepX6M6UQywzI1lX5JGkv5w4hRkqxZdTJ+sAu
	 Z84GYk0Pg7ESQrPhU6NKs2Q6lRg4tMXRYE/xZW3rxdBxuFas+uENHVAPPiOCdgZLD5
	 qwEK8F6aiZJug59mZw9oKHVZf2iq0c1FSPlEVbjdNSnJgY8X6fRfP1BCnZ8f+OYQ4D
	 SujNUxiISOc7+0/CYggdeaMOeU/dV/sK/Kbeal3AoXbmKLi7FhCix9wppmrACVPjYZ
	 iabYBqzmO0eP3c7FBFM57WWrN286Rr7nZEwuD7XzSCHktj49OqmVehYoLpqmBYWnni
	 lI9QxUcZxVBJA==
Date: Wed, 25 Jan 2023 17:46:06 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Stephane Eranian <eranian@google.com>,
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v3 1/3] objtool: Install libsubcmd in build
Message-ID: <20230126014606.idgutoohowyel6ei@treble>
References: <20230105090155.357604-1-irogers@google.com>
 <20230105090155.357604-2-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105090155.357604-2-irogers@google.com>

On Thu, Jan 05, 2023 at 01:01:53AM -0800, Ian Rogers wrote:
> Including from tools/lib can create inadvertent dependencies. Install
> libsubcmd in the objtool build and then include the headers from
> there.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>

After a make, "git status" shows:

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	tools/objtool/libsubcmd/

So tools/objtool/.gitignore needs an update.

> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -12,9 +12,15 @@ srctree := $(patsubst %/,%,$(dir $(CURDIR)))
>  srctree := $(patsubst %/,%,$(dir $(srctree)))
>  endif
>  
> -SUBCMD_SRCDIR		= $(srctree)/tools/lib/subcmd/
> -LIBSUBCMD_OUTPUT	= $(or $(OUTPUT),$(CURDIR)/)
> -LIBSUBCMD		= $(LIBSUBCMD_OUTPUT)libsubcmd.a
> +LIBSUBCMD_DIR = $(srctree)/tools/lib/subcmd/
> +ifneq ($(OUTPUT),)
> +  LIBSUBCMD_OUTPUT = $(abspath $(OUTPUT))/libsubcmd
> +else
> +  LIBSUBCMD_OUTPUT = $(CURDIR)/libsubcmd
> +endif
> +LIBSUBCMD_DESTDIR = $(LIBSUBCMD_OUTPUT)

Similar to Nicolas' comment, it's confusing to have two variables with
the same value.  Please s/LIBSUBCMD_DESTDIR/LIBSUBCMD_OUTPUT/

> +LIBSUBCMD = $(LIBSUBCMD_OUTPUT)/libsubcmd.a
> +CFLAGS += -I$(LIBSUBCMD_OUTPUT)/include

As far as I can tell, this CFLAGS addition is both ineffective (it's
overwritten later) and unnecessary (it's made redundant by the same
addition to the INCLUDES variable).

-- 
Josh
