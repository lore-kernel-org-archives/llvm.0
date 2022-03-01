Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1177C
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 20:15:05 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id v28so23365534ljv.9
        for <llvm@lists.linux.dev>; Tue, 01 Mar 2022 12:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4eHzcr1YBGh9o3F4BfOGRvjDUMT5g6q2aQ+3yXHWlOo=;
        b=IZ7/AMI7eJ+ZC/a6fwyXrw1yeswUH52MRpfmJL+44Eql30HG9WzC+yjvRBlCihk6qS
         EvBYRMpstobbwMQtFKPVT7whOd7g6EVNZ9/wh7HN9tT37SQk/kV5yveCnI1WKJxZgJfl
         u5hnXn2wSwbpo9fmHyh7tnjuQRET8kflkToPHzIjsE09X8R0kVDj2vdGuFiwf8ERMe6P
         ZUYFx2H+eXSISc3wqYR+rj1jGJiYrqhXhAk2plKyJAwvUaqs44FoSzMAFM70O9Zf7sm+
         roIZG0kJTwRPMpvGKMjoahCaVCHPIeV7xANIw5S+Q6dN5bwJxAjfKupRq3TdUUvC7rAX
         ewCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4eHzcr1YBGh9o3F4BfOGRvjDUMT5g6q2aQ+3yXHWlOo=;
        b=LmXGPwufHCzDazaiOwcbwXW2fqeU3bisQoTlvsJFVqj5DO085pEXaWaxgsZ3ohEL9h
         WouJMeWn1aZdh1ZINBVeLiMPerdx+tGUq3jAiQbpNfIsZjEUgjqlV/qP4X/iJCau/V69
         6FkeEQXoOGF8muqJKsULWgTxH3U4QJTMj169PY9w3UA26dV9S8SmaLrAOeKc3kRIZxUR
         RYc2MzDIoYjqMs4e45nCihk8AWvAb+6leN4mnJyyrJkjzfXbkPAFjmJaOzi3Lr4MijoX
         q1sBhoxrp6dNFov32UdYHaGf9RQI9VxaDnm+tMRrcemLXxd7kEAasiEabRN3Ga8nlM3V
         2PXg==
X-Gm-Message-State: AOAM532i2EOKU/wTC2mIPZRLeWZFPvHj/cBJa6YvTRuTrhxhob9AANkb
	Zt6qhO8w8gjOjWjbZNkLvXR5kufyS/yaH0N7GX57fQ==
X-Google-Smtp-Source: ABdhPJzNPHP87nTATQhKnvYuvIArBZyNmAuESqaseKTw/6hflPbUYbtD2HuT0mMBWgoGoh8R52W1FO0GY7/eOoWfE0w=
X-Received: by 2002:a2e:3004:0:b0:223:c126:5d1a with SMTP id
 w4-20020a2e3004000000b00223c1265d1amr18945849ljw.408.1646165703196; Tue, 01
 Mar 2022 12:15:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220217153842.3252424-1-trix@redhat.com> <51018469-3bab-e56d-7407-b16170b5d74c@amd.com>
 <CADnq5_OGEURo76mzc4Sb2Jar465Xt4vkSMECDi5jCMH332zUAg@mail.gmail.com>
 <CAKwvOdnYTC7mku1=eVaDLGQFHdoN3u8Afoo582OAQ+ApJmfhQQ@mail.gmail.com>
 <CADnq5_PniW+-8G5AhOSwuovESpfeMxL4r6P30b3F1coa_NmMEQ@mail.gmail.com> <CAOWid-cXYze56YmUACWP4emNeGHXMFf4q5aZfFGUwVXWNFAvSg@mail.gmail.com>
In-Reply-To: <CAOWid-cXYze56YmUACWP4emNeGHXMFf4q5aZfFGUwVXWNFAvSg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Mar 2022 12:14:51 -0800
Message-ID: <CAKwvOdn52Kn1dnmp9cCwJtv5kPwZfHgApzhzajsdkjOwF8XqVA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix amdgpu_ras_block_late_init error handler
To: Kenny Ho <y2kenny@gmail.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Joshi, Mukul" <mukul.joshi@amd.com>, 
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

On Tue, Feb 22, 2022 at 11:12 AM Kenny Ho <y2kenny@gmail.com> wrote:
>
> On Thu, Feb 17, 2022 at 2:06 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > On Thu, Feb 17, 2022 at 2:04 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > >
> > > Alex,
> > > Has AMD been able to set up clang builds, yet?
> >
> > No.  I think some individual teams do, but it's never been integrated
> > into our larger CI systems as of yet as far as I know.
>
> I have just added clang build to our CI last night so hopefully we
> should be catching these now.

Wonderful! ++beers_owed;
-- 
Thanks,
~Nick Desaulniers
