Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3272BF014
	for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 01:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750122135; cv=none; b=DNTYMFAiQ6uALQLuu6g+URAVSMzVsX22FooZGYFq+p6lJFrrEfAlls1cJ+VPHhQ0gYJTPFe1ZFHYOAmF9pyKMLGV/Eix8fBQrY1OKYtGwYPQE4HBYtL0E4/6V6I+FJXPvLkgonGWy181mo6X2YxCZX431GJ800xZ2HPRrfBNrOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750122135; c=relaxed/simple;
	bh=ospMXSe6TcH5ZFslI7eHGzEFVdVEcnM7JHD+rdR9szU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eGskLgAed+Y6UMwncyW1BxM6Xtot48eQD1b5Jje0rgeBBiQpUsiAY3FBQigOFw765kC47Co3e7wfhFNOtXCX41QFWAIpUsiPPEeNRH5TBzTv2dApd+PdhDJ2EbwOeRSYAcU34rdIDLxCB7B5uP4lLha5yH+rabvae5tRBrOM2mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a37JUkrn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a37JUkrn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750122130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=38zI0uT4iLHePXEyU7bXPqdOLJbZwGTLBknVjIpvzL4=;
	b=a37JUkrniuq8HIJbB1nD7x5J8aWCrHRv4uwaAth40Wi9RcAXZQbp/TN3whdl0dC8wwke0H
	dCmvszYi6cEe39BFGhl81bdAe/EtBNNYkY7IeG3bJaMssJccsCzNPt2Niqnjjw8mxoU1Yl
	ws0se3Pg7zuQsCAIsp5c8dzm8fJiWfo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-EwxVO8zFNn-41r3sf4KyFw-1; Mon,
 16 Jun 2025 21:02:08 -0400
X-MC-Unique: EwxVO8zFNn-41r3sf4KyFw-1
X-Mimecast-MFC-AGG-ID: EwxVO8zFNn-41r3sf4KyFw_1750122127
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17DCC195608C
	for <llvm@lists.linux.dev>; Tue, 17 Jun 2025 01:02:07 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FA21180045B;
	Tue, 17 Jun 2025 01:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 8 of 100): Test report for master
 (6.16.0-rc2, upstream-mainline, 44a5ab7a)
Date: Tue, 17 Jun 2025 01:02:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <50884.125061621020800390@us-mta-468.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gAAPWsX_i8Svj8KYzmiL0e7y10DvTQUrcHY5aeaVtlc_1750122127
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
    Commit message: Merge tag 'powerpc-6.16-3' of git://git.kernel.org/pub/=
scm/linux/kernel/git/powerpc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1872559865

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    kselftests upstream - bpf_test_progs [x86_64]
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

