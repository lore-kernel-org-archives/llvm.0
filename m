Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E65F7A
	for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 18:45:19 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id y32so23852907lfa.6
        for <llvm@lists.linux.dev>; Tue, 28 Jun 2022 11:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4A7JptdsYkzAASzc4tkybkZDdctkCSB8PkmFN8uYVCI=;
        b=jKK9ituFZ+ubZapMzrh1ZUAkCQdnD2GwgEoK2/+06e9by7rYWo0M21RwB9RhuDTOV1
         sirjg4cgMk5iTnWIgO/+RUZo522q2VNlm3/BCjQf+4qD4a6c6eiPx5pIFCswicWwjnhh
         rhYcXDmIFoyQjq13x1jth2oavyXK/dUCXGEE4lWGNKeBIuydRbjvM1rGqIjKsa6Wkg/k
         YV939/4UKnIdOKjckr8oZEg0t/sPqlnXVdjgpGPnnVBInQGYes1UDs8hfszL7rdS3Ees
         9JNvIGIPqXvcy1JFsGvcZyroGMvo4EOcspdtr74iFRTQQU0H7qywfOosyr7VMYz/MnVg
         E8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4A7JptdsYkzAASzc4tkybkZDdctkCSB8PkmFN8uYVCI=;
        b=gGNMukJSo8MD459NeUyLyLHTmcyMB0F4RNJN9KazIbfKEAsopQpfYF21JAkORPgX/9
         eVJ+cmYW6IhC8aVTeqCKqb7s5+FNjLaHSMYdR+anIqsKFZcYsuf4K7JDlR5FLpqEI0nX
         LJD8Lgx8/BFApnv3gkt/2xb5y5E6mEV2oO4Rhn5j04+JuewsIDQWXMUXnsPLwK37qk7k
         jcIpu/i4HNFMCf0nSILvV1U8bTxXZbW1L7Vt/n3waLSub3zwbYxzri++y6emviOeRs4t
         OHaA3KcpNhuvPcXnXuH7HYbYAtMUwO6ksKe8U5xXkgeOOUuouTS9byES45khqrp+NgFI
         zxbw==
X-Gm-Message-State: AJIora9pZeMO4YT3x0lM32u2MEr1x/Loc5AyGRij4t13P8KYLzjiyDn+
	XMvYmRrVWWpuDvvWbuNuoa/w1bvOyWupYIc4AQu0dg==
X-Google-Smtp-Source: AGRyM1vT0A85nTZOQqS3XNPxs7XxozWywoh4CvpbznRddJchqP81sTLCvsoMEeNPd7QxyA7myNcILnRQ+L+b6muQqqw=
X-Received: by 2002:a05:6512:1307:b0:47f:baa4:52c5 with SMTP id
 x7-20020a056512130700b0047fbaa452c5mr11957896lfu.103.1656441917176; Tue, 28
 Jun 2022 11:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220628012353.13995-1-jhubbard@nvidia.com>
In-Reply-To: <20220628012353.13995-1-jhubbard@nvidia.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 28 Jun 2022 11:45:05 -0700
Message-ID: <CAKwvOd=FmKYse9NEvMt5MHev5wRzeZH6AcBd1uQEL5k0GLP+Zw@mail.gmail.com>
Subject: Re: [PATCH v3] gen_compile_commands: handle multiple lines per .mod file
To: John Hubbard <jhubbard@nvidia.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 27, 2022 at 6:24 PM John Hubbard <jhubbard@nvidia.com> wrote:
>
> scripts/clang-tools/gen_compile_commands.py incorrectly assumes that
> each .mod file only contains one line. That assumption was correct when
> the script was originally created, but commit 9413e7640564 ("kbuild:
> split the second line of *.mod into *.usyms") changed the .mod file
> format so that there is one entry per line, and potentially many lines.
>
> The problem can be reproduced by using Kbuild to generate
> compile_commands.json, like this:
>
>     make CC=clang compile_commands.json
>
> In many cases, the problem might be overlooked because many subsystems
> only have one line anyway. However, in some subsystems (Nouveau, with
> 762 entries, is a notable example) it results in skipping most of the
> subsystem.
>
> Fix this by fully processing each .mod file.
>
> Fixes: 9413e7640564 ("kbuild: split the second line of *.mod into *.usyms")
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the fix, John!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>
> Link to v2:
> https://lore.kernel.org/all/20220616021149.327587-1-jhubbard@nvidia.com/
>
> Changes since v2:
>
>   * Restored a blank line.
>
>   * Rewrote the commit description.
>
> thanks,
> John Hubbard
>
>
>  scripts/clang-tools/gen_compile_commands.py | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 1d1bde1fd45e..47da25b3ba7d 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -157,10 +157,10 @@ def cmdfiles_for_modorder(modorder):
>              if ext != '.ko':
>                  sys.exit('{}: module path must end with .ko'.format(ko))
>              mod = base + '.mod'
> -           # The first line of *.mod lists the objects that compose the module.
> +            # Read from *.mod, to get a list of objects that compose the module.
>              with open(mod) as m:
> -                for obj in m.readline().split():
> -                    yield to_cmdfile(obj)
> +                for mod_line in m:
> +                    yield to_cmdfile(mod_line.rstrip())
>
>
>  def process_line(root_directory, command_prefix, file_path):
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers
