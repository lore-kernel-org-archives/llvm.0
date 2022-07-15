Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984084C9A
	for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 22:06:47 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id n74so10679939yba.3
        for <llvm@lists.linux.dev>; Fri, 15 Jul 2022 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=znO2Y2mgyPmy5xm12i9TL77/e75ofCAf3Bz+mrqCTv4=;
        b=nwAiyzRfyeVohdu3BaFHjx1n2btdZSItOlEp1k1/USIkt6ye8CF/Tmpde2UgZLFQ2T
         VKpWpyPaVmctwZl8ZfSwpEp2AWZ3zSWSXLFqo29BbYRYw1kbmkXLywzlEIsuXVVGdR/K
         lpQlkasoIEiPB+83O+Y6+OxY0CMGw7lqu5Jn7rKleQM89vXdbC3r1yU/Zo/VtC0NeZc0
         DujYDqUsr/EHYPEiCFjDFGG5tX9QsAJRjZo4hfOPQKC9Rx4DsxS+jus2zzz+Unem59l+
         Gt0RfG2//6/ob5HxWL/xswiLhcV3xlt6DwvrMy9xjLTKYO9xgEOECy7rOxHJH3tE6M+X
         hqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=znO2Y2mgyPmy5xm12i9TL77/e75ofCAf3Bz+mrqCTv4=;
        b=0IaEBXHXU8f2R4gghizquoOXLpaX2vYoFE+5kMHFKCENpyniwNTEZD/uT8HaO8IugX
         LvWncOw96QVNS/v26nu+e19/pf4kdIpwadCvK9Z0IVzGzPt1DQKYfnP5N9nTs+r1r9IO
         9zuYptK0ukj64dG+ti7kcgf5w3LbNcPj8NU4g/dWcuCtYz0yeSPA8Bz0O995c/tlb0Dm
         aFeRcf4LlSyGYjZeR9SkkJQBJJqwDwAjHvX1Ufa61zyvaf4Yx1E92qmB1mVKsSG89aMx
         BdtmRvLLIgprPV5d9KRXQUPurZMqEVxk1d5XIaSzwKYDipE5tCV7iISZYZ9GUpWNcT/4
         uckg==
X-Gm-Message-State: AJIora+pgB1KaBF0gK8tM23RLPObT03pr2DUIwSUn3LsIgknRWbA5LS/
	MoKwyqbj+UqYjV6YuyhPAJlGVmcTkg+jxF1y81g=
X-Google-Smtp-Source: AGRyM1vCyIioAc6FrRYSlWDCUwjzz1zghjCHuCXctUu8dF3ZQxopEjcdoi1g3VkwnNz6rOpCmINBYPNNMlGpkWgVgCk=
X-Received: by 2002:a25:3c45:0:b0:664:cf75:c2d6 with SMTP id
 j66-20020a253c45000000b00664cf75c2d6mr15969381yba.446.1657922806561; Fri, 15
 Jul 2022 15:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714185514.7d1a2ac9@canb.auug.org.au> <Ys/42uMzQy+CFTGI@debian>
 <YtA+127QgRifnRBZ@dev-arch.thelio-3990X> <CADVatmOTNA8uVqDEx6kp=+_O=wEhV2jbS9-frct-c4ZqBxcspg@mail.gmail.com>
 <YtBEXdrsthFamQs8@dev-arch.thelio-3990X> <CADVatmNOV+jn1WSFo=z4F9KqzYAgxCWr0cxTFL_5myJKFkQNzQ@mail.gmail.com>
 <YtCJeieW4Mz1VfRx@dev-arch.thelio-3990X>
In-Reply-To: <YtCJeieW4Mz1VfRx@dev-arch.thelio-3990X>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Fri, 15 Jul 2022 23:06:10 +0100
Message-ID: <CADVatmMMWc4YYzsuMSu8uH6fTbChU_RyK75eeQb+B3aT3kDGKg@mail.gmail.com>
Subject: Re: linux-next: Tree for Jul 14
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 10:24 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Dropping the next list and Stephen as these issues are likely present on
> mainline as well.
>
> On Thu, Jul 14, 2022 at 07:26:27PM +0100, Sudip Mukherjee wrote:
> > Hi Nathan,
> >

<snip>

