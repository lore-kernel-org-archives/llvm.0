Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D8179C6;
	Fri,  1 Mar 2024 17:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709313023; cv=none; b=jwyk7bbzeU8cVqrFC4m2boM+kEO+Zz/NGOUpMsYyizM6AdpERxKeC7eRU6iiWPSDlMD35rxFA34FQ3S9cV15bSrKVRY/LmuYRCyNvajAYMGmyk81nbMwV2Vb/6sRMVFCcMPHspqMMaoqFVTaiCgYqqODR7Lo/zPmotrwwim0j4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709313023; c=relaxed/simple;
	bh=0PNGivLq9Yya5wQexvzoN5it8gfcAaW7ouWYOTxSZyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfKWnHXOqO5t42W7SM1UHPSOhXoWw4qZDNBmrvl3pJQfHCNhdvcJybc9CE6YxDAETBFaH5mu1kb2Y9VaQspWj848BKogkDbKsHAlz2AAsAa/CwvG5Yv9P7ha/SHa8qU6PRZ9O6tebG6OjivhRn5wfmFfOqEB0G/WpSFaMnanFYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FvER6E8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FvER6E8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4C96C433F1;
	Fri,  1 Mar 2024 17:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709313023;
	bh=0PNGivLq9Yya5wQexvzoN5it8gfcAaW7ouWYOTxSZyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvER6E8mQ5elfqpufWeY4lvcR6bg3dUcE5nvT++ci05kYvNawr3Q/HTHiUmCLfasP
	 BlRHY6wl+/OngGAtvinAcMW+Mn2/PpDxU4J4BCGodnf9lg+mxFEy0nHilQOrw8LsrL
	 +sf2rNjGHsEmwGLGZr6aqXOmsGQGelwM7YtcV7S0Dd3JmRF0fpik7tGSovKlB+XZD9
	 CtnjbBMZnsq4WczWPjqTNNx+yfU+Xxf00jux3u2bXR2BlW+i2yBJoKztbuL/UbYPYb
	 Txaz5YIHgGwEIv9oRA4n6oxP5U/u47FUh/pb1XWTBy6tAcrTQ8ylUTEJq84Mf7L85s
	 JOh7eKCchxHuQ==
Date: Fri, 1 Mar 2024 10:10:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/24] ALSA: hwdep: Use guard() for locking
Message-ID: <20240301171021.GA3762584@dev-arch.thelio-3990X>
References: <20240227085306.9764-1-tiwai@suse.de>
 <20240227085306.9764-6-tiwai@suse.de>
 <20240229210034.GA185642@dev-arch.thelio-3990X>
 <87r0gue7io.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r0gue7io.wl-tiwai@suse.de>

