Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD419F42C
	for <llvm@lists.linux.dev>; Wed, 18 Jun 2025 03:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750218792; cv=none; b=JqlmvavH98/HcYWGjhFWhyARGCI/qsTF0N0Fy1ngBRBjaNZCUhwyQOzrLA/Imp40i052xpl1My0+S1ReXZkfTjXqjUnFOOyKmtLMSYdRb2nFQDUBxUYPZNklj1mtoQpeABvDLlxJ09jTFRqUMObrONXoKLhDBoRYdbZaF2q+kiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750218792; c=relaxed/simple;
	bh=I7yVx9wZY/v9ChgFwKUnVOn7MrtTvcDP2lWsGwk+l0s=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FUuZ45ZWERs4US5SgZlKXuUyaFK4IlCXjs0P3hYLthR/YJDqTEzP6tVsahgpuDzG5ZGO91aIAbjBWan0bhDCxRSKZbTb8/PbJSN29ws27AK7GjWfnDPZCM5zokrRanh4o7YOd1k+3pfegAfIwUZaTypiUjdXyPUBULYn/A/if6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCBMmIvj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCBMmIvj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750218789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YeH7Hv7PdDqFtVZdWpqTTajkHZwTKljT44eYBbhhl7U=;
	b=WCBMmIvji6JKjLbtDdp1n0iA/m3FHKVK9rzMsP/XaxH+USWDOp/NcjFuWF2ebOk3uu9SX9
	P1fOwoJKaPnQmnmmZLV4t2ocPZXVH13cvaYzkLQ9GSC82TRaRFgnWilvGeq2gTCd7K5jh3
	PYSiZkmdlhyXo7d7mktk1LLiZZLpBiM=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-YkQy3zuFNrWckk-SfmUtUQ-1; Tue,
 17 Jun 2025 23:53:07 -0400
X-MC-Unique: YkQy3zuFNrWckk-SfmUtUQ-1
X-Mimecast-MFC-AGG-ID: YkQy3zuFNrWckk-SfmUtUQ_1750218786
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 87F3A1808985
	for <llvm@lists.linux.dev>; Wed, 18 Jun 2025 03:53:06 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 26EE1195608F;
	Wed, 18 Jun 2025 03:53:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 79): Test report for master
 (6.16.0-rc2, upstream-mainline, 46637478)
Date: Wed, 18 Jun 2025 03:53:05 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <76981.125061723530700615@us-mta-194.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4xTgs9ueYD17vSi1s0Et8qg9frbfT8w9lPi5hRW7EPA_1750218786
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'platform-drivers-x86-v6.16-2' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1875101070

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1875101070-x86_64-kernel-debug

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1875101070-x86_64-kernel_upt_27
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1875101070-x86_64-kernel_upt_23
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic


Tests that were not ran because of internal issues:
    Boot test [ppc64le]
    CKI/restraint [ppc64le]
    machineinfo [ppc64le]
    Reboot test [ppc64le, x86_64]
    SELinux Custom Module Setup [ppc64le]
    selinux-policy: serge-testsuite [ppc64le]
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

