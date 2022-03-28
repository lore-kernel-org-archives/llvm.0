Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8D37C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 16:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E3C8C004DD;
	Mon, 28 Mar 2022 16:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648483632;
	bh=qZVkUhdYVaRCKeRsrsBh1vhZfOiBsQqWGLWkaspWtwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LTq1BNj7zsS+xlAqljn7dFEkiKHxQ/XlkkYtq9n85qHygOWFP8AGfnFQDi72wOv7A
	 XK6XvHBSgKn8eBdBZC8MJ9F5EeUlDrOD3alotytztzw1+V2DJ6rM+pl1h1shpmUbJ0
	 ShvKtLShfmTR/+e0g0eJ09i1IIGUdTbHrtrl0p/rtgiXaWD2uMDxdFodatVSPz4Y6H
	 Kau7CTFHNJLA9ssUK9vMAp02adYqYiQ3CkkM2mwnI9xUfNmBr8JQYttyQaQ1KmuaW8
	 6laQ5sTmkDpHBvtK70ngzBXyyZ+9ngiK0U2mbH/vjMSgYWNih1H2BBMJb8UOQeluN9
	 2t0pkMBTlv+wQ==
Date: Mon, 28 Mar 2022 09:07:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: trix@redhat.com
Cc: sfrench@samba.org, ndesaulniers@google.com, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] cifs: fix enum usage
Message-ID: <YkHdKQ8TlhXTv1FP@dev-arch.thelio-3990X>
References: <20220328130300.3090213-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220328130300.3090213-1-trix@redhat.com>

On Mon, Mar 28, 2022 at 06:03:00AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang build fails with
> cifsfs.c:709:18: error: implicit conversion from enumeration
>   type 'enum statusEnum' to different enumeration
>   type 'enum tid_status_enum'
>   tcon->status = CifsExiting;
>                ~ ^~~~~~~~~~~
> 
> The type of the element status changed, so enum needed to change.
> Replace CifsExiting with TID_EXITING.

Right, this was clearly missed by the below commit, as every other
instance of tidStatus was changed to status plus the value from
enum tid_status_enum, except this one.

> Fixes: 7e5c8c02911b ("smb3: cleanup and clarify status of tree connections")
> Signed-off-by: Tom Rix <trix@redhat.com>

Thanks for sending the patch!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  fs/cifs/cifsfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index 0789bf1496c74..a47fa44b6d52b 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -706,7 +706,7 @@ static void cifs_umount_begin(struct super_block *sb)
>  		spin_unlock(&cifs_tcp_ses_lock);
>  		return;
>  	} else if (tcon->tc_count == 1)
> -		tcon->status = CifsExiting;
> +		tcon->status = TID_EXITING;
>  	spin_unlock(&cifs_tcp_ses_lock);
>  
>  	/* cancel_brl_requests(tcon); */ /* BB mark all brl mids as exiting */
> -- 
> 2.26.3
> 
> 
