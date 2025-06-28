Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F96262BE
	for <llvm@lists.linux.dev>; Sat, 28 Jun 2025 01:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751074934; cv=none; b=qk7GQoVk+WjJB3GableVz1RsXrf6xD6jksQK2l767Mkrctqq9cmYEvUO5Z1zW1ffcNddKRYjfV+SUBzHMX2ZZMnG/n4B6RbhVxhqBvwU23e3fSs/AdPL2IXFIChHCzpQLHnMRUTxt1s2LK5A9If7O34BATjY1QD8oUjt+INHSk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751074934; c=relaxed/simple;
	bh=AqFak+RkKOLxtlaw89uM9uejcA//xdBg87iSO3PBj7Q=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NWz9ztYPuqIxm6Sxr3L4J3gCNTIsorS1IadI+royLFgdJsy2it9KGx3WmbWiRXopsJDeEmyfMOs2pNenqwq9fH49jEmPhvz7uRS4b5k6ewb49NBhEwljDa2nCIo18346M+iZ+9RTXbfySU8lb5BCvOWFMMEIrzbN2Vxhw/DiE8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gH53Lnkc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gH53Lnkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751074930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bEfWnEf/odywAjTDhUNHjeGHYju/8/QM5XgYcmz7WrA=;
	b=gH53Lnkc61pVBrGL4uIGvN9G8aSLnBWgJshDCmwbflkrF8zLGZPyovYqAcCOMZBBClF9qD
	Q87gd8lvGn3kPILmqA12k7W4YurY1HkaNxcRlaPGK4susHEbZe21D3aV1YKOSvHllQ9GMB
	5Jt+jIYAMuPqIlXghs2xFMoCpev6ofU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-264-NfykCDWHPsOfomHc7VTPxg-1; Fri,
 27 Jun 2025 21:42:08 -0400
X-MC-Unique: NfykCDWHPsOfomHc7VTPxg-1
X-Mimecast-MFC-AGG-ID: NfykCDWHPsOfomHc7VTPxg_1751074928
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 02E9218002EC
	for <llvm@lists.linux.dev>; Sat, 28 Jun 2025 01:42:08 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 612EA19560AF;
	Sat, 28 Jun 2025 01:42:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 6 of 100): Test report for master
 (6.16.0-rc3, upstream-mainline, e5403415)
Date: Sat, 28 Jun 2025 01:42:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <23566.125062721420800123@us-mta-264.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G5ZP5HxU090acyoqhRDBIv9nQEQ_zLjper_iEiHWo3s_1751074928
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
    Commit message: Merge tag 'block-6.16-20250626' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1894443714

One or more kernel tests failed:
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

