Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6778230E84D
	for <llvm@lists.linux.dev>; Sat, 21 Jun 2025 01:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750470191; cv=none; b=ZggSMwcZEuTRo23xQpmHDLROJ+7oBWEd3tzVYsdZLa0FtZdS8Ukau2Ktzl84kVclN37OmqTFuqqpd+6i85kCanE4qwMDEXLGnghgW/QoZzffSPbrrNnklU8iNpZYRi4AHBIYl7CPUqyRP//36b6I0b0R44wlqQAlEqoGgf48Coo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750470191; c=relaxed/simple;
	bh=+R+OOVfGzL5YQk+qF2xMLBhb11M1LHPO3CBlPN/8JWg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=m9PJ3zjKf3QvKNnie66aLk3Qk9W9WyBWUu4EVJz+HpwVT0EbaLGlZR0It2R/jdtmWQg4v5q6L/9MNv7vZ8hcmnpWkJgU+e+0tgtYKtHTTXoDh3LxJ/yn+qAdMBfO5p9RTSj/XBLwq2LR09dYUKaysN4qUjlYiAZEXC/TncaqHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kc2bkHOF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kc2bkHOF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750470188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L78PBgBPNpViv9aSqUVpgnxpr2VzP1w+/l8Qdd5F61k=;
	b=Kc2bkHOFcPC0MU8VC3AKe8bYG5/NX9DU9CxYgBu9/aJC2r2phE5JE0ubOQdTCBNaO14wvh
	TucfbuW4WhTye9hrbh9IGr3EUlXpxdCK2/W8Vd1U7Qsu+ZKLu9mRJOJ9cj4Ad06HXsMsQs
	XmNYuYBABD+gkcIHTxFhMISFnmQERMc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-pEGchzp7Pkm2TW7IXQhOng-1; Fri,
 20 Jun 2025 21:43:06 -0400
X-MC-Unique: pEGchzp7Pkm2TW7IXQhOng-1
X-Mimecast-MFC-AGG-ID: pEGchzp7Pkm2TW7IXQhOng_1750470186
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1797C195608C
	for <llvm@lists.linux.dev>; Sat, 21 Jun 2025 01:43:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DC2731803AFF;
	Sat, 21 Jun 2025 01:43:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 15 of 100): Test report for master
 (6.16.0-rc2, upstream-mainline, 11313e2f)
Date: Sat, 21 Jun 2025 01:43:04 -0000
To: bgoncalv@redhat.com, llvm@lists.linux.dev, yoyang@redhat.com,
 ftjahjad@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <10439.125062021430700271@us-mta-584.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: onmWIS-nz2ZWKnGe74IAKVtQyo17kMv4uPw3PTq1jf8_1750470186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'gpio-fixes-for-v6.16-rc3' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/brgl/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1880982268

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1880982268-x86_64-kernel_upt_21
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
        xfstests - nfsv4.2
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1880982268-x86_64-kernel_upt_31
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
    kselftests upstream - bpf [x86_64]
    kselftests upstream - bpf_test_progs [x86_64]
    machineinfo [x86_64]
    Reboot test [x86_64]
    SELinux Custom Module Setup [ppc64le]
    selinux-policy: serge-testsuite [x86_64]
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

