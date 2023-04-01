Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF433C10
	for <llvm@lists.linux.dev>; Sat,  1 Apr 2023 14:05:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F240DC433D2;
	Sat,  1 Apr 2023 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680357920;
	bh=MZ44pijlcbwqZoRd2llf2veubGkW4dMJTr6PLEgL0wY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NqM4nLnKP4gbENhoIgQOGTWfbGeuJSxqlEjtpt7lpmSEqlMKKgrjtINPe1r6mCT5/
	 ZvGhgAcG3krRSPgvEUVYLd2N+XtN0aBY9KqK8vUl421b3aAzPhJIzTDAIkusRLuEoJ
	 dJhERA/0ioZOQki2R8Mvo72rZYIFvPda8jiCGUsAuQZubGPk5zjjf4x4ZAIXBeidm8
	 pxzAFfaVujODZLDbK1glMw0aY2DFfnMWwul3aR/NHwixyNw54mVRgZf9LpLw4Xz2xI
	 nIt6ZLp0c2QWkXU7hTv5UqaymlXLvz8T2QMVp+nFSjSydhPl3qYr/8MqiemhR2Z7NF
	 EIZ6uLm/mQDSg==
Date: Sat, 1 Apr 2023 15:20:28 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tom Rix <trix@redhat.com>, lars@metafoo.de, nathan@kernel.org,
 ndesaulniers@google.com, u.kleine-koenig@pengutronix.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, Chuhong Yuan <hslester96@gmail.com>, Brian Masney
 <bmasney@redhat.com>, Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] iio: tsl2772: remove unused prox_diode_mask variable
Message-ID: <20230401152028.30344b48@jic23-huawei>
In-Reply-To: <ZCGVJOSBjKO3FKD6@smile.fi.intel.com>
References: <20230327120823.1369700-1-trix@redhat.com>
	<ZCGVJOSBjKO3FKD6@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Mar 2023 16:07:48 +0300
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Mar 27, 2023 at 08:08:23AM -0400, Tom Rix wrote:
> > clang with W=1 reports
> > drivers/iio/light/tsl2772.c:576:24: error: variable
> >   'prox_diode_mask' set but not used [-Werror,-Wunused-but-set-variable]
> >         int i, ret, num_leds, prox_diode_mask;
> >                               ^
> > This variable is not used so remove it.  
> 
> While from the compilation point of view this is a correct fix, I think
> we need to hear from the author (or interested stakeholders) about this
> feature. Perhaps it should be enabled / fixed differently.
> 

Superficially it looks like this value should have been stored to
chip->settings.prox_diode

+CC people who might know...

Jonathan
