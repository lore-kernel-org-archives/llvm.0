Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB92E11D0
	for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 03:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750043533; cv=none; b=pFmqMieIPEhN1tCFdXPwQgSyqBH8obH8OfMMlMQuuSu5C/7Hjxonr61LtZzMv8U1Gcheakj2HwYrr0Rw99u3NwIT3DZOSno8NBQkQJolUKAnjILTV3ZL2wFztwo1Y27VU5Ywbw1vKKVHl36z8FbVLkj/6CgJ4maG/gFEPayitpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750043533; c=relaxed/simple;
	bh=fK3JIcuOGDmJs3xtYIftmqP4IZNHQcv1Byz5o0WFvZI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Yd20alwbsKG3mlFTAvKdHUF11F5wNuhnDupCTL5709KRJ+gJfu0hpPSj0r9TuJRt6ONfdPF4sZUtZdzMcMZx7z9hwGiMqnnKvdv0cslMuqyAkDQkKqHRFWpmLF+S1wqLWlPjOU0z3kdGhv/ch7oDXUSPtJtDjtqo+lRGgOa4qYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fofCxQ/Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fofCxQ/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750043529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHhnjQLt8ytONkmLCieqmY+LOLNWKOvduX3+74OEAxQ=;
	b=fofCxQ/QR2Jo83O17EZVGo7BwkS81zWJh6Hqswx78vfwyzTRnhfKI4VMuQdqkPalr3NktA
	rxXD3L8+1ixuD7/zcn4UqsfgeDrx+R00CnjHdMzTPxM1rL+9fZwwsT6epGhnBGvWpA3+Qr
	bHi2JlT/Lgs0PL58ZPiA6NKZc4wA17g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-12-WUHC14RbPSK2if_rL-qIqA-1; Sun,
 15 Jun 2025 23:12:07 -0400
X-MC-Unique: WUHC14RbPSK2if_rL-qIqA-1
X-Mimecast-MFC-AGG-ID: WUHC14RbPSK2if_rL-qIqA_1750043525
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2A391800282
	for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 03:12:05 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7B0B219560A3;
	Mon, 16 Jun 2025 03:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.16.0-rc2,
 upstream-mainline, e04c78d8)
Date: Mon, 16 Jun 2025 03:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <70618.125061523120700279@us-mta-12.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pTYZylZ5VV281Nd2cxsFtnASZYz7fNPQln9RtC68c8Q_1750043525
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
    Commit message: Linux 6.16-rc2

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1870898923

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]



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

