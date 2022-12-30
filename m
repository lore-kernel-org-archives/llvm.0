Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0328F7
	for <llvm@lists.linux.dev>; Fri, 30 Dec 2022 18:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20CEBC433EF;
	Fri, 30 Dec 2022 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672423371;
	bh=dU/4Pv/AsYdZCFgnxqG06UuR7FIxiOj383GZLqs7CKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YVke1mwrwckJqTSC5qFg3iSO4PnnvFhrY3huSdAsyQpsi2HgA2xA6pLEfJstspZmA
	 h8+JnKHdAocxme4TS58wtSQ6juanTAXkDu1P63GtTWmbRYAaWpOIPaLLLTNevk30sI
	 byXYp2xoIHivnWvKR65suF8t8qXpFR4r0xIqOiE6NqeGaVce2bEZ8HgG0gupjk1Gsm
	 eRLaAzJQFYTkR2M2Ync6J68fZ+baosDbbm4CARayJc3wmN+6nu6UGqHbAld3osQWuW
	 M0/QqOE014vl873Otu5eNB9NRIPe1lSeCD10WOdkYovuYfitC4dbEG+yhZ4REFpfND
	 jKqgu8XSgCsag==
Date: Fri, 30 Dec 2022 11:02:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com,
	ndesaulniers@google.com, wqu@suse.com, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] btrfs: handle -Wmaybe-uninitialized with clang
Message-ID: <Y68nyfHNXieotO+C@dev-arch.thelio-3990X>
References: <20221230175507.1630431-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221230175507.1630431-1-trix@redhat.com>

On Fri, Dec 30, 2022 at 12:55:07PM -0500, Tom Rix wrote:
> The clang build reports this error
> error: unknown warning option '-Wmaybe-uninitialized'; did you mean '-Wuninitialized'? [-Werror,-Wunknown-warning-option]
> make[3]: *** [scripts/Makefile.build:252: fs/btrfs/super.o] Error 1
> 
> -Wmaybe-uninitialized is a gcc only flag.  Move to setting with cc-option.
> 
> Fixes: 1b19c4c249a1 ("btrfs: turn on -Wmaybe-uninitialized")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for the patch! Looks like I forgot to double back to this...

https://lore.kernel.org/Y6kgR4qnb23UdAEX@dev-arch.thelio-3990X/

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  fs/btrfs/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/btrfs/Makefile b/fs/btrfs/Makefile
> index eca995abccdf..460eced3f5bd 100644
> --- a/fs/btrfs/Makefile
> +++ b/fs/btrfs/Makefile
> @@ -7,12 +7,12 @@ subdir-ccflags-y += -Wmissing-format-attribute
>  subdir-ccflags-y += -Wmissing-prototypes
>  subdir-ccflags-y += -Wold-style-definition
>  subdir-ccflags-y += -Wmissing-include-dirs
> -subdir-ccflags-y += -Wmaybe-uninitialized
>  condflags := \
>  	$(call cc-option, -Wunused-but-set-variable)		\
>  	$(call cc-option, -Wunused-const-variable)		\
>  	$(call cc-option, -Wpacked-not-aligned)			\
> -	$(call cc-option, -Wstringop-truncation)
> +	$(call cc-option, -Wstringop-truncation)		\
> +	$(call cc-option, -Wmaybe-uninitialized)
>  subdir-ccflags-y += $(condflags)
>  # The following turn off the warnings enabled by -Wextra
>  subdir-ccflags-y += -Wno-missing-field-initializers
> -- 
> 2.27.0
> 
