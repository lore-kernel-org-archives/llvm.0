Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509792E2663
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 11:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783164756; cv=pass; b=pzys2QYeSav5BnvpUcAtySaJFWb89Zo+bleNQGibxNN7FRXdBJNoXuXFt0oYGbSfMoJUlvmRefkQFcpzU2jonz3xwprOASmDSDrFK9n8zKYKJ9JYcPgCsieM4ydxb11vK1on19lj3fk9XTZbGk0PwoY0SmMUdCqPzWGNAdF6wDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783164756; c=relaxed/simple;
	bh=8OTCBWbdCtmuwJeFimchV1AxQzt329vUxOdL5TjRnb8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M8b5IwCSRH6rLtczpRRxSbf+CuyxhtRPyTkXdM5vzvr8BkNWkDf0356bAgNQFxZq1GToinHi9v2MAgWUyh/9dF5x5/2Wjn5O1MVc3gAnyfUWzTfk/aNNmVgFcY/K9FmMd78/tv/3wXE4A1ZIjQ8UQzzclz7MwXS//AOEY+Xmw0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZUsbuPr; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZUsbuPr"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so1209663a34.2
        for <llvm@lists.linux.dev>; Sat, 04 Jul 2026 04:32:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783164754; cv=none;
        d=google.com; s=arc-20260327;
        b=ojrQX4B1Hm8Y7CTGfqrcetIJReRGvL5KlpJwG3NSE0sjcMVfAggkx/svrrgArPRNmO
         lZzvN+rO6e57JDohr/OX93kKGyf56a2Pbj8uMggCA6ufYK3ToOutBZLfbzBV2Lxhd3QV
         fGuboscbB3Xtl6QRXISChLGzItSSAa4MTpELP+QKQ7Fus743Rkbb35TIWRdb2qm4V07V
         ScIX8lkWkKzxLRQUKYRmXElzVVT4YF4mog5NixYMXfrejq/QBbXhgb38i6DTlV85Yiwq
         HMn2SgSKdcodpFgel7ggVYaOpt/8/VaZ4YBiFjXpVdbgVc6enLRLC2t6lUd2xlHyVMmn
         dDvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EWxbVxt0bUrbMOVyYOzNg2L9Hi49TedpZAPD1zNG07k=;
        fh=RYictS3nFLjillzjMoz2EnccAQU7h1IGSCLw7XO3mgo=;
        b=pF7N7fcsHDL5fa1ObtL33Q/mchOkq8HWgVMbxmTPsNZ+N5x/zvAmOdJQXA3owNdLAh
         2KZ8KRseOtW+TygwayPjOJkKlyVU21bzHUml5trFQJoPIVvWTqV31Y9kptKFjXoeFB5N
         XWeZXu9dCkvDMndjFSmuXLHeueBYVxz5mzbhhmqvoZmfa9+EtqvdonzYPSZghM4eFrNU
         6bXPdDW6qDLpIVGJ7LIVYhoYywHtwnui3Ky4YBIo+AoiqP17G4MdilqaJlb3Hv569ksA
         rPOJPulGg80RPHBKqhNn9D8Xq4eb5PXK3Z3P6PQ9MH/D+DUzW6Qj6ZInXpmayu9+RyJU
         RSww==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783164754; x=1783769554; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EWxbVxt0bUrbMOVyYOzNg2L9Hi49TedpZAPD1zNG07k=;
        b=nZUsbuPrqGI4w7/YRNDNiy0RSfz6W+c1M0RZA1h7SFu+0dHMehECc1yRHy1B3sWCcj
         NSkNKIvyJQnGr4Qcvoyda1BB5vGspTZlJjIk1wcgIhdDJwStg/ioQm/DAT+FppzwDD71
         67XLB2wBBDDRHkD/d7OaJfoXIhrnLLQrzVkd1MeuhNV8WEk0dfGA9XfUF25WPiEay1sE
         KiRhsofiPXynHK4EzRz2Nf4uwxxEVi4d+/UumYdj0vzXo/OmaKGngcpG23N0P2/e7aea
         RMTUEiUaJJy4ojLIKondnfkrEKMDdmQBD9H8KRGsCl4QeLsmBP6J9ijy+7/rORyYd7gE
         EP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783164754; x=1783769554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWxbVxt0bUrbMOVyYOzNg2L9Hi49TedpZAPD1zNG07k=;
        b=czSLdtObpspa4+A2mPeWB7o7iTnFf9o5NRB0ouMFHN1jAsCQTlcad+bhMiDEPEE/ek
         +S2DANmRdXBJY3J2cG3kP+gbctuWw0GZxmj5tAvoAWF6FnbbkaPmyV081xsKrBvbRif5
         VbphfXaOeTPQqTdOflMegIwpR86cxZnmWHjGKK9Y/A3fjenwXExQtZ/SACa2ZuMnn92I
         KbP3rXo4KczN/JNykrdZri/fAEgFzMjRX5Tx6xQHgG1AvJCL4vibTS8XNAhnmmUATMHt
         wcQf6ilJXzM00B2eAZWMau5d38bJO69ZxY9PSRofH7cf75RUDqTt8jjz8xqq25ymOckx
         xIbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/wxNXHVzRXTZLWWOEchmB5Nr5Owj8YsdFd6x25egnE1R/FYykrn4mgQRUtmwQ6xBpW35xj@lists.linux.dev
