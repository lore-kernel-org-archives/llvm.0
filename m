Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96C728CF7C
	for <llvm@lists.linux.dev>; Mon,  7 Jul 2025 09:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880150; cv=none; b=JJifIfGwBNz0voVl0PhGEbPG82R2xJc2LLTNFjEByyNswIoncCejhq9FBHplJWqXccYKc7+lVeaaESN9KTBzcCF+LR0Sl/UIUhd7UT1Aif9xNP1R247yMJpbBgBmobO7XQTMiTSdZXwDG4BA0QlRjtrhGgPWGniettry4KSzhF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880150; c=relaxed/simple;
	bh=XvW8C+5cxHE823eB0B6qTevoEHZEmVl1/nWGCKMxFLU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=o7qgbUKeij33cc+eR1dVAYM0iK7GMfCVVgu9UKy6v1c9/ydo+e1rISZ6N1aEWJDqXv3CY4U6AciRnSaDVMl1iXDUHx0ndJZo8UhmTNQk5pgEEBnmu7uyfjjdSg9CttudGOb0br2Te6ZbUChL+7TEfRbeidHMYHO3od+1aEnrGXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a4EoSYuc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a4EoSYuc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751880146;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=er9riMe/zg8ytasSUEcUG5ZakjZO+WuHARDpxhfNmf0=;
	b=a4EoSYucfvUXNlrMncrp/ZCbxZhlEGcO5peHsgBeHY4h1BR40ZHwhvgEq4NSMJOCtlBzKn
	Qpwx016Kb7Z+8i9pUtzyIQLMAiBq5twpi5rncfoMXzpKTp3wIqAuNifuELPYi4xwQwDjA2
	QzhjsPXaw88nvJe/JmbGwL07OCsSqD8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-wPmEC-jiM2G7q1zvHCkOVw-1; Mon,
 07 Jul 2025 05:22:22 -0400
X-MC-Unique: wPmEC-jiM2G7q1zvHCkOVw-1
X-Mimecast-MFC-AGG-ID: wPmEC-jiM2G7q1zvHCkOVw_1751880142
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C717195608C
	for <llvm@lists.linux.dev>; Mon,  7 Jul 2025 09:22:22 +0000 (UTC)
Received: from [172.20.236.189] (unknown [10.30.44.207])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2695C19560AB;
	Mon,  7 Jul 2025 09:22:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 3 of 100): Test report for master
 (6.16.0-rc4, upstream-mainline, 1f988d07)
Date: Mon, 07 Jul 2025 09:22:20 -0000
To: liwan@redhat.com, jbastian@redhat.com, omosnace@redhat.com,
 mmalik@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <89583.125070705222202683@us-mta-120.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qHDf0OO9xbra5ld_WaBWR4evHZ8Gril1FfiLOsaIWKI_1751880142
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'hid-for-linus-2025070502' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1908831443

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1908831443-s390x-kernel_upt_14
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1908831443-aarch64-kernel_upt_14
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1908831443-x86_64-kernel_upt_22
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test
        stress: stress-ng - memory
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1908831443-s390x-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1908831443-aarch64-kernel_upt_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: xfstests failures generic/32{6..8}
            URL: https://issues.redhat.com/browse/RHEL-50644
            Affected tests:
                xfstests - xfs [x86_64]
        Issue: mkfs.xfs prints warning about invalid stride unit, hardware =
specific
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1924
            Affected tests:
                xfstests - xfs [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64]
                kselftests upstream - bpf_test_progs [x86_64]
                kselftests upstream - net [x86_64]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    selinux-policy: serge-testsuite [ppc64le]
    stress: stress-ng - memory [x86_64]


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

