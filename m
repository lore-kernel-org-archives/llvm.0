Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C99E263D7
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 21:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EE9C433C8;
	Tue,  1 Aug 2023 21:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690926763;
	bh=/MJtcmuDxCcRCloI1q+HiSSif7LIAPt0IVFs1ZlKo9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjWvtXIeR3ZZjDZCFv2HsZhN9AC36ylZ5gKSVN7GOCf8YiY8M0iRnNkZIXDGwvIFx
	 zaX1A4yf8f8OjDnBgwQXDjf3MdnxoBzIKCumYvLCnPb/muPutxHFN4ec5rWdaTOfYb
	 8aCDCB1KrcMIaP8T87+yM57sT3FlUJtYVYV0Uov2RT9WIfxlj4Lk56nYR9cvjEnZC1
	 eiw3Jz1pAJG1YMf9TQMQ0UvW3wK3oFaGVpJFzFOfG/5e8RohVbDMMIOQ50iNYV6UQH
	 H4Is8MhuZCikip2cfRd87YnEmyp29l0SpmJV/0HGf+W2xmuVZtmnBMXv8R5s9d2sSg
	 aHGPQTvhmqs7w==
Date: Tue, 1 Aug 2023 14:52:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Avri Altman <avri.altman@wdc.com>, Bean Huo <beanhuo@micron.com>,
	Asutosh Das <quic_asutoshd@quicinc.com>,
	"Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
	Arthur Simchaev <Arthur.Simchaev@wdc.com>,
	Can Guo <quic_cang@quicinc.com>, llvm@lists.linux.dev
Subject: Re: [PATCH] scsi: ufs: Fix the build for gcc 9 and before
Message-ID: <20230801215240.GA534984@dev-arch.thelio-3990X>
References: <20230801201337.1007617-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230801201337.1007617-1-bvanassche@acm.org>

On Tue, Aug 01, 2023 at 01:13:23PM -0700, Bart Van Assche wrote:
> gcc compilers before version 10 cannot do constant-folding for sub-byte
> bitfields. This makes the compiler layout tests fail. Hence skip the
> layout checks for gcc 9 and before.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Naresh Kamboju <naresh.kamboju@linaro.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  drivers/ufs/core/ufshcd.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 23335aaa6a66..875c860bcc05 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -10564,6 +10564,15 @@ static const struct dev_pm_ops ufshcd_wl_pm_ops = {
>  
>  static void ufshcd_check_header_layout(void)
>  {
> +#if defined(__GNUC__) && __GNUC__ -0 < 10

clang defines __GNUC__ and it does not sound like it is impacted by this
issue? I just built with LLVM 11 through 17 and did not see it. Can this
be made more specific?

Also, can we use IS_ENABLED() and not rely on the preprocessor? This
appears to work for me.

    if (IS_ENABLED(CONFIG_CC_IS_GCC) && CONFIG_GCC_VERSION < 100000)
        return;

> +	/*
> +	 * gcc compilers before version 10 cannot do constant-folding for
> +	 * sub-byte bitfields. Hence skip the layout checks for gcc 9 and
> +	 * before.
> +	 */
> +	return;
> +#endif
> +
>  	BUILD_BUG_ON(((u8 *)&(struct request_desc_header){
>  				.cci = 3})[0] != 3);
>  
