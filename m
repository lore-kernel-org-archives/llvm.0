Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588B63822AA
	for <llvm@lists.linux.dev>; Sat, 20 Jun 2026 14:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781966531; cv=none; b=Lb7kdQC6tWJEKWRvaDf3u9PvHPHhq9Y8iS5LNBtogD2xRbAP7iaNKzdsY8hft/M9h9HaONNLRSeFCT48rySOaeYWK9p0GHTedNCCj33+I0KFVBLaXmOoFu9fNhAvSxBh+J4eiAxhA2rr6kUnOUTfU3g8xWlh9lEHs9pf0FB8tSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781966531; c=relaxed/simple;
	bh=O1tFbWTdeRStwPr3KF0za5XYRg4eCN+F3sCmqAf/43c=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FKQUbOn660MQCzor86w8m21ji88DwXode2Ue+JYpJ7jmGheUyB6v6h76EUFUPBHpKSYtARpYa8RDoHToPve/2gdDXOvEZVMwZbCOaHNaV6+QOy1/L2InKG9C1oLMnbd/NgeURQ+8iHb3oCYi1py22m46Lrtek7VjKcc2Amxa35U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OMdqQ/ah; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OMdqQ/ah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781966528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WBfkVkvZlNZV8Efk+7n9G3rAaO0NLkROmn6Zz9EQn/s=;
	b=OMdqQ/ahsCih4E2XQ6/aCaT9jRt0giH8xCd17dwGIlO8wOn7b7pg6J6e3c6nMvRXcrYCgJ
	0ThuAz0D72xAWHTdORqpBmsMZLoMtDG/ffcUTKM8vbYtBMrqIwgKDQ5VoHKNzRUYCEpztd
	C/o2qBu9pfgdxUUm7/YPHcPeGxzP+BQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-184-RjQcpJokN56xiPlgf-jUsw-1; Sat,
 20 Jun 2026 10:42:06 -0400
X-MC-Unique: RjQcpJokN56xiPlgf-jUsw-1
X-Mimecast-MFC-AGG-ID: RjQcpJokN56xiPlgf-jUsw_1781966526
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB72C18005A9
	for <llvm@lists.linux.dev>; Sat, 20 Jun 2026 14:42:05 +0000 (UTC)
Received: from [172.20.103.220] (unknown [10.30.45.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E30619560A3;
	Sat, 20 Jun 2026 14:42:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, a975094b)
Date: Sat, 20 Jun 2026 14:42:05 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <53172.126062010420600575@us-mta-184.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: no8y-3BVrROCo_4ImUeC1AmSb35S0IrRJruPnBZYseM_1781966526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'exfat-for-7.2-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/linkinjeon/exfat

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2615342009

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2615342009_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2615342009_aarch64_kernel_kcidb_tool_21496193_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2615342009_x86_64_kernel_kcidb_tool_21496187_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { create } for comm=3D"rpc.mountd"
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2456368
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

