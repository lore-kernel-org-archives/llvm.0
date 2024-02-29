Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901D1504D2;
	Thu, 29 Feb 2024 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240436; cv=none; b=KsOjV3Z1sK1CNVmmYtLbqLE56jvws4C/BDQuwH/K6XSYaa5a01YTyjk5T6pwk0+175PVS9m6TgRrtswBcL8I0qlwpxQifmf7XYKC43NiVKMmtXOyJwrYBn5s43R2mDx3qWYchNH+7EjRCOTUkpMX46NogIndYJT1nHfyGcZGslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240436; c=relaxed/simple;
	bh=1PFlaG0ecz4A0TRgIF7F08DP139nGBd6n5zmGJQVjVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFhc5+ZTqXJx93fG0YdmqR+k/YLI8bdye1o7ghwUeI1EXgjioZnFbJCmFa/D0V8fv4y65gYwJWUiJ1sOe1j432a7+7kM2eYrwA1yRTBSq0QtT1iPfxP2W1od1CBJ+Vl2ATTpp1oNQJPhyUsqf6XO0ah3llM7nDIKeDRQKsaI6aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p1wrJk3E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p1wrJk3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30E74C433C7;
	Thu, 29 Feb 2024 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709240436;
	bh=1PFlaG0ecz4A0TRgIF7F08DP139nGBd6n5zmGJQVjVM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p1wrJk3E0khFbxj8mmCW8AfReYQ3wrywIMSTfSVxWRjT+bCDq+plJzDBikxSEjt2/
	 icsX7gTHw6EGyQ+HDbH1mXVmb77QB3PK8I5Xitn2VBkmYaF3Lnuh9MQlPm2BcH0UkC
	 1PbSvKjpdDLvI6owmZfvlOwtUabm90xFCw+SiFsbdI/yyakz+na151M9bmILxQ4up/
	 JfiLEWQlPTilDTUnunzKrVavsi8XEW5OitOpkHX7hG5PZloc4lgSS3mitfL55Yd63Q
	 ePk9hQIfqAiu1GLKsBjACZJ43E1uhafeQ1rH57FdbdnJl4WY4+4O3ute6zXNRWq2KP
	 zTDfDTYKASkWg==
Date: Thu, 29 Feb 2024 14:00:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/24] ALSA: hwdep: Use guard() for locking
Message-ID: <20240229210034.GA185642@dev-arch.thelio-3990X>
References: <20240227085306.9764-1-tiwai@suse.de>
 <20240227085306.9764-6-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227085306.9764-6-tiwai@suse.de>

Hi Takashi,

On Tue, Feb 27, 2024 at 09:52:47AM +0100, Takashi Iwai wrote:
> We can simplify the code gracefully with new guard() macro and co for
> automatic cleanup of locks.
> 
> There are still a few remaining explicit mutex_lock/unlock calls, and
> those are for the places where we do temporary unlock/relock, which
> doesn't fit well with the guard(), so far.
> 
> Only the code refactoring, and no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/hwdep.c | 85 +++++++++++++++++++++-------------------------
>  1 file changed, 38 insertions(+), 47 deletions(-)
> 
> diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
> index de7476034f2c..9d7e5039c893 100644
> --- a/sound/core/hwdep.c
> +++ b/sound/core/hwdep.c
> @@ -149,12 +149,12 @@ static int snd_hwdep_release(struct inode *inode, struct file * file)
>  	struct snd_hwdep *hw = file->private_data;
>  	struct module *mod = hw->card->module;
>  
> -	mutex_lock(&hw->open_mutex);
> -	if (hw->ops.release)
> -		err = hw->ops.release(hw, file);
> -	if (hw->used > 0)
> -		hw->used--;
> -	mutex_unlock(&hw->open_mutex);
> +	scoped_guard(mutex, &hw->open_mutex) {
> +		if (hw->ops.release)
> +			err = hw->ops.release(hw, file);
> +		if (hw->used > 0)
> +			hw->used--;
> +	}
>  	wake_up(&hw->open_wait);
>  
>  	snd_card_file_remove(hw->card, file);
> @@ -272,43 +272,43 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
>  
>  			if (get_user(device, (int __user *)arg))
>  				return -EFAULT;
> -			mutex_lock(&register_mutex);
>  
> -			if (device < 0)
> -				device = 0;
> -			else if (device < SNDRV_MINOR_HWDEPS)
> -				device++;
> -			else
> -				device = SNDRV_MINOR_HWDEPS;
> +			scoped_guard(mutex, &register_mutex) {
> +				if (device < 0)
> +					device = 0;
> +				else if (device < SNDRV_MINOR_HWDEPS)
> +					device++;
> +				else
> +					device = SNDRV_MINOR_HWDEPS;
>  
> -			while (device < SNDRV_MINOR_HWDEPS) {
> -				if (snd_hwdep_search(card, device))
> -					break;
> -				device++;
> +				while (device < SNDRV_MINOR_HWDEPS) {
> +					if (snd_hwdep_search(card, device))
> +						break;
> +					device++;
> +				}
> +				if (device >= SNDRV_MINOR_HWDEPS)
> +					device = -1;
> +				if (put_user(device, (int __user *)arg))
> +					return -EFAULT;
> +				return 0;
>  			}
> -			if (device >= SNDRV_MINOR_HWDEPS)
> -				device = -1;
> -			mutex_unlock(&register_mutex);
> -			if (put_user(device, (int __user *)arg))
> -				return -EFAULT;
> -			return 0;
> +			break;
>  		}

