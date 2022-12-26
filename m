Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055E8634
	for <llvm@lists.linux.dev>; Mon, 26 Dec 2022 04:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A527C433D2;
	Mon, 26 Dec 2022 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672028233;
	bh=WjcgB8b9KOwVdHOgPsbxXPcn2mzQzapJEoOIrCPxgjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEU5H8Ibkcfy7ZCh2rKd5pwsgoz++yNivMnjU8k+Omo+PG23Xjb0cvDbnRMpYrV2d
	 tBuNkDhfDSeqNgIW9ktZzAVSHxlsKQkwuUAs1mnwKet1coGDx9MBIbqzNDjAEv51mO
	 dpjq/e8ODjXthSXajj2dTmCOOWG/fI1Ozqrzv/v2LpcGMFYQWJN4bI4QVJZ+/IE6CT
	 ybp/+nHQKDDuBKFZ79CtaXfVM/bbtG2mp0MrqxPZTMCTb5hO5BwEbkcrtO5h1282Pq
	 xx/raH+oHstPd3i+KNGRz/h88tuOcsrcmnHrA9IqCLhWGeCRQW/iUzl9TUzZ5JzTRi
	 REM7nrwcafBTQ==
Date: Sun, 25 Dec 2022 21:17:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josef Bacik <josef@toxicpanda.com>
Cc: linux-btrfs@vger.kernel.org, kernel-team@fb.com, llvm@lists.linux.dev
Subject: Re: [PATCH 8/8] btrfs: turn on -Wmaybe-uninitialized
Message-ID: <Y6kgR4qnb23UdAEX@dev-arch.thelio-3990X>
References: <cover.1671221596.git.josef@toxicpanda.com>
 <1d9deaa274c13665eca60dee0ccbc4b56b506d06.1671221596.git.josef@toxicpanda.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d9deaa274c13665eca60dee0ccbc4b56b506d06.1671221596.git.josef@toxicpanda.com>

On Fri, Dec 16, 2022 at 03:15:58PM -0500, Josef Bacik wrote:
> We had a recent bug that would have been caught by a newer compiler with
> -Wmaybe-uninitialized and would have saved us a month of failing tests
> that I didn't have time to investigate.
> 
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

This needs to be moved to the condflags section, as
-Wmaybe-uninitialized is a GCC only flag, so this breaks our builds with
clang on next-20221226:

  error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]

I can send a patch on Tuesday unless the original commit can be amended.

> ---
>  fs/btrfs/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
> index 555c962fdad6..eca995abccdf 100644
> --- a/fs/btrfs/Makefile
> +++ b/fs/btrfs/Makefile
> @@ -7,6 +7,7 @@ subdir-ccflags-y += -Wmissing-format-attribute
>  subdir-ccflags-y += -Wmissing-prototypes
>  subdir-ccflags-y += -Wold-style-definition
>  subdir-ccflags-y += -Wmissing-include-dirs
> +subdir-ccflags-y += -Wmaybe-uninitialized
>  condflags := \
>  	$(call cc-option, -Wunused-but-set-variable)		\
>  	$(call cc-option, -Wunused-const-variable)		\
> -- 
> 2.26.3
> 
> 
