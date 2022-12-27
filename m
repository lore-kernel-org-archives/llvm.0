Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DA63239
	for <llvm@lists.linux.dev>; Tue, 27 Dec 2022 18:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D088C433D2;
	Tue, 27 Dec 2022 18:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672166893;
	bh=jC+G6KggctyJl19lPvX6acqHjopjAKeOdWYT4ODLTZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Lo1YFgc4wMO579CEmwBJteC/WRWHqg6NmNoHdgr2Myntqw6NsJ/QboLSBLlG0/wQl
	 GNxFtfJuBD1zNW0kzFB0gkOFhWDXP7vftCIm8u80vENUIrb/sF3LRupDlqdpM7mH8p
	 Spu9aRXzzs5wSCaFWUx0HinsGxFdV1WgK4abqeTTyC4fyNYrPd6N5EXj06jxX81NYI
	 hl8HBlrrxBvlWkP7lFICUXqtL7HIHU5/Fh8fT8AxhPEir4aAaHqYdTrPahC6IoZctI
	 OOIVJmRn7TjXDhhk9ne82b53glBkRNIvZO4zUJaZWpWsVpawEz/rsxgxxNgnkOxk7w
	 zNVuI+iJztoZw==
Date: Tue, 27 Dec 2022 11:48:10 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>,
	linuxppc-dev@lists.ozlabs.org, Daniel Vetter <daniel@ffwll.ch>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] fbdev: make offb driver tristate
Message-ID: <Y6s96iuc3NRN5tS4@dev-arch.thelio-3990X>
References: <20221126000401.25302-1-rdunlap@infradead.org>
 <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
 <f8c6eb94-10ee-07a8-ea48-d4fae60fc9ae@gmx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8c6eb94-10ee-07a8-ea48-d4fae60fc9ae@gmx.de>

On Sat, Dec 10, 2022 at 05:35:06PM +0100, Helge Deller wrote:
> On 11/26/22 14:40, Thomas Zimmermann wrote:
> > Am 26.11.22 um 01:04 schrieb Randy Dunlap:
> > > Make the offb (Open Firmware frame buffer) driver tristate,
> > > i.e., so that it can be built as a loadable module.
> > > 
> > > However, it still depends on the setting of DRM_OFDRM
> > > so that both of these drivers cannot be builtin at the same time
> > > nor can one be builtin and the other one a loadable module.
> > > 
> > > Build-tested successfully with all combination of DRM_OFDRM and FB_OF.
> > > 
> > > This fixes a build issue that Michal reported when FB_OF=y and
> > > DRM_OFDRM=m:
> > > 
> > > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x58): undefined reference to `cfb_fillrect'
> > > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x60): undefined reference to `cfb_copyarea'
> > > powerpc64-linux-ld: drivers/video/fbdev/offb.o:(.data.rel.ro+0x68): undefined reference to `cfb_imageblit'
> > > 
> > > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Michal Suchánek <msuchanek@suse.de>
> > > Cc: linuxppc-dev@lists.ozlabs.org
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Cc: Helge Deller <deller@gmx.de>
> > > Cc: linux-fbdev@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > 
> > Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> applied.

Is this going to make it to Linus soon? We are now seeing this error in
our CI, which has the configuration describe in this commit.

https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/3785609002/jobs/6437398666#step:5:149

https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integration2/builds/2JUMSmjAoSJoKfl6PPjfU66JGit/build.log

Cheers,
Nathan

> > > ---
> > >   drivers/video/fbdev/Kconfig |    4 ++--
> > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff -- a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
> > > --- a/drivers/video/fbdev/Kconfig
> > > +++ b/drivers/video/fbdev/Kconfig
> > > @@ -456,8 +456,8 @@ config FB_ATARI
> > >         chipset found in Ataris.
> > >   config FB_OF
> > > -    bool "Open Firmware frame buffer device support"
> > > -    depends on (FB = y) && PPC && (!PPC_PSERIES || PCI)
> > > +    tristate "Open Firmware frame buffer device support"
> > > +    depends on FB && PPC && (!PPC_PSERIES || PCI)
> > >       depends on !DRM_OFDRM
> > >       select APERTURE_HELPERS
> > >       select FB_CFB_FILLRECT
> > 
> 
> 
