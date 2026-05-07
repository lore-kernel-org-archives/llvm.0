Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E04F2C0F81
	for <llvm@lists.linux.dev>; Thu,  7 May 2026 21:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187731; cv=none; b=fBiseT+izg3GZDg57AyBcdO8ZmQmVHDoaDVAWSzKs7Q96J66j6HArnBbtMHX0uM/pKwIQ7ZNbVQlpYtX5Ti+UVH99ZSo84vmDUyV6LQCMA+HktPg7LkPmPVRxYa2ltIQyK2NS7qxz0ub53b40EXS3aco5i7CzfrrWg2GMQC+97Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187731; c=relaxed/simple;
	bh=TREEd+D24Hd/8dTcThczCCwKthG6RxURh7rKKieHoSI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=fv+sUxr56Rea89Ew1iw2qe185LDXwCY8sHPWTfZCkLAgCP1rV1fx669N+i75zMQ4m5IywboLskW+Wnc35tdz+FIAzhoDzZ5bOEGhA+IFqo8ouPlETdaZENtZgMpxMyYguGteq1fqdl6KeK91Vr75/BNtaTw7atBZuS9vXbuxHYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=alqmGtxX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="alqmGtxX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778187729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e1H74Re45CRgFTO7gXwzpnUMaz0Ync1XNqkepwTvXv0=;
	b=alqmGtxXqj6yYv1qv+mip+bLFeVsMY4HZZVrPF5YGkmUR+bT/Xvs0pYSA1u3FqcOH/Ou/7
	1sLin3kcjQ+rKbugcwALX0PchTPPUlgHPE00xCeKnPn3Vly6U6Kh6BrJyYoPSyB+D9aXbM
	APE9GMnyNyxZxG2oE1ZVWDK9OYKd+VM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-OtHw7rfoOcehiQYpDzZF_w-1; Thu,
 07 May 2026 17:02:07 -0400
X-MC-Unique: OtHw7rfoOcehiQYpDzZF_w-1
X-Mimecast-MFC-AGG-ID: OtHw7rfoOcehiQYpDzZF_w_1778187726
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 757A51956061
	for <llvm@lists.linux.dev>; Thu,  7 May 2026 21:02:06 +0000 (UTC)
Received: from [172.20.190.18] (unknown [10.30.44.187])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 09F26300019F;
	Thu,  7 May 2026 21:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 68 of 97): Test report for master
 (7.1.0-rc2, upstream-mainline, 9207d47f)
Date: Thu, 07 May 2026 21:02:05 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <28281.126050717020701479@us-mta-198.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YUJ9WKbRXe2VRofhWJFqkG-uoEOLRxRsbrIdhb92Lfc_1778187726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2502335053

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2502335053_x86_64_kernel_kcidb_tool_21231609_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, ppc64le, s390x, x86_64]
    /distribution/command [aarch64, ppc64le, s390x, x86_64]
    /test/misc/machineinfo [aarch64, ppc64le, s390x, x86_64]
    Boot test [aarch64, ppc64le, s390x, x86_64]
    CKI/restraint [aarch64, ppc64le, s390x, x86_64]
    Reboot test [aarch64, ppc64le, s390x, x86_64]
    SELinux Custom Module Setup [aarch64, ppc64le, s390x, x86_64]
    selinux-policy: serge-testsuite [aarch64, ppc64le, s390x]
    Storage - blktests - throtl [aarch64, s390x, x86_64]
    Storage - blktests - ublk [aarch64, s390x, x86_64]
    stress: stress-ng - cpu-cache [aarch64, s390x, x86_64]
    stress: stress-ng - memory [aarch64, s390x, x86_64]
    xfstests - btrfs [aarch64]
    xfstests - ext4 [aarch64]
    xfstests - xfs [aarch64]


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

