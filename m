Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22323C2C0
	for <llvm@lists.linux.dev>; Fri, 28 Jul 2023 06:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690527295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bj0unbsgzTyLqXvVgkRn1pNWfHKbeGC/DCkbHQPV1hI=;
	b=Onm2ZSngl/iOLSvNhICMK2daFAWsnCkF37sinuny4ufOJ5KPRe8SuGVl6WSR+tawAaQ/Zw
	WMVhhPdqy+GM1I8GJNSURdN0kcFsjrB9etM+J5lP7TWOGMD+M8drr73GIsE1UYbu7EhmWX
	XmnQQinbNoc4eQx87lwMDpEnDcv/aF0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-269-gGIGRHLtO42FSI-Mgep3Og-1; Fri, 28 Jul 2023 02:54:52 -0400
X-MC-Unique: gGIGRHLtO42FSI-Mgep3Og-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5224c6b937bso1036947a12.0
        for <llvm@lists.linux.dev>; Thu, 27 Jul 2023 23:54:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690527291; x=1691132091;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bj0unbsgzTyLqXvVgkRn1pNWfHKbeGC/DCkbHQPV1hI=;
        b=AdojB4fL8gG6k+YMySNGTlp95LYnZMrx8vIwxl/TLpmpD7O/fuyMYdnYMsH2xKGM9m
         qHKBYe9jKhGr/rGgvnCB5ev/hSJlVpW8g1pMDbirc6wmDr4XgSJgSxCCm3/d/9oDKROo
         PAwIoOqV+eflc37zdP6REcO29zhRgFRLNL3qRu6vzINhTUSNqyni/0Pd4zLWOvdIVbva
         5pLUJwORCcxH+SomYwgnuU11JqYV+f5aAF+fRlD8rfcoDevoG0mscB86vaOL3RNCU9cv
         A4rRKFdIhymMiFD3INnQ8Jt+F7UjfSy/nhKzPc3VxjaEcJ4TneQDeKMP1WiFO+1+byWO
         u6Zg==
X-Gm-Message-State: ABy/qLZUHJDf5bxUmsqr8KONcgRrQfiy9vi0eSWsLgBnuIXA6Of22a1O
	1O/gtoYnso7BBbWlc2NmiDAw/Z+vWgMr98ELn6mbMcZRitduBLlooYGnYJfKt0sNTPialL2j7KG
	ybGTufF4Mi6CJzX9p9cc03lYkb9EZ2g==
X-Received: by 2002:aa7:d507:0:b0:522:29b7:741d with SMTP id y7-20020aa7d507000000b0052229b7741dmr875207edq.29.1690527291706;
        Thu, 27 Jul 2023 23:54:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEYESMvZST052Gx5ljC9nktz+PQBfpCV/crEEkYr/ZCFBfd+cLigELjNsYPntG1kaBkcalrkjh4xKMsu7HSDKA=
X-Received: by 2002:aa7:d507:0:b0:522:29b7:741d with SMTP id
 y7-20020aa7d507000000b0052229b7741dmr875196edq.29.1690527291400; Thu, 27 Jul
 2023 23:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <65365.123072800401200236@us-mta-556.us.mimecast.lan> <ZMNKpJCzbAERwqp/@MiWiFi-R3L-srv>
In-Reply-To: <ZMNKpJCzbAERwqp/@MiWiFi-R3L-srv>
From: Bruno Goncalves <bgoncalv@redhat.com>
Date: Fri, 28 Jul 2023 08:54:39 +0200
Message-ID: <CA+QYu4pHZjgXriy4rmvdpYnPcRbzs1_mEF=fdUJxLQs7WEsYEQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9D=8C_FAIL_=28SKIPPED_191_of_328=29=3A_Test_report_for_m?=
	=?UTF-8?Q?aster_=286=2E5=2E0=2Drc3=2C_mainline=2Ekernel=2Eorg=2Dclang=2C_57012c57=29?=
To: Baoquan He <bhe@redhat.com>
Cc: cki-project@redhat.com, yiyan@redhat.com, llvm@lists.linux.dev, 
	xiawu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Jul 2023 at 06:57, Baoquan He <bhe@redhat.com> wrote:
>
> Hi CKI team,
>
> On 07/28/23 at 04:40am, cki-project@redhat.com wrote:
> > Hi, we tested your kernel and here are the results:
> >
> >     Overall result: FAILED
> >              Merge: OK
> >            Compile: OK
> >               Test: FAILED
> >
> >
> > Kernel information:
> >     Commit message: Merge tag 'net-6.5-rc4' of git://git.kernel.org/pub=
/scm/linux/kernel/git/netdev/net
> >
> > You can find all the details about the test run at
> >     https://datawarehouse.cki-project.org/kcidb/checkouts/97648
> >
> > One or more kernel tests failed:
> >     Unrecognized or new issues:
> >           x86_64 - kdump - sysrq-c
> >                    Logs: https://datawarehouse.cki-project.org/kcidb/te=
sts/8928580
> >                    Non-passing subtests:
> >                        =E2=9D=8C FAIL /kdump/crash-sysrq-c
> >           x86_64 - kdump - file-load
> >                    Logs: https://datawarehouse.cki-project.org/kcidb/te=
sts/8928581
> >                    Non-passing subtests:
> >                        =E2=9D=8C FAIL /kdump/crash-sysrq-c
> >           x86_64 (debug) - Boot test
> >                    Logs: https://datawarehouse.cki-project.org/kcidb/te=
sts/8928644
> >                    Non-passing subtests:
> >                        =E2=9D=8C FAIL distribution/kpkginstall/journalc=
tl-check
>
> All these failure cases have empty console.log, there's no way to check
> what's going on there. The empty console.log is related to 1st kernel,
> there must something wrong withih it.

Thanks, yes it is a pain. Sometimes the serial console in the machines
don't work at all, that's why the console.log is empty.
I wonder if the kdump tests would upload journalctl logs, we would be
able to use it to check for failures instead of relying only on
console.log.

Bruno
>
> Thanks
> Baoquan
>

