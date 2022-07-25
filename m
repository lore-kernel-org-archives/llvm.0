Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBB41FA4
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 15:37:55 +0000 (UTC)
Received: by mail-vk1-f173.google.com with SMTP id y129so5290762vkg.5
        for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ce9WmTohzte7LfK/wgpV+cfmugHGV3dfc7hkp2BxW9g=;
        b=A6opXY1LnxKcl7TYevC11kRWAz+qHFwq/nircbsm0snEoA6ut4kcdE/tGdUh+Jt5KW
         INJU9/gHkfWJpTeWo8Wh82ua8OVkM53wc3oiSHgK2H81H8CoFu/TS6iUn4ZwrRApToAT
         XSI784cgxe+SNJgvj8ez4Yd5ROzvT0qPio9zsgaoCmrOVIMb4aZp9g+SrAYKrT5S4HPt
         HMy2hEunfRQF3b99c0ovvdYcrCEykP2n56TSoECy6+ZBjw8mEZXSN69KvQHkv1jMKYPE
         qZym/bM0uoSXruwJF5YuZZuY3Bk5bGAQ0Dv/cPnHX+djWx+GlEEpZP8hRvbR+mHsHwnL
         K4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ce9WmTohzte7LfK/wgpV+cfmugHGV3dfc7hkp2BxW9g=;
        b=rcTTO6CVzJleyc76DV3WaVGAsdvp9EYml5Arf7NCH3PGMBmc9anrvodogp8umfRKta
         MtDAQzATyaE2+gMY0Wczp2TIeg4T5wSbYveXoLyTuo++xtLOJBkcGJxc/tFJXQ2V7lFK
         U15PKr8J54JCkbGCEj47NU28ftzszYxqYD5RA/bpDxtwCICJFyt7en7cAXYJZ+AaV3Ed
         UrkIeqCySgiWZU5qiztfxsIdiI6svxtK/pJFQ1bGMcP8ciepF9wLqgyiBUEpbTyzmb18
         gVyEk4CZDBT7GCpeBtDD6wuMis+RJQqwNgaZ2537yHqHG8o8E8jcm72rMCjToJfb7ESO
         bclA==
X-Gm-Message-State: AJIora8a7gPDT+omtls/+5REli3VGmXK/RppbVz/jB9nCzYTXP2NMLv/
	YsuY8xzrr+Cjnl9LOHpSNn2kekKE5QBQ7BXH5l7Oi5NjslWfdg==
X-Google-Smtp-Source: AGRyM1vy4rm8kAqacz73td2CCjxy38eGBKreL4z/CXUNjiSL15nHrAfEstjPyn/c3wiRQRnztsQmTKBYy/putDJwfyU=
X-Received: by 2002:a05:6122:68d:b0:376:f68:ec7c with SMTP id
 n13-20020a056122068d00b003760f68ec7cmr3492241vkq.16.1658763474165; Mon, 25
 Jul 2022 08:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1255100749.2407.1658623869025@jenkins.jenkins> <62deb7be.1c69fb81.eeae1.e023SMTPIN_ADDED_BROKEN@mx.google.com>
In-Reply-To: <62deb7be.1c69fb81.eeae1.e023SMTPIN_ADDED_BROKEN@mx.google.com>
From: Yury Norov <yury.norov@gmail.com>
Date: Mon, 25 Jul 2022 08:37:43 -0700
Message-ID: <CAAH8bW9nm2mv=pvpWn86-VFJoXn3mRx6SP6pFVsvsj8XL-RMzw@mail.gmail.com>
Subject: Re: [TCWG CI] Regression caused by linux: lib/nodemask: inline
 next_node_in() and node_random()
To: Nathan Chancellor <nathan@kernel.org>
Cc: ci_notify@linaro.org, llvm@lists.linux.dev, arnd@linaro.org
Content-Type: text/plain; charset="UTF-8"

Hi Nathan,

It's not a false positive. The fix is here:
https://lkml.org/lkml/2022/7/23/456

I removed the patch in trouble from -next, so this warning will disappear.

Sorry for the noise.

Thanks,
Yury

On Mon, Jul 25, 2022 at 8:33 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sun, Jul 24, 2022 at 12:51:08AM +0000, ci_notify@linaro.org wrote:
> > [TCWG CI] Regression caused by linux: lib/nodemask: inline next_node_in() and node_random():
> > commit bbe8fb1a3c5301384d54cd6d722850182817358e
> > Author: Yury Norov <yury.norov@gmail.com>
> >
> >     lib/nodemask: inline next_node_in() and node_random()
> >
> > Results regressed to
> > # reset_artifacts:
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 20659
> > # First few build errors in logs:
> > # 00:04:42 crypto/wp512.c:782:13: error: stack frame size (1168) exceeds limit (1024) in 'wp512_process_buffer' [-Werror,-Wframe-larger-than]
> > # 00:04:42 make[1]: *** [crypto/wp512.o] Error 1
> > # 00:08:42 make: *** [crypto] Error 2
> > # 00:11:07 drivers/gpu/drm/selftests/test-drm_mm.c:372:12: error: stack frame size (1032) exceeds limit (1024) in '__igt_reserve' [-Werror,-Wframe-larger-than]
> > # 00:11:07 make[4]: *** [drivers/gpu/drm/selftests/test-drm_mm.o] Error 1
> > # 00:11:32 make[3]: *** [drivers/gpu/drm/selftests] Error 2
> > # 00:21:27 drivers/mtd/chips/cfi_cmdset_0001.c:1872:12: error: stack frame size (1096) exceeds limit (1024) in 'cfi_intelext_writev' [-Werror,-Wframe-larger-than]
> > # 00:21:27 make[3]: *** [drivers/mtd/chips/cfi_cmdset_0001.o] Error 1
> > # 00:21:43 make[2]: *** [drivers/mtd/chips] Error 2
> > # 00:21:43 sound/soc/intel/avs/path.c:815:18: error: stack frame size (1232) exceeds limit (1024) in 'avs_path_create' [-Werror,-Wframe-larger-than]
> >
> > from
> > # reset_artifacts:
> > -10
> > # build_abe binutils:
> > -9
> > # build_kernel_llvm:
> > -5
> > # build_abe qemu:
> > -2
> > # linux_n_obj:
> > 20660
>
> This appears to be a false positive unless I am missing something. The
> number of artifacts built does drop due to that commit but it is because
> the code is being shuffled from nodemask.c to nodemask.h, dropping
> nodemask.c altogether.
>
> Between the two logs, there are an even number of errors per file.
>
> $ rg "error: " /tmp/{good,bad}.log | string split -f 2 ' ' | string split -f 1 : | sort | uniq -c
>       2 crypto/wp512.c
>       4 drivers/gpu/drm/amd/amdgpu/../display/dc/dml/calcs/dce_calcs.c
>       2 drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c
>       2 drivers/gpu/drm/selftests/test-drm_mm.c
>       2 drivers/mtd/chips/cfi_cmdset_0001.c
>       2 drivers/ntb/hw/idt/ntb_hw_idt.c
>       4 drivers/staging/fbtft/fbtft-core.c
>       2 drivers/staging/rtl8723bs/core/rtw_security.c
>       2 sound/soc/intel/avs/path.c
>
> Cheers,
> Nathan
