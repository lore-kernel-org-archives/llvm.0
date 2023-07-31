Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6CAA2C
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690785619;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EwKju+twdDvwzbpYHMz7znd4nXYV6EyX5G4TIEHmpYQ=;
	b=ZD7p2Usuc0tSfdmcOMjZlYiicVvLEunmIzQvPdOyuyoFoKUhfIbo4MH16VPgES/nZ44BiG
	cCLKMZnWCHEyrOT73C13KENErqIy78ebhA/UtGWR9qPN0jd3nTx1Wp5p32Wx+l3qhsL6Hd
	+suMRK6X6J4c8O6hbp6M669PAGbcZ/A=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-9Z9Il4-EME6Pv26DlTX-bg-1; Mon, 31 Jul 2023 02:40:16 -0400
X-MC-Unique: 9Z9Il4-EME6Pv26DlTX-bg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 648191C47663
	for <llvm@lists.linux.dev>; Mon, 31 Jul 2023 06:40:16 +0000 (UTC)
Received: from localhost (ovpn-12-42.pek2.redhat.com [10.72.12.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A853401061;
	Mon, 31 Jul 2023 06:40:15 +0000 (UTC)
Date: Mon, 31 Jul 2023 14:40:11 +0800
From: Baoquan He <bhe@redhat.com>
To: Bruno Goncalves <bgoncalv@redhat.com>, xiawu@redhat.com,
	yiyan@redhat.com
Cc: cki-project@redhat.com, yiyan@redhat.com, llvm@lists.linux.dev,
	xiawu@redhat.com
Subject: Re: =?utf-8?B?4p2MIEZBSUwgKFNLSVBQRUQgMTkx?=
 =?utf-8?Q?_of_328=29=3A_Test_repor?= =?utf-8?Q?t?= for master (6.5.0-rc3,
 mainline.kernel.org-clang, 57012c57)
Message-ID: <ZMdXS6Xfv/+Ct9tL@MiWiFi-R3L-srv>
References: <65365.123072800401200236@us-mta-556.us.mimecast.lan>
 <ZMNKpJCzbAERwqp/@MiWiFi-R3L-srv>
 <CA+QYu4pHZjgXriy4rmvdpYnPcRbzs1_mEF=fdUJxLQs7WEsYEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CA+QYu4pHZjgXriy4rmvdpYnPcRbzs1_mEF=fdUJxLQs7WEsYEQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 07/28/23 at 08:54am, Bruno Goncalves wrote:
> On Fri, 28 Jul 2023 at 06:57, Baoquan He <bhe@redhat.com> wrote:
> >
> > Hi CKI team,
> >
> > On 07/28/23 at 04:40am, cki-project@redhat.com wrote:
> > > Hi, we tested your kernel and here are the results:
> > >
> > >     Overall result: FAILED
> > >              Merge: OK
> > >            Compile: OK
> > >               Test: FAILED
> > >
> > >
> > > Kernel information:
> > >     Commit message: Merge tag 'net-6.5-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> > >
> > > You can find all the details about the test run at
> > >     https://datawarehouse.cki-project.org/kcidb/checkouts/97648
> > >
> > > One or more kernel tests failed:
> > >     Unrecognized or new issues:
> > >           x86_64 - kdump - sysrq-c
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8928580
> > >                    Non-passing subtests:
> > >                        ❌ FAIL /kdump/crash-sysrq-c
> > >           x86_64 - kdump - file-load
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8928581
> > >                    Non-passing subtests:
> > >                        ❌ FAIL /kdump/crash-sysrq-c
> > >           x86_64 (debug) - Boot test
> > >                    Logs: https://datawarehouse.cki-project.org/kcidb/tests/8928644
> > >                    Non-passing subtests:
> > >                        ❌ FAIL distribution/kpkginstall/journalctl-check
> >
> > All these failure cases have empty console.log, there's no way to check
> > what's going on there. The empty console.log is related to 1st kernel,
> > there must something wrong withih it.
> 
> Thanks, yes it is a pain. Sometimes the serial console in the machines
> don't work at all, that's why the console.log is empty.
> I wonder if the kdump tests would upload journalctl logs, we would be
> able to use it to check for failures instead of relying only on
> console.log.

Thanks, Bruno.

It could be a little helpful to have journalctl logs. However, it may
not help much in kdump case. When I check these kdump failure case of CKI, I
usually check test_console.log firstly. If test_console.log is
incomplete, I will check console.log because console.log contains all
printed log on console.

As for journalctrl logs, it can only get the boot log of 1st kernel. As
for kdump boot log, e.g kdump boot could hang in early stage or the
middle of bootup, the journalctl log doesn't make any sense.

So for kdump, console log is very important.

Thanks
Baoquan

