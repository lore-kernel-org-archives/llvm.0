Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72437F
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 09:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41990C433C1;
	Tue, 13 Sep 2022 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663062658;
	bh=LFc8VLcHvprYH28gDo1PjrF0ebxy+2UO+x/vOTan0wQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=toW6LVrvof6E3mcs+G1NnzlNd+IXWSRQs1dN0ITSZc7EsSpizN6XMa84z0POGWWt6
	 JRySY58G6lzpU1n21O8EhKBD1dis8us8urDzbCclbF7ncg9p6lAWZKNNMZLIR+14jQ
	 hLFE9SH6WE5/cUGsdDXrZlKTEowc50k+GyrZ8dv7xr1FkQ4Tcvfec/iRsFcKrdmJdF
	 CR54kstM97vCriYq11NtVCqfqBuIzsGxKAd8CalYEkYPwyIkSx4bmrkP1bPhw6MZee
	 7YSdNwGzhx5PDJWDZG4jlHqoRtBLOpqzbcoziVBMZ2/vgebcV+oByTJ78meXmC82N6
	 4Q0nfwBZxAR5Q==
Date: Tue, 13 Sep 2022 02:50:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: yangxingwu <xingwu.yang@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: ndesaulniers@google.com, trix@redhat.com, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts/clang-tools: remove unused module
Message-ID: <YyBSgNbJGRBNIL5I@dev-arch.thelio-3990X>
References: <20220913040753.2198-1-xingwu.yang@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220913040753.2198-1-xingwu.yang@gmail.com>

On Tue, Sep 13, 2022 at 04:07:52AM +0000, yangxingwu wrote:
> remove unused imported 'os' module
> 
> Signed-off-by: yangxingwu <xingwu.yang@gmail.com>

Sure.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Masahiro, are you able to pick this up? The original was not cc'd to
linux-kbuild but it is on lore:

https://lore.kernel.org/20220913040753.2198-1-xingwu.yang@gmail.com/

> ---
>  scripts/clang-tools/run-clang-tools.py | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
> index 1337cedca..bb78c9bde 100755
> --- a/scripts/clang-tools/run-clang-tools.py
> +++ b/scripts/clang-tools/run-clang-tools.py
> @@ -12,7 +12,6 @@ compile_commands.json.
>  import argparse
>  import json
>  import multiprocessing
> -import os
>  import subprocess
>  import sys
> 
> --
> 2.37.2
> 
