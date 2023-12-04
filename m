Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A00171D9
	for <llvm@lists.linux.dev>; Mon,  4 Dec 2023 16:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="didfVJq6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62E5FC433C8;
	Mon,  4 Dec 2023 16:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701709162;
	bh=HsRSNN6CpvmvZAZ4yUoTzbjW0yuOeGGx/khxv4eeGtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=didfVJq6y/6VNbAau4ux2zMDTvbk3bR1iCMcgr2s7RSHUt7Plq0+NIfgG+QGn0sVq
	 USjAh5l0Cy6smgZwKWSI4he5ofSZLKwjFYpJZUKFMXt29Q8W96SgYuguTd5ruv978n
	 3VCYNsJcW/jGfNNsJQFAJlk+OeF+6dESEMS2XXo/xQCWYipcGRZlkL4xjF9lSNLWxR
	 cvj/4S6wlmf0//Sq0RbjpmrgBYKouefqpankUA5aeytIdMTQAhhrDMs4Kio+5fDs6n
	 zlfzMHXtmHQO0AeX3IJKZAI2pku39SJmepOsQUhQCqMMF/9Z1WpRCKukQt987+KeG1
	 cdtcCSbcC9cAQ==
Date: Mon, 4 Dec 2023 09:59:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jialu Xu <xujialu@vimux.org>
Cc: ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gen_compile_commands.py: fix path resolve with symlinks
 in it
Message-ID: <20231204165920.GA16980@dev-arch.thelio-3990X>
References: <20231204104141.3618547-1-xujialu@vimux.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204104141.3618547-1-xujialu@vimux.org>

On Mon, Dec 04, 2023 at 06:41:42PM +0800, Jialu Xu wrote:
> When symbolic links are involved in the path, os.path.abspath might not
> resolve the symlinks and instead return the absolute path with the
> symlinks intact.

Can you provide an example or more detailed description of how this
behavior is currently broken? I can't really understand how having
symlinks in the path after normalization would break anything but I am
potentially missing something :)

> use pathlib.Path resolve() instead of os.path.abspath()
> 
> Signed-off-by: Jialu Xu <xujialu@vimux.org>
> ---
>  scripts/clang-tools/gen_compile_commands.py | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/clang-tools/gen_compile_commands.py b/scripts/clang-tools/gen_compile_commands.py
> index 180952fb91c1b..0a6c0996b4a8f 100755
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
> @@ -172,8 +173,8 @@ def process_line(root_directory, command_prefix, file_path):
>      # by Make, so this code replaces the escaped version with '#'.
>      prefix = command_prefix.replace('\#', '#').replace('$(pound)', '#')
>  
> -    # Use os.path.abspath() to normalize the path resolving '.' and '..' .
> -    abs_path = os.path.abspath(os.path.join(root_directory, file_path))
> +    # Make the path absolute, resolving all symlinks on the way and also normalizing it.
> +    abs_path = str(Path(os.path.join(root_directory, file_path)).resolve())

I think this can be more simply:

    abs_path = str(Path(root_directory, file_path).resolve())

I think there should be a comment around why we are creating a Path
object then creating a string from it, rather than using the Path object
directly, namely that PosixPath is not JSON serializable.

>      if not os.path.exists(abs_path):
>          raise ValueError('File %s not found' % abs_path)
>      return {
> -- 
> 2.39.2
> 
