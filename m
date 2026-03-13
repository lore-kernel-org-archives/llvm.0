Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF634C815
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 03:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773372730; cv=none; b=a/Tf8FzTEdUg7sW90bwJYOyG8Q4GRYhwKaHe6OAvroKeQfsVRxT5OnMQcsbcjI8KBSt9GJvFcyppVDno9qrqTihYBaZj+wLb2RuZs7eFjOtZrD6SEn5cOAhOz5j8UTA1a0snW/qtdZ1IXa/NHAcbH1anwFTnnp8si4GpybEwFXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773372730; c=relaxed/simple;
	bh=eSvSbJkq+2fFUVbx+dy2xdUGtaFDIp0wSq+lVvwWHAc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=S25TaFxoKJnt9RWgnkenU6KuKNHnzEhubmdgQVraO54BenIht+hSF3S2GbkayPieMq5snV6r1C2DceAQ1vbUxjaLC9dcnnPfMgQ1Z0Nq3T4XxnvmURJ8ze6ePC54Q5hSqgaRgKzJ1yya6fjh8Pu+UCmAV9KxZJNoe2EaxscWUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AwtadT1l; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AwtadT1l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773372727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kM/JCp6G1I/UJ8yZCbqa5Z7YG9Pfk1Gxhhg0yHWFn5M=;
	b=AwtadT1lOTMmwCGaEcbClg0PMoW+z+TgV2vu7DgT4Vw0fdG/C0qpoRQ1sFRouq6O1Feb5w
	1j2gLaWASoZB70uWp09j8wNmIGvCsiUJf0T+QA4wOYoPMpU9k2jgeuuHfPGQCw/xZRsaay
	C4VH+n7mxdD647lThYFb7jV+Xi4Wm40=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-_0rP-dk3MU67oBgZcfRwxQ-1; Thu,
 12 Mar 2026 23:32:06 -0400
X-MC-Unique: _0rP-dk3MU67oBgZcfRwxQ-1
X-Mimecast-MFC-AGG-ID: _0rP-dk3MU67oBgZcfRwxQ_1773372725
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D79521945CB7
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 03:32:04 +0000 (UTC)
Received: from [172.20.219.202] (unknown [10.30.44.44])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 77AF3180035F;
	Fri, 13 Mar 2026 03:32:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (7.0.0-rc3,
 upstream-mainline, 0257f64b)
Date: Fri, 13 Mar 2026 03:32:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <79887.126031223320600207@us-mta-112.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SikdqDSrVMT9T4x_TKPbhLj25ffRDqTx-lfytqteUCM_1773372725
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
    Commit message: Merge tag 'pm-7.0-rc4' of git://git.kernel.org/pub/scm/=
linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2382185108

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: selinux-policy: serge-testsuite: /bin/sh: line 1: ./scripts/=
recordmcount: cannot execute binary file: Exec format error
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1507
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: xfstests nfsv4.2 generic/309 FAIL on 6.19.0 as "mtime not up=
dated" and "ctime not updated"
            URL: https://lore.kernel.org/linux-nfs/20251219175955.4480-1-ok=
orniev@redhat.com/
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

