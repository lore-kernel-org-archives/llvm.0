Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3815120F8;
	Sun, 26 Mar 2023 12:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365A6C433EF;
	Sun, 26 Mar 2023 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679835313;
	bh=0b6LuPA20/cTjat7T/vMrk9FzqwkJo2HORoQjjdpRwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T1ggRYYBga+fmXn67xo0uUzWBMVk2L3qfzmpZEGvDGoizT2JPMrnGAEAl/uFJOyic
	 8TlWjLsruuh9s4b/tXQTfhTodm9XLeSPW/2MNfFtK0CGViQyw8FsEvQzuFCgWL/OvT
	 1sMxt/jkR97/7NgHUrTTtZkRv1NoCl4ntWGC/HiA=
Date: Sun, 26 Mar 2023 14:55:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nam Cao <namcaov@gmail.com>
Cc: Tom Rix <trix@redhat.com>, nathan@kernel.org, ndesaulniers@google.com,
	artur.bujdoso@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unused pHalData variable
Message-ID: <ZCBArurFCc7Pae+T@kroah.com>
References: <20230326122321.1352337-1-trix@redhat.com>
 <ZCA+vIjUFHZFUFPC@nam-dell>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCA+vIjUFHZFUFPC@nam-dell>

On Sun, Mar 26, 2023 at 02:46:52PM +0200, Nam Cao wrote:
> On Sun, Mar 26, 2023 at 08:23:21AM -0400, Tom Rix wrote:
> > clang with W=1 reports
> > drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:23: error: variable
> >   'pHalData' set but not used [-Werror,-Wunused-but-set-variable]
> >         struct hal_com_data *pHalData;
> >                              ^
> > This variable is not used so remove it.
> > 
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/staging/rtl8723bs/hal/hal_btcoex.c | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> > index e36f8c369a04..0cb2adcc1f78 100644
> > --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> > +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> > @@ -1179,10 +1179,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
> >  
> >  void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
> >  {
> > -	struct hal_com_data *pHalData;
> > -
> > -
> > -	pHalData = GET_HAL_DATA(padapter);
> >  }
> 
> If this function doesn't do anything, does it not make more sense to
> just remove this function entirely?

This function is already removed in linux-next, so it doesn't matter :)

thanks,

greg k-h
