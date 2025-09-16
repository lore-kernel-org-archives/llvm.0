Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099F42E0410
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758050233; cv=none; b=cgP0WZQF7gbm4Q0TbY7JNVBPlfxidyKkNx3Mo7sQVKF7xsjJfaep+BjqcsWys1mHQfeLMnr8tB3c2TKZHE6b3AH0WNjawixaB0RVxBMIYTdOlGL7IlomXmQIR0urpVMTRaqjoXmJ7wn8krpU6/T+vArLnLQo2WNLNygu3pxc/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758050233; c=relaxed/simple;
	bh=Z8FYkHzqITHBcNPUZ8eprivwhPaarBx25yPPRnC28a8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Iu7RncoaXfJ+yZC7Trfck6T3r9m2UqiSQXL6c76HQAUQ/GBXgQq3qM/B8nMDDbskExIhT7dQ8nCUNEhyHMvQz3cDOyxyA2mua3VZ+jch8Jp3181VauIp0Yp2imGy0/QbkWITs0ZKoSpdRGOYRjGCh0tey6vattXuWVbdHyXhN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VPHZ5daZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VPHZ5daZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758050229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sdwQhSA84tt6X4WXYMuPGgqHCIHFjWxWz8o28nW7OkI=;
	b=VPHZ5daZC6MFriOMx7tVfbYxLQnW/Bcs/GM9DzhhkwRe2XAIS5OK2JBsjPb2TrwjHKzLd7
	g9oJdmT0SOs9f6AOKS1bAFXUXOdZMhYhH8CoXzgvStyxTDw2jfXQYOeFE3ZUo6oYjnHTvw
	XHAC7r5hLs670sz+t5POclJ7GoZtLlE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-614-Dojt_FaSNLmo36UPbJAPMg-1; Tue,
 16 Sep 2025 15:17:08 -0400
X-MC-Unique: Dojt_FaSNLmo36UPbJAPMg-1
X-Mimecast-MFC-AGG-ID: Dojt_FaSNLmo36UPbJAPMg_1758050227
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6A2E18004D4
	for <llvm@lists.linux.dev>; Tue, 16 Sep 2025 19:17:07 +0000 (UTC)
Received: from [172.20.100.178] (unknown [10.30.44.68])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 711D31800446;
	Tue, 16 Sep 2025 19:17:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 35 of 137): Test report for master
 (6.16.0-0, upstream-mainline, 2988dfed)
Date: Tue, 16 Sep 2025 19:17:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <03786.125091615170800811@us-mta-614.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F8grBqgKLlD9EnyWod1jVhQ3Vel-nCJS_c2tlOzs91Q_1758050227
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
    Commit message: Merge tag 'block-6.17-20250808' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1975473104

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [s390x, x86_64]
    /distribution/command [s390x, x86_64]
    /test/misc/machineinfo [s390x, x86_64]
    Boot test [s390x, x86_64]
    CKI/restraint [s390x, x86_64]
    Reboot test [s390x, x86_64]
    SELinux Custom Module Setup [s390x, x86_64]
    Storage - blktests - throtl [s390x]
    Storage - blktests - ublk [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]
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

