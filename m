Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12834457A2
	for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911392; cv=none; b=CRJ3nr6HTeN7UasLCIEAPD+ESRljyHohROrmtDwpSuLU2iwixCC0nkEeSFNofJ55QVEHSvLrjE/vBRYhkTcXEFK7hZFR25m1Y6qQ8pmoQCfvxMqZSE2mkFwo5MmiQMnQSnPU4UNwGdaxbqvixrSFlM7xP0enUhL6/fA3VLzFaQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911392; c=relaxed/simple;
	bh=tmiqKy3s1+R/6aXN6qOg0RVyP9nnLg8o4gUWgGdJ+tg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=C6BHFMJUD1PQtX0EQVZsdFeygAXBidpompjT/n/h5zGU72oFXM6tM7OMdvEO0pSwYBs8UpteVSs/9dJllgkWk7hHnPr4upLEDtKoo861RmI+W5inPsSrbZ9zXDSnE0t8QoN8/+w2J1PrvLWXJlXEBQBRTfD3Usj7z2sjv2W+ny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g0cl+c+J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g0cl+c+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784911389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=O54JqRpCKpmLnfdYLoQIOv3C8Jp5pBaU7ZBufO+IkGI=;
	b=g0cl+c+JCGTfpKIOjSe8bR+17TiacZUmosXUCZVFTbHh6kV83AFpaOUfMIHutufpCU2kk0
	OJWS3zzcFfjWNNqsa1z6H9zJytCLWZ+rCuZmy3yjMdpmcUQYLDVFCaFANLTWQ+btEqkU88
	jDu/1Sp6Eh9fAJm2zhGguCjZlcgiv1A=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-bjCBBHQGOSW_csUYxZZLRA-1; Fri,
 24 Jul 2026 12:43:07 -0400
X-MC-Unique: bjCBBHQGOSW_csUYxZZLRA-1
X-Mimecast-MFC-AGG-ID: bjCBBHQGOSW_csUYxZZLRA_1784911387
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EF3401882618
	for <llvm@lists.linux.dev>; Fri, 24 Jul 2026 16:43:06 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 838781800986;
	Fri, 24 Jul 2026 16:43:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 62 of 88): Test report for master
 (7.2.0-rc4, upstream-mainline, 4539944e)
Date: Fri, 24 Jul 2026 16:43:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <39952.126072412430800147@us-mta-14.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sBHQS5dpkNnmN_qrw-R_d3mZmmod6Pe8JufYHwInY5Y_1784911387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'liveupdate-fixes-2026-07-22' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/liveupdate/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2698419035

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2698419035_ppc64le_kernel

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, s390x, x86_64]
    /distribution/command [aarch64, s390x, x86_64]
    /test/misc/machineinfo [aarch64, s390x, x86_64]
    Boot test [aarch64, s390x, x86_64]
    CKI/restraint [aarch64, s390x, x86_64]
    Reboot test [aarch64, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, s390x, x86_64]
    selinux-policy: serge-testsuite [s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x]
    Storage - blktests - ublk [aarch64, s390x]
    stress: stress-ng - cpu-cache [aarch64, s390x]
    stress: stress-ng - memory [aarch64, s390x]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

