Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58772F2E
	for <llvm@lists.linux.dev>; Wed, 17 Aug 2022 15:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32CACC433C1;
	Wed, 17 Aug 2022 15:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660751153;
	bh=prGIqLTjJea4Mm1/Op+Xn1poe2U0hwQIrV+hVaACtXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NVm6zsWeYPt6buQTKUQM0HzWxyugtBwuEiwezWaOvx8/e6h13ThJfHVHCFRue+dtS
	 cbFBlBtg8vuUA1LRaLrC96lnvCEdPMmpu62H9oAn7NfoV4V5ArDtLVXVzONGk6uOaI
	 MZgzD2ovQMT4sEx3JS4ZCG9LGVddZHYKYlxs8h5kLs5fMK7c9y8Q5J6x3i9qwg6nU7
	 WcsSiLwVcpnV/EH4U7GBv7U1E/rmN8clnzHgYrBIDVuNw1eEbopKWd7T03ALlyP3xI
	 HTPuxc6CHbQd1PMNnlvMqi2RwcpB0Znbt4L5xTmqOMiw2BeuFWuPpYfDL/sjvTSP8X
	 RjfhevUz6LFPw==
Date: Wed, 17 Aug 2022 08:45:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matt Flax <flatmax@flatmax.com>
Cc: kernel test robot <lkp@intel.com>, alsa-devel@alsa-project.org,
	llvm@lists.linux.dev, kbuild-all@lists.01.org, broonie@kernel.org
Subject: Re: [PATCH v2] ASoC: codecs: add uspport for the TI SRC4392 codec
Message-ID: <Yv0NLxzwqdBaZ3Jf@dev-arch.thelio-3990X>
References: <20220808214028.2502801-1-flatmax@flatmax.com>
 <202208090909.Pg0BZGie-lkp@intel.com>
 <YvvbKry5FVFbNdcI@dev-arch.thelio-3990X>
 <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8439531-897a-c25a-688b-be01290b006d@flatmax.com>

On Wed, Aug 17, 2022 at 03:44:33PM +1000, Matt Flax wrote:
> 
> On 17/8/22 04:00, Nathan Chancellor wrote:
> 
> > >     265			/* set the PLL for the digital receiver */
> > >     266			switch (src4xxx->mclk_hz) {
> > >     267			case 24576000:
> > >     268				pj = 0x22;
> > >     269				jd = 0x00;
> > >     270				d = 0x00;
> > >     271				break;
> > >     272			case 22579200:
> > >     273				pj = 0x22;
> > >     274				jd = 0x1b;
> > >     275				d = 0xa3;
> > >     276				break;
> > >   > 277			default:
> > >     278				/* don't error out here,
> > >     279				 * other parts of the chip are still functional
> > >     280				 */
> > >     281				dev_info(component->dev,
> > >     282					"Couldn't set the RCV PLL as this master clock rate is unknown\n");
> > In the final commit, there is a 'break' here. Should it be a 'return 0'
> > instead? Or should there be a different fix for these warnings?
> 
> The data sheet for the src4392 doesn't list defaults for these registers
> (loaded with pj, jd and d). The actual state of these registers is not known
> until we load them with something, arbitrary or not.
> 
> 	{  SRC4XXX_RCV_PLL_0F,		0x00  },  /* not spec. in the datasheet */
> 	{  SRC4XXX_RCV_PLL_10,		0xff  },  /* not spec. in the datasheet */
> 	{  SRC4XXX_RCV_PLL_11,		0xff  },  /* not spec. in the datasheet */
> 
> The state of DIR PLL registers aren't important if the user doesn't specify
> a known mclk frequency.  The implication is that the DIR will not function,
> however that is already implied by the user lacking to specify a known mclk
> frequency.
> 
> The other functions on the chip (port A/B I2S, SRC, DIT, etc) will behave as
> per usual, only the DIR will be dysfunctional.

So I suppose there is little point to all of the calls to regmap_write()
and regmap_update_bits() in the default case then, meaning a 'return 0'
would be appropriate? Sorry, I am having a hard time parsing what should
be done about the warnings, which are fatal for allmodconfig due to
CONFIG_WERROR.

Cheers,
Nathan

> > >     283			}
> > >     284			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_0F, pj);
> > >     285			if (ret < 0)
> > >     286				dev_err(component->dev,
> > >     287					"Failed to update PLL register 0x%x\n",
> > >     288					SRC4XXX_RCV_PLL_0F);
> > >   > 289			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_10, jd);
> > >     290			if (ret < 0)
> > >     291				dev_err(component->dev,
> > >     292					"Failed to update PLL register 0x%x\n",
> > >     293					SRC4XXX_RCV_PLL_10);
> > >   > 294			ret = regmap_write(src4xxx->regmap, SRC4XXX_RCV_PLL_11, d);
> > >     295			if (ret < 0)
> > >     296				dev_err(component->dev,
> > >     297					"Failed to update PLL register 0x%x\n",
> > >     298					SRC4XXX_RCV_PLL_11);
> > Cheers,
> > Nathan
