Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC382405F5
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748634131; cv=none; b=eRfM4nkOVQgq5taZ8kJxG4k77ZscjzcgU25Y2Bsp9tF0KiabCUp2Zj7kB2zcg/vfMMUbZurphgArzYfyq+cKCcJhxrBz//CGKSUfIOgyKsQuuX9NWm/e3ywlo9duyVvyYWgG4UdZdIIUmtEBZT48I7DuTEeaaBLhBAaFB/1Ra8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748634131; c=relaxed/simple;
	bh=FRn9gDhNwJV4LMhx1+UPbq2nwQkCF4Wkhc2iBdpCrlQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ooOfg3SH6nrnOlrlidLNBPRUF0u1Tfvqx0CWSJcW0JuhpkXZDMzLD9WXNApabd+wt4qn4GhRmkZLUfG/NrV/f0gwqYVISS6yt/A0GVk9uAsEIU/VaDqVsdOUR6bpNW3lrSJwZPht1R5skeeu+zSwghpra81xOP8c66aWveTOHMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e2lmTdUb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e2lmTdUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748634128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GwKBukChZEAm6EaGNV9J4OP3d2m8EuXRCikyY8mXxRY=;
	b=e2lmTdUbmcm8mN8gUC0G0x8ivriX5pUBMAqWnnw/QGibu4jgCbEJ8K9svskxCoD3u2MEUb
	NmjzqvoRY6IavN4Ce+V1EDQ3o1c9quRWthKcp321/jAB9gppX3+1dtJDGLKGuIrGYi8V10
	cNddoKCpMsfNYSbFMjNmh/zEJV6SGvA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-226-aUoPfcXEMUW5s5M21EnC3Q-1; Fri,
 30 May 2025 15:42:07 -0400
X-MC-Unique: aUoPfcXEMUW5s5M21EnC3Q-1
X-Mimecast-MFC-AGG-ID: aUoPfcXEMUW5s5M21EnC3Q_1748634126
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 70A221956095
	for <llvm@lists.linux.dev>; Fri, 30 May 2025 19:42:06 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 46244180049D;
	Fri, 30 May 2025 19:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 6 of 100): Test report for master
 (6.15.0, upstream-mainline, f66bc387)
Date: Fri, 30 May 2025 19:42:04 -0000
To: fmaurer@redhat.com, omosnace@redhat.com, ftjahjad@redhat.com,
 mmalik@redhat.com, bgoncalv@redhat.com, haliu@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <81822.125053015420700385@us-mta-226.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xCxYhobPnHJDpVPW90DJMxQwS6ayXo8aMhPqAFnXQ_w_1748634126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1844097049

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1844097049-x86_64-kernel-debug_upt_4
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        kselftest build - bpf
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1844097049-x86_64-kernel-debug_selftest_bpf
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1844097049-x86_64-kernel-debug_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1844097049-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test


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

