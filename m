Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7CF191F91
	for <llvm@lists.linux.dev>; Wed,  3 Jul 2024 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720029801; cv=none; b=WgXPDSqIbRFoZaXrK+jQqAmj0tQ1e+YcAy9cwdqgegb3vfZmbBJIQdUFjAwirCGqO+SbesgZPWDDWOKEAgqPOOaoqYIA6VXlkBrSDa/7sXZvkfWV19SUTaV6sU5GnzU6awsepZ1sFe8lbomlycvLeWbLaCd8gxNhVw6onX4CS2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720029801; c=relaxed/simple;
	bh=rpkk3eszE0pZXbO6wsoMdfLvcsO2aeIBIUTFlb1Kx5Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BDpmqPWyZ2x/W56vswMqGvfNmjVsGdIS5fso8WCSnwzFRovdFQ3bhLkA2bwyAiHeZG3+nugVvjDGn9No8cJif5nE77N92m49FKJcJhXqP8J7bqA06Ljnl3CBMDA02BmM9/GSH/9z4Ny+soX/U6d047b3r54eP8GTPfFuI9+B1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B1u7iGyC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B1u7iGyC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720029798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Zo31XQTFtStCHG75LmJtzrY0zLh2lPlEKkPbi+Dl1LA=;
	b=B1u7iGyCiEAIRWuO3csKq/cdV/zBaX5VPBrhUaGohFPj1AXPLroh5iZxQDYDFe2cY58Llp
	0fC7ZhCDkP1duJ0ORCpt8MjRceN19/yKu7EHadaeA8QpaHLWzCbkSSkFAdyJNJ/ofyONMB
	qOCgYvItlZBRpgtbOucj2kloUTYu0fA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-546-yeOgSlYEP06OBWdxxH5zmA-1; Wed,
 03 Jul 2024 14:03:17 -0400
X-MC-Unique: yeOgSlYEP06OBWdxxH5zmA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9773719560A3
	for <llvm@lists.linux.dev>; Wed,  3 Jul 2024 18:03:16 +0000 (UTC)
Received: from [172.64.0.79] (unknown [10.30.33.131])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC9411954B0D;
	Wed,  3 Jul 2024 18:03:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 39 of 192): Test report for master
 (6.10.0-rc6, mainline.kernel.org-clang, 73461051)
Date: Wed, 03 Jul 2024 18:03:15 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <72853.124070314031702525@us-mta-546.us.mimecast.lan>
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
    Commit message: Merge tag 'erofs-for-6.10-rc7-fixes' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/xiang/erofs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1358019500

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-s390x-kernel_upt_14
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-s390x-kernel_upt_29
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-s390x-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-ppc64le-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-ppc64le-kernel_upt_18
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-ppc64le-kernel_upt_24
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-aarch64-kernel_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1358019500-aarch64-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check


Tests that were not ran because of internal issues:=20
    AMTU (Abstract Machine Test Utility) [ppc64le, s390x]
    Boot test [s390x]
    CKI/restraint [s390x]
    Filesystem - Loopdev Sanity [ppc64le, s390x]
    kdump - crash-file-load [ppc64le, s390x]
    kdump - kexec-file-load [s390x]
    Libkcapi AF_ALG test [ppc64le, s390x]
    machineinfo [s390x]
    Memory function: memfd_create [ppc64le, s390x]
    Networking - Ethernet drivers sanity [ppc64le, s390x]
    Networking cki netfilter test [ppc64le, s390x]
    Networking vnic: ipvlan/basic [ppc64le, s390x]
    POSIX pjd-fstest suites [ppc64le, s390x]
    Reboot test [ppc64le, s390x]
    SELinux Custom Module Setup [s390x]
    selinux-policy: serge-testsuite [ppc64le, s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - dm/common [ppc64le, s390x]
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

