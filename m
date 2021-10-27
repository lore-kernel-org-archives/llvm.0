Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BE02C82
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 07:37:26 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 25825C638E; Wed, 27 Oct 2021 08:32:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
	t=1635319925; bh=Qh20DSqzNkEVBywW6slcGwgXVAd3ieFW+tkBVAZYzyA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DB/yzvtS7+CeJtrFeH/1aQJMFHCu6h8hOnq6qqlPdEC0rOR1a/X2Kt9nQSpcaOZVX
	 EeZL1mvQhKUfwb06/pi30OGqu26bLA0SOsVy7J6kSuLwOccNouNEW4j8+C1jXjgyqZ
	 waUIELqf8ujRBAtxrgaGBxeiL3WKw+uW+JfS95r5dxY2jNWrV2ZNLJAHAag3h9JHzq
	 ycKn0VF8jLfTsaOIkGWTyXJO49udUKgT5oF0DmAmE1I4WCrdxZXm2CAdj4ObJwBT1z
	 WA5dSVT5llqW5K4qV5gEFztkrJ8iuYY/8vw4pDtdlXU5lcRtD1VJh2+5MKWaFUVwyZ
	 ZXnY+2pVBh0Dw==
Date: Wed, 27 Oct 2021 08:32:04 +0100
From: Sean Young <sean@mess.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: kernel test robot <lkp@intel.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <maira.canal@usp.br>,
	mchehab@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3] media: rc: pwm-ir-tx: Switch to atomic PWM API
Message-ID: <20211027073204.GA3978@gofer.mess.org>
References: <YXU2i0FtAGDRCMSu@fedora>
 <202110271450.Z8JPybLg-lkp@intel.com>
 <20211027061552.bb4fczniqp6b7amh@pengutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211027061552.bb4fczniqp6b7amh@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed, Oct 27, 2021 at 08:15:52AM +0200, Uwe Kleine-König wrote:
> On Wed, Oct 27, 2021 at 02:07:19PM +0800, kernel test robot wrote:
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> > 
> > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > 
> > >> ERROR: modpost: "__udivdi3" [drivers/media/rc/pwm-ir-tx.ko] undefined!
> 
> This comes from the line:
> 
> 	state.duty_cycle = DIV_ROUND_CLOSEST(pwm_ir->duty_cycle * state.period, 100);
> 
> where DIV_ROUND_CLOSEST expands to a normal division but state.period is
> a u64. So this should use DIV64_U64_ROUND_CLOSEST I guess.

DIV64_U64_ROUND_CLOSEST is for dividing a u64 with a u64. We're dividing
by 100 here so this is not necessary.

It should use DIV_ROUND_CLOSEST_ULL, however it might be nicer to use:

	pwm_set_relative_duty_cycle(&state, pwm_ir->duty_cycle, 100);

Thanks

Sean
