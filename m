Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84832FB2
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750650789; cv=none; b=nEK9990VO9LrzEHAgJWNpbcwm9uTHCPtmQHiAijk/+mYMkbJvbB3Rc6/t2AzDPx7b/QQrBvh7ttmATVum/+I4UcW4TXbJiqeGVs0J1ufGl5mRR25aJvxfMOxG+yiEXFgCDbDADs4tOZ8RX+YCzSWOuEJzbvSMBN2ejW1pSze590=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750650789; c=relaxed/simple;
	bh=/TCKBz7PK0bDxPZggv9l5SExbLuZFq+uAHlsbyAN1vg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XMTP069aviRKUeO8e3/oQ/hGKskb1A+qW4vexQ+PJpYNwJoUJSyg10xxGnDpRsDmf6f2u4Uf4vbpsuDqzog2ToMxDScbN//sXzULnLfFkXCyWyH9FRJloxKx2lW3cAzvcvLV6LNl8AH4rCslKs1ZpIwkBP4+oxSEsXk8CwJqjQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q8+sCLY4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q8+sCLY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750650786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2q/01txhBFDPtUpd1nrAzOcoi4zMGSzvpY7S6zaCRMc=;
	b=Q8+sCLY4OBeKa9VIeij+afaFL45u7WrMOX91/HyjQ6OZbGHHBBo2fAYAdZD5Fnxzn402jv
	ZgVxGM85LCuV96rJD5m04vOpQfPuCwuWv6MVbR2rGhisgih3ajzpNIIEFQ9x+m84aLF2ve
	MG753R80nVfSUBnv5eZNue2BKqISZq8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-421-dEqSs5TmN2Gdbz6SkurHzA-1; Sun,
 22 Jun 2025 23:53:05 -0400
X-MC-Unique: dEqSs5TmN2Gdbz6SkurHzA-1
X-Mimecast-MFC-AGG-ID: dEqSs5TmN2Gdbz6SkurHzA_1750650784
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4F6DF1809C84
	for <llvm@lists.linux.dev>; Mon, 23 Jun 2025 03:53:04 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D327618003FC;
	Mon, 23 Jun 2025 03:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 2 of 100): Test report for master
 (6.16.0-rc2, upstream-mainline, b67ec639)
Date: Mon, 23 Jun 2025 03:53:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <68875.125062223530500279@us-mta-421.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ubq0P-x0PBEGGXDp9u02Mi0ULtF6BEaS0nVmF-qGveI_1750650784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'i2c-for-6.16-rc3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1883123284

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: kernel BUG at kernel/cred.c:104
            URL: https://lore.kernel.org/linux-nfs/20250508051829.bdv2r72l2=
o5rsbni@dell-per750-06-vm-08.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

