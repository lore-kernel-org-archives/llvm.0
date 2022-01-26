Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F0168
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 10:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643191875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhIZwfc/c/lXu6BIviBn1PpkPzYO3v9VaCuPLA3WngQ=;
	b=Se/vtmg6be8LJRaO+ksgySQ5ycg40bLAALo7rc0z6v1OpR/eRE9KzoS2JVR+9k+pXfVQi/
	swN9h/ZsbrN15M2F9eDVPCG5p2WQBTqIkEyUpzglEOEk2IWZN/+4oS9RmyZoaMB4sEiAbn
	62gEMM92gCUCfK7LMqWryGciFvA+bgI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-USRI6oUMNoSOiwAFTdG7MQ-1; Wed, 26 Jan 2022 05:11:12 -0500
X-MC-Unique: USRI6oUMNoSOiwAFTdG7MQ-1
Received: by mail-lf1-f71.google.com with SMTP id m9-20020a194349000000b0043955e8f436so3226266lfj.11
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 02:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bhIZwfc/c/lXu6BIviBn1PpkPzYO3v9VaCuPLA3WngQ=;
        b=bX9APMsSRLSOBzAcjL3N8vJAfevGCIkKJlrLpGSIFf42/V0PEeaardvgqAuzKbTZBD
         4DunGAv6qmu2jcVguTJ095ti5U4IPDlp74I+uYf5tIXT+3Av8WxVj3qVW7P3x34oOz1I
         qRhaUZMI3acpDOVpLCwY89lN7clvCHGdwePKsJiu+DxrRPir2URk7M30EyoDOVoV4dnU
         IwV41CmXKN0un4ldWleC1DTymqC05DVSUnQfOH6lTns+uKLeMw+IlaGFnTfyjj+RPsNH
         D0gH3tsrDbByTJYjN1HU3SFthuDnSFQqxQjd9PXoVmSaK/u4iS3USUgQuW/XahCdFZ1b
         xiGw==
X-Gm-Message-State: AOAM530mXuv4JzcTBuvBue/b6mEny0JFZkCm+VSAMvG+f+vIFg88xNjy
	9RpBjZq8L8oMIDDpcvBx6+LQQALoP8iIOpA6SL4CzAZZjPr1LxLNG26aeDgOgRNn3Xs3mGfNQlo
	VdNB8gMd91GKv6NHgTgod+YGpEjRBVQ==
X-Received: by 2002:a19:494f:: with SMTP id l15mr19457684lfj.91.1643191870844;
        Wed, 26 Jan 2022 02:11:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYGCQjGlvubMejXywuOTwf0IeFWYbIsZk0hHljijzK/+jASV7e5HxTF5AvbQzOOspXKIp1oJGsVZK7LhAnWJs=
X-Received: by 2002:a19:494f:: with SMTP id l15mr19457674lfj.91.1643191870650;
 Wed, 26 Jan 2022 02:11:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cki.LKX9M86D1UOULT0MYKRS@redhat.com> <CAASaF6yO05hj_e-XwpuiMmvSm8zpj+v5YP4_+qHdsOegFAEUVA@mail.gmail.com>
In-Reply-To: <CAASaF6yO05hj_e-XwpuiMmvSm8zpj+v5YP4_+qHdsOegFAEUVA@mail.gmail.com>
From: Bruno Goncalves <bgoncalv@redhat.com>
Date: Wed, 26 Jan 2022 11:10:59 +0100
Message-ID: <CA+QYu4q8sD8Dm9C-JEx08_1A75HiLNjq4WNbT0VRt+qV_yut-g@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IPCfkqUgUEFOSUNLRUQ6IFRlc3QgcmVwb3J0IGZvciBrZXJuZWwgNS4xNy4wLXJjMQ==?=
	=?UTF-8?B?IChtYWlubGluZS5rZXJuZWwub3JnLWNsYW5nLCA0OWQ3NjZmMyk=?=
To: Jan Stancek <jstancek@redhat.com>
Cc: CKI Project <cki-project@redhat.com>, Li Wang <liwang@redhat.com>, 
	Memory Management <mm-qe@redhat.com>, llvm@lists.linux.dev, skt-results-master@redhat.com
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bgoncalv@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 26, 2022 at 10:49 AM Jan Stancek <jstancek@redhat.com> wrote:
>
> On Wed, Jan 26, 2022 at 2:35 AM CKI Project <cki-project@redhat.com> wrot=
e:
> >
> >
> >
> > Check out this report and any autotriaged failures in our web dashboard=
:
> >     https://datawarehouse.cki-project.org/kcidb/checkouts/30259
> >
> > Hello,
> >
> > We ran automated tests on a recent commit from this kernel tree:
> >
> >        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git
> >             Commit: 49d766f3a0e4 - Merge tag 'for-5.17-rc1-tag' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/kdave/linux
> >
> > The results of these automated tests are provided below.
> >
> >     Overall result: FAILED (see details below)
> >              Merge: OK
> >            Compile: OK
> >  Selftests compile: FAILED
> >              Tests: PANICKED
> >     Targeted tests: NO
> >
> > All kernel binaries, config files, and logs are available for download =
here:
> >
> >   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html=
?prefix=3Ddatawarehouse-public/2022/01/25/456059085
> >
> > One or more kernel tests failed:
> >
> >     s390x:
> >      =E2=9D=8C LTP - syscalls
> >      =F0=9F=92=A5 LTP - fs
>
> discussion about binfmt panic here:
> https://lore.kernel.org/all/20220124181812.1869535-2-ztong0001@gmail.com/=
T/#u

Thank you, I've added a CKI issue to track it:
https://datawarehouse.cki-project.org/issue/922

>
>

