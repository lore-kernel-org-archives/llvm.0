Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C2112FB15
	for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719220284; cv=none; b=n9oufyP4cgZlwGGTf+1MkwJv4Kmkm8BRjQVAxTjVzt/Pc0qQ7pDI0DD2HziUVsyrVOUPbGpbuza0lw8eP9+CCToA/TAeXlM+IOJ/2WNsQx4HU/xSFtd/GvnxBVKX+AId9WnjGTTAjGAHKVdmH5j0g2W9t0/BYim5QNi85O77G/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719220284; c=relaxed/simple;
	bh=CZWH6wSfM5215X2E/AWreI1F06IiFx9OHdkn3H78Hp4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=a2hK/HXloBbEMyjv1L2SbWMgrOJK0C6M2Lb21zBeE8lT3zZGUmM9xepT1cgWLWW/v0+v4ib0ssOTvsrwwa9KMNaj/mEdJ67GeAVANaIVVpAfKcZRQMHuthkOkNfUEQSbqxCW6J5oFrxdt8G7ElqQm7DVKQ/nQCuRTCgsSXINrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEcm29if; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEcm29if"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719220280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7Fmr7G1P2tkGGKBJQYDypTbwQ0Bqueh65PJciau37ms=;
	b=JEcm29ifHpMGsdnX+yUBoNz0DbRe1lTmK5q/fJPDgJfOYSXKKHqrB8CA5PjZ0OyhEoTYFG
	Hx9MK930J1Ov0mZpFKYc5hw8R24onYVViS42B5WtvLZriBQ9sIHSp35IR4cU+HW9cY2fjL
	AzBVuveNzoXBxXTNtKqW40SkHIjXGuk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-NlSTfXs2Px6iycauJXrLww-1; Mon,
 24 Jun 2024 05:11:17 -0400
X-MC-Unique: NlSTfXs2Px6iycauJXrLww-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC16B19560B2
	for <llvm@lists.linux.dev>; Mon, 24 Jun 2024 09:11:16 +0000 (UTC)
Received: from [172.64.2.89] (unknown [10.30.34.59])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 381B21956048;
	Mon, 24 Jun 2024 09:11:16 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 192): Test report for master
 (6.10.0-rc4, mainline.kernel.org-clang, 7c16f0a4)
Date: Mon, 24 Jun 2024 09:11:15 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <70935.124062405111700491@us-mta-191.us.mimecast.lan>
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
    Commit message: Merge tag 'i2c-for-6.10-rc5' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1344344236

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1344344236-x86_64-kernel_upt_35
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] blktests nbd/001 failed
            URL: https://github.com/osandov/blktests/issues/141
            Affected tests:
                Storage - blktests - blk - upstream [x86_64]
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
    machineinfo [s390x, x86_64 (debug)]
    Reboot test [s390x]
    SELinux Custom Module Setup [s390x]
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

