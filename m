Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F66F23817E
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 02:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787539335; cv=none; b=fdS6sXiceXSlwGJ5yhnHhg4CXdL+SLFcJQLvkwrpaHTPznbg+hXdQZOaz3unchvrne2y/E7wqX6x+09cKKQlWV1iPq750vBgfYwleu0g7LaQKXUE7HgKm8OTIpHjFcJmNmH85XhQw78zlY6up2CX8V6B3gIp+CDJcjkXZVy0Tkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787539335; c=relaxed/simple;
	bh=CmskdT4tKL+Wm2XFvVz0cedDlsfBCPBmv/4xkpPhKFI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hBFmrbj52MBHvv2P9sPvRI6yLZ+XUOcfzRAm7xGddAMxgiYi4pc7U+JIi4jqoeH8c4UymtdAnSmG2fO0NfjmZDiSAqxWIvqa22E4h0dPHyAvhEgrtEd8NBkHYe46RzYGemtkI9hdEhgDMpdPe8ssvh7s7DJp8xosCwRGyTfO97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aRkytqX1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aRkytqX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787539329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=H4Pr1iQAkZb/nyhGv+pIqUL+nRcjFCEO0Fy7ML5/yj0=;
	b=aRkytqX1H5osRJyhO044m8TB2JL46wuYypzS3ZfdS2XmGwTn5nJnFbeE6uKZeNTBe+EsVO
	sTNtdbC6oOtHOF+rBa0KRdyujNJmtQAaBU5ooATFol7J9y/4F1MYbb6LQL/mF+ivz017l3
	KLVKJUxqJy8jkZLCGkt+qJIt4dJNfFc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-416-9Tz0200pOreXsuSgS8jy-A-1; Sun,
 23 Aug 2026 22:42:07 -0400
X-MC-Unique: 9Tz0200pOreXsuSgS8jy-A-1
X-Mimecast-MFC-AGG-ID: 9Tz0200pOreXsuSgS8jy-A_1787539326
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B6F9519540D5
	for <llvm@lists.linux.dev>; Mon, 24 Aug 2026 02:42:06 +0000 (UTC)
Received: from [172.20.61.140] (unknown [10.30.44.61])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BE7A618005AC;
	Mon, 24 Aug 2026 02:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 8 of 66): Test report for master
 (7.2.0-0, upstream-mainline, 2be02a7c)
Date: Mon, 24 Aug 2026 02:42:05 -0000
To: ftjahjad@redhat.com, llvm@lists.linux.dev, fs-test@redhat.com,
 bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <43840.126082322420700133@us-mta-416.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5OCf3HZSMzyqKzNOlkWqmAp_zIWb_pxZo_wh4KD0wp4_1787539326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for-v7.3' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/sre/linux-power-supply

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2780750852

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2780750852_aarch64_kernel_kcidb_tool_1200047731_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2780750852_aarch64_kernel_kcidb_tool_1200047731_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2780750852_x86_64_kernel_kcidb_tool_1200056697_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [upstream] [eln] waived call traces we don't plan to report =
upstream
            URL: https://redhat.atlassian.net/browse/RHELTEST-137
            Affected tests:
                Boot test [x86_64]
                Reboot test [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [x86_64]
    /distribution/command [x86_64]
    /test/misc/machineinfo [x86_64]
    Boot test [x86_64]
    CKI/restraint [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [x86_64]
    selinux-policy: serge-testsuite [x86_64]


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