X-Gm-Message-State: AOJu0YwHdMNgrmpw9ZRaCvc7vrcIy6bJRhSHLiKJDwAGtXCO0gTC7+cC
	kxm7Inh6r+Gd1AryfE+nbXDaexNnF99MTu4xUeW7NQVKYY2PCsFsuimcOEi1BS0g4G7OmI3ybJ5
	AObQSQcVh4FoyaMYvG3cq4d8CpHp3Hjo=
X-Gm-Gg: AfdE7clXqTLxUJn30ZYqKWusg4ok3g/2W/pkFcG4jJHZAg933qCCd5HWJ07PVl70PYZ
	kqxHsvezeIDw2gNFOuzRd+hHwjzjAzHFgGK/qyXlr0yVt2Wq4iIxTfaJyoPth+ivQBb/EMC8hP4
	76OJP4wGXkD2Y9uQq5CKe8Qu86gv/qNOPiYXtAmJDh3UswsB3eefhwIpWjq4sIrf4bLePb5WhPS
	ofNfS3jwYR3t/w60bdQT+xGXtgdPljD3fIwjHzBSSMExXoTEU6trpl/Ai8Khy6YtofPKRr+U+M=
X-Received: by 2002:a05:6830:258e:b0:7e6:f2dd:93c3 with SMTP id
 46e09a7af769-7eb7ff1bee0mr1941047a34.15.1783164754180; Sat, 04 Jul 2026
 04:32:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260704084133.122053-1-christian.koenig@amd.com>
In-Reply-To: <20260704084133.122053-1-christian.koenig@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Sat, 4 Jul 2026 16:32:22 +0500
X-Gm-Features: AVVi8CcK_S66JOwlm4n0LTy0xr_IGeFKHbpsM77Kmo3cE5f0eLtGIWRvXB6zhGs
Message-ID: <CABXGCsPB4V6h-vUHwQ0Fo=bsdn66xP4fOOOezwWw2hiKh5TRJQ@mail.gmail.com>
Subject: Re: [PATCH] drm/drm_exec: avoid indirect goto
To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
	peterz@infradead.org, jpoimboe@kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 4, 2026 at 1:41=E2=80=AFPM Christian K=C3=B6nig
