Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F7A393DE9
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375198; cv=none; b=DGy0/GaGR29ClMM27uvMD9UN1ZFu2sMrKgZ/UwlBpE2kUd7hccIEIUQDVUEXpiQWxytxNJIpZm6C+yMTBS7t23Onte8TWSVly3yZ0+hjQLs1AEDFPpQwxvRQ3EqlhFzwDcc3GTexVZTybTGP1Am4ptONAHzZtEgcJ6J455f2oA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375198; c=relaxed/simple;
	bh=SqyZHDigu6Kns9RuLEL1mq2MDgwybomAGxJ9GyHaxQ8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=lYOthjxdZDyRuOnhOJF9Bf012bVX/N8bkGlyqv1eHbX7bqaB3QgWzN3jVK0kdCJy6halvj3tDY1nQcvtvj13BjHaP4DYU2jixUtOrSDM1+e4xC90YEO4g4yzc12yIeUUh0yVb90b6IxfMKmCQHSkAWReakkk2Rmrf2F85P0tBgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S7yZxLM1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S7yZxLM1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770375196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TBXvsriaK3eAJSZsrDyj9/rbH8NRGLFPNoqW9TJAA50=;
	b=S7yZxLM1cacrauKEKpkOyB8Zqgrfutp692nP2CJVZulItlTVEnraPMXfRgt1mecm/X6tFE
	6NgH9FHEuMpjrES9xQT64zLIgEVccKIBGaLZTUe9MsAkszxE64178fGFiX7aPGMxaHBE93
	4gphZH8KMNZQd5/I4z+GOl7Cfev+xLo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-jkJAegTbMcaK569bzQ4zFQ-1; Fri,
 06 Feb 2026 05:53:15 -0500
X-MC-Unique: jkJAegTbMcaK569bzQ4zFQ-1
X-Mimecast-MFC-AGG-ID: jkJAegTbMcaK569bzQ4zFQ_1770375194
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D72518002FB
	for <llvm@lists.linux.dev>; Fri,  6 Feb 2026 10:53:14 +0000 (UTC)
Received: from [172.20.128.30] (unknown [10.30.44.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0EEB418003F5;
	Fri,  6 Feb 2026 10:53:13 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 10 of 137): Test report for master
 (6.19.0-rc8, upstream-mainline, 8fdb05de)
Date: Fri, 06 Feb 2026 10:53:13 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <80418.126020605531500265@us-mta-481.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zUxuJebVMSxJyGVhUwi4Qt7lde33e2DROQ7vZ0lK97k_1770375194
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
    Commit message: Merge tag 'net-6.19-rc9' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2308586228

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
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
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    kselftests upstream - net [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]


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

