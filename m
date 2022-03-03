Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAFF33C7
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 11:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646307716;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aqBSrbSdMNwPK2ZUsZhrHTBj0wDT7DRz3Uh9oe8j24M=;
	b=UFLUs2XZbf8NdvAiNFZpBrIBJIAxUuhHA48PW43xItyyMISV7YeqG4QCZZYjEZl8BJLH3+
	aJBs+kQ/judfGlpEKF1ysFuMTlHUKKKa6wyIuJDsIQ6deib0GLV8VSvB4h0D8ByKD8ZXZG
	yPQ/XC2V0nmHyQq+t/VI4UsmT/m4ELk=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-205-wF3da76GMg2y2HKPYO4lgQ-1; Thu, 03 Mar 2022 06:41:55 -0500
X-MC-Unique: wF3da76GMg2y2HKPYO4lgQ-1
Received: by mail-lj1-f197.google.com with SMTP id n8-20020a2e86c8000000b002479a94c041so1804323ljj.3
        for <llvm@lists.linux.dev>; Thu, 03 Mar 2022 03:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqBSrbSdMNwPK2ZUsZhrHTBj0wDT7DRz3Uh9oe8j24M=;
        b=u3+kanW7vhx+OHUQC4bWNgx5FAJYtL+RqlbjV9ifHzgk/amyne1e+SaldiSB3MIKLf
         XIDlIRRnDC6wvmBjhbKhUr4UEEZOJT2L+hIO19wOo/GakSwbBLghi+3q6sn7wAZhp1q6
         zLYu7Nfng2QcgU+4iRnj8b1msqvBCFGXd2scUZLpwW4FWuLqa5ZjPCIr1Az9cCyltZoT
         huPTAk2HHn2UDRlQtSjW57IOfUVRnUCFc5udkwg39ICEIMslLOu/FXw7GS+oloaxEqHM
         y3p7J3HxF2s+rSyp+Ys8lpSjUwku0OokzzroFhjEYBmT61s/IuE+vakgIpLc7iTtSXBR
         kWXg==
X-Gm-Message-State: AOAM532EvjPAMP8MtYBTQI2hd1NrXhTAAI8A+1cIZVs8EO/btBod94O3
	sAxgx2aNdlzN8/jQA/kwhNQMwrCVo4aB8jrrG0ifPGcBxwqKiuOvqa/lH3T1eYyAI4ti4Rrb2k8
	HzYyhwrZqnf3D5sB3/OACS4fc1Fknog==
X-Received: by 2002:a05:6512:490:b0:443:d65a:2bc8 with SMTP id v16-20020a056512049000b00443d65a2bc8mr20830481lfq.579.1646307713162;
        Thu, 03 Mar 2022 03:41:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxI2CyAVDrRpKoot3YdtX360CQv7KQn1exb01Q3XrvX14zqrROec19o0dyRL/oekGIY04Kwk/Rp60Fag1A7Wds=
X-Received: by 2002:a05:6512:490:b0:443:d65a:2bc8 with SMTP id
 v16-20020a056512049000b00443d65a2bc8mr20830459lfq.579.1646307712908; Thu, 03
 Mar 2022 03:41:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220127151945.1244439-1-trix@redhat.com> <d26d4bd8-b5e1-f4d5-b563-9bc4dd384ff8@acm.org>
 <0adde369-3fd7-3608-594c-d199cce3c936@redhat.com> <e3ae392a16491b9ddeb1f0b2b74fdf05628b1996.camel@perches.com>
 <46441b86-1d19-5eb4-0013-db1c63a9b0a5@redhat.com> <8dd05afd-0bb9-c91b-6393-aff69f1363e1@redhat.com>
 <233660d0-1dee-7d80-1581-2e6845bf7689@linux-m68k.org>
In-Reply-To: <233660d0-1dee-7d80-1581-2e6845bf7689@linux-m68k.org>
From: Konrad Wilhelm Kleine <kkleine@redhat.com>
Date: Thu, 3 Mar 2022 12:41:41 +0100
Message-ID: <CABRYuG=WCBLp+roXzdEZE-X_HHDtwnN-S-CsA2V41h-1v3otnA@mail.gmail.com>
Subject: Re: [PATCH] scsi: megaraid: cleanup formatting of megaraid
To: Finn Thain <fthain@linux-m68k.org>
Cc: Tom Rix <trix@redhat.com>, Joe Perches <joe@perches.com>, 
	Bart Van Assche <bvanassche@acm.org>, kashyap.desai@broadcom.com, sumit.saxena@broadcom.com, 
	shivasharan.srikanteshwara@broadcom.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, nathan@kernel.org, ndesaulniers@google.com, 
	megaraidlinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kkleine@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

(Resending in plain text format to make mailing lists happy.)

Hi Finn,

On Thu, 3 Mar 2022 at 09:40, Finn Thain <fthain@linux-m68k.org> wrote:
>
>
> On Wed, 2 Mar 2022, Tom Rix wrote:
>
> > >>> Long term, it would be good have a reliable way to automatically fix
> > >>> either new files or really broken old files.
> > >> That's really a maintainer preference no?
> > >>
> > >> Especially so for any automation.
> > >
> > > In practice everything is up to the maintainer.
> > >
> > > If some maintainer wants fix their formatting then clang-format should
> > > just work
> > >
> > > It isn't likely they will have time to hand fix every file.
> >
> > A follow up issue in the clang project has been raised by Konrad, here
> >
> > https://github.com/llvm/llvm-project/issues/54137
> >
>
> Why request a "leave" option for every style rule? Why not just a "leave"
> option for the most contentious rules?


Getting to the point that every style option can be disabled
individually is not an operation done in one go. I plan on presenting
the changes required to exactly one style option and from there I'm
all ears if you have style options that you consider "contentious". We
could certainly tackle them next. But for starters I think it's fine
to just show the impact of changing one style option only.

>> The response from the developers that anyone who wants to leave existing
>> code unmolested by certain rules should "wake up and smell the coffee" is
>> obnoxious, IMO.

I hear you, I like tea better than coffee ;). In all seriousness, I'm
here to help and I don't judge the developers for protecting their
code and having an opinion about other projects. We're here to talk
and find a solution, nothing more. Let's try to ignore the sarcastic
undertone in the dialogue.

>> Presumably clang-format must grow until it has sufficient program logic
>> and config options to cater to every exception to every rule. How long
>> will that take? Some carefully chosen "leave" options might make the
>> program much more useful in the near term.

That's what I aim at. I hope I've outlined this in the first paragraph
of this email. One baby step at a time...
- Konrad

>
>
>
> > Tom
> >
> >
> > >
> > > Tom
> > >
> > >>
> > >>
> >
>