<ckoenig.leichtzumerken@gmail.com> wrote:
>
> The drm_exec component uses a variable with scope limited to the for() an=
d
> an indirect goto to allow instantiating multiple macros in the same
> function.
>
> This unfortunately doesn't work well with certain compilers when the
> indirect goto can't be lowered to a direct jump.
>
> Switch the indirect goto to a direct goto, the drawback is that we now
> can't use the dma_exec_until_all_locked() macro in the same function
> multiple times.
>
> The is currently only one user of this and only as a hacky workaround
> which is about to be removed.
>
> So document that the __label__ statement should be used when the macro is
> used multiple times and fix the tests and the only use case where that is
> necessary.
>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  2 ++
>  drivers/gpu/drm/tests/drm_exec_test.c  | 24 ++++++++++++------
>  include/drm/drm_exec.h                 | 34 ++++++++++++++------------
>  3 files changed, 36 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index fee4c94c2585..fc28d0fdad37 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -3011,6 +3011,8 @@ bool amdgpu_vm_handle_fault(struct amdgpu_device *a=
dev, u32 pasid,
>         is_compute_context =3D vm->is_compute_context;
>
>         if (is_compute_context) {
> +               __label__ drm_exec_retry;
> +
>                 /* Release the root PD lock since svm_range_restore_pages
>                  * might try to take it.
>                  * TODO: rework svm_range_restore_pages so that this isn'=
t
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/test=
s/drm_exec_test.c
> index 2fc47f3b463b..7a374e462348 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -180,19 +180,27 @@ static void test_multiple_loops(struct kunit *test)
>  {
>         struct drm_exec exec;
>
> -       drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -       drm_exec_until_all_locked(&exec)
>         {
> -               break;
> +               __label__ drm_exec_retry;
> +
> +               drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +               drm_exec_until_all_locked(&exec)
> +               {
> +                       break;
> +               }
> +               drm_exec_fini(&exec);
>         }
> -       drm_exec_fini(&exec);
>
> -       drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> -       drm_exec_until_all_locked(&exec)
>         {
> -               break;
> +               __label__ drm_exec_retry;
> +
> +               drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
> +               drm_exec_until_all_locked(&exec)
> +               {
> +                       break;
> +               }
> +               drm_exec_fini(&exec);
>         }
> -       drm_exec_fini(&exec);
>         KUNIT_SUCCEED(test);
>  }
>
> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
> index 8725ba92ff91..cc2937185a9f 100644
> --- a/include/drm/drm_exec.h
> +++ b/include/drm/drm_exec.h
> @@ -101,17 +101,6 @@ drm_exec_obj(struct drm_exec *exec, unsigned long in=
dex)
>  #define drm_exec_for_each_locked_object_reverse(exec, obj)             \
>         __drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(=
drm_exec))
>
> -/*
> - * Helper to drm_exec_until_all_locked(). Don't use directly.
> - *
> - * Since labels can't be defined local to the loop's body we use a jump =
pointer
> - * to make sure that the retry is only used from within the loop's body.
> - */
> -#define __drm_exec_until_all_locked(exec, _label)                       =
\
> -_label:                                                                 =
        \
> -       for (void *const __maybe_unused __drm_exec_retry_ptr =3D &&_label=
; \
> -            drm_exec_cleanup(exec);)
> -
>  /**
>   * drm_exec_until_all_locked - loop until all GEM objects are locked
>   * @exec: drm_exec object
> @@ -119,9 +108,18 @@ _label:                                             =
                        \
>   * Core functionality of the drm_exec object. Loops until all GEM object=
s are
>   * locked and no more contention exists. At the beginning of the loop it=
 is
>   * guaranteed that no GEM object is locked.
> + *
> + * A global label name drm_exec_retry is used, if you need to use more t=
han one
> + * instance of this macro in the same function the label needs to be mad=
e local
> + * to the block with the __label__ keyword.
>   */
>  #define drm_exec_until_all_locked(exec)                                 =
       \
> -       __drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
> +       for (bool const __maybe_unused __drm_exec_loop =3D false;        =
 \
> +            drm_exec_cleanup(exec);)                                   \
> +               if (false) {                                            \
> +drm_exec_retry: __maybe_unused;                                         =
       \
> +                       continue;                                       \
> +               } else
>
>  /**
>   * drm_exec_retry_on_contention - restart the loop to grap all locks
> @@ -129,12 +127,14 @@ _label:                                            =
                        \
>   *
>   * Control flow helper to continue when a contention was detected and we=
 need to
>   * clean up and re-start the loop to prepare all GEM objects.
> + * The __drm_exec_loop check exists to prevent usage outside of an
> + * drm_exec_until_all_locked() loop.
>   */
>  #define drm_exec_retry_on_contention(exec)                     \
>         do {                                                    \
>                 if (unlikely(drm_exec_is_contended(exec)))      \
> -                       goto *__drm_exec_retry_ptr;             \
> -       } while (0)
> +                       goto drm_exec_retry;                    \
> +       } while (__drm_exec_loop)
>
>  /**
>   * drm_exec_is_contended - check for contention
> @@ -154,12 +154,14 @@ static inline bool drm_exec_is_contended(struct drm=
_exec *exec)
>   *
>   * Unconditionally retry the loop to lock all objects. For consistency,
>   * the exec object needs to be newly initialized.
> + * The __drm_exec_loop check exists to prevent usage outside of an
> + * drm_exec_until_all_locked() loop.
>   */
>  #define drm_exec_retry(_exec)                                  \
>         do {                                                    \
>                 WARN_ON((_exec)->contended !=3D DRM_EXEC_DUMMY);  \
> -               goto *__drm_exec_retry_ptr;                     \
> -       } while (0)
> +               goto drm_exec_retry;                            \
> +       } while (__drm_exec_loop)
>
>  /**
>   * drm_exec_ticket - return the ww_acquire_ctx for this exec context
> --
> 2.43.0
>

Tested on the configs that originally tripped objtool, the error is gone
with this patch:

  - gcc, non-LTO: amdgpu_vm.o builds clean
    (was amdgpu_vm_handle_fault+0x169 / +0x97)
  - clang, non-LTO: amdgpu_vm.o builds clean
    (was amdgpu_vm_handle_fault+0x12d)
  - clang + ThinLTO + KASAN, OBJTOOL_WERROR=3Dy: full vmlinux.o link
    passes objtool (was amdgpu_vm_handle_fault+0x186 / +0x16b)

x86_64, clang 22.1.8.

Tested-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>

FWIW the kernel test robot reported this many times across trees (clang
LTO, clang non-LTO, and gcc builds); it's all the same drm_exec
computed-goto pattern. Full list if you want to add Reported-by/Closes:

Fixes: 9920249a5288 ("drm/amdgpu: convert amdgpu_vm_lock_by_pasid() to
drm_exec")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202606231854.7LeCtlLe-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202606232356.gwHMAJAW-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202606240753.kYjobJVl-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202606241110.iUga5vVw-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202607031446.1PWG18mN-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202607031837.HSmBj8pr-lkp@int=
el.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202607040159.GopyEswS-lkp@int=
el.com/

--=20
Best Regards,
Mike Gavrilov.
