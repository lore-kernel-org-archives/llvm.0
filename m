Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8E529CA
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 15:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5221EC340E1;
	Fri, 21 Jan 2022 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642779658;
	bh=1in7em99IDhgMK/RO/WoVEmsP6HEPw8AIBhEqarMRU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p9v2O5nFEjmrej1lSBixzH+jQG9o183FJVHTewcqCpNGYDqUahJyXrVNPL2p3rx45
	 8DLDkPaZs64ste5arxiXz3OECYokerqxFA+TDeJ3eiPX/IdJ8cdL5dEsvZk5+Py4o8
	 WdwQ1zkIUpaCOGHZ4UtYvf9i2wbsS03flyOdFRtCufXQgF0iq5Km43Y3vgpZZZiR9M
	 iMkY3IngdcICRdFpWy79LEbDFLS8VsAODxNFAojFfUmwAsTaKYVlePW9wDBYjYqZFj
	 2UOLbNU9NaS0MZSbAswJx9SdWYvKuQ/o+PUuTTXfaaezhaRgjqQBEsitGtGTWMfDdi
	 5omZAiJLcKZRQ==
Date: Fri, 21 Jan 2022 15:40:49 +0000
From: Filipe Manana <fdmanana@kernel.org>
To: trix@redhat.com
Cc: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, nathan@kernel.org,
	ndesaulniers@google.com, anand.jain@oracle.com,
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] btrfs: initialize variable cancel
Message-ID: <YerUAcOO5SV3J98+@debian9.Home>
References: <20220121134522.832207-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220121134522.832207-1-trix@redhat.com>

On Fri, Jan 21, 2022 at 05:45:22AM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> ioctl.c:3333:8: warning: 3rd function call argument is an
>   uninitialized value
>     ret = exclop_start_or_cancel_reloc(fs_info,
> 
> cancel is only set in one branch of an if-check and is
> always used.  So initialize to false.
> 
> Fixes: 1a15eb724aae ("btrfs: use btrfs_get_dev_args_from_path in dev removal ioctls")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: Filipe Manana <fdmanana@suse.com>

Could use a more precise subject like for example:

  "btrfs: fix use of uninitialized variable at rm device ioctl"

Anyway, it looks good.
Thanks.

> ---
>  fs/btrfs/ioctl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/btrfs/ioctl.c b/fs/btrfs/ioctl.c
> index 190ad8af4f45a..26e82379747f8 100644
> --- a/fs/btrfs/ioctl.c
> +++ b/fs/btrfs/ioctl.c
> @@ -3308,7 +3308,7 @@ static long btrfs_ioctl_rm_dev(struct file *file, void __user *arg)
>  	struct block_device *bdev = NULL;
>  	fmode_t mode;
>  	int ret;
> -	bool cancel;
> +	bool cancel = false;
>  
>  	if (!capable(CAP_SYS_ADMIN))
>  		return -EPERM;
> -- 
> 2.26.3
> 