>
> It has not been as bad with CONFIG_KASAN_STACK force disabled for clang
> but it is still there for certain architectures, namely ARCH=arm. I
> would be curious to see if all those -Wframe-larger-than instances
> disappear with CONFIG_KASAN disabled.

Almost. This is from powerpc allmodconfig of next-20220715 with
CONFIG_KASAN disabled.

drivers/block/ublk_drv.c:890:6: error: variable 'io' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (tag >= ubq->q_depth)
            ^~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
        io->flags &= ~UBLK_IO_FLAG_ACTIVE;
        ^~
drivers/block/ublk_drv.c:890:2: note: remove the 'if' if its condition
is always false
        if (tag >= ubq->q_depth)
        ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:887:6: error: variable 'io' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (ubq->ubq_daemon && ubq->ubq_daemon != current)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
        io->flags &= ~UBLK_IO_FLAG_ACTIVE;
        ^~
drivers/block/ublk_drv.c:887:2: note: remove the 'if' if its condition
is always false
        if (ubq->ubq_daemon && ubq->ubq_daemon != current)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:884:6: error: variable 'io' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (!ubq || ub_cmd->q_id != ubq->q_id)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
        io->flags &= ~UBLK_IO_FLAG_ACTIVE;
        ^~
drivers/block/ublk_drv.c:884:2: note: remove the 'if' if its condition
is always false
        if (!ubq || ub_cmd->q_id != ubq->q_id)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:884:6: error: variable 'io' is used
uninitialized whenever '||' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (!ubq || ub_cmd->q_id != ubq->q_id)
            ^~~~
drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
        io->flags &= ~UBLK_IO_FLAG_ACTIVE;
        ^~
drivers/block/ublk_drv.c:884:6: note: remove the '||' if its condition
is always false
        if (!ubq || ub_cmd->q_id != ubq->q_id)
            ^~~~~~~
drivers/block/ublk_drv.c:880:6: error: variable 'io' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (ub_cmd->q_id >= ub->dev_info.nr_hw_queues)
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
        io->flags &= ~UBLK_IO_FLAG_ACTIVE;
        ^~
drivers/block/ublk_drv.c:880:2: note: remove the 'if' if its condition
is always false
        if (ub_cmd->q_id >= ub->dev_info.nr_hw_queues)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:877:6: error: variable 'io' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (!(issue_flags & IO_URING_F_SQE128))
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:940:2: note: uninitialized use occurs here
        io->flags &= ~UBLK_IO_FLAG_ACTIVE;
        ^~
drivers/block/ublk_drv.c:877:2: note: remove the 'if' if its condition
is always false
        if (!(issue_flags & IO_URING_F_SQE128))
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/block/ublk_drv.c:868:20: note: initialize the variable 'io' to
silence this warning
        struct ublk_io *io;
                          ^
                           = NULL
drivers/block/ublk_drv.c:1304:6: error: variable 'ret' is used
uninitialized whenever 'if' condition is true
[-Werror,-Wsometimes-uninitialized]
        if (!ub)
            ^~~
drivers/block/ublk_drv.c:1330:9: note: uninitialized use occurs here
        return ret;
               ^~~
drivers/block/ublk_drv.c:1304:2: note: remove the 'if' if its
condition is always false
        if (!ub)
        ^~~~~~~~
drivers/block/ublk_drv.c:1301:9: note: initialize the variable 'ret'
to silence this warning
        int ret;
               ^
                = 0
7 errors generated.
_________________________________________________________________________________________________________________


drivers/clk/qcom/gpucc-sm8350.c:111:2: error: initializer element is
not a compile-time constant
        gpu_cc_parent,
        ^~~~~~~~~~~~~
drivers/clk/qcom/gpucc-sm8350.c:126:2: error: initializer element is
not a compile-time constant
        gpu_cc_parent,
        ^~~~~~~~~~~~~
2 errors generated.
_________________________________________________________________________________________________________________

drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c:1093:12: error: stack frame size
(2112) exceeds limit (2048) in 'vcn_v3_0_start'
[-Werror,-Wframe-larger-than]
static int vcn_v3_0_start(struct amdgpu_device *adev)
           ^
1 error generated.
_________________________________________________________________________________________________________________


-- 
Regards
Sudip
