Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDDE2940D
	for <llvm@lists.linux.dev>; Sat, 15 Jun 2024 23:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718493742; cv=none; b=KPZtxapaMZ2K/CZ20SFSeQPLE+BSSyVbu93dnXXmbjhvrw8Jm4BS6YINQewCxqrIry1veZevBH56CK+TXhtR/fGeYXxI0Ip1MiRgSm2tNXib0CGOvwvGu5ORqRXAuCKp7N5WG8z7BelL7HqdJb7y4hah2GG6225OQRtGmazqWWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718493742; c=relaxed/simple;
	bh=oXCzjJDq5HzupH1e6s/KEhRHvYR/3ZxoexSm1mHQgFI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cw4b3DObq8UrH8EmF/qWtCRRbvY99mo0JHnCOG7dXN4sqb7dnrC7TO9ZII5eNBSgUV86TTJVVkXLaI6xtGdTjQRV8i8dETarr4lOhcCniJEwjL+BISUHw8jdxXQYFcN045hZyaCMSHZc1DGbhfrnM5AV2qoopG+Jwur9EGuA+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iIaRnO6w; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iIaRnO6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718493739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NGD+3sErR9NxT5C8w/Wzgu9uUH1sONAUS98mYqBNPk4=;
	b=iIaRnO6w4RIj0YZ1H6vuWsjlUzSZJrWkEwHV/LNmFHSLyJJV3c6x9GQY2HhbKQ+g3LG5yR
	hHQ+CNB0saAId1EheUXtK+HHanHTYhhIDk1xNKj4v2656mlC1z0eiMYEaepyEEMa/RkHXl
	lytbDH16QMTr3GUIMUAnjy2XtgGlTd8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-uhg0It4gMvCekQPCkCoufA-1; Sat,
 15 Jun 2024 19:22:17 -0400
X-MC-Unique: uhg0It4gMvCekQPCkCoufA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE2211956086
	for <llvm@lists.linux.dev>; Sat, 15 Jun 2024 23:22:16 +0000 (UTC)
Received: from [172.64.3.44] (unknown [10.30.33.101])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2E42B1956052;
	Sat, 15 Jun 2024 23:22:16 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 20 of 192): Test report for master
 (6.10.0-rc3, mainline.kernel.org-clang, 44ef20ba)
Date: Sat, 15 Jun 2024 23:22:16 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <51675.124061519221700277@us-mta-344.us.mimecast.lan>
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
    Commit message: Merge tag 's390-6.10-4' of git://git.kernel.org/pub/scm=
/linux/kernel/git/s390/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1333456716

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1333456716-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rhel-10] xfstests - cifsv3.11 - generic/207 - error in bloc=
k: expected 4096 bytes, received 0
            URL: https://issues.redhat.com/browse/RHEL-39974
            Affected tests:
                xfstests - cifsv3.11 [x86_64, x86_64 (debug)]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [s390x, x86_64]
    Reboot test [s390x, x86_64 (debug)]
    SELinux Custom Module Setup [ppc64le, s390x, x86_64]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x, x86_64 (debug)]
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

