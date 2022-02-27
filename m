Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD024A91
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 17:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7F08C340EF;
	Sun, 27 Feb 2022 17:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645983707;
	bh=u7vdYl/msJzciiBUb4kqi0WTExjnG9fioQPXlI5ief0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xs1LWFkSqwXAGfmnXXhvfL+kVt07aTnfpsB52Vxlux/P31uUqSsWqquz/BZ3egW9E
	 5AWcpUjRB/JozILkJNE5e8q26bz/NxH5/BttXnZJ5KVqduarQgYYheQ4M3ah7QaQUI
	 7/iK9RUTN+DtNx72HR8wCi7F5FbIebSFBFfIFdyaf8ugdWH2hdojy40ObPY1ps4fJ8
	 aVEBo3JQaWgTMndrBBFu8JtBuVT0rS5+jT1uah64W7P88fR5eYtu1hSrvQNZFGoA9/
	 V5N+jMGQQSQlfmauloQcU0gkD4fh7skp8AZmE+x+oNY1vmkidNRXZa6wM75IFoHzFg
	 dis9WveVLuDOQ==
Date: Sun, 27 Feb 2022 17:48:50 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: trix@redhat.com
Cc: roan@protonic.nl, lars@metafoo.de, nathan@kernel.org,
 ndesaulniers@google.com, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] iio: scd4x: check return of scd4x_write_and_fetch
Message-ID: <20220227174850.73520e39@jic23-huawei>
In-Reply-To: <20220227154331.80338-1-trix@redhat.com>
References: <20220227154331.80338-1-trix@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 27 Feb 2022 07:43:31 -0800
trix@redhat.com wrote:

> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this problem
> scd4x.c:474:10: warning: The left operand of '==' is a
>   garbage value
>   if (val == 0xff) {
>       ~~~ ^
> val is only set from a successful call to scd4x_write_and_fetch()
> So check it's return.
> 
> Fixes: 49d22b695cbb ("drivers: iio: chemical: Add support for Sensirion SCD4x CO2 sensor")
> Signed-off-by: Tom Rix <trix@redhat.com>

Good find, but I'd prefer a separate check on ret inline with what the
other error checking paths in that function are doing.

> ---
>  drivers/iio/chemical/scd4x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
> index 20d4e7584e923..b978330fb761c 100644
> --- a/drivers/iio/chemical/scd4x.c
> +++ b/drivers/iio/chemical/scd4x.c
> @@ -471,7 +471,7 @@ static ssize_t calibration_forced_value_store(struct device *dev,
>  	ret = scd4x_write_and_fetch(state, CMD_FRC, arg, &val, sizeof(val));
>  	mutex_unlock(&state->lock);
>  
> -	if (val == 0xff) {
> +	if (!ret && val == 0xff) {
>  		dev_err(dev, "forced calibration has failed");
>  		return -EINVAL;
>  	}
Prefer

	if (ret)
		return ret;

	if (val == 0xff) {
		dev_err(dev, "...
		return -EINVAL;
	}

Thanks,

Jonathan

