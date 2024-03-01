Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FDF69952
	for <llvm@lists.linux.dev>; Fri,  1 Mar 2024 07:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709278069; cv=none; b=WWPSOFn3ay/MVhqDwO+pF9zJWY2kYi2VdHPqkAhEopUTZ/a/GQ6kI31STFdegHQpp9iohQKfwGRBFv1V98uxkDNMg1+CBZSLVEMTpbWi8aGnrOgMLevnREp2K43mrNLDPjGdpbSbA5kj2q6idRV6Z390Cn6FBCq4+MK8I3t+pBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709278069; c=relaxed/simple;
	bh=W7zdHagKA1+i9adc3ZyTbvx1mZq7byD5lmrZZP0ty/8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oSdu4KvaPkk7jJJGVLwpQ4dITT5WiTQS2wpxy/Wv+KzLlYgCctCB8Bdi3qJAz1yAPssSPHwt6MyC5ZT5ouJqKizKktQfBTfoYkDOEDYNFooENLpxNKoCfKSGMHVZr/cVu9TCSV03Iqw1voUA+Mg5wE2ZDxTG714keZ0E5PU1osc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EVlPm6Rl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pX9JChBN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EVlPm6Rl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=pX9JChBN; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EVlPm6Rl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pX9JChBN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EVlPm6Rl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="pX9JChBN"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7A40F1FD8B;
	Fri,  1 Mar 2024 07:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709278064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WxBbLT+qG5USSgqCUTkVEpQrSPsuJuAFWx1nommK8I=;
	b=EVlPm6RlMaxwiDGBPnIf7yBppipZrYMoJqDbyIwNkTYT9Ii/11OYZVjnIS4iNKzHpk+wV5
	fbR4HhICxyitjjIi7kby56HZVciASDegBH82I/5O7XCbY0HZLjzaiKVUXZ4vMrtpQvJHSe
	a6T/kyE9OsRI85lLiLhcinGKx32nRLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709278064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WxBbLT+qG5USSgqCUTkVEpQrSPsuJuAFWx1nommK8I=;
	b=pX9JChBNdeTXxb1T4lme3E6RndQeorEW3EDGGQojp33UU4CsTC2ESu7z3ByKDgSQr/Zjkb
	V0OLl3UQHajGqlBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709278064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WxBbLT+qG5USSgqCUTkVEpQrSPsuJuAFWx1nommK8I=;
	b=EVlPm6RlMaxwiDGBPnIf7yBppipZrYMoJqDbyIwNkTYT9Ii/11OYZVjnIS4iNKzHpk+wV5
	fbR4HhICxyitjjIi7kby56HZVciASDegBH82I/5O7XCbY0HZLjzaiKVUXZ4vMrtpQvJHSe
	a6T/kyE9OsRI85lLiLhcinGKx32nRLg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709278064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/WxBbLT+qG5USSgqCUTkVEpQrSPsuJuAFWx1nommK8I=;
	b=pX9JChBNdeTXxb1T4lme3E6RndQeorEW3EDGGQojp33UU4CsTC2ESu7z3ByKDgSQr/Zjkb
	V0OLl3UQHajGqlBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3C57613ABF;
	Fri,  1 Mar 2024 07:27:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n6IAC3CD4WWqfwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 01 Mar 2024 07:27:44 +0000
Date: Fri, 01 Mar 2024 08:27:43 +0100
Message-ID: <87r0gue7io.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/24] ALSA: hwdep: Use guard() for locking
In-Reply-To: <20240229210034.GA185642@dev-arch.thelio-3990X>
References: <20240227085306.9764-1-tiwai@suse.de>
	<20240227085306.9764-6-tiwai@suse.de>
	<20240229210034.GA185642@dev-arch.thelio-3990X>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.998];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

