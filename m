Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3211B7F
	for <llvm@lists.linux.dev>; Sun,  3 Sep 2023 10:35:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3430FC433C8;
	Sun,  3 Sep 2023 10:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693737334;
	bh=CYLpYPeGI0w2m5LfccnFlQeF/v6+pPHDIGG7jNrSsZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CI/mn7yWXPnP/4PvuIH1bU7XkTkW8LhN0omDP7SzOy/bjg/rweAwiVpsrZzlgK2j0
	 E8pi7cxgYE1dA3HQHOMa6vDX8yu9wyoRpVkP9y8p1e0VxZ+5edPc49Kqk49SGaS65x
	 CwKiHwtNtegMCCF8tRAyPys9TlqTQK6wvTQrcERIxKzydo6xdmiGWcoUTZsQN4aK+O
	 QrE9k2y0FXC7olLXJnxj7UIU0bgY3x+ZfyjiQjsD5ftzlT+fJYrK4HxRfAWPNbBemA
	 yX78sOv7qA6BkVPa+JQUKWkETB1M/JSUqLK7WMHsaynzF1ZCpflrFUJnR6iyOVqLnT
	 gz2IfX2s7eLXA==
Date: Sun, 3 Sep 2023 12:35:30 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa@kernel.org>, Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH] i2c: pxa: fix clang -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230903103530.cdg4ehf4fas4mjbf@zenone.zhora.eu>
References: <20230816-void-drivers-i2c-busses-i2c-pxa-v1-1-931634b931ec@google.com>
 <ZOkofUzv6t9lXyN+@shikoro>
 <CAFhGd8qg5aeo34irrOQR7td1rjBVF2q4mDFV=Kbt=EmMUiTB_A@mail.gmail.com>
 <ZOkyRoKmRTMHLm7b@shikoro>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOkyRoKmRTMHLm7b@shikoro>

Hi,

> > There was some discussion [1] wherein it was ultimately decided that
> > this warning should probably be turned off (contrary to what the title
> > of the GitHub issue says).
> 
> I totally agree with your last comment in [1]. So, I also vote for
> disabling the warning. Thus, I will reject these patches, but still
> thank you for looking into such issues and trying to solve them!

yes, unfortunately this is the trend and most of the patches
follow this approach and they are getting merged.

I don't like pointers storing values and this fix whould be
completely taken from another side. In any case, given the trend,
I will not oppose.

Andi
