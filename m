Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55ECD10970;
	Mon, 20 Nov 2023 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RhdxgwzT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441F9C433C8;
	Mon, 20 Nov 2023 09:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700471681;
	bh=k6d0lM2+y9b16G3yyqRXaBCz7ulXb/nq5YVNLW0SRa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RhdxgwzTZTzphlnqO+ks94VV8+EVDg2G3VZURo5HN+D0ghfDpb4gw6Yx5Ozld/FZd
	 m/he1krbAShfl8untN3cb1ZaXgVM2/4HY0DaLqoGvIZRPFA4W+/4uUOUP4vVNy7OW1
	 oJSsHaK3fAdy7F43iUsEj0X7sJEQ/1AoP98azjm4=
Date: Mon, 20 Nov 2023 10:14:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Su Hui <suhui@nfschina.com>
Cc: tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	alexander.usyskin@intel.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] misc: mei: client.c: fix some error code problem in
 mei_cl_write
Message-ID: <2023112010-ceremony-salad-145b@gregkh>
References: <20231120085343.157381-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120085343.157381-1-suhui@nfschina.com>

On Mon, Nov 20, 2023 at 04:53:45PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'rets' is never
> read. Remove some useless code, and let 'buf_len = -EOVERFLOW' to make
> sure we can return '-EOVERFLOW'.
> 
> mei_msg_hdr_init() return negative error code, rets should be
> 'PTR_ERR(mei_hdr)' rather than '-PTR_ERR(mei_hdr)'.
> 
> Fixes: 0cd7c01a60f8 ("mei: add support for mei extended header.")
> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
>  drivers/misc/mei/client.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 9c8fc87938a7..00dac0a47da0 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -2011,7 +2011,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>  
>  	mei_hdr = mei_msg_hdr_init(cb);
>  	if (IS_ERR(mei_hdr)) {
> -		rets = -PTR_ERR(mei_hdr);
> +		rets = PTR_ERR(mei_hdr);

This looks like a bugfix, while the other changes here are just a normal
cleanup.  Can you please split this up into different patches?

thanks,

greg k-h