On Thu, 29 Feb 2024 22:00:34 +0100,
Nathan Chancellor wrote:
> 
> Hi Takashi,
> 
> On Tue, Feb 27, 2024 at 09:52:47AM +0100, Takashi Iwai wrote:
> > We can simplify the code gracefully with new guard() macro and co for
> > automatic cleanup of locks.
> > 
> > There are still a few remaining explicit mutex_lock/unlock calls, and
> > those are for the places where we do temporary unlock/relock, which
> > doesn't fit well with the guard(), so far.
> > 
> > Only the code refactoring, and no functional changes.
> > 
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
> > ---
> >  sound/core/hwdep.c | 85 +++++++++++++++++++++-------------------------
> >  1 file changed, 38 insertions(+), 47 deletions(-)
> > 
> > diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
> > index de7476034f2c..9d7e5039c893 100644
> > --- a/sound/core/hwdep.c
> > +++ b/sound/core/hwdep.c
> > @@ -149,12 +149,12 @@ static int snd_hwdep_release(struct inode *inode, struct file * file)
> >  	struct snd_hwdep *hw = file->private_data;
> >  	struct module *mod = hw->card->module;
> >  
> > -	mutex_lock(&hw->open_mutex);
> > -	if (hw->ops.release)
> > -		err = hw->ops.release(hw, file);
> > -	if (hw->used > 0)
> > -		hw->used--;
> > -	mutex_unlock(&hw->open_mutex);
> > +	scoped_guard(mutex, &hw->open_mutex) {
> > +		if (hw->ops.release)
> > +			err = hw->ops.release(hw, file);
> > +		if (hw->used > 0)
> > +			hw->used--;
> > +	}
> >  	wake_up(&hw->open_wait);
> >  
> >  	snd_card_file_remove(hw->card, file);
> > @@ -272,43 +272,43 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
> >  
> >  			if (get_user(device, (int __user *)arg))
> >  				return -EFAULT;
> > -			mutex_lock(&register_mutex);
> >  
> > -			if (device < 0)
> > -				device = 0;
> > -			else if (device < SNDRV_MINOR_HWDEPS)
> > -				device++;
> > -			else
> > -				device = SNDRV_MINOR_HWDEPS;
> > +			scoped_guard(mutex, &register_mutex) {
> > +				if (device < 0)
> > +					device = 0;
> > +				else if (device < SNDRV_MINOR_HWDEPS)
> > +					device++;
> > +				else
> > +					device = SNDRV_MINOR_HWDEPS;
> >  
> > -			while (device < SNDRV_MINOR_HWDEPS) {
> > -				if (snd_hwdep_search(card, device))
> > -					break;
> > -				device++;
> > +				while (device < SNDRV_MINOR_HWDEPS) {
> > +					if (snd_hwdep_search(card, device))
> > +						break;
> > +					device++;
> > +				}
> > +				if (device >= SNDRV_MINOR_HWDEPS)
> > +					device = -1;
> > +				if (put_user(device, (int __user *)arg))
> > +					return -EFAULT;
> > +				return 0;
> >  			}
> > -			if (device >= SNDRV_MINOR_HWDEPS)
> > -				device = -1;
> > -			mutex_unlock(&register_mutex);
> > -			if (put_user(device, (int __user *)arg))
> > -				return -EFAULT;
> > -			return 0;
> > +			break;
> >  		}
> 
> Due to a bug in clang that was resolved in clang-17 [1], clang-13
> through clang-16 fail to build this file for ARCH=powerpc after this
> change in -next as commit e6684d08cc19 ("ALSA: hwdep: Use guard() for
> locking"):
> 
>   sound/core/hwdep.c:291:9: error: cannot jump from this asm goto statement to one of its possible targets
>                                   if (put_user(device, (int __user *)arg))
>                                       ^
>   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
>                     __put_user(x, _pu_addr) : -EFAULT;                    \
>                     ^
>   arch/powerpc/include/asm/uaccess.h:48:3: note: expanded from macro '__put_user'
>                   __put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);      \
>                   ^
>   arch/powerpc/include/asm/uaccess.h:116:10: note: expanded from macro '__put_user_size_goto'
>           case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
>                   ^
>   arch/powerpc/include/asm/uaccess.h:86:2: note: expanded from macro '__put_user_asm_goto'
>           asm goto(                                       \
>           ^
>   sound/core/hwdep.c:273:8: note: possible target of asm goto statement
>                           if (get_user(device, (int __user *)arg))
>                               ^
>   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
>                     __get_user(x, _gu_addr) :                             \
>                     ^
>   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
>           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
>           ^
>   arch/powerpc/include/asm/uaccess.h:201:16: note: expanded from macro '__get_user_size_allowed'
>                   break;                                                  \
>                                                                           ^
>   sound/core/hwdep.c:276:4: note: jump exits scope of variable with __attribute__((cleanup))
>                           scoped_guard(mutex, &register_mutex) {
>                           ^
>   include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
>           for (CLASS(_name, scope)(args),                                 \
>                             ^
>   sound/core/hwdep.c:273:8: error: cannot jump from this asm goto statement to one of its possible targets
>                           if (get_user(device, (int __user *)arg))
>                               ^
>   arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
>                     __get_user(x, _gu_addr) :                             \
>                     ^
>   arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
>           __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
>           ^
>   arch/powerpc/include/asm/uaccess.h:199:3: note: expanded from macro '__get_user_size_allowed'
>                   __get_user_size_goto(x, ptr, size, __gus_failed);       \
>                   ^
>   arch/powerpc/include/asm/uaccess.h:187:10: note: expanded from macro '__get_user_size_goto'
>           case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;  \
>                   ^
>   arch/powerpc/include/asm/uaccess.h:158:2: note: expanded from macro '__get_user_asm_goto'
>           asm_goto_output(                                        \
>           ^
>   include/linux/compiler_types.h:380:31: note: expanded from macro 'asm_goto_output'
>   #define asm_goto_output(x...) asm volatile goto(x)
>                                 ^
>   sound/core/hwdep.c:291:9: note: possible target of asm goto statement
>                                   if (put_user(device, (int __user *)arg))
>                                       ^
>   arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
>                     __put_user(x, _pu_addr) : -EFAULT;                    \
>                     ^
>   arch/powerpc/include/asm/uaccess.h:52:9: note: expanded from macro '__put_user'
>                                                                   \
>                                                                   ^
>   sound/core/hwdep.c:276:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
>                           scoped_guard(mutex, &register_mutex) {
>                           ^
>   include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
>           for (CLASS(_name, scope)(args),                                 \
>                             ^
>   2 errors generated.
> 
> However, looking at the original change, could this be avoided/worked
> around by just moving the put_user() call out of the scoped_guard()?
> The put_user() call was not originally under register_mutex, so it seems
> like this would work? As I understand it, mutex_unlock() will be called
> once the scope of the guard is left. I am happy to send a formal patch.

Yes, that was my intention but somehow it slipped :-<
Could you submit the fix patch?


Thanks!

Takashi
