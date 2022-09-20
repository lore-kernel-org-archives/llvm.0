Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1809B1C11
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 12:32:08 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id cc5so4038319wrb.6
        for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date;
        bh=1MF4EqMmKiknkCxbkWjC3WSdMgGUyAMwUXpH/v5PLhs=;
        b=hqQ+kEhXrINc6InWXqyon5OwHwauo0C0OEZqG9NYnnK3ZJEsnGX1dAgFB3BKCrj+G2
         dPc7q5c1k8lHWMoQBkHE/1IaSTUy3ygewYM52gTFSgKVYi2WbLib61VKuUPe+W0DDkYR
         JKD8dDfQC2/sTJdVL6sudb0h/OJjZIYbZ88OU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1MF4EqMmKiknkCxbkWjC3WSdMgGUyAMwUXpH/v5PLhs=;
        b=8Jz1ubpQjaybJP8tcUPRPI2Xy8r6PS1KhZnOW6G+1GAwK/ygWquelHP2toBaaImw43
         LChwKh+Q5RA1c7V2tS0DKHmHClCpggspKKHW5rS2UtzJyIN4oyJgRS9HwBoUj01NBYa/
         sJXZzWnPFV4lS1E3yWjfZrkTy7Z6hxs3Od8g5Cu0Lym2yQKih3OfmDY+MLofgQ4jIkCd
         DMtn1w3pDGDhPHe3MKR8chWoVxKjXu0zoVYixDb+M6fWt1w0MA0e0mEMcN34moiY8kmx
         F1NEqsquVjXnGH/y5XeIJ0xZWZSvrxzvn0ZW9MPMQkdPSQBZElYkspsQ/0LSaLe1SKSo
         3Nvg==
X-Gm-Message-State: ACrzQf0L6T2o7N0M3EOPCLU9wMw8N6pnnNZeOoRAqK4F0d73q2K6Q5z/
	eu/PQJV4eaczNupUuzniHKQg1Q==
X-Google-Smtp-Source: AMsMyM6r6Ml0b1UTbXqs9UY3GRGCQbw72xzvUd6ll61viiKh6J0PpVhoGzWJOg+mkXMFmIU7FSUtJw==
X-Received: by 2002:a5d:504c:0:b0:228:db0e:a4c9 with SMTP id h12-20020a5d504c000000b00228db0ea4c9mr14181924wrt.272.1663677127257;
        Tue, 20 Sep 2022 05:32:07 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i (net-188-217-56-12.cust.vodafonedsl.it. [188.217.56.12])
        by smtp.gmail.com with ESMTPSA id f7-20020a05600c4e8700b003b340f00f10sm17629084wmq.31.2022.09.20.05.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 05:32:06 -0700 (PDT)
Date: Tue, 20 Sep 2022 14:32:03 +0200
From: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
	sudipm.mukherjee@gmail.com,
	Alex Deucher <alexander.deucher@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
	Luben Tuikov <luben.tuikov@amd.com>,
	Philip Yang <Philip.Yang@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] drm/amdgpu: initialize r variable into amdgpu_cs_submit
 function
Message-ID: <20220920123203.GA346517@tom-ThinkPad-T14s-Gen-2i>
References: <20220920122216.346321-1-tommaso.merciai@amarulasolutions.com>
 <3430255f-3675-eef2-92bd-4eb8be582c83@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3430255f-3675-eef2-92bd-4eb8be582c83@amd.com>

Hi Christian,

On Tue, Sep 20, 2022 at 02:23:58PM +0200, Christian König wrote:
> Am 20.09.22 um 14:22 schrieb Tommaso Merciai:
> > The builds of arm64 allmodconfig with clang failed to build
> > next-20220920 with the following result:
> > 
> > 1190:3: error: variable 'r' is uninitialized when used here [-Werror,-Wuninitialized]
> > note: initialize the variable 'r' to silence this warning
> > 
> > This fix compilation error
> 
> I've already send a patch to fix this to the mailing list 7 Minutes ago :)
> 
> Please review or ack that one.

Sorry, my bad. Don't see your patch :)

Cheers,
Tommaso

> 
> Thanks,
> Christian.
> 
> > 
> > Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > index 58088c663125..efa3dc9b69fd 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> > @@ -1168,7 +1168,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
> >   	struct amdgpu_bo_list_entry *e;
> >   	struct amdgpu_job *job;
> >   	uint64_t seq;
> > -	int r;
> > +	int r = 0;
> >   	job = p->job;
> >   	p->job = NULL;
> 

-- 
Tommaso Merciai
Embedded Linux Engineer
tommaso.merciai@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via Le Canevare 30, 31100 Treviso, Veneto, IT
T. +39 042 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
