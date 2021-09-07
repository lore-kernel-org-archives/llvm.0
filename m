Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A672
	for <llvm@lists.linux.dev>; Tue,  7 Sep 2021 17:48:56 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id i3-20020a056830210300b0051af5666070so100731otc.4
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 10:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vJ+gvRBAJLYeXIcZ9ApCagIly/vKGuQEYDnPNSFOA74=;
        b=da/6Y3fG+8wHReQooEtxzXUpiQLf3IWvfdjkVdTLWT2s6Am+/9Clj0sMfgbAubv61Y
         BgT4uzkRcaiQPcRttX181tb2auxOCGD3PEVUztHsICbha/tmxDfRg0dV1PXCM8xc7oLS
         TFK/C/2raqkmh2b053q0mdZwTtvGpYpwY3aUnLP+9xjcGPvXBsSj0XiTKzjD1ANwsvjn
         EdPljMIr1yAVaqIpqmUAgtdHZlBw3Xk+WvEmuqiFZ5Zb+qe+xZX9wubtk0o6dMP3+Idv
         Zv8jazx1DSakndwOsWER90iZnVklgw5Hp4qR0QoJ+OMaIfRPDHK4yK0DGKQSrnamA75g
         63Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vJ+gvRBAJLYeXIcZ9ApCagIly/vKGuQEYDnPNSFOA74=;
        b=QRjeQXdHJM9GPJ0F7jhbxlEb63YeZfgRtlzaKUxvOW6rXDTtsrzjzUs6DK5Z0oFmnu
         Pr0z2yIkpatAjl3EwZFr5Z2xTTuo9sx65OtEf4lDmwW8c5VBeufgytMGlQSpCawqclk7
         91oNtyQgix9N1weKBrw8+Rnn49nPn9G3tMPLG5H4hJilvb+9HHflz/5fBGgucl/7TnFP
         2294nqT/z56kopeirigmrzHsTK2savFO9om5cH2hBSU/hpY/kXsIMZzk+5t3v5I0ETlV
         Hv7A89HwyApA1mP56JW/XdcJsmbnOl9OK6nx8y6ZpS8kpwF/EKvCnv5BRlUIfKEkOXCF
         8VWg==
X-Gm-Message-State: AOAM532sTSkEQ53VI9V3xkwxvd82UBtwOoBfVRO2uXEl2DNRWqJ4ZT+p
	kinQtx+WG2re3m63nZ8MkZ4=
X-Google-Smtp-Source: ABdhPJxKFT6NS8bw70/CxRGAzVzqrsO1KTheuRVbQod9RkhnEixN4kCQw4cIIdPb2n5MrDeRy4MVVg==
X-Received: by 2002:a05:6830:4411:: with SMTP id q17mr16455010otv.48.1631036935500;
        Tue, 07 Sep 2021 10:48:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21sm2378650ooy.5.2021.09.07.10.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 10:48:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <CAHk-=wgZkQ+eZ02TaCpAWo_ffiLMwA2tYNHyL+B1dQ4YB0qfmA@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <1b7cac01-adab-e2d4-769b-b14ed8903ad9@roeck-us.net>
Date: Tue, 7 Sep 2021 10:48:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgZkQ+eZ02TaCpAWo_ffiLMwA2tYNHyL+B1dQ4YB0qfmA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/7/21 10:10 AM, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 2:11 AM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>>> x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:452:13: error: stack frame size (1800) exceeds limit (1280) in function 'dcn_bw_calc_rq_dlg_ttu' [-Werror,-Wframe-larger-than]
>>> x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn21/display_rq_dlg_calc_21.c:1657:6: error: stack frame size (1336) exceeds limit (1280) in function 'dml21_rq_dlg_get_dlg_reg' [-Werror,-Wframe-larger-than]
>>> x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn30/display_rq_dlg_calc_30.c:1831:6: error: stack frame size (1352) exceeds limit (1280) in function 'dml30_rq_dlg_get_dlg_reg' [-Werror,-Wframe-larger-than]
>>> x86_64-alpine.log:drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn31/display_rq_dlg_calc_31.c:1676:6: error: stack frame size (1336) exceeds limit (1280) in function 'dml31_rq_dlg_get_dlg_reg' [-Werror,-Wframe-larger-than]
>>> x86_64-alpine.log:drivers/vhost/scsi.c:1831:12: error: stack frame size (1320) exceeds limit (1280) in function 'vhost_scsi_release' [-Werror,-Wframe-larger-than]
>>>

FWIW, the above is because of

static void vhost_scsi_flush(struct vhost_scsi *vs)
{
         struct vhost_scsi_inflight *old_inflight[VHOST_SCSI_MAX_VQ];

where VHOST_SCSI_MAX_VQ=128. Presumably some versions of clang inline
this function. gcc has the same problem here - its stack frame size is
also > 1024 for vhost_scsi_flush().

Guenter
