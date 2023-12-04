Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7351B1EB54;
	Mon,  4 Dec 2023 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KiIj8OFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9F6C433C9;
	Mon,  4 Dec 2023 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701692542;
	bh=VBhrN1iPpuRyzjKXqxjhhLRiYuFI95GVYxgoft4cV+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KiIj8OFDtFDuB6JKodOOuVAdXP362m2FJeoPh4PXXfCfZObsP6HzgR0U9xs2o9KEv
	 OOLqGlRWqIK8+dnhNdyUJEcp6yfR/5BdPP6qIF4bZJ6ry3Z41iaGeOf66n6+HP09M3
	 4qw6jBXbREaIeogan0AmKBRjd0tnPBrBcXKDhTdQ=
Date: Mon, 4 Dec 2023 09:00:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Su Hui <suhui@nfschina.com>
Cc: alexander.usyskin@intel.com, tomas.winkler@intel.com, arnd@arndb.de,
	nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v3] misc: mei: client.c: fix problem of return
 '-EOVERFLOW' in mei_cl_write
Message-ID: <2023120452-stool-party-bf2b@gregkh>
References: <20231128014507.418254-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128014507.418254-1-suhui@nfschina.com>

On Tue, Nov 28, 2023 at 09:45:08AM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'rets' is never
> read.Using 'goto err' to go to the error path and fix this problem.
> 
> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
> Signed-off-by: Su Hui <suhui@nfschina.com>

How was this tested?

> ---
> v3: 
>  - using 'goto err' rather than 'buf_len=-EOVERFLOW'.(Thanks to Sasha)
> 
> v2:
>  - split v1 patch to different patches
> https://lore.kernel.org/all/20231120095523.178385-2-suhui@nfschina.com/
> 
> v1:
> https://lore.kernel.org/all/5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com/
> 
>  drivers/misc/mei/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 7ea80779a0e2..0489bec4fded 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -2033,7 +2033,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>  	hbuf_slots = mei_hbuf_empty_slots(dev);
>  	if (hbuf_slots < 0) {
>  		rets = -EOVERFLOW;
> -		goto out;
> +		goto err;

Please prove that this is correct, as based on the code logic, it seems
very wrong.  I can't take this unless the code is tested properly.

thanks,

greg k-h
