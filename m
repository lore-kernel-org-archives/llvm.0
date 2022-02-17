Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2053D6A
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 19:06:22 +0000 (UTC)
Received: by mail-oo1-f52.google.com with SMTP id i10-20020a4aab0a000000b002fccf890d5fso725659oon.5
        for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 11:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0eT1lxfoq5qyDbp5eIAnsQwboX33oLO1Gz2b8VOV9eQ=;
        b=piI/0gpwz6MmcTd1tH7GT+KhCfmXjeZWejCehWfMxd3GxACkkdyeFdtCc38MyaMz1F
         v4spK69iBJM7RoH0lhLqBr7gJycoTylK4cLqx1R0wY7R72Q8x1R6NRv8PMzlN69v2arP
         RSz8EyYI7sepd0OP8Efx20nT1hJx5EZ4/BSEMMA291KGWneP9sU38hgNORJEMtFYf+1z
         MNTpoT0RFr/Q87ZJCYHxoztOoY6em6llwZ7lprlPMp0W2Had5rQUwtDSr5D4k68dR5l3
         z30Uyie+549zmipggxcR3Q79WDaehA57h3NuDLc/hyaQzlcVdelcTNmc9jKp56Y7l35A
         fCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0eT1lxfoq5qyDbp5eIAnsQwboX33oLO1Gz2b8VOV9eQ=;
        b=DYed1uqmkCvgnyDMoZm/EuAbXPzuMeZKUX6WqQ171tR8AZBoOKc3Of4naYBV+Ry4vV
         Txi7ipcAKsjx/Oy4C/gRXJFJxMnpWvdwntAhzPy9rfAo5Dqj1Gzs5uBfGJrKfAnNv/oY
         BxHvKeC/GY/ty52VRgA0TBOEwqFtxbkbiP4weD9lBFgI/KNxHIjDmiFBJEnCcvv7ULH7
         taI/YORWAEdlVgAI1ap0v2xCiiyCzDGrWNxE1zEmfCIgcbJsdTqkA4Ot5n+QCf7Twa6J
         2784SPX7wa/u1+6qQ1JLfhl99HMZMcLHoFPnZz1oId6tc3diYY5bDVVYr6MfGyC4CRdc
         quSA==
X-Gm-Message-State: AOAM533TYxH957qjK9TML74tZW5m9knu8UlgFuNFQTnWQ39aMBhljT3n
	aTqzj9wJxUq88r00C2Ob7+haIySoxqpMlNAlkc0=
X-Google-Smtp-Source: ABdhPJzTVo0BLlHY7QOaP5AWF+/HgAkv4O3cf3iw2UsClSnH35LOu7yMNCVBBMkTCxKrTWxKi1E4tGf81mwXJX3Csrw=
X-Received: by 2002:a05:6870:b281:b0:d3:e9c:811d with SMTP id
 c1-20020a056870b28100b000d30e9c811dmr1565142oao.225.1645124781997; Thu, 17
 Feb 2022 11:06:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com> <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com> <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 17 Feb 2022 14:06:10 -0500
Message-ID: <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>, Tom Rix <trix@redhat.com>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Nathan Chancellor <nathan@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>, 
	John Clements <john.clements@amd.com>, Tao Zhou <tao.zhou1@amd.com>, 
	"Chai, Thomas" <YiPeng.Chai@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>, 
	Dennis Li <Dennis.Li@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>, Nirmoy Das <nirmoy.das@amd.com>, 
	llvm@lists.linux.dev, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 2:04 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Feb 17, 2022 at 8:16 AM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Applied.  Thanks!
> >
> > Alex
>
> Alex,
> Has AMD been able to set up clang builds, yet?

No.  I think some individual teams do, but it's never been integrated
into our larger CI systems as of yet as far as I know.

Alex


>
> --
> Thanks,
> ~Nick Desaulniers
