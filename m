Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4DB645
	for <llvm@lists.linux.dev>; Tue, 14 May 2024 05:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715663877; cv=none; b=bywHY9BJqsbEiy8i4uJAu1Fwz8ETdum/zjufmZb8Kk80KlzTEcxFaMRBMJZVu86NC5KDME57LPnFAi5jah7nCCGdJq36pEPSUGsUuGlOGp9u7oVEPLhVzqHrtOiADy26S37/Nie7VMNj5VKs2kUzaiH3JUfV9LnE/UgAUck+UAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715663877; c=relaxed/simple;
	bh=BHUpEHPhZQFbftFIQECjtdHAN1r3bFsB8Fq2axg00zY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=E1J/E21r0Ec64xca+IdFG3sOLjVgQj/wohSBEYQO3GA2TnCka2JGLywcvrkwAeeTUMNRRmgxf4jwVEtnDZNL6WmxcvVOzGIRFR5lXvFHjZMjhDii2LBT9X75sCnlvumfdtWUnxdyD81bZtUCvICom8xwPUwnGjnA7mmp+Ws5K/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZhhJ1SnY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZhhJ1SnY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715663873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uqEtzGC+cVdWXmh6GLGieVLsp2Gjc0Pv9l/gxS7fQSU=;
	b=ZhhJ1SnYipYNdCeUEdX9WKdlITQDqmbDnDbZhtVHUQrbBeVyiort/1qQy50DpFDaOtGLIy
	29r9SqCTYv5bi3CGagUEaMfnzfUCn5HluM7hK0Q+VAsbl+rN60pphsHV0ZIVlWU8v+oK3z
	GX95Cq157mVJEDboeNsdwXY/0guqTYQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-JqWyOxsgNMqrVmFhlhzyuQ-1; Tue,
 14 May 2024 01:01:37 -0400
X-MC-Unique: JqWyOxsgNMqrVmFhlhzyuQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C5721C02D34
	for <llvm@lists.linux.dev>; Tue, 14 May 2024 05:01:37 +0000 (UTC)
Received: from [172.64.11.15] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1372351BF;
	Tue, 14 May 2024 05:01:37 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 8 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, 25c73642)
Date: Tue, 14 May 2024 05:01:37 -0000
To: yiyan@redhat.com, bhe@redhat.com, fsuba@redhat.com, bgoncalv@redhat.com,
 llvm@lists.linux.dev, xiawu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
Message-Id: <44022.124051401013700319@us-mta-33.us.mimecast.lan>
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
    Commit message: Merge tag 'keys-next-6.10-rc1' of git://git.kernel.org/=
pub/scm/linux/kernel/git/jarkko/linux-tpmdd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1288966505

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1288966505-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        kdump - kexec-file-load
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1288966505-x86_64-kernel_upt_26
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kexec-file-load
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1288966505-x86_64-kernel_upt_37
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1288966505-aarch64-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        Storage - dm/common
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1288966505-ppc64le-kernel_upt_13
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL exit_code

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
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


Tests that were not ran because of internal issues:=20
    Memory function: memfd_create [aarch64, ppc64le, s390x, x86_64, x86_64 =
(debug)]
    SELinux Custom Module Setup [ppc64le]


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

