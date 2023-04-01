Received: from onstation.org (onstation.org [52.200.56.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60958F4E
	for <llvm@lists.linux.dev>; Sat,  1 Apr 2023 20:29:10 +0000 (UTC)
Received: from localhost (c-73-214-169-22.hsd1.pa.comcast.net [73.214.169.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by onstation.org (Postfix) with ESMTPSA id 91AC24212BC;
	Sat,  1 Apr 2023 16:23:32 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 onstation.org 91AC24212BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onstation.org;
	s=default; t=1680380612;
	bh=8kDgeSe0XAJ1hw6nbgK0BQxOJVCl6IRIynQ8IhHYmk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HY5QSjvV487ajsKs1J3BFL5ZbLCSj/sg13x0hj1iBLJmFNWcCTucWpxDsojXfDCsH
	 fPWKAsSTiY2bPfI9JHKklN+uv8hgD8jBa8OjCzzbyIZcSO0zrfOtDbQlAE9NmQfpPa
	 ixg5wf5aS3cfwVpTOp/Gkfs6AuUCmsMcrIhduZoo=
Date: Sat, 1 Apr 2023 16:23:32 -0400
From: Brian Masney <masneyb@onstation.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Tom Rix <trix@redhat.com>, lars@metafoo.de, nathan@kernel.org,
	ndesaulniers@google.com, u.kleine-koenig@pengutronix.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Chuhong Yuan <hslester96@gmail.com>,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH] iio: tsl2772: remove unused prox_diode_mask variable
Message-ID: <ZCiSxK5JgY6g+0X+@onstation.org>
References: <20230327120823.1369700-1-trix@redhat.com>
 <ZCGVJOSBjKO3FKD6@smile.fi.intel.com>
 <20230401152028.30344b48@jic23-huawei>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230401152028.30344b48@jic23-huawei>

On Sat, Apr 01, 2023 at 03:20:28PM +0100, Jonathan Cameron wrote:
> On Mon, 27 Mar 2023 16:07:48 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > On Mon, Mar 27, 2023 at 08:08:23AM -0400, Tom Rix wrote:
> > > clang with W=1 reports
> > > drivers/iio/light/tsl2772.c:576:24: error: variable
> > >   'prox_diode_mask' set but not used [-Werror,-Wunused-but-set-variable]
> > >         int i, ret, num_leds, prox_diode_mask;
> > >                               ^
> > > This variable is not used so remove it.  
> > 
> > While from the compilation point of view this is a correct fix, I think
> > we need to hear from the author (or interested stakeholders) about this
> > feature. Perhaps it should be enabled / fixed differently.
> > 
> 
> Superficially it looks like this value should have been stored to
> chip->settings.prox_diode
> 
> +CC people who might know...

Jonathan is correct about the proper fix and is this is my mistake. We
should just need to add this to the bottom of that function:

   chip->settings.prox_diode = prox_diode_mask;

Tom: I can fix this up next week, unless I hear from you otherwise that
you'll do it.

Brian
