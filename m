Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90355156220
	for <llvm@lists.linux.dev>; Sat,  8 Jun 2024 13:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717853599; cv=none; b=XOfdBN0+/rF1Ncp2ULKuQ+5mYGU0LPiTc+y5gPmf3680NZGpdYipORjz4uaaajaCbBkzgo0hpTM5Exoe/fLm8qWTkLjyn1ByMGM9ZOnPffKQ+w/g6npX1i25y/ebyZ3kSeUYFv7en3w7J6vcryBU0aq55JruPrEWkO6s31MDwh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717853599; c=relaxed/simple;
	bh=Z5f/HKOzCOs6IEymybZRkRbNaUVonzicSChB5M24zTI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=XZIsc0Yn3WaEGX7SCanhXZpZ1IHUVlsa4RhzudV6w8OPgiy2oulcurGkS9uJYITNnFJTWDWiJ4oajo7LhtAj8mpdRWCw0NhnxlyX2pcMmipPrCXSG5IdKtURhig1AB0rWGqtNTIe5ji8jDpnKTmtwyj3oHx7p/tyETB2EHDHD1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EoYaI1be; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EoYaI1be"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717853596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5tzZYePrfj42JVdPi6XKnifgZnVXQwFA2nOhd0ayluo=;
	b=EoYaI1beWPX+EAkfZKB5dpvXuhI9UQfOa493BI67jREWzIrygsadKgFIdPWWAOT5tVY23D
	B26t/RjIscLxtmNZGQDuvPqnI0aFrQUw2XZRWfZxZAIG8L2dS4TcXI1NltviZYDh8Sger6
	LlNjGDZMJK5omMPSS017px7soppWISs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-660-_iGahxcWNku4wIczLmF8Gg-1; Sat,
 08 Jun 2024 09:33:14 -0400
X-MC-Unique: _iGahxcWNku4wIczLmF8Gg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3A1E19560AB
	for <llvm@lists.linux.dev>; Sat,  8 Jun 2024 13:33:13 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0E8630000C4;
	Sat,  8 Jun 2024 13:33:12 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 192): Test report for master
 (6.10.0-rc2, mainline.kernel.org-clang, 07978330)
Date: Sat, 08 Jun 2024 13:33:12 -0000
To: xzhou@redhat.com, llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <37833.124060809331500138@us-mta-660.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.10-rc2-tag' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1323545806

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1323545806-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - cifsv3.11
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1323545806-x86_64-kernel-debug_upt_32
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/214
                       =E2=9D=8C FAIL generic/221
                       =E2=9D=8C FAIL generic/245
                       =E2=9D=8C FAIL generic/339
                       =E2=9D=8C FAIL generic/565
        xfstests - nfsv4.2
              x86_64 (debug)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1323545806-x86_64-kernel-debug_upt_31

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [rawhide] avc:  denied  { ioctl } for  pid=3D326068 comm=3D"=
systemd-coredum" path=3D"/dev/z90crypt" dev=3D"devtmpfs" ino=3D99 ioctlcmd=
=3D0x7a05 scontext=3Dsystem_u:system_r:systemd_coredump_t:s0 tcontext=3Dsys=
tem_u:object_r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2283367
            Affected tests:
                Boot test [s390x]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

