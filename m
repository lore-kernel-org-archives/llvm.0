Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2E27B
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 00:23:48 +0000 (UTC)
Received: from conssluserg-06.nifty.com ([10.126.8.85])by condef-04.nifty.com with ESMTP id 25K0Gbir022071
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 09:16:37 +0900
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 25K0GIPD006936
	for <llvm@lists.linux.dev>; Mon, 20 Jun 2022 09:16:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 25K0GIPD006936
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1655684179;
	bh=4blG+KdLMI4J2p0+RQlJ7XT3Z2d4e9BRsQ9l3EsiNDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bFPQD0DwtyRbfSABPK0yLwWWCWm8IoIcRYXF7M40GjA6l3nfZepRQ7CnQmnjP1AZ9
	 TZJPOdcGrxWgmbirpYqJ+yazewRMyWE1TQjjht3UK0FPkR3o0YTFGay10Sejl4dxMv
	 zrKkeyfsIydQRpWS/Cc2skyGad5wwpbX3IQHvVTUyH7YmtgFrd++NjfIXb/C1ysK95
	 lZY3g4/pw9CHAogtcBjFyqAfGRDskkgEz2TgPPdPwgXBZ4DoDYgxyouvu2d4NzkeiO
	 EHXlxIyE+/sJvrwPtA4MxYQD53zaKgYjF5Sx0NT81k4qHGpgzcWg6XpnZmQhexNS9W
	 GaXAew8bSS9qA==
X-Nifty-SrcIP: [209.85.221.46]
Received: by mail-wr1-f46.google.com with SMTP id k22so6004304wrd.6
        for <llvm@lists.linux.dev>; Sun, 19 Jun 2022 17:16:19 -0700 (PDT)
X-Gm-Message-State: AJIora93QQTgumVbtB1OVH8Vm3Sd6aiSMCLynoskqyG3zeJ07oi9bsU4
	01LEnLGc+gXTTBJIEW/DV6ApoSjO2ivf2YesWko=
X-Google-Smtp-Source: AGRyM1t89pUeU8cM0NU4fw4pi19rXim37m7agFIl7us4x947hMt1OMJMKtyXj2kzdiwBrVyYv8sZCr/JOvuLTDoMqxY=
X-Received: by 2002:a05:6000:810:b0:21b:90e6:42a8 with SMTP id
 bt16-20020a056000081000b0021b90e642a8mr1124133wrb.477.1655684177810; Sun, 19
 Jun 2022 17:16:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220616021149.327587-1-jhubbard@nvidia.com>
In-Reply-To: <20220616021149.327587-1-jhubbard@nvidia.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Jun 2022 09:15:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1j-c-Kb-FffscwLqR0aHtx1=_cH2VtWw7vAFQRF_LTg@mail.gmail.com>
Message-ID: <CAK7LNAQ1j-c-Kb-FffscwLqR0aHtx1=_cH2VtWw7vAFQRF_LTg@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: fix overlooked module files
To: John Hubbard <jhubbard@nvidia.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>,
        Jason Gunthorpe <jgg@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 16, 2022 at 11:12 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> scripts/clang-tools/gen_compile_commands.py incorrectly assumes that
> each .mod file only contains one line. In fact, such files contain one
> entry per line, and for some subsystems, there can be many, many lines.
> For example, Nouveau has 762 entries, but only the first entry was being
> processed. This problem causes clangd to fail to provide references and
> definitions for valid files that are part of the current kernel
> configuration.


My previous comment "Can you update the commit log?"
meant, "Can you rewrite the commit log (in a more concise way)?".



I am not sure the Nouveau example is needed here, but
more important information is that
ecca4fea1ede4 changed the .mod file
from "all entries at the first line" to "one entry per line".




> This problem only occurs when using Kbuild to generate, like this:
>
>    make CC=clang compile_commands.json
>
> It does not occur if you just run gen_compile_commands.py "bare", like
> this (below):
>
>    scripts/clang-tools/gen_compile_commands.py/gen_compile_commands.py .

I am not sure if this is needed, but at least, the command line is wrong.

scripts/clang-tools/gen_compile_commands.py/gen_compile_commands.py .
    -->
scripts/clang-tools/gen_compile_commands.py .


> Fix this by fully processing each .mod file. This fix causes the number
> of build commands that clangd finds in my kernel build (these numbers
> are heavily dependent upon .config), from 2848 to 5292, which is an 85%
> increase.

I am not sure if the second sentence is needed
because this patch is just an obvious fix.



Sorry, I missed to adjust this file in ecca4fea1ede4,
and ended up bothering you too much.



> Fixes: 9413e7640564 ("kbuild: split the second line of *.mod into *.usyms")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Changes since v1:
>
> Applied changes recommended by Masahiro Yamada (thanks!): corrected the
> "Fixes" tag, and improved the python code for parsing .mod files.
>
>
>  scripts/clang-tools/gen_compile_commands.py | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 1d1bde1fd45e..acf4ec28aaf1 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -157,11 +157,10 @@ def cmdfiles_for_modorder(modorder):
>              if ext != '.ko':
>                  sys.exit('{}: module path must end with .ko'.format(ko))
>              mod = base + '.mod'
> -           # The first line of *.mod lists the objects that compose the module.
> +            # Read from *.mod, to get a list of objects that compose the module.
>              with open(mod) as m:
> -                for obj in m.readline().split():
> -                    yield to_cmdfile(obj)
> -
> +                for mod_line in m:
> +                    yield to_cmdfile(mod_line.rstrip())
>


Please do not remove the blank line.


This file consistently keeps two lines between functions,
as suggested by PEP8.  [1]

[1] : https://peps.python.org/pep-0008/#blank-lines






--
Best Regards
Masahiro Yamada
