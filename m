Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1036302146
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 07:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775200332; cv=none; b=EIJ7fLR8QFkalYP4DVP2v/bZhWIWk0X78AZMi2yr3pBF1BWTBVo9VrpwMrHT1VDUnoUX65oXXSmHL4iMFJY8ayu3Ag3qLCLwysc5e/T+/j4BwhUtSb7GfF9mCv17F1z6C7TSg5gczCsbd8EeLxmQnPqS8RQN31cqBt6j91D0b/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775200332; c=relaxed/simple;
	bh=lkx/EPu9RCjHFejtE1olO9afGX3m4zBn7OJsN2o0/rQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KEnR5KHGNGQu7Csvhceao2j2Rqna56Xih7nNKwxgY5pE175wVxYUY6jlypy6EgxHYaumPTDvJsiqm5/CtB97AhZzZ5MRM9LzzdTFDLGbOR5UVe1AO1uo04RPi7OFzXWrzPP24H3jMF+tTwOcaSLYRsJ44EidH4hMXe2kHS8Nujs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gg2cnmJL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gg2cnmJL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775200330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lhndI3Hm5s+prPYlhDFtLoxdfhuIDRwaBnjrdv4DLiE=;
	b=Gg2cnmJLK4wNu4nHJJwI2uFM2Z9/76Thrmi25MuDMKDP76bKlQS+24h+8MD90IdxxfDpb9
	DxiaKbBOS+vuUv050QKQTpj4LLkj0WZSW+YYkzXG2RhyCZh/t/qmZvcY8VNdYox7Q3yKU1
	JRrnMv37BiF9+otgwJzFXKSIJr4nHKU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-534-6OZFmnLgM32ijuXKP9AN6A-1; Fri,
 03 Apr 2026 03:12:08 -0400
X-MC-Unique: 6OZFmnLgM32ijuXKP9AN6A-1
X-Mimecast-MFC-AGG-ID: 6OZFmnLgM32ijuXKP9AN6A_1775200327
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E7EE19560A1
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 07:12:07 +0000 (UTC)
Received: from [172.20.155.76] (unknown [10.30.44.186])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 12D9818001FE;
	Fri,  3 Apr 2026 07:12:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc6,
 upstream-mainline, 5619b098)
Date: Fri, 03 Apr 2026 07:12:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <12868.126040303120800178@us-mta-534.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QV1rrobge1DInd0GDaqd7LY5unnsy406wQtHZHcV-DA_1775200327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-7.0-rc6-tag' of git://git.kernel.org/pub=
/scm/linux/kernel/git/kdave/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2426687180

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2426687180_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: fedora rawhide - nfsv4.2 failed to update ctime when calling=
 futimens
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417851
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

