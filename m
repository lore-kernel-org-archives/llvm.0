Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293EE1E1A2
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 14:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B7D5C433C9;
	Thu, 10 Aug 2023 14:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691678694;
	bh=U7AHW5DtWbmAG9Eg70mB7kcvRN4oEw4Uh2afJWCAUTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VyaKpQ2+7cui0XWCAAhqdAd+VGbWec7bzimuAwAjPgzEFN63rEAeDsZZdIWCS8pJo
	 pBDMGxn7/3SG9+wcDy3QkA77PM5h4+w+nhNNV/DdvUebflEYS0/G+zPZmoVrMDW7ID
	 b0oEIcFtoHFOVY4ileOspjUBbzcxg0iMxQlGtv1CQV1FH8rs9Ph3vOpPR8n9ph22Pa
	 EG1ybYbPodLdCB9lKN+8vsxuslM5fAaPiCIJ47zgIU2T8sZZt5KQEQdrnT5uj1fTmZ
	 o/8PoBnNCHWAT1nBClRKzpSy7HRaKEzjTGZJnf2EGH9DfTSP0e78b/F1+/V7Al6Bpn
	 G5Y9257lvrD1w==
Date: Thu, 10 Aug 2023 07:44:52 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast
 warning
Message-ID: <20230810144452.GD1549244@dev-arch.thelio-3990X>
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
 <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>
 <20230810085632.xzonkmse27mu4yew@intel.intel>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810085632.xzonkmse27mu4yew@intel.intel>

Hi Andi,

On Thu, Aug 10, 2023 at 10:56:32AM +0200, Andi Shyti wrote:
> Hi Justin,
> 
> > @@ -1036,7 +1036,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
> >  	platform_set_drvdata(pdev, iproc_i2c);
> >  	iproc_i2c->device = &pdev->dev;
> >  	iproc_i2c->type =
> > -		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
> > +		(unsigned long) of_device_get_match_data(&pdev->dev);
> 
> I think this should be uintptr_t, as defined in types.h:
> 
>     typedef unsigned long uintptr_t;

Yes, that is a valid comment, although I will say that I have seen some
developers/maintainers prefer 'unsigned long' over 'uintptr_t', so it is
really a crapshoot which one to pick :)

> (I'm a bit puzzled to see a void *data cast to a 0/1 value.)

It is an odd pattern but as far as I understand it, the kernel uses it a
lot to pass platform specific data around (just grepping for
'.data = (void *)' shows a lot of instances.

Cheers,
Nathan
