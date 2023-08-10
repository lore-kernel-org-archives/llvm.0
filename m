Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE74E186C
	for <llvm@lists.linux.dev>; Thu, 10 Aug 2023 08:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD84BC433C8;
	Thu, 10 Aug 2023 08:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691657795;
	bh=JnhEH4wMc8AeDCC0VFoQzQrj+iXNdjqhUQZWI00aVz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rr8FrM0ZIPljqAf/YtTP0nPqKVf0SAWcJYosFK7Q2LQ+ppagF7NZsocOKvKfWW8Iv
	 tOcB+r+K6DXD4L5lCrPuff4QCziSJERHeTikodP0HTpOD/bXibzsloh9hziKLqC7c3
	 r6so+GeqiVHXchJPSJ5b2diWokVjVvkYHEbSSQUrfFe4WgAHFuJcDA8gM2FSKercB5
	 6Yx7rg5ZQmO2uPu73ODAdx1gchqSnOzzoxs17BUMrfEqcUOV+NKYP1cLbIV4qtQr48
	 SkZ7r50kj9j3QHeeuRJEHBgoFHEHqE2Y5lz4RT294C8Y8Z9vYMsA47Ne6KJqBVh8sz
	 vRP4RsDiE8sKQ==
Date: Thu, 10 Aug 2023 10:56:32 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast
 warning
Message-ID: <20230810085632.xzonkmse27mu4yew@intel.intel>
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
 <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>

Hi Justin,

> @@ -1036,7 +1036,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, iproc_i2c);
>  	iproc_i2c->device = &pdev->dev;
>  	iproc_i2c->type =
> -		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
> +		(unsigned long) of_device_get_match_data(&pdev->dev);

I think this should be uintptr_t, as defined in types.h:

    typedef unsigned long uintptr_t;

(I'm a bit puzzled to see a void *data cast to a 0/1 value.)

Andi
