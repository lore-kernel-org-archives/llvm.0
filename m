Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352B57C
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 08:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F1FC433D7
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668674784;
	bh=lshv90GZvIIRK6CiPhX598Z0NXfqQjkAdH3RaDMv5VI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=d0hcPwKzEfs1lv4OaZrbN3ZNYCAkm29GSEit52jIcUg753Kj+muX8W/fHJRG3c9r+
	 WwoJnWxeMiltcaiOl+UqIHLNkGxEL21PsplJXmZrjuUYdlzgzRJH3l8F1eK3+NDlC4
	 1PUuT46bIyl+hxjjiQhnjo2l4BPu473q9AoLMRHnw1EAPLmFq5DMEwdJuv56HRKaJn
	 VoINiUsG09nS8J2JNv8kteRpa8F+hl+NsdG9CCkl1Uu++YtdUS4XODI7nPTCSACkf0
	 ZNC6gZxbXieI6nkVnRTjwh8h8hqEdQ/7EQhsk+W3bvANqKHZZtZ6tNDm3K825XxAjY
	 H+geQLE4LTUdQ==
Received: by mail-yb1-f178.google.com with SMTP id i131so1063292ybc.9
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 00:46:24 -0800 (PST)
X-Gm-Message-State: ANoB5pmvd5idHkOB1m6tHLCDL7GcgzWW1GyQUNJhrlarGsV5+DFaa8wv
	10lXNg2+accPqg8vzAhchr6+0T0cJ1OPFU6zErA=
X-Google-Smtp-Source: AA0mqf6HeEJZ+tdQw5CBNfxZKT4jBpeHrgZVXlfuQnhJWeQGG5PT1VyndJ7zdBDZbvkTJhvXL8jiWN3PXlXdLSAlpMU=
X-Received: by 2002:a25:83c7:0:b0:6dd:1ffe:2028 with SMTP id
 v7-20020a2583c7000000b006dd1ffe2028mr1209144ybm.550.1668674783929; Thu, 17
 Nov 2022 00:46:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221116134126.199087-1-marpagan@redhat.com> <Y3T/ESXEb+MF2QEW@kroah.com>
In-Reply-To: <Y3T/ESXEb+MF2QEW@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Thu, 17 Nov 2022 10:45:57 +0200
X-Gmail-Original-Message-ID: <CAFCwf1193-TiMdx3unuHC1H4zK+7qYg_4A5mtOB7VGmqZ6M6HQ@mail.gmail.com>
Message-ID: <CAFCwf1193-TiMdx3unuHC1H4zK+7qYg_4A5mtOB7VGmqZ6M6HQ@mail.gmail.com>
Subject: Re: [PATCH] habanalabs: added return value check for hl_fw_dynamic_send_clear_cmd()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Marco Pagani <marpagan@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 16, 2022 at 5:17 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Nov 16, 2022 at 02:41:25PM +0100, Marco Pagani wrote:
> > The clang-analyzer reported a warning: "Value stored to 'rc' is never
> > read".
> >
> > The return value check for the first hl_fw_dynamic_send_clear_cmd() call
> > in hl_fw_dynamic_send_protocol_cmd() appears to be missing.
> >
> > Signed-off-by: Marco Pagani <marpagan@redhat.com>
> > ---
> >  drivers/misc/habanalabs/common/firmware_if.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/misc/habanalabs/common/firmware_if.c b/drivers/misc/habanalabs/common/firmware_if.c
> > index 2de6a9bd564d..311942108dbc 100644
> > --- a/drivers/misc/habanalabs/common/firmware_if.c
> > +++ b/drivers/misc/habanalabs/common/firmware_if.c
> > @@ -1782,6 +1782,8 @@ int hl_fw_dynamic_send_protocol_cmd(struct hl_device *hdev,
> >
> >       /* first send clear command to clean former commands */
> >       rc = hl_fw_dynamic_send_clear_cmd(hdev, fw_loader);
> > +     if (rc)
> > +             return rc;
> >
> >       /* send the actual command */
> >       hl_fw_dynamic_send_cmd(hdev, fw_loader, cmd, size);
>
> Are you sure this is ok?  If the first "clean the buffer" command fails,
> all should still be good as that wasn't the real command.
>
> But maybe the hardware will never fail this?
>
> thanks,
>
> greg k-h

Actually it's a real mistake, it was overlooked when the code was
written (although chances of failure in clear cmd are very small).
I'll apply it to my tree.
Reviewed-by: Oded Gabbay <ogabbay@kernel.org>
Thanks,
Oded
