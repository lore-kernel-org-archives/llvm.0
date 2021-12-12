Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD3368
	for <llvm@lists.linux.dev>; Sun, 12 Dec 2021 02:16:17 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id k6-20020a17090a7f0600b001ad9d73b20bso10576789pjl.3
        for <llvm@lists.linux.dev>; Sat, 11 Dec 2021 18:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ODm5tTBiKjrGbG+xckr2d0+8GcplwxAyRg/WZM+r+ZU=;
        b=fx/cYQjNTogkQkklLJydR4YdBt6fJXbRKvaeOoIOFI7DBXmRSoXo0ojIGmfZMOZhNr
         dMcuspsbvAJNb9rzHf1GX3K6IeTIcMC0c5Ymmz1w8LubF7dk50Ur8q+uUrA6KRi+iKp2
         khoaI/56VO2lV9pSIdiqQpkeMSJqH/CnS33OQ4Pdjp6CamzXMJn5WI8X29TU2ZV9QU3g
         q0Rp3c0onPer0gpCnAh2JC5At7NuCfw44RArqd4m/rM6MU6iKPVLYsefDsyQUkNa9gl/
         PpeMQ6zdz/DRWduDt0zCfTDFxG56jCFAVH+oB3kTpoTTyZb3ymiN9ChoJG970B9/SETd
         Hicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ODm5tTBiKjrGbG+xckr2d0+8GcplwxAyRg/WZM+r+ZU=;
        b=nN48J4gcQRVD0BopbnQkvOsRb+CINgO1RrtOf1VbUsvpVMfcr1IRjT5iCXGlXklTEd
         xxnN/zdApKSqxozxsE0UVXOlIr8s+jeAWrJeIZpiQOq/OBTIPczCUiBSPqJWbOKHWdfJ
         jUrRuCWYwmypAwyW390Am3L8B0KpY5n3xEM2Pyvxy8uJvc4+dlt3rN3XgqjzHps4wCR2
         ufnqa+JxBXx6gIh9AXOCDSkJwKWgexluVi3vj6DGLWO4c02RKECORM1mbKg3lVoF6NzO
         4Sj3/30vT5wFsVzacyAHEibcz6ahCcHUc5l3eU37myJVWEnnralDAOJMfYXMFHvJy04+
         x4TQ==
X-Gm-Message-State: AOAM532/FQp1PxDc84R/InESvrNkMm3rsUlhJvTmkliEezZYU42KjNwM
	/n72ZWodFl191F/xi2uGyQqJhdGWNamWd4/plEU=
X-Google-Smtp-Source: ABdhPJxxdL1mGuaBvfT4Vll0Ypm45+kpnKpBj99qjYdQuu116CxUfv0X/VSqia83k0TsstchZ5IoKRVNzzHPr4Xi0dE=
X-Received: by 2002:a17:90b:4c03:: with SMTP id na3mr34447607pjb.62.1639275377221;
 Sat, 11 Dec 2021 18:16:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1639030882-92383-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1639030882-92383-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 11 Dec 2021 18:16:06 -0800
Message-ID: <CAADnVQKnN6bariMqkXCzHCGcb-ZT6MSJqXq1QjpRbwS8vdy=eQ@mail.gmail.com>
Subject: Re: [PATCH] bpf: use kmemdup() to replace kmalloc + memcpy
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, 
	Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 8, 2021 at 10:22 PM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow coccicheck warning:
>
> ./kernel/bpf/btf.c:6537:13-20: WARNING opportunity for kmemdup.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

Applied. Thanks
