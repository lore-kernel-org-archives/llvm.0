Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D211C91;
	Mon, 20 Nov 2023 10:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qg3+xKVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3207DC433C7;
	Mon, 20 Nov 2023 10:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700474574;
	bh=cHimYpMhUep/CZIA34BYn3fN2F5JRYJOp6C9HTy9Kyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qg3+xKVhl3cPufNUbrh2VSLXFNldK96+YpJvA8DbDkkpeMp+Hx5ksGncTNmrmcl40
	 ueSj7yj7matXWd0Jclb+dv+XnCNlKTTYridjT7lcAXzl0UsJAz9jOev0hji2Bsyu51
	 Mzp/1zhn7NNHV2GI6uzOqUT3Gip1yGTSUq/UHXKs=
Date: Mon, 20 Nov 2023 11:02:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Su Hui <suhui@nfschina.com>
Cc: tomas.winkler@intel.com, arnd@arndb.de, nathan@kernel.org,
	ndesaulniers@google.com, trix@redhat.com,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 2/2] misc: mei: client.c: fix problem of return
 '-EOVERFLOW' in mei_cl_write
Message-ID: <2023112042-napped-snoring-b766@gregkh>
References: <20231120095523.178385-1-suhui@nfschina.com>
 <20231120095523.178385-2-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120095523.178385-2-suhui@nfschina.com>

On Mon, Nov 20, 2023 at 05:55:26PM +0800, Su Hui wrote:
> Clang static analyzer complains that value stored to 'rets' is never
> read.Let 'buf_len = -EOVERFLOW' to make sure we can return '-EOVERFLOW'.
> 
> Fixes: 8c8d964ce90f ("mei: move hbuf_depth from the mei device to the hw modules")
> Signed-off-by: Su Hui <suhui@nfschina.com>
> ---
> v2: split v1 patch to different patches
> v1: https://lore.kernel.org/all/5c98fc07-36a9-92cc-f8d6-c4efdc0c34aa@nfschina.com/
> 
>  drivers/misc/mei/client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/mei/client.c b/drivers/misc/mei/client.c
> index 7ea80779a0e2..9d090fa07516 100644
> --- a/drivers/misc/mei/client.c
> +++ b/drivers/misc/mei/client.c
> @@ -2032,7 +2032,7 @@ ssize_t mei_cl_write(struct mei_cl *cl, struct mei_cl_cb *cb, unsigned long time
>  
>  	hbuf_slots = mei_hbuf_empty_slots(dev);
>  	if (hbuf_slots < 0) {
> -		rets = -EOVERFLOW;
> +		buf_len = -EOVERFLOW;
>  		goto out;
>  	}
>  
> -- 
> 2.30.2
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
