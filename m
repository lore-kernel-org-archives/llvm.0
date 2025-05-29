Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B240225A29
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526734; cv=none; b=ZLRe/gTNlDtIbfjcJRTBXWAwXAKwMo5/Jd/ff6Miaf+ecgSlOysL9mtgxifQT47RvHkPDw0FlHgKq38ZIjBc000YnRaQ+03lLqb2X/evT1vyGtgOcmiG8Wh2paOvduQTnANAA2ayAHGnIRd//QGu1liFcUyEq1dkl66zp6eB+hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526734; c=relaxed/simple;
	bh=Lob6CMqf2YNBSR/vHDFfDP+j8KgehFLxPa0WESrUYWI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uhOrHJwzKBTKHZaT/ZvucIqlGssn1xl74hMMXVico8/bTdasZYJuSh/bmCkWbjWyh9Dg6veRFVUlzotudKEkn6B4XcQehYz2Og+juOyIX+pAiHfZj4okxZmlDMpjzy8XvFmaI/1g7GOhDzx42W6XeR4W7/A2xw9BCmUtX8XkOrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNETbfP8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNETbfP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748526729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bzXe2m5bLDGDwmrHK4KHclu9xWZ2eHafhKh6ENtZQpg=;
	b=FNETbfP8bguUMCc1JNgmcNeGva4uhflPwiZUcZkSe9TLs5FwE0re7+S0JfVqcj7tTrgPLU
	Q5zrO5eKGL3cLOwqsjlSDLtp5JpmC4rsqVIhrVLUHMLF5t1BgmCXSkPsXcdKj9U3voUTBY
	ZLF3v5fFcZVhj1QMIl5zmXSx6hssnEg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-J2CGV4q8PESJYMCXF53CMg-1; Thu,
 29 May 2025 09:52:08 -0400
X-MC-Unique: J2CGV4q8PESJYMCXF53CMg-1
X-Mimecast-MFC-AGG-ID: J2CGV4q8PESJYMCXF53CMg_1748526727
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 301E01956051
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 13:52:07 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5FB0719560AF;
	Thu, 29 May 2025 13:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 7 of 100): Test report for master
 (6.15.0, upstream-mainline, b08494a8)
Date: Thu, 29 May 2025 13:52:06 -0000
To: omosnace@redhat.com, ftjahjad@redhat.com, mmalik@redhat.com,
 bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <92200.125052909520800221@us-mta-79.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GyGlCJlBPqQDjL3Df0ATvcHwBcXoV89W53MXPLN9sFE_1748526727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'drm-next-2025-05-28' of https://gitlab.freed=
esktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1841575801

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841575801-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841575801-x86_64-kernel-debug_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1841575801-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    SELinux Custom Module Setup [aarch64]
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

