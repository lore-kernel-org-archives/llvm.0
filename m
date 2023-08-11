Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1463B6;
	Fri, 11 Aug 2023 15:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BE5C433C7;
	Fri, 11 Aug 2023 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691766414;
	bh=x9/6qPE0ahOZQaLwoxBTxd9SGZCAAaS1X7FH7xekC3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rhIDV5tX3UpkogZmDz/UGhXNsPdjLYb+TPRfoJGSDVHnMj0OSSKTRgqo5Sz/WexcW
	 5riHcZC3CUSoEYzQ/ND0nGwbI9a15vMS4dsoNtKZlLYlCqvP4S/QaB8Gyx0TUjEGIH
	 qXCuzKMJgRgeooMbfYMjmjXRdU+WkOcMt68UGi3ZSd3HVQcOt1kisx0wfnHWuN+ETC
	 CXA9jtQl2ROSChDpN9etivDJOXX6whMQTSSSbdvRSPelaoAEFLLTOWLlCsN+MeE9Yy
	 1cLX1KqNvI66C38ed1PPi2dEYv3sQwbtdsY8yV4aMowBoLjCxzWt0OVf6e3Fog/uo2
	 BBoNafQT3v82w==
Date: Fri, 11 Aug 2023 20:36:44 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Vivek Pernamitta <quic_vpernami@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] bus: mhi: host: remove unused-but-set parameter
Message-ID: <20230811150644.GB5296@thinkpad>
References: <20230811134547.3231160-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230811134547.3231160-1-arnd@kernel.org>

On Fri, Aug 11, 2023 at 03:45:41PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Clang warns about a parameter that is decremented but never evaluated heere:
> 
> bus/mhi/host/main.c:803:13: error: parameter 'event_quota' set but not used [-Werror,-Wunused-but-set-parameter]
>                              u32 event_quota)
> 
> Remove the access to the variable to avoid that warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/main.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 74a75439c7130..dcf627b36e829 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -938,7 +938,6 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>  				if (!mhi_chan->configured)
>  					break;
>  				parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
> -				event_quota--;
>  			}
>  			break;
>  		default:
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்
