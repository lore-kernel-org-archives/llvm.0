Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC0517FF3;
	Thu, 17 Aug 2023 19:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4070C433C7;
	Thu, 17 Aug 2023 19:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692301956;
	bh=SPiXooE6PXcXmqC5tjCHuM013avVZj6UwiflyY70E2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6ncAT98j4Enq0lr0b+waHy+Zt96gKu0n6FcdoztdS3GhaVY9F2Zis2GR1qVY88+W
	 69Slu03qP0ZNXNm2+CHjxfB0a5dPCDYaTXf3RUIoATZ8y5LP+5KN83Z2lLaLA6UWkx
	 Q1jGnlK/nXEe0khoXFjwu9l3/8toEqpT+4T+7SS7K9bXorKT7Ec40BUiB26G5PJA3x
	 sxpMTE4a4715SEEwPXhzUIooHn6NZL89D9NB1JrByM+WrhJSF9XkUH+phYvq1xDGZX
	 j+9+QnFSWFkos1KuzTNR4iAtU8LNK7VIAMU4yjtEI2I61gq3Mt+g9zJ1WFWvJC0ZmX
	 AqCAya57wexjA==
Date: Thu, 17 Aug 2023 20:52:31 +0100
From: Lee Jones <lee@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Artur Weber <aweber.kernel@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [linux-next:master 4727/8441]
 drivers/video/backlight/lp855x_bl.c:252:7: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <20230817195231.GL986605@google.com>
References: <202308091728.NEJhgUPP-lkp@intel.com>
 <20230817170602.GJ986605@google.com>
 <20230817170845.GA3299567@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230817170845.GA3299567@dev-arch.thelio-3990X>

On Thu, 17 Aug 2023, Nathan Chancellor wrote:

> On Thu, Aug 17, 2023 at 06:06:02PM +0100, Lee Jones wrote:
> > Arthur,
> > 
> > Please submit a follow-up patch or I'll have to revert it.
> 
> The follow up fix was sent a couple hours after this report:
> 
> https://lore.kernel.org/20230809114216.4078-1-aweber.kernel@gmail.com/

Super, thanks.

I had a simple grep for a follow-up, but must have missed it.  I'll
probably get up to it (working reverse chronologically) tomorrow some
time.

-- 
Lee Jones [李琼斯]
