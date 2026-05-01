Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF9B2D9ECD
	for <llvm@lists.linux.dev>; Fri,  1 May 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777618931; cv=none; b=S32sr/McswFqah5g9aRgdldAV/wVX8ueaDMFuJ2FGglPHHMls3nBiObPFaChPeMruyCsujuRPhc97rFx4m8AMFm+vfc8Zat2WpjY2FdcpHpvzfPMyueAs0nSwtU/LgWQ/dd6wCIhetwujDWGhrBab7jDMtdrM17Wq+sXZQxF+RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777618931; c=relaxed/simple;
	bh=nBxMGC3oZvuec4RbejEAURaeVvgJXPvP8+zgYfhIOAE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=u1YVPxCU5cPaHLQYCxWADh5HXIW7JECCYDBq8Wk5i8/2RneRWm8IqHPwu3gat5ffNJpcmrbTE2/wv69St3lVXKpN8AiRthJK4o6SgoZOaGNKiA/+IswuQ3bITkoQnZMqtZzvuS3FHHkwoFCegO/dDEU+I4lkj/BVWyNR7omswLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h3ehbyk8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h3ehbyk8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777618929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CnjC/YrCSKQSb7oABrBU6yk3EiJLe9XpzAuSoi7bKpk=;
	b=h3ehbyk82YQMV0omK34VCh2x61khzSowWcFZO7DQmCZubYADj07vevjnIUaiwtPOXrJBvV
	etTwqHjPir6xKKhoAGMDKL2/a6UZ9Whjl5N/UEnswmTK2G+V1IyKl2CQpDGvL1bTuzoZAk
	O6IKDTUKQt4ZCA3TL7AnOaS6+GNhVYQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-KW6EWNo2M-OpQzD6AWkt7w-1; Fri,
 01 May 2026 03:02:08 -0400
X-MC-Unique: KW6EWNo2M-OpQzD6AWkt7w-1
X-Mimecast-MFC-AGG-ID: KW6EWNo2M-OpQzD6AWkt7w_1777618927
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 678FB180034B
	for <llvm@lists.linux.dev>; Fri,  1 May 2026 07:02:07 +0000 (UTC)
Received: from [172.20.231.189] (unknown [10.30.44.222])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0ABAC1955D84;
	Fri,  1 May 2026 07:02:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc1,
 upstream-mainline, 08d0d346)
Date: Fri, 01 May 2026 07:02:06 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <60626.126050103020800120@us-mta-543.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LyCpZAEtrjSE4VS1d1D_kWUWJhsaRkVTqVNq3Q2Kv6A_1777618927
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'net-7.1-rc2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2492021469

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2492021469_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2492021469_aarch64_kernel_kcidb_tool_21203730_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
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

