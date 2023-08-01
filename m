Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02B4DC94
	for <llvm@lists.linux.dev>; Tue,  1 Aug 2023 20:35:25 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-403a7066bc8so44329361cf.0
        for <llvm@lists.linux.dev>; Tue, 01 Aug 2023 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690922125; x=1691526925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf9b5ArRYyIVdrw7rdZ9H8YQljZ2dhYx/WgjJXtbi90=;
        b=zt+nePwElf098r6sKk/gQOji9C+o+MPTbAwCfrY9GUmRgmE4TTHLRZOV+JPrB0kICg
         uRiUNQANWEg+KHmRuhggtdxFTvqv9ZANBUuUxTbWx4+kYyQiMVlIQSKe7ZqoFVPmHfDl
         hDkj10yRFkQNJ9vfIpZTqvyu3xMBjPO01C8VHwDIO51fFt+hBOCj7L7DgPBFEW2/EvFP
         e84SDiS539tMsKja/psGxarB8iEYt/GZ93WPHy1iyioyR9c4lCVvbGtwYkcZOnk/QI7Q
         VSM7lb47Gx8vQheU4x9PcqS5DzUKkUya3Xiq26LtFCZ3Offt3FsWu87mf6kTtXydQ+aZ
         /i7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690922125; x=1691526925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nf9b5ArRYyIVdrw7rdZ9H8YQljZ2dhYx/WgjJXtbi90=;
        b=BOoQYk76U614xfXzqpJ2O0S5y3Hulv6vHxkzvUdDW7JMenU5oeCK/sIQ3KppU+usg2
         CUL0urOJa/WrlsluTQP9bEK9wcA8SSDUEIFIQjMit67uW+mp8ziZ4TEgaCbeTlPf7+wU
         HvQXNhtvvEgheNb5IWG2Wcog5ZHdx5Mx5AyZxB+P0B/g7aslYW1CJqYIyOFKcFYdfP8T
         3gAhZJt9j17Fzoy4Athyo2GeGApIJKXz8mUSEQHDFux9r+PlwbDqdddyK8VXLk1YVx1E
         7v7b13AHSkcxrx0WcpN691XHIo6l3vcc2m9P2wA4PEt0c7BSkw/h70CL6lVkzaHulemI
         icHQ==
X-Gm-Message-State: ABy/qLZfejaZgr8o0zPDSdoHt5OQFrQYwaEH73fRynzaE8pQxjNvph2q
	jG3YL+25w5buUsHbp7vW0K4J7ouWc+3jArOCNuvj2g==
X-Google-Smtp-Source: APBJJlEuoeiPGNMDv5kGiNrPu5wxV6+seqvoAcOaJ4oQ4V9hKgcO2ZE6cIhNx9OxQVoXVwVoyH3whzrqhk+OfvfkWMg=
X-Received: by 2002:a05:6214:84d:b0:63c:f5c0:cd14 with SMTP id
 dg13-20020a056214084d00b0063cf5c0cd14mr12573306qvb.49.1690922124679; Tue, 01
 Aug 2023 13:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230731123625.3766-1-christian.koenig@amd.com>
In-Reply-To: <20230731123625.3766-1-christian.koenig@amd.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Aug 2023 13:35:13 -0700
Message-ID: <CAKwvOdmRm=vOjNXGWeuKw-h78CXMrkcwc5vnCRVqFxMxWzhCcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/exec: use unique instead of local label
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: boris.brezillon@collabora.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	trix@redhat.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, naresh.kamboju@linaro.org, 
	dakr@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 31, 2023 at 5:36=E2=80=AFAM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> GCC forbids to jump to labels in loop conditions and a new clang
> check stumbled over this.
>
> So instead using a local label inside the loop condition use an
> unique label outside of it.
>
> Fixes: commit 09593216bff1 ("drm: execution context for GEM buffers v7")
> Link: https://gcc.gnu.org/onlinedocs/gcc/Statement-Exprs.html
> Link: https://github.com/ClangBuiltLinux/linux/issues/1890
> Link: https://github.com/llvm/llvm-project/commit/20219106060208f0c2f5d09=
6eb3aed7b712f5067
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> CC: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Works for me; thanks for the patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

I suspect it's possible to change the indirect goto into a direct goto
with some further refactoring (macros can take block statements; if
drm_exec_until_all_locked accepted a block statement arg then you
could introduce a new scope, and a new local label to that scope, then
just use direct goto), but this will probably apply cleaner. (oh, is
09593216bff1 only in next at the moment? The AuthorDate threw me.)

There are some curious cases where __attribute__((cleanup())) doesn't
mesh well with indirect gotos.
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D37722

May not ever be a problem here...

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

If you wanted to be more specific (if this addition is due to
__PASTE), then `compiler_types.h` is more precise.

>  #include <linux/ww_mutex.h>
>
>  #define DRM_EXEC_INTERRUPTIBLE_WAIT    BIT(0)
> @@ -74,13 +75,12 @@ struct drm_exec {
>   * Since labels can't be defined local to the loops body we use a jump p=
ointer
>   * to make sure that the retry is only used from within the loops body.
>   */
> -#define drm_exec_until_all_locked(exec)                                \
> -       for (void *__drm_exec_retry_ptr; ({                     \
> -               __label__ __drm_exec_retry;                     \
> -__drm_exec_retry:                                              \
> -               __drm_exec_retry_ptr =3D &&__drm_exec_retry;      \
> -               (void)__drm_exec_retry_ptr;                     \
> -               drm_exec_cleanup(exec);                         \
> +#define drm_exec_until_all_locked(exec)                                 =
       \
> +__PASTE(__drm_exec_, __LINE__):                                         =
       \
> +       for (void *__drm_exec_retry_ptr; ({                             \
> +               __drm_exec_retry_ptr =3D &&__PASTE(__drm_exec_, __LINE__)=
;\
> +               (void)__drm_exec_retry_ptr;                             \
> +               drm_exec_cleanup(exec);                                 \
>         });)
>
>  /**
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
