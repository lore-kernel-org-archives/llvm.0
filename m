Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41535C8FE
	for <llvm@lists.linux.dev>; Fri, 20 Jun 2025 02:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750385532; cv=none; b=D15Ulr4Yc1g1ox7rCuQLxJkCVc/D2Y5JPKDzVzSxSSry7C0FUwAyY5MszUPv+pXGvHKxJKw4nf9a0fZKOG3srYISHjKdJu5yNitGYWRTGa/zAqn6N2Y7bLnrBaUHWciXZCV2bKB1tjK21XepLUNZZTKEOcvmOJGW0cpWuJY2+ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750385532; c=relaxed/simple;
	bh=kJELz1/mHfKNGbCM+HoirpJbL9tD5ZMPRDYBOcqL9tU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jhwdFdeRFAGl3jZJyOfobwLZSuUsWYmjpTWen8Uj0l0oXLcBEVy5ZVIP0uxI1mGURgur5sHI0z/BN1wBA0qp0MNU3nmh3Eapbm96Bm8Wr49ed160BIVPDduKVYBNGBI8TrpcSFYASoNADmALz3W7V6IrjHB3VRrWZZL48nDILGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQayTW/K; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQayTW/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750385529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Xf1oFEmK4iJ9gb6of2sF8dPg8VMyjOBK7TJkqY5Rt4M=;
	b=jQayTW/KY5Z2yHMdxegJjSVOLHoNAwMsc8Y+I3y5wRRs4Dn1OfqA5IlddXJQvKKg8xzB3L
	QbHKSprew9rQhVsob0juDbuxQJhSQPUk+FJg7l7Z3Eks1+b/Y7B9Zn5v5l67X3n+3+YQpC
	eXRQTJZb22dFhoQLWlmLc0QRrhNFJfY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-aWZbcdzcMTOMAuPMsPZycg-1; Thu,
 19 Jun 2025 22:12:07 -0400
X-MC-Unique: aWZbcdzcMTOMAuPMsPZycg-1
X-Mimecast-MFC-AGG-ID: aWZbcdzcMTOMAuPMsPZycg_1750385527
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D27751956080
	for <llvm@lists.linux.dev>; Fri, 20 Jun 2025 02:12:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B00D30001A1;
	Fri, 20 Jun 2025 02:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 100): Test report for master
 (6.16.0-rc2, upstream-mainline, 5c8013ae)
Date: Fri, 20 Jun 2025 02:12:05 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <99809.125061922120700605@us-mta-86.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4rPTCgcctf0pSOKX78wcakT-wS9Ltah2aFrqxB4YVaE_1750385527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.16-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1879185702

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - ext4
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1879185702-x86_64-kernel_upt_28
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - btrfs [x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [x86_64]


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

