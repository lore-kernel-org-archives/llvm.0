Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC60362133
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 08:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526333; cv=none; b=pRdVctfP5WIhX6jl4ojg7a4n4RD4+hMsIpKRVZF2k6ljADy1jch5YbrKPeBPOzQlvwTYX+imurSC+H0xQv6xvKxAhofYlYpLbBbZs5c8dMI5I+xt27OP+Uek+5IbyQXes761D4gt5A5I9l4Qs0cdU6kDe30gpOOOKgRcpBG9oS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526333; c=relaxed/simple;
	bh=B1tW/K5U3/BnYRdsqS2Ndq8NIn3w4ceCxX35jkhZUAc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PkoUxERc1FyjQ71FG6BDvor4Ui73JBIKXbKkQAOZ4MTnotY/iSsEsxvL2mdMlOlKEjuMxSULchgQDEstuidoF4OPbIYWDkqxTnbnFrvF00ofQ/fnbx02x5dlXjSXwPSABiJZmhRvhHJ/692o3yc53sQuR7yVvxngmXJTk/KDaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fDykaTFz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fDykaTFz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779526330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9GlCURWhcAy++thLTnrLbYh+Rl1gJMo5eXoRzjXUjOQ=;
	b=fDykaTFzcEH9xfj7A7vwrhS5dQiNhcILD3W3NS1kEWVD1HmDArs8SGwTrxZpxcyI/gJTLO
	neISEvPux8XpxERjVb+gwq4Rn434fxxqQAr7Imz+kwhQujGC9sOLx3EFGaMQlmatUmQdID
	W94JKzeNS+zLZJG6aC48DHADKAPgKBY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-dZnNBY_CPGuK2TINQACqUw-1; Sat,
 23 May 2026 04:52:08 -0400
X-MC-Unique: dZnNBY_CPGuK2TINQACqUw-1
X-Mimecast-MFC-AGG-ID: dZnNBY_CPGuK2TINQACqUw_1779526327
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 581BB1800372
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 08:52:07 +0000 (UTC)
Received: from [172.20.212.222] (unknown [10.30.45.124])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9CFB71800352;
	Sat, 23 May 2026 08:52:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc4,
 upstream-mainline, cca95436)
Date: Sat, 23 May 2026 08:52:06 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <88755.126052304520800135@us-mta-13.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VariRct_NGtWzo2Gx3IvzwBz4VgJssoMwirdRyglu-0_1779526327
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'phy-fixes-7.1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/phy/linux-phy

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2547296507

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2547296507_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2547296507_x86_64_kernel_kcidb_tool_21334846_9
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

