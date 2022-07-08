Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CF7A
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 19:15:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id bf9so14599393lfb.13
        for <llvm@lists.linux.dev>; Fri, 08 Jul 2022 12:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qp+lpzvCDOD67Z+Hmb4GLEu8Pem+vI3Wee/5Fmd3BnA=;
        b=Qkz/lH6HilqA4BbTtGBftnPldxYvYuc8IwBkzWVd/EIkwT067gdU04vz4TqvkHHRuK
         f/XOb/29EAYLLxENNy7CXoWCtuRty2Bl8hi3OOEuIqWFXBtFJEMt5rrPG5F20vcT99jd
         l69Rk4lrYRMUMsN9ChNMNNhV2XXDdYcB59dGrCmrJTj3x7seSzZ+eIjzegVxstbfSrnI
         IgMH7kV2FkyaKbHYPB0B96n32hLNlFGswLJkwMTjAQfduJZUTQlepDFgrm+YNVCgKJbB
         GNlSQU9vRJJmNmej1etbQpk/YXA+GDd8C1qlw9dchlLHnWCFoFyIud3BRkU+v29lMXAP
         9y7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qp+lpzvCDOD67Z+Hmb4GLEu8Pem+vI3Wee/5Fmd3BnA=;
        b=5XUPl+RxT39EJpOn9Wgj21cz0j0zvc90ufnTpP5Mx+uJeIBcZZ1FiCURv3PXZXX4NY
         c5MYjSBKRYZcegImfl2/7BnWXTqIEL8gN5HybGh5efMsYEgNe5XweazxMS7Myf7SEJGb
         PQtEjEuW4/NLXnwmGTWe2Qo5FL62LV5RPHri/Bf0fejTNuFnWkqgeYcm5/ZDq52F9JVD
         N9php66QpWQx8pp9mUdauO43yRWjkk2usHmKGIwd84Fhv1Zt8olXpO0pyM8FlJ7yzJNv
         MrKKjS5q9L79ooKQNDcr4ZqUBoGTLlAXaRliT2vkmLQj7956c65CoFJId+gDKeFoVA4q
         AZzg==
X-Gm-Message-State: AJIora/7swbb+bGyIDvnFvhtmirBccEno8qBzFBYpZ5NzeAiKEmebqEr
	UMxxJKQMYZPDyHy1f77Qbc/TkYTq/nP6uQMj/2/i2g==
X-Google-Smtp-Source: AGRyM1vaos+6EOBCLOeo8WwPTEXEoU5FHuKCK3vWzTTcWeVhul0/TzrBnFF81jzw3oWMhGwaJmoD6ZIL5h/yUnZBuGw=
X-Received: by 2002:a05:6512:e83:b0:489:c6fe:e121 with SMTP id
 bi3-20020a0565120e8300b00489c6fee121mr1344407lfb.100.1657307715617; Fri, 08
 Jul 2022 12:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1791141562.180.1657258946129@jenkins.jenkins>
In-Reply-To: <1791141562.180.1657258946129@jenkins.jenkins>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 8 Jul 2022 12:15:04 -0700
Message-ID: <CAKwvOdkGvW+2RJSJeraUr_Z0N2GE8PEKsMY-k6coSjWE3mXySw@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by linux: lib/bitmap: Make length
 parameter `len` unsigned
To: ci_notify@linaro.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, llvm@lists.linux.dev, arnd@linaro.org, 
	Yury Norov <yury.norov@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for the report! Looks like Paul has a v2 that fixes this:
https://lore.kernel.org/lkml/20220708075239.9057-1-pmenzel@molgen.mpg.de/

On Thu, Jul 7, 2022 at 10:42 PM <ci_notify@linaro.org> wrote:
>
> [TCWG CI] Regression caused by linux: lib/bitmap: Make length parameter `len` unsigned:
> commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> Author: Paul Menzel <pmenzel@molgen.mpg.de>
>
>     lib/bitmap: Make length parameter `len` unsigned
>
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 547
> # First few build errors in logs:
> # 00:01:34 lib/bitmap.c:351:6: error: conflicting types for '__bitmap_set'
> # 00:01:34 make[1]: *** [lib/bitmap.o] Error 1
> # 00:01:37 make: *** [lib] Error 2
>
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 564
> # linux build successful:
> all
>
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>
> This commit has regressed these CI configurations:
>  - tcwg_kernel/llvm-release-arm-norov-allnoconfig
>
> First_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-aaa4ab5ec04480fd0c16c7452d28444c862b2b87/
> Last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-dc34d5036692c614eef23c1130ee42a201c316bf/
> Baseline build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/build-baseline/
> Even more details: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/
>
> Reproduce builds:
> <cut>
> mkdir investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> cd investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
>
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-allnoconfig/1/artifact/artifacts/test.sh --fail
> chmod +x artifacts/test.sh
>
> # Reproduce the baseline build (build all pre-requisites)
> ./jenkins-scripts/tcwg_kernel-build.sh @@ artifacts/manifests/build-baseline.sh
>
> # Save baseline build state (which is then restored in artifacts/test.sh)
> mkdir -p ./bisect
> rsync -a --del --delete-excluded --exclude /bisect/ --exclude /artifacts/ --exclude /linux/ ./ ./bisect/baseline/
>
> cd linux
>
> # Reproduce first_bad build
> git checkout --detach aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> ../artifacts/test.sh
>
> # Reproduce last_good build
> git checkout --detach dc34d5036692c614eef23c1130ee42a201c316bf
> ../artifacts/test.sh
>
> cd ..
> </cut>
>
> Full commit (up to 1000 lines):
> <cut>
> commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> Author: Paul Menzel <pmenzel@molgen.mpg.de>
> Date:   Thu Jul 7 23:50:52 2022 +0200
>
>     lib/bitmap: Make length parameter `len` unsigned
>
>     The length is non-negative, so make it unsigned, and adapt while
>     condition accordingly.
>
>     Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>     Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  lib/bitmap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index b18e31ea6e66..0746beb336df 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -348,14 +348,14 @@ int __bitmap_weight(const unsigned long *bitmap, unsigned int bits)
>  }
>  EXPORT_SYMBOL(__bitmap_weight);
>
> -void __bitmap_set(unsigned long *map, unsigned int start, int len)
> +void __bitmap_set(unsigned long *map, unsigned int start, unsigned int len)
>  {
>         unsigned long *p = map + BIT_WORD(start);
>         const unsigned int size = start + len;
>         int bits_to_set = BITS_PER_LONG - (start % BITS_PER_LONG);
>         unsigned long mask_to_set = BITMAP_FIRST_WORD_MASK(start);
>
> -       while (len - bits_to_set >= 0) {
> +       while (len >= bits_to_set) {
>                 *p |= mask_to_set;
>                 len -= bits_to_set;
>                 bits_to_set = BITS_PER_LONG;
> </cut>



-- 
Thanks,
~Nick Desaulniers
