Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858832A1AA
	for <llvm@lists.linux.dev>; Sun, 12 Apr 2026 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775971932; cv=none; b=fG+4LwpDr4pvuIKTNNirnVJ+bBN21tz0XdxjH+ZPsJ0KhNCUaDzOol2NNf+EkrE0scAuBCJ5BJ4d5tPiCX2wQmMJ9qiVl/GsIIvekez4lwfJPjoielcBLGR1ANXiCUpabqzmBcC66sFF4IJUI4Q6ebDS541KLGvAVDY1Q50qVss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775971932; c=relaxed/simple;
	bh=VPhPPoYWdIY4md/31VtDlB3tvMR5txSOWbtsA+dcTpY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=AD4O1rn/qKegdo2LPZeHppJu3X6o9YSw1Fb+5ES8TqubsKTaO/PLzx0rZadWrRG4OZ3ea9p3iHqVujaDn1AJocDevzPlTI7E8pJ+d5UfHlPpF3d9ZsctOKQzj9PMJId48A8RRf5+R3xn3fjvAkVtq/HpkXb6+TvB63nb7tWqLHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XFMTPbjA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XFMTPbjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775971929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Kk8lK6313W1rPUnxTL2wQHVi6dYOYRT9W5nwOtMnLt8=;
	b=XFMTPbjAjCLWeGNRzuZl9fWvW7LiHsdwit6dAOICMMoGtVAoVtV/OWZAImchUoiakpAW4k
	H0ON+ofXReqpnpGNdX5mQGPefpR9UJRHgAIHuru7fM+OVyX6URUltYPs+0Xo3RzmlbG0OC
	6PyLLd24yrFndtLwQwfEqdOjLI267NU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-sTdqqEEjPIiX07r8BKza-Q-1; Sun,
 12 Apr 2026 01:32:08 -0400
X-MC-Unique: sTdqqEEjPIiX07r8BKza-Q-1
X-Mimecast-MFC-AGG-ID: sTdqqEEjPIiX07r8BKza-Q_1775971927
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B8521956095
	for <llvm@lists.linux.dev>; Sun, 12 Apr 2026 05:32:07 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BEEF2195608E;
	Sun, 12 Apr 2026 05:32:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 88 of 97): Test report for master
 (7.0.0-rc7, upstream-mainline, f5459048)
Date: Sun, 12 Apr 2026 05:32:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <00091.126041201320800147@us-mta-588.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DyIW95MW8P8SiuO0C32z0jSyHxkrNInDVCsY1sD22Ls_1775971927
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
    Commit message: Merge tag 'i2c-for-7.0-final' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2446719726

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x, x86_64]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
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

