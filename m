Received: from smtp107.iad3b.emailsrvr.com (smtp107.iad3b.emailsrvr.com [146.20.161.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27568D2ED
	for <llvm@lists.linux.dev>; Tue, 21 Mar 2023 17:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
	s=20221208-6x11dpa4; t=1679408287;
	bh=TlmvMoZFxOuSDyvJfZ0J5hwIF97FbtPnlE66kHho/mo=;
	h=Date:Subject:To:From:From;
	b=cN2TurYcLx7jbqyoU/aWftymQORWLtAJT3eqTv7+rRiexgMUlyIYOpSkryUTtAD6V
	 zxU0mFyn9sfR14jIevO+IpEVNzCmXzaEdtZ2k9ngRWP+/U/RsksH3X5LC83X0miI1I
	 VPKFnCA1sjnz/yRxMAqFfs5jFWriW4T4soObNVGo=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp14.relay.iad3b.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 34C5DE0553;
	Tue, 21 Mar 2023 10:18:06 -0400 (EDT)
Message-ID: <a0eb6753-a92f-70bc-7794-c58f8362b1a4@mev.co.uk>
Date: Tue, 21 Mar 2023 14:18:05 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] comedi: remove unused dma_chain_flag_bits function
To: Tom Rix <trix@redhat.com>, hsweeten@visionengravers.com,
 nathan@kernel.org, ndesaulniers@google.com
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230321121410.1782901-1-trix@redhat.com>
Content-Language: en-GB
From: Ian Abbott <abbotti@mev.co.uk>
Organization: MEV Ltd.
In-Reply-To: <20230321121410.1782901-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Classification-ID: ce337f4d-767b-48db-80cb-328976d526b4-1-1

On 21/03/2023 12:14, Tom Rix wrote:
> clang with W=1 reports
> drivers/comedi/drivers/cb_pcidas64.c:377:28: error: unused function
>    'dma_chain_flag_bits' [-Werror,-Wunused-function]
> static inline unsigned int dma_chain_flag_bits(u16 prepost_bits)
>                             ^
> This function is not used, so remove it.
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>   drivers/comedi/drivers/cb_pcidas64.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/comedi/drivers/cb_pcidas64.c b/drivers/comedi/drivers/cb_pcidas64.c
> index ca6038a25f26..59390b23fa81 100644
> --- a/drivers/comedi/drivers/cb_pcidas64.c
> +++ b/drivers/comedi/drivers/cb_pcidas64.c
> @@ -374,11 +374,6 @@ static inline u16 pipe_full_bits(u16 hw_status_bits)
>   	return (hw_status_bits >> 10) & 0x3;
>   };
>   
> -static inline unsigned int dma_chain_flag_bits(u16 prepost_bits)
> -{
> -	return (prepost_bits >> 6) & 0x3;
> -}
> -
>   static inline unsigned int adc_upper_read_ptr_code(u16 prepost_bits)
>   {
>   	return (prepost_bits >> 12) & 0x3;

Looks OK, thanks!

Reviewed-by: Ian Abbott <abbotti@mev.co.uk>

-- 
-=( Ian Abbott <abbotti@mev.co.uk> || MEV Ltd. is a company  )=-
-=( registered in England & Wales.  Regd. number: 02862268.  )=-
-=( Regd. addr.: S11 & 12 Building 67, Europa Business Park, )=-
-=( Bird Hall Lane, STOCKPORT, SK3 0XA, UK. || www.mev.co.uk )=-

