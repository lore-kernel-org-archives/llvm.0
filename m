Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B26E3B3BF2
	for <llvm@lists.linux.dev>; Mon,  8 Jun 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780909389; cv=none; b=AadAtDGPXucEiXXgxP41DjhkR8sMFOLkVrSaabFKT+dNlkx+XEqr9+I1/9/ODMrB2OVhuODErp53Deu6xsDV8kj4CC1xx4iNcPqWeRQncsR2cbI0QLXvq+f18P2WGMDbHYzRJc8c14uq+4nIlLVm5Ev184g9GXNXWN4/Xnc1Ncw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780909389; c=relaxed/simple;
	bh=/jWXJfBzrRJ1HeS9IjwZhcmCRKGDHey7KBlrSSvTIJY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=BwF7AvcB1bB1+GAkhqlAvZiaBZc1poO1/IuT6OS1MQxMcuvFSZHiTCnXEyFzYNcuIMAS95d3ZVNYwGAya0fztmSBJKeIm2Z2J2NEI1LaGrwb2JdV0Pa698JNqA9zrQ0mbDJK45QSCWIcSerWfN6MIW2DgU6caqSVfmvKDzh5GUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RQtgcqbe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RQtgcqbe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780909387;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6A7GcrI/nqGziOYMuyUtXm9YXtFpTUH8rwLGuxD5Mac=;
	b=RQtgcqbe4trsxDAS+BZlldHFxd2FreV62WdPhxQkwJYLlWR2886P9fFJM+yhuEzr7AkV0e
	ZZjZjQcYcygXTH58MmrUmfWfpQNv/pDZFMBd2bu+VMPFfJ/NKIgVJin+6rDRTu/ve7yvdf
	uiBU7kuv0ZevDs86B+5ghdEp5zfEIAg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-MpFZtl7QNm2IA0300-Xh3A-1; Mon,
 08 Jun 2026 05:03:06 -0400
X-MC-Unique: MpFZtl7QNm2IA0300-Xh3A-1
X-Mimecast-MFC-AGG-ID: MpFZtl7QNm2IA0300-Xh3A_1780909385
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D8F8180035C
	for <llvm@lists.linux.dev>; Mon,  8 Jun 2026 09:03:05 +0000 (UTC)
Received: from [172.20.145.56] (unknown [10.30.45.118])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D6AF19560A2;
	Mon,  8 Jun 2026 09:03:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, c68691dc)
Date: Mon, 08 Jun 2026 09:03:04 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <81303.126060805030600944@us-mta-654.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FLC1Ep8LItVHsbGJ5Ce85f6VmcYyCSSUts11N4NT8-0_1780909385
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'x86-urgent-2026-06-07' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2583319450

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2583319450_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2583319450_aarch64_kernel_kcidb_tool_21425083_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2583319450_x86_64_kernel_kcidb_tool_21425075_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

