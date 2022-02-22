Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ADA66CF
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 19:12:49 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2d641c31776so186026197b3.12
        for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 11:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MIuf7B6ggNpBhnBC4BV4Wx/yI126tWB3veseg963gIw=;
        b=oO4DLFIdF57cng91nz+ABsKhV3TEZMT4YH2lr4gu+QyKiHY/p9DVOaozbT73qgUo+w
         xQ27MwmBRWjReen46DDOboOnddmO9/G+2my87QZxKBkXv4l+/ZIkzCE+YibDvGS82tr0
         HZoBeNSLHqIdxa1Bqoclcc2rWWVKuuZ97ifQkHXI6/n3++k7W9wF8snW9tx1VykggiAd
         hu4BJF221YTv/PUYb8MOBSrE1s9NmmfgNSMv7MEWWG2IgolZVZtOzOZbfb9F9dGBcui2
         No4HnBw2U9LDz6tICVmKGe/4TXVP/KGT/hXXO865Xl+3ZFSgHikjXcCE37PmLXsefax7
         bpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MIuf7B6ggNpBhnBC4BV4Wx/yI126tWB3veseg963gIw=;
        b=7owAZo/ArszdMdnRQ1XSOio0NhAEqhVUQpxTgxe45q5soxMS5zJbAu4QwjJKgoCNAQ
         pU8OMxH+oin2WKiIWjm/6MiptndtygBIxPZ4F3ODYieFv+V6fYYi375bTxV6tkzDh1JC
         iwJeHtNczafm/lS8jQ8Iypl54nUzs9dfRRFhXLS70TbWAsEowT5o/N0dO2PxNbqE315T
         r3hFDm8LQnEV00FY9ITpMC/m/zS7FOOdiufOhOMHQI1aufMnyX2QHJY6tyL90fjniLpr
         RYWlk90k2mA32ufUzZUpbm86oPfArn/EoZJ3RKQug+O6c9q9AZsEjjHAN1FcWlvmu+9i
         GZlw==
X-Gm-Message-State: AOAM533K3VPX+Xa4f1ne4RnvsvZBOsMEMnRVPsMDKPeLDDTxVl4CjRkh
	LXJNgaf8vXyl4swvyx4zq2PoMN36Ew4dezlbwow=
X-Google-Smtp-Source: ABdhPJwogRs4v3RoIbi9LLn5frjoRnppXVlb2XUr+i5bRqLbpZZJ4wuR98W0v903ktfUAXqLtpj99zYOXAJ1elSwzCI=
X-Received: by 2002:a81:184f:0:b0:2d0:e2b1:1995 with SMTP id
 76-20020a81184f000000b002d0e2b11995mr24474079ywy.364.1645557168674; Tue, 22
 Feb 2022 11:12:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com> <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
 <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com> <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
In-Reply-To: <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com>
From: Kenny Ho <y2kenny@gmail.com>
Date: Tue, 22 Feb 2022 14:12:37 -0500
Message-ID: <CAOWid-cXYze56YmUACWP4emNeGHXMFf4q5aZfFGUwVXWNFAvSg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, "Joshi, Mukul" <mukul.joshi@amd.com>, 
	Tao Zhou <tao.zhou1@amd.com>, llvm@lists.linux.dev, Dave Airlie <airlied@linux.ie>, 
	Tom Rix <trix@redhat.com>, xinhui pan <Xinhui.Pan@amd.com>, Nirmoy Das <nirmoy.das@amd.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luben Tuikov <luben.tuikov@amd.com>, "Stanley.Yang" <Stanley.Yang@amd.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, "Chai, Thomas" <YiPeng.Chai@amd.com>, 
	John Clements <john.clements@amd.com>, Christian Koenig <christian.koenig@amd.com>, 
	Dennis Li <Dennis.Li@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 17, 2022 at 2:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Thu, Feb 17, 2022 at 2:04 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> >
> > Alex,
> > Has AMD been able to set up clang builds, yet?
>
> No.  I think some individual teams do, but it's never been integrated
> into our larger CI systems as of yet as far as I know.

I have just added clang build to our CI last night so hopefully we
should be catching these now.

Kenny

>
> Alex
>
>
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
