Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5A120F8;
	Sun, 26 Mar 2023 13:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA032C433D2;
	Sun, 26 Mar 2023 13:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679836817;
	bh=DCQOATmQzGlfzrAUPN5To5/sRencn+ujNeV4RPDtAhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phANgEHH2kJz0I0Oe8aMuD8w0DTDBgbn31+krj3VEfj+obWiF4VMXuS8LN4fdHaz1
	 d2TbE9vR1zTX2SF0UWh8a681jalSCXPfojgdz6W/Kx3cmlZKJiuZNWdP6340Gp7NVP
	 ReYSLIlSN1UO1BoInk6ycAq5jw2W/Mw/y4oscBsA=
Date: Sun, 26 Mar 2023 15:20:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tom Rix <trix@redhat.com>
Cc: Nam Cao <namcaov@gmail.com>, nathan@kernel.org, ndesaulniers@google.com,
	artur.bujdoso@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: remove unused pHalData variable
Message-ID: <ZCBGjp7bJBWWztOG@kroah.com>
References: <20230326122321.1352337-1-trix@redhat.com>
 <ZCA+vIjUFHZFUFPC@nam-dell>
 <ZCBArurFCc7Pae+T@kroah.com>
 <8a2746a0-57e0-621b-7db9-2719554d050b@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a2746a0-57e0-621b-7db9-2719554d050b@redhat.com>

On Sun, Mar 26, 2023 at 06:13:16AM -0700, Tom Rix wrote:
> 
> On 3/26/23 5:55 AM, Greg KH wrote:
> > On Sun, Mar 26, 2023 at 02:46:52PM +0200, Nam Cao wrote:
> > > On Sun, Mar 26, 2023 at 08:23:21AM -0400, Tom Rix wrote:
> > > > clang with W=1 reports
> > > > drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:23: error: variable
> > > >    'pHalData' set but not used [-Werror,-Wunused-but-set-variable]
> > > >          struct hal_com_data *pHalData;
> > > >                               ^
> > > > This variable is not used so remove it.
> > > > 
> > > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > > ---
> > > >   drivers/staging/rtl8723bs/hal/hal_btcoex.c | 4 ----
> > > >   1 file changed, 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> > > > index e36f8c369a04..0cb2adcc1f78 100644
> > > > --- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> > > > +++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
> > > > @@ -1179,10 +1179,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
> > > >   void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
> > > >   {
> > > > -	struct hal_com_data *pHalData;
> > > > -
> > > > -
> > > > -	pHalData = GET_HAL_DATA(padapter);
> > > >   }
> > > If this function doesn't do anything, does it not make more sense to
> > > just remove this function entirely?
> > This function is already removed in linux-next, so it doesn't matter :)
> 
> My patch is against linux-next from tag next-20230324

Ah, ok, well it will be gone in the next one, as this is already gone in
my tree.

thanks,

greg k-h
