Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359437C0F0
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 21:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174605; cv=none; b=LwnpExSlq6STJDq6CXeZ66WcP7Z+Ml7YBszXXH6Rnful+t1tiFIavufKVqMVjgp9UgS9d29JyJK1u2RtZqSTwuYF5INnf8LTiuYMrbi/Q/IlN+BLarar7If9H7fi+bugu4IcXsUURoIF+xvDBD4GPrKI5l3dTBlVydVBOy67UT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174605; c=relaxed/simple;
	bh=m9F3YjUWoGsTacSF3GyoYDXUt/PxvGosNBnYMG2gNTY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=F+n9wQL9sg9Lp1iLo7eQzNLGmBcpAraqHwELLMYm/8zUuT5iRCRjRzWxSO785TWQ1XYgGCoxM/mhcdZtetJzRmW9xb0nC1OpJCa7SpC53gkfwWSLA8Et5iZ0FLfH9Uy8KC/1NpkGS+cjvkQ7sa35b8Ixj5oLE2Uux9pFIGIkdhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtgaOmqW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtgaOmqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=c1RQgcgVwtFG66do1t24OnjFB9xut9qWUX6QHpzBsqA=;
	b=dtgaOmqWIG1xtk2n2BlhlZQbHBvVQa21YVL6Av9uJgOuqWevp+OydW5ZAMtnySxfmlYHCv
	RJMCDnWUP+yjLID+9udKYkd8NAOkG7RtT/B/sFI+OGDRv2qwim+Qspkdtxlk581fiQhMl1
	0L4SvtA42xU5qyxv8H8AJdsYeq5GnQI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-lIJO2kyXPx6XHaAv7rTkeg-1; Wed,
 19 Aug 2026 17:23:21 -0400
X-MC-Unique: lIJO2kyXPx6XHaAv7rTkeg-1
X-Mimecast-MFC-AGG-ID: lIJO2kyXPx6XHaAv7rTkeg_1787174601
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B9CF18028BE
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 21:23:09 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 87DE5195394B;
	Wed, 19 Aug 2026 21:23:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-0, upstream-mainline, 59e6295f)
Date: Wed, 19 Aug 2026 21:23:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <32605.126081917232102515@us-mta-433.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dqxmRpIuQHxi4YcJYj7-kh12X2x5l7K8frqwe0kF0uY_1787174601
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
    Commit message: Merge tag 'driver-core-7.3-rc1' of git://git.kernel.org=
/pub/scm/linux/kernel/git/driver-core/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2773953560

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
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