Due to a bug in clang that was resolved in clang-17 [1], clang-13
through clang-16 fail to build this file for ARCH=powerpc after this
change in -next as commit e6684d08cc19 ("ALSA: hwdep: Use guard() for
locking"):

  sound/core/hwdep.c:291:9: error: cannot jump from this asm goto statement to one of its possible targets
                                  if (put_user(device, (int __user *)arg))
                                      ^
  arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                    __put_user(x, _pu_addr) : -EFAULT;                    \
                    ^
  arch/powerpc/include/asm/uaccess.h:48:3: note: expanded from macro '__put_user'
                  __put_user_size_goto(__pu_val, __pu_addr, __pu_size, __pu_failed);      \
                  ^
  arch/powerpc/include/asm/uaccess.h:116:10: note: expanded from macro '__put_user_size_goto'
          case 1: __put_user_asm_goto(x, __pus_addr, label, "stb"); break;        \
                  ^
  arch/powerpc/include/asm/uaccess.h:86:2: note: expanded from macro '__put_user_asm_goto'
          asm goto(                                       \
          ^
  sound/core/hwdep.c:273:8: note: possible target of asm goto statement
                          if (get_user(device, (int __user *)arg))
                              ^
  arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
                    __get_user(x, _gu_addr) :                             \
                    ^
  arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
          __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
          ^
  arch/powerpc/include/asm/uaccess.h:201:16: note: expanded from macro '__get_user_size_allowed'
                  break;                                                  \
                                                                          ^
  sound/core/hwdep.c:276:4: note: jump exits scope of variable with __attribute__((cleanup))
                          scoped_guard(mutex, &register_mutex) {
                          ^
  include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
          for (CLASS(_name, scope)(args),                                 \
                            ^
  sound/core/hwdep.c:273:8: error: cannot jump from this asm goto statement to one of its possible targets
                          if (get_user(device, (int __user *)arg))
                              ^
  arch/powerpc/include/asm/uaccess.h:295:5: note: expanded from macro 'get_user'
                    __get_user(x, _gu_addr) :                             \
                    ^
  arch/powerpc/include/asm/uaccess.h:283:2: note: expanded from macro '__get_user'
          __get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err);      \
          ^
  arch/powerpc/include/asm/uaccess.h:199:3: note: expanded from macro '__get_user_size_allowed'
                  __get_user_size_goto(x, ptr, size, __gus_failed);       \
                  ^
  arch/powerpc/include/asm/uaccess.h:187:10: note: expanded from macro '__get_user_size_goto'
          case 1: __get_user_asm_goto(x, (u8 __user *)ptr, label, "lbz"); break;  \
                  ^
  arch/powerpc/include/asm/uaccess.h:158:2: note: expanded from macro '__get_user_asm_goto'
          asm_goto_output(                                        \
          ^
  include/linux/compiler_types.h:380:31: note: expanded from macro 'asm_goto_output'
  #define asm_goto_output(x...) asm volatile goto(x)
                                ^
  sound/core/hwdep.c:291:9: note: possible target of asm goto statement
                                  if (put_user(device, (int __user *)arg))
                                      ^
  arch/powerpc/include/asm/uaccess.h:66:5: note: expanded from macro 'put_user'
                    __put_user(x, _pu_addr) : -EFAULT;                    \
                    ^
  arch/powerpc/include/asm/uaccess.h:52:9: note: expanded from macro '__put_user'
                                                                  \
                                                                  ^
  sound/core/hwdep.c:276:4: note: jump bypasses initialization of variable with __attribute__((cleanup))
                          scoped_guard(mutex, &register_mutex) {
                          ^
  include/linux/cleanup.h:169:20: note: expanded from macro 'scoped_guard'
          for (CLASS(_name, scope)(args),                                 \
                            ^
  2 errors generated.

However, looking at the original change, could this be avoided/worked
around by just moving the put_user() call out of the scoped_guard()?
The put_user() call was not originally under register_mutex, so it seems
like this would work? As I understand it, mutex_unlock() will be called
once the scope of the guard is left. I am happy to send a formal patch.

[1]: https://github.com/ClangBuiltLinux/linux/issues/1886

diff --git a/sound/core/hwdep.c b/sound/core/hwdep.c
index 9d7e5039c893..09200df2932c 100644
--- a/sound/core/hwdep.c
+++ b/sound/core/hwdep.c
@@ -288,11 +288,10 @@ static int snd_hwdep_control_ioctl(struct snd_card *card,
 				}
 				if (device >= SNDRV_MINOR_HWDEPS)
 					device = -1;
-				if (put_user(device, (int __user *)arg))
-					return -EFAULT;
-				return 0;
 			}
-			break;
+			if (put_user(device, (int __user *)arg))
+				return -EFAULT;
+			return 0;
 		}
 	case SNDRV_CTL_IOCTL_HWDEP_INFO:
 		{
