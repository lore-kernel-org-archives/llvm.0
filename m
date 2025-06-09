Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE71FBC91
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 12:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471136; cv=none; b=e3Vn/hsOW/zHCU+NEOZ0HMO/FjHfE3HQY8IWPTTduha/PQrU3Bhwsr3vC+3upYWWn0dco8eB9bNiG255Bu48XCzN42HICVdi73ZQ3GG4KVoR3DB+QWeAnkELJpW+BhwuvZ2xZ/bavWo2tEBbnq2Wd6+Lh/5St7GEfK+aDx/+mrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471136; c=relaxed/simple;
	bh=oiO2DnYWFXqL18ayBqElJqNRSdRuK6aPUSc39EGpDSM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Db4QzHiUXNDNrztiUxGgL4j5CLzdiQFsc1E4M0VxblChTkorZFujU/pZA6tCtvZa5OkYXbuxDKJ+sL0w8iIditHd+b7mF5rVZ6vXAlTJJMsc/sLGouTP+CQP+nWCmQV75CIfgkTMtvBrGtO5WcHb6oSMUFqLfor/uFsEtfU0IRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhmrnFQb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhmrnFQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749471133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3CK/akHFKWt5MMO8YGGqlqg38X6EvL6ND79j7+tXD6Y=;
	b=fhmrnFQbuNce7sfkARA3gu6igfQXGqmdlC/gOKBedbHt9Zgs25RA/Nf7t1FO0pkJM0Turu
	I9YTfONLu8G+h9d36F2K1VjJ9oXyRgRUJQZ5uIn/wCA0S/A3HxhH7HzxfD52OfwBbrMPxp
	nPLfPEu8l26v5CGo4w/a9sXvSnuSHzk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-160-phDC7RyqMIK6wEySyMlR2g-1; Mon,
 09 Jun 2025 08:12:11 -0400
X-MC-Unique: phDC7RyqMIK6wEySyMlR2g-1
X-Mimecast-MFC-AGG-ID: phDC7RyqMIK6wEySyMlR2g_1749471130
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 435B3195608A
	for <llvm@lists.linux.dev>; Mon,  9 Jun 2025 12:12:10 +0000 (UTC)
Received: from [172.20.188.120] (unknown [10.30.45.122])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 125FA18003FC;
	Mon,  9 Jun 2025 12:12:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 3 of 100): Test report for master
 (6.15.0, upstream-mainline, 119b1e61)
Date: Mon, 09 Jun 2025 12:12:09 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <57718.125060908121101159@us-mta-160.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zm7eQFhSC0B4EpsmXtSVg-EMUygTq2dZvRCramiuw5U_1749471130
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
    Commit message: Merge tag 'riscv-for-linus-6.16-mw1' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/riscv/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1858291852

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:
    Reboot test [x86_64]
    xfstests - cifsv3.11 [x86_64]
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

