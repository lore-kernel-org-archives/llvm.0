Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D672570
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 18:01:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72B4C385A0;
	Thu,  7 Apr 2022 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649354500;
	bh=+RD7PW8EiSgoK7hk7pP1ZkBkMlJVqYjQb7/8uzaiGkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f0vWDtvkhfMG14Ich+ZDQF2Vq/dAuwCEG8DnOjCWNORlmA/yWORy3+Dd0EypYeDIK
	 3cAfvwWSUVtOrIZhXZje1gFhro63bVSV2hSXWIobEc+lXOGtbBHzA68xSYOZBB7smj
	 5ZtG5IrR8RjJuupPT/vS1L2SQNcu1pDBOQ5KTeG1FXtIzvqyuD1gKMEUfeSZ2MGoNj
	 vxveqTMEkq2fF5IActEasm1sF31cGeCh1eD0+Qoce1oy+2FYkVOxGWbNwxv7/zH8u5
	 WTB55RJY1jotbCFwNeDsicMACrCkTswdbqVnLYEeUcvU+2fxleXm26s3WhAdKzIYH2
	 5RuGIcdkNHzfA==
Date: Thu, 7 Apr 2022 11:01:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tom Rix <trix@redhat.com>
Cc: pkshih@realtek.com, kvalo@kernel.org, davem@davemloft.net,
	kuba@kernel.org, pabeni@redhat.com, ndesaulniers@google.com,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] rtw89: ser: add a break statement
Message-ID: <Yk8nAnDcnPF5rC7N@dev-arch.thelio-3990X>
References: <20220407175349.3053362-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407175349.3053362-1-trix@redhat.com>

On Thu, Apr 07, 2022 at 01:53:49PM -0400, Tom Rix wrote:
> The clang build fails with
> ser.c:397:2: error: unannotated fall-through
>   between switch labels [-Werror,-Wimplicit-fallthrough]
>         default:
>         ^
> The case above the default does not have a break.
> So add one.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>

There is also https://lore.kernel.org/r/20220407132316.61132-2-pkshih@realtek.com/.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I have been using Documentation/process/deprecated.rst as justification
for the extra break, warning aside, as all case statements must end in
one of the following:

break
fallthrough
continue
goto
return

> ---
>  drivers/net/wireless/realtek/rtw89/ser.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/realtek/rtw89/ser.c b/drivers/net/wireless/realtek/rtw89/ser.c
> index 25d1df10f226..5aebd6839d29 100644
> --- a/drivers/net/wireless/realtek/rtw89/ser.c
> +++ b/drivers/net/wireless/realtek/rtw89/ser.c
> @@ -394,6 +394,7 @@ static void ser_idle_st_hdl(struct rtw89_ser *ser, u8 evt)
>  		break;
>  	case SER_EV_STATE_OUT:
>  		rtw89_hci_recovery_start(rtwdev);
> +		break;
>  	default:
>  		break;
>  	}
> -- 
> 2.27.0
> 
