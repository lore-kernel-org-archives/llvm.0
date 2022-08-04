Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E43C5384
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 18:52:28 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id f22so775374edc.7
        for <llvm@lists.linux.dev>; Thu, 04 Aug 2022 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=d9A+1UrQLh0WcW9MhwNlbIKjJoOc9nVaeZ+f3kn5XJg=;
        b=Wghr6irArPcwVSc+CNnhrrsEu9dnr4MgYqspEvpRuXFzsOtqFWg2OW0RZw0DsbJhbG
         7KYJuxI+hGsaf1e3eCH86NhWL3mKYHLchNkwelwizVdbqx2TCHmSyTmd7/UiTNDRDtqj
         1bkDxMnc43SYw+VE+NmTMF0O+9AkEy2ziVWdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=d9A+1UrQLh0WcW9MhwNlbIKjJoOc9nVaeZ+f3kn5XJg=;
        b=r/fFOAN8ArYv1/DvhiweY2DK63RaAZX0vcqlR5fcPZYJlQuPsAEKtvQ1oXvWjTCux9
         VBtY3XesW1MXdzXn6uVfgO0AUjAzm3N22phLPg+b1PGKe5J2CyOeDsxyLdQEnuYf2dBe
         JHlcN3MTF/hawPl/4jpF8825BvkjlNjxAMnoD0y6YYsj4bRtU2g4Ho5QCEChjAwtyw/G
         Dp8G1YtDHobPSAAJ6vNtchUaGkWXX8l2O3mXvXS8eFzFkd4oB4mlTiwfAsO9G1Ta8+/6
         0x++PLH0YmI+pbqlB22tdeWDKTL4mD+SX34iZ+OvP940Q7XTQA48JUnv7QXBrw2kxCUd
         l26w==
X-Gm-Message-State: ACgBeo3vFowAVZiSTmGXT4llhDHuMGaqq9pDBlT8k0iJ9XVj7o1l2ep9
	S06h4xBqzOcPnCPtXQTyOXYwPeo405tVrJ67
X-Google-Smtp-Source: AA6agR7doc8pAmNGG2DTv60SD7YDwBP5QrRvJZsTre85yp1cmE/OwT1C/yPKajwA/Z8IUmBNeNloqw==
X-Received: by 2002:a05:6402:3485:b0:43d:7fe0:74d1 with SMTP id v5-20020a056402348500b0043d7fe074d1mr3380976edc.413.1659639147163;
        Thu, 04 Aug 2022 11:52:27 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com. [209.85.221.49])
        by smtp.gmail.com with ESMTPSA id y2-20020a170906448200b00730ba005b39sm613279ejo.132.2022.08.04.11.52.25
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 11:52:25 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id j1so821590wrw.1
        for <llvm@lists.linux.dev>; Thu, 04 Aug 2022 11:52:25 -0700 (PDT)
X-Received: by 2002:adf:edcb:0:b0:21e:d043:d271 with SMTP id
 v11-20020adfedcb000000b0021ed043d271mr2265646wro.274.1659639145076; Thu, 04
 Aug 2022 11:52:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian>
In-Reply-To: <YuwRyQYPCb1FD+mr@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Aug 2022 11:52:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
Message-ID: <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 4, 2022 at 11:37 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> git bisect points to 3876a8b5e241 ("drm/amd/display: Enable building new display engine with KCOV enabled").

Ahh. So that was presumably why it was disabled before - because it
presumably does disgusting things that make KCOV generate even bigger
stack frames than it already has.

Those functions do seem to have fairly big stack footprints already (I
didn't try to look into why, I assume it's partly due to aggressive
inlining, and probably some automatic structures on stack). But gcc
doesn't seem to make it all that much worse with KCOV (and my clang
build doesn't enable KCOV).

So it's presumably some KCOV-vs-clang thing. Nathan?

              Linus
