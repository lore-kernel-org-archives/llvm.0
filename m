Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C562E093A
	for <llvm@lists.linux.dev>; Sat, 21 Mar 2026 11:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774092187; cv=none; b=YNu9ORNg8NEag6i4VoFh2+NRgoXJLM2mbOkQWeyuBwMh62tneIWU4++9R1QdFy4eB1C4jLNZ0Sad6HgyBXN2fwM4xskLAl0ROeWeew3SKHY6qasrNWZANmpgDzYjXuo3J4OGeo+Gg6sQp9rbPZ+zd8kDFFbbad4DkcwAGv9RePo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774092187; c=relaxed/simple;
	bh=PgxQk5SsAl7i2g6w2uNxaYzZkyFs82piqoG52gDVZdY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=qbkmitl2cs86By+nejYUV9FjIjECa08eY97acU67NerRiEQMryoK7puyfHIj/OUjlGQf/mw2Ru1nQiYvWQz1n4mVxMgpjPTyWzr8eBkntAVWx1xGI80M7sYgEo12wxtJn6w3lDgaL85MHRbuEjF3A3MIcc/gKb/g9rCr4yWEm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J+ouYSQ7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J+ouYSQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774092184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pxkMfk3iPrKugAxCUOGIKtOmuFYiQNx3v0GmzPEUgNQ=;
	b=J+ouYSQ7HFTQmI3HWC2v0kEwoQngzoUiw8p8sDr44x7WnPdatY4s52b1+6XZSaFdqC5fQm
	cG5QZA75IQyXR6WsuyjlsOyEwfZm0z4ezY5xPOQS+9bB+yvxNmmbD/s9TU15dXcdJbPJYO
	csqUM5WAvW1mSQn1zFGAzv+W5EN0NEA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-QTFkRWKhPmGXwF8DE3z8uw-1; Sat,
 21 Mar 2026 07:23:03 -0400
X-MC-Unique: QTFkRWKhPmGXwF8DE3z8uw-1
X-Mimecast-MFC-AGG-ID: QTFkRWKhPmGXwF8DE3z8uw_1774092182
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 55893195605E
	for <llvm@lists.linux.dev>; Sat, 21 Mar 2026 11:23:02 +0000 (UTC)
Received: from [172.20.168.233] (unknown [10.30.45.63])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E4519180075D;
	Sat, 21 Mar 2026 11:23:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.0.0-rc4,
 upstream-mainline, c612261b)
Date: Sat, 21 Mar 2026 11:23:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <28540.126032107230300161@us-mta-524.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z0aWjyj911WZexItdbuX_aUyB3J2cEj6r4hv5dJAGxE_1774092182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'io_uring-7.0-20260320' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2398729928

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2398729928_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc: denied { getattr } for comm=3D"rpcbind" name=3D"/" dev=
=3D"pidfs" ino=3D1 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsys=
tem_u:object_r:pidfs_t:s0 tclass=3Dfilesystem permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2417839
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

