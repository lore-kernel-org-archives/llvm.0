Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B5B18AFE
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 15:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8B7DC433C8;
	Mon, 31 Jul 2023 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690817481;
	bh=fV5y4+iW+dG0MR3l0sCnIUpZJWAO2cuZQNow3dJK7UE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUP49ogqd+NXeBDl9Zxi9BkuY0HT+RF2y8VnuiAVvGHvBM+N9iIosP01J74SkxbsM
	 byfY4u1239Ds0LI0iATOr8nkUxINY1dhahsGfIrj5rABN6gJcOvgrjVNBZB7QnotSe
	 5g+ohqMcNb6MkB70mlGUQgsk8Myi2QTKtKpJarBcQ2dw7ZB9OAn5wwQ1wB75LM/ZTf
	 BCKlYt6MqS16uTijiKhTfHAfJ0wDowxtxWtCMOa1JiVg8rq0ua4/x4YY8j9nkGCTNx
	 lMT7owd6VAwuDLGBsAde3vtAIQc72geTb0eDuX+bZTBYCHVfxPY1j/55hrm7hoYoAy
	 LAPDn+BBDlNZQ==
Date: Mon, 31 Jul 2023 08:31:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: boris.brezillon@collabora.com, ndesaulniers@google.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
	trix@redhat.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	naresh.kamboju@linaro.org, dakr@redhat.com
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
Message-ID: <20230731153119.GA773004@dev-arch.thelio-3990X>
References: <20230731123625.3766-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230731123625.3766-1-christian.koenig@amd.com>

On Mon, Jul 31, 2023 at 02:36:24PM +0200, Christian König wrote:
> GCC forbids to jump to labels in loop conditions and a new clang
> check stumbled over this.
> 
> So instead using a local label inside the loop condition use an
> unique label outside of it.
> 
> Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d096eb3aed7b712f5067
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> CC: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Christian König <christian.koenig@amd.com>

Passes my build tests and I inspected the preprocessed output to make
sure it should work. I ran the KUnit tests, which all pass (although [1]
is needed to fix a tangential issue):

Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks for fixing this!

[1]: https://lore.kernel.org/20230728183400.306193-1-arthurgrillo@riseup.net/

> ---
>  include/drm/drm_exec.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 73205afec162..e0462361adf9 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -3,6 +3,7 @@
>  #ifndef __DRM_EXEC_H__
>  #define __DRM_EXEC_H__
>  
> +#include <linux/compiler.h>
>  #include <linux/ww_mutex.h>
>  
>  #define DRM_EXEC_INTERRUPTIBLE_WAIT	BIT(0)
> @@ -74,13 +75,12 @@ struct drm_exec {
>   * Since labels can't be defined local to the loops body we use a jump pointer
>   * to make sure that the retry is only used from within the loops body.
>   */
> -#define drm_exec_until_all_locked(exec)				\
> -	for (void *__drm_exec_retry_ptr; ({			\
> -		__label__ __drm_exec_retry;			\
> -__drm_exec_retry:						\
> -		__drm_exec_retry_ptr = &&__drm_exec_retry;	\
> -		(void)__drm_exec_retry_ptr;			\
> -		drm_exec_cleanup(exec);				\
> +#define drm_exec_until_all_locked(exec)					\
> +__PASTE(__drm_exec_, __LINE__):						\
> +	for (void *__drm_exec_retry_ptr; ({				\
> +		__drm_exec_retry_ptr = &&__PASTE(__drm_exec_, __LINE__);\
> +		(void)__drm_exec_retry_ptr;				\
> +		drm_exec_cleanup(exec);					\
>  	});)
>  
>  /**
> -- 
> 2.34.1
> 
> 
