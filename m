Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BE723EAB8
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 10:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780743192; cv=none; b=XyjQO5tX+UrkOl/uvTiZJ6+vWLtuisfXIdSwP7vCNDXuobF3Zjp8wxBH+dKWmNdoc6lFxKzieqeYgXJBBCAmbO+o0pBGjws5VcvaSh/IYSNTbX4MB/w54SQwxgKMEweiAtD/5Hf5LgCFw2DSOOI79qCwBxexDBXIkTrtaxdaARA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780743192; c=relaxed/simple;
	bh=/Fcjv/E1pk3Bdz0TCZ9HgzflQTEdSHQZf3ND6y2jpAw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=a2UE8Qqq8/yaGkI/HLI1EIIU4ceA2djMr55LikF5zirs//gWCMZtWxDVYg4a/JuZf/I+vUvtn/sCjaoSDMfciQTTswYb5lvCVprv4OGcAhppGF25CE/yEMgfdDdNfDQgiUQGLiR89ivWb6WnpWy4DlL1TA+SUp4hiVh6n8yWsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aztY28rp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aztY28rp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780743189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=np1wwmWCmgxArOWfbKF2SMuWcn403RrRtxHWBxfaDWU=;
	b=aztY28rpPEDL9qq72heTIPKa9RQaoh9RvOy0GzNqxIxTfrDHhqUrjOZboRDX4jW1ciSUO7
	1SZ1fNCE01eQ65siyNZthb567jLWdHYTmkhGxfLNZKZFllUWKMPQ9wJGrvdzOUAyOabZVm
	kOUBLpcxRgiCKhUainjXXItoT07jS6s=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-pRFYPK4lMd2T-m1T0mNsgA-1; Sat,
 06 Jun 2026 06:53:08 -0400
X-MC-Unique: pRFYPK4lMd2T-m1T0mNsgA-1
X-Mimecast-MFC-AGG-ID: pRFYPK4lMd2T-m1T0mNsgA_1780743187
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 60A851956048
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 10:53:07 +0000 (UTC)
Received: from [172.20.58.252] (unknown [10.30.44.88])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 009A3195608E;
	Sat,  6 Jun 2026 10:53:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, c10130c2)
Date: Sat, 06 Jun 2026 10:53:06 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <36450.126060606530800399@us-mta-128.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ccz6weud59QsDUZoGFxj1rwhFJJBlW7pk9i5CbANx14_1780743187
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'io_uring-7.1-20260605' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/axboe/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2580658777

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2580658777_ppc64le_kernel

One or more kernel tests failed:
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

