Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468BA3F8C3
	for <llvm@lists.linux.dev>; Tue,  5 Dec 2023 16:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cYk14YHq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66FD1C433C8;
	Tue,  5 Dec 2023 16:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701795410;
	bh=vnVlZzqZdVGwXpKfqdKy0p7fnqLtksgs6J1ySIaSR9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cYk14YHqwKu/eQeU5wvHKIl9+iR73IzAs5hZk7hrajH5Fs7/jfaxhNuguireTAqgg
	 NPxTRIdxGIMIn8lXXWqQaHOHfZGE4uNcMJ4SrZ0oU87SPTIqK3tEhZlgYHZSi1SkwN
	 QxXWMl1Yb+rbgU5mSsOwLfjdCYQl9+0FVwvSWyXkG506yjZA/lqErMy+uhPXtFwcLF
	 O8i7eVKSgLWBuKoZhyO1A38bJMBH8L+b403kvRSSpLOGR0NMIqN2lumxAIG52teTkS
	 bZteHHYuDnXknMPNrKxiwySMgtSVEyhb483Y4oxSOsB7lrLLcgnEL12hwlVhgEJZr7
	 fiPENfQVHPKdA==
Date: Tue, 5 Dec 2023 09:56:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jialu Xu <xujialu@vimux.org>
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gen_compile_commands.py: fix path resolve with
 symlinks in it
Message-ID: <20231205165648.GA391810@dev-arch.thelio-3990X>
References: <20231204165920.GA16980@dev-arch.thelio-3990X>
 <20231205021523.4152128-2-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231205021523.4152128-2-xujialu@vimux.org>

Hi Jialu,

On Tue, Dec 05, 2023 at 10:15:26AM +0800, Jialu Xu wrote:
> When symbolic links are involved in the path, os.path.abspath might not
> resolve the symlinks and instead return the absolute path with the
> symlinks intact.
> 
> Use pathlib.Path resolve() instead of os.path.abspath()
> 
> Signed-off-by: Jialu Xu <xujialu@vimux.org>

Thanks for the clarification in your previous message [1], I suppose
that makes sense as to why nobody has reported this to us because that
is a rather odd situation that the upstream kernel would not experience.

I think that some of those details should be in the commit message,
along with a short example like you provided, so that we know exactly
what the situation was and how this patch resolves it.

Perhaps something like (please feel free to correct or reword as you
feel necessary):

"When a path contains relative symbolic links, os.path.abspath() might
not follow the symlinks and instead return the absolute path with just
the relative paths resolved, resulting in an incorrect path.

<broken example>

Use pathlib.Path.resolve(), which resolves the symlinks and normalizes
the paths correctly.

<working example>"

The actual fix seems fine to me. Feel free to add

  Reviewed-by: Nathan Chancellor <nathan@kernel.org>

to the subsequent submission and please include both

  Masahiro Yamada <masahiroy@kernel.org>
  linux-kbuild@vger.kernel.org

on it in addition to the people you have here, as he is the one who
actually applies gen_compile_commands.py changes (I am going to send a
MAINTAINERS change for this).

[1]: https://lore.kernel.org/20231205021523.4152128-1-xujialu@vimux.org/

Cheers,
Nathan

> ---
>  scripts/clang-tools/gen_compile_commands.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 180952fb91c1b..99e28b7152c19 100755
> --- a/scripts/clang-tools/gen_compile_commands.py
> +++ b/scripts/clang-tools/gen_compile_commands.py
> @@ -11,6 +11,7 @@ import argparse
>  import json
>  import logging
>  import os
> +from pathlib import Path
>  import re
>  import subprocess
>  import sys
> @@ -172,8 +173,9 @@ def process_line(root_directory, command_prefix, file_path):
>      # by Make, so this code replaces the escaped version with '#'.
>      prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>  
> -    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
> -    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
> +    # Make the path absolute, resolving all symlinks on the way and also normalizing it.
> +    # Convert Path object to a string because 'PosixPath' is not JSON serializable.
> +    abs_path = str(Path(root_directory, file_path).resolve())
>      if not os.path.exists(abs_path):
>          raise ValueError('File %s not found' % abs_path)
>      return {
> -- 
> 2.39.2
> 
> 
