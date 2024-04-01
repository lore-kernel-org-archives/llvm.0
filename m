Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539591E888
	for <llvm@lists.linux.dev>; Mon,  1 Apr 2024 12:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711975887; cv=none; b=oiZBt3+juCBxe/E2cH5rZUEVzZs/DNtOMUKZakh3PJ63HibhymwLmAsv/V842bjOmzeGrOHgUYfeJBMwsFJ0YDuWUib8lByN5MP6pfJb91Vb3KIVbPk3vqCJ+vUe+V27uwrQSYaT4EKqkqx/8owDf97lAFS67bMTt6iftz3ldhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711975887; c=relaxed/simple;
	bh=028PM49KK1V7nnAloB+GkpIWLsg7IJFIvByC32Ujwac=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eWJlRRKOgQ0XTYquuPEqw3I62j14ZzqmufjPgsWLd5RaZZT/mJ0XxAnZk1zeXzVf4sJnzwCn1PFqMYoujeALk62JTUgg6iFc/pjR8j9Ct3uO0HXy07JK5umbGctOg8CapUSdYBAQYKO8idLETPJpMbQmLFINWxrn8rdtYVtmmI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R7NIY749; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R7NIY749"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711975884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ia7udztRkNsN/65KMh5zI5ehWOL6vzs6g7ERLqlPlPg=;
	b=R7NIY749ZGkCi1u4l70ljDSyzFiDxLxEV9Xtm6EQdwC+RvyIBaeqh44yAVP8XqMcwRc4Xf
	lMp68K6Dd1sRI+sTaDPn1vj0UIk1mUeOvrB2mTA1CWhSwwVJ0Dii9HEcz1LJD5XLJWlUQc
	LwFL54WPdPDnmgzb7SYGstUL4eRTvjg=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-139-3Y-fOlAAMsaJBHLu3ikLLQ-1; Mon,
 01 Apr 2024 08:51:22 -0400
X-MC-Unique: 3Y-fOlAAMsaJBHLu3ikLLQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81CBC1C031A4
	for <llvm@lists.linux.dev>; Mon,  1 Apr 2024 12:51:22 +0000 (UTC)
Received: from [172.64.11.58] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8039F492BC7;
	Mon,  1 Apr 2024 12:51:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.9.0-rc2, mainline.kernel.org-clang, 39cd87c4)
Date: Mon, 01 Apr 2024 12:51:21 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
Message-Id: <74941.124040108512201161@us-mta-139.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Linux 6.9-rc2

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/138186

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11857133
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/129
                       =E2=9D=8C FAIL generic/135
                       =E2=9D=8C FAIL generic/141
                       =E2=9D=8C FAIL generic/169
                       =E2=9D=8C FAIL generic/198
                       =E2=9D=8C FAIL generic/207
                       =E2=9D=8C FAIL generic/208
                       =E2=9D=8C FAIL generic/210
                       =E2=9D=8C FAIL generic/211
                       =E2=9D=8C FAIL generic/212
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/245
                       =E2=9D=8C FAIL generic/246
                       =E2=9D=8C FAIL generic/248
                       =E2=9D=8C FAIL generic/249
                       =E2=9D=8C FAIL generic/257
                       =E2=9D=8C FAIL generic/308
                       =E2=9D=8C FAIL generic/309
                       =E2=9D=8C FAIL generic/310
                       =E2=9D=8C FAIL generic/339
                       =E2=9D=8C FAIL generic/340
                       =E2=9D=8C FAIL generic/344
                       =E2=9D=8C FAIL generic/345
                       =E2=9D=8C FAIL generic/346
                       =E2=9D=8C FAIL generic/354
                       =E2=9D=8C FAIL generic/360
                       =E2=9D=8C FAIL generic/406
                       =E2=9D=8C FAIL generic/412
                       =E2=9D=8C FAIL generic/420
                       =E2=9D=8C FAIL generic/428
                       =E2=9D=8C FAIL generic/433
                       =E2=9D=8C FAIL generic/437
                       =E2=9D=8C FAIL generic/439
                       =E2=9D=8C FAIL generic/443
                       =E2=9D=8C FAIL generic/446
                       =E2=9D=8C FAIL generic/451
                       =E2=9D=8C FAIL generic/452
                       =E2=9D=8C FAIL generic/460
                       =E2=9D=8C FAIL generic/524
                       =E2=9D=8C FAIL generic/532
                       =E2=9D=8C FAIL generic/565
                       =E2=9D=8C FAIL generic/567
                       =E2=9D=8C FAIL generic/590
                       =E2=9D=8C FAIL generic/591
                       =E2=9D=8C FAIL generic/609
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11857132
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/129
                       =E2=9D=8C FAIL generic/354

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftests: bpf:test_tunnel.sh [FAIL]
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1749
            Affected tests:
                kselftests upstream - bpf [x86_64 (debug)]
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                Storage - blktests - blk - upstream [aarch64, s390x, x86_64=
]
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                stress: stress-ng - memory [aarch64, s390x, x86_64]
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                AMTU (Abstract Machine Test Utility) [s390x]
                Boot test [s390x]
                Filesystem - Loopdev Sanity [s390x]
                Libkcapi AF_ALG test [s390x]
                machineinfo [s390x]
                Networking cki netfilter test [s390x]
                Networking vnic: ipvlan/basic [s390x]
                POSIX pjd-fstest suites [s390x]
                Reboot test [s390x]
                Storage - blktests - blk - upstream [s390x]
                Storage - blktests - nvme-tcp - upstream [s390x]
                Storage - swraid scsi_raid [s390x]
                stress: stress-ng - cpu-cache [s390x]
                stress: stress-ng - memory [s390x]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [Rawhide] readpage_elf: Attempt to read non-existent page at=
 __exclude_unnecessary_pages: Can't read the buffer of struct page
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2269991
            Affected tests:
                kdump - file-load [ppc64le]
                kdump - sysrq-c [ppc64le]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [x86_64 (debug), aarch64, s390x, x86_64, =
ppc64le]


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