On Fri, Mar 01, 2024 at 08:27:43AM +0100, Takashi Iwai wrote:
> On Thu, 29 Feb 2024 22:00:34 +0100,
> Nathan Chancellor wrote:
> > 
> > Hi Takashi,
> > 
> > On Tue, Feb 27, 2024 at 09:52:47AM +0100, Takashi Iwai wrote:
> > > We can simplify the code gracefully with new guard() macro and co for
> > > automatic cleanup of locks.
> > > 
> > > There are still a few remaining explicit mutex_lock/unlock calls, and
> > > those are for the places where we do temporary unlock/relock, which
> > > doesn't fit well with the guard(), so far.
> > > 
> > > Only the code refactoring, and no functional changes.
> > > 
> > > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > > ---
> > >  sound/core/hwdep.c | 85 +++++++++++++++++++++-------------------------
> > >  1 file changed, 38 insertions(+), 47 deletions(-)
> > > 
> > > diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
> > > index de7476034f2c..9d7e5039c893 100644
> > > --- a/sound/core/hwdep.c
> > > +++ b/sound/core/hwdep.c
> > > @@ -149,12 +149,12 @@ static int snd_hwdep_release(struct inode *inode, struct file * file)
> > >  	struct snd_hwdep *hw = file->private_data;
> > >  	struct module *mod = hw->card->module;
> > >  
> > > -	mutex_lock(&hw->open_mutex);
> > > -	if (hw->ops.release)
> > > -		err = hw->ops.release(hw, file);
> > > -	if (hw->used > 0)
> > > -		hw->used--;
> > > -	mutex_unlock(&hw->open_mutex);
> > > +	scoped_guard(mutex, &hw->open_mutex) {
> > > +		if (hw->ops.release)
> > > +			err = hw->ops.release(hw, file);
> > > +		if (hw->used > 0)
> > > +			hw->used--;
> > > +	}
> > >  	wake_up(&hw->open_wait);
> > >  
> > >  	snd_card_file_remove(hw->card, file);
> > > @@ -272,43 +272,43 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
> > >  
> > >  			if (get_user(device, (int __user *)arg))
> > >  				return -EFAULT;
> > > -			mutex_lock(&register_mutex);
> > >  
> > > -			if (device < 0)
> > > -				device = 0;
> > > -			else if (device < SNDRV_MINOR_HWDEPS)
> > > -				device++;
> > > -			else
> > > -				device = SNDRV_MINOR_HWDEPS;
> > > +			scoped_guard(mutex, &register_mutex) {
> > > +				if (device < 0)
> > > +					device = 0;
> > > +				else if (device < SNDRV_MINOR_HWDEPS)
> > > +					device++;
> > > +				else
> > > +					device = SNDRV_MINOR_HWDEPS;
> > >  
> > > -			while (device < SNDRV_MINOR_HWDEPS) {
> > > -				if (snd_hwdep_search(card, device))
> > > -					break;
> > > -				device++;
> > > +				while (device < SNDRV_MINOR_HWDEPS) {
> > > +					if (snd_hwdep_search(card, device))
> > > +						break;
> > > +					device++;
> > > +				}
> > > +				if (device >= SNDRV_MINOR_HWDEPS)
> > > +					device = -1;
> > > +				if (put_user(device, (int __user *)arg))
> > > +					return -EFAULT;
> > > +				return 0;
> > >  			}
> > > -			if (device >= SNDRV_MINOR_HWDEPS)
> > > -				device = -1;
> > > -			mutex_unlock(&register_mutex);
> > > -			if (put_user(device, (int __user *)arg))
> > > -				return -EFAULT;
> > > -			return 0;
> > > +			break;
> > >  		}
> > 
> > Due to a bug in clang that was resolved in clang-17 [1], clang-13
> > through clang-16 fail to build this file for ARCH=powerpc after this
> > change in -next as commit e6684d08cc19 ("ALSA: hwdep: Use guard() for
> > locking"):
> > 
> >   sound/core/hwdep.c:291:9: error: cannot jump from this asm goto statement to one of its possible targets
> >                                   if (put_user(device, (int __user *)arg))
> >                                       ^
> >   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
> >                     __put_user(x, _pu_addr) : -EFAULT;                    \
> >                     ^
> >   arch/powerpc/include/asm/uaccess.h:48:3: note: expanded from macro '__put_user'
> >                   __put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);      \
> >                   ^
> >   arch/powerpc/include/asm/uaccess.h:116:10: note: expanded from macro '__put_user_size_goto'
> >           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
> >                   ^
> >   arch/powerpc/include/asm/uaccess.h:86:2: note: expanded from macro '__put_user_asm_goto'
> >           asm goto(                                       \
> >           ^
> >   sound/core/hwdep.c:273:8: note: possible target of asm goto statement
> >                           if (get_user(device, (int __user *)arg))
> >                               ^
> >   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
> >                     __get_user(x, _gu_addr) :                             \
> >                     ^
> >   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
> >           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
> >           ^
> >   arch/powerpc/include/asm/uaccess.h:201:16: note: expanded from macro '__get_user_size_allowed'
> >                   break;                                                  \
> >                                                                           ^
> >   sound/core/hwdep.c:276:4: note: jump exits scope of variable with __attribute__((cleanup))
> >                           scoped_guard(mutex, &register_mutex) {
> >                           ^
> >   include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
> >           for (CLASS(_name, scope)(args),                                 \
> >                             ^
> >   sound/core/hwdep.c:273:8: error: cannot jump from this asm goto statement to one of its possible targets
> >                           if (get_user(device, (int __user *)arg))
> >                               ^
> >   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
> >                     __get_user(x, _gu_addr) :                             \
> >                     ^
> >   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
> >           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
> >           ^
> >   arch/powerpc/include/asm/uaccess.h:199:3: note: expanded from macro '__get_user_size_allowed'
> >                   __get_user_size_goto(x, ptr, size, __gus_failed);       \
> >                   ^
> >   arch/powerpc/include/asm/uaccess.h:187:10: note: expanded from macro '__get_user_size_goto'
> >           case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;  \
> >                   ^
> >   arch/powerpc/include/asm/uaccess.h:158:2: note: expanded from macro '__get_user_asm_goto'
> >           asm_goto_output(                                        \
> >           ^
> >   include/linux/compiler_types.h:380:31: note: expanded from macro 'asm_goto_output'
> >   #define asm_goto_output(x...) asm volatile goto(x)
> >                                 ^
> >   sound/core/hwdep.c:291:9: note: possible target of asm goto statement
> >                                   if (put_user(device, (int __user *)arg))
> >                                       ^
> >   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
> >                     __put_user(x, _pu_addr) : -EFAULT;                    \
> >                     ^
> >   arch/powerpc/include/asm/uaccess.h:52:9: note: expanded from macro '__put_user'
> >                                                                   \
> >                                                                   ^
> >   sound/core/hwdep.c:276:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >                           scoped_guard(mutex, &register_mutex) {
> >                           ^
> >   include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
> >           for (CLASS(_name, scope)(args),                                 \
> >                             ^
> >   2 errors generated.
> > 
> > However, looking at the original change, could this be avoided/worked
> > around by just moving the put_user() call out of the scoped_guard()?
> > The put_user() call was not originally under register_mutex, so it seems
> > like this would work? As I understand it, mutex_unlock() will be called
> > once the scope of the guard is left. I am happy to send a formal patch.
> 
> Yes, that was my intention but somehow it slipped :-<
> Could you submit the fix patch?

Sure thing: https://lore.kernel.org/20240301-fix-snd-hwdep-guard-v1-1-6aab033f3f83@kernel.org/

Thanks for the input!

Cheers,
Nathan
