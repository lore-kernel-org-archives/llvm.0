Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD18E25D1E9
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786122732; cv=none; b=qstF4PDoNWO0InmIxI8ymlDDHhzMgxE8xGr2BIqy0+63mwbEeRL4JEeGw+NOrYisTkQIapg/Pc9AHKG6AFxQBnFpV1+OqNEOyb2UWuJuGprSo1cjDHrCdHIvJpv1aH893ObH1d5UpBLYswUwXcJQ3FbDl3j1pPYxWSr+6U4M3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786122732; c=relaxed/simple;
	bh=E7D0IK44ndMITWwK7KErAcUhf5DMWoLUJ3QfHh4Nl0Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=l6yTSbnTy04iAlqcm3GVYK1DqJwrmxsRwh5klkG8iMcifNHg6lbvXNFZYu4frkRpfNL/2d8aNbwKegQfezD+bqrwjrA9GDmBLmSya4Y9j9SFLbuE+DdXXAC6udzeM+3apzyIThW0HqSubUz84V+nZ84od0/qoTfx7pZBdoEJg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1f15LrS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1f15LrS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786122729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kE77mrX0Xv2iIJXDiFYj08f+BEpYbuFrvEQA6OS8BiM=;
	b=Q1f15LrS7aEkyexvpyDQ8kKlOH3GX2345pCcZf2nHM6jsZthIHm/91FoSlARwGMcH7gbJm
	YdrvRgmkBP7iq1fVUrRc6J1hFbP2Dvf+mwezcX+1Y98XaFAFRUfki8Lr3Q4L+EZhbJFvPe
	eJC2HNc8yre6+Tkd5XiklTwXQ1BnRp8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-iBFEHsyFMrahOXxWL_5pBQ-1; Fri,
 07 Aug 2026 13:12:08 -0400
X-MC-Unique: iBFEHsyFMrahOXxWL_5pBQ-1
X-Mimecast-MFC-AGG-ID: iBFEHsyFMrahOXxWL_5pBQ_1786122727
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3B8B7195608F
	for <llvm@lists.linux.dev>; Fri,  7 Aug 2026 17:12:07 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CB34F19560AB;
	Fri,  7 Aug 2026 17:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-rc6, upstream-mainline, 6c68fa60)
Date: Fri, 07 Aug 2026 17:12:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <24725.126080713120801026@us-mta-529.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HmAD_VgS2OFHnszgJs5rKQKueUFn0UzB5xqpHeIlmL8_1786122727
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
    Commit message: Merge tag 'for-7.2-rc6-fixup-worker-tag' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2738681093

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

