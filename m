Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F4379979
	for <llvm@lists.linux.dev>; Sat, 13 Jun 2026 08:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781340195; cv=none; b=HKNND3/GIccoLUXTqqP4icumpcnYlsupgu9WDo9D8ob/OVwfd/wGhM9pEbRZCd9DH7ht1nXEFKb0RSNjQfpK0V8wFVtgfy69I+XCmUOoCd/Ze4sxPKO162RvGsLPR4s9oHfHdO/Na4KKg9F0Oqb2+LrOh28a1dnwwD3EojIrCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781340195; c=relaxed/simple;
	bh=Lgyiy5oN1qDVofYaHxoUBQoDLxBulYCTrybXzbDEnnc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tHOlV8PauhHwmPspSjY3B3vhT+8rrfC1dz29fys8e0CH8Df01x0byRCgM7hMPqhKXxe3XClIYKnYAIRdYxpazNtF2GzMjmWlmjvD0h/OZzwf8Es3cSCBDXiWvjoxE+4wVsUm4/EQ/zW4d1h9GWEwUoPZx4YbLYvGTTZTQVqW+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNiBkI8j; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNiBkI8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781340193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=452XhnA6Hm8ySHzDumHz4u8rLO4xVxF6vPY9rXoXe2Q=;
	b=LNiBkI8jqBhKu3X1XLtMeCNZd9TQBuFUl9YOccOTsnuf5rNm31uq/rfuWNdwnO9OEVfs56
	clGUrcYO3ePvcvMRj5For3kyxV5S0WQ7QRmVZN5b0QxEQpEPLTUQza9TZcRBBN/snsccLI
	VpYDOokjkVL6enS8sArJgCFu3GbQFvs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-DKTvySYGMoGWC0fRqpyrpw-1; Sat,
 13 Jun 2026 04:43:10 -0400
X-MC-Unique: DKTvySYGMoGWC0fRqpyrpw-1
X-Mimecast-MFC-AGG-ID: DKTvySYGMoGWC0fRqpyrpw_1781340189
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 895D3180131C
	for <llvm@lists.linux.dev>; Sat, 13 Jun 2026 08:43:09 +0000 (UTC)
Received: from [172.20.205.34] (unknown [10.30.44.235])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1190B1774;
	Sat, 13 Jun 2026 08:43:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc7,
 upstream-mainline, 2a2974b5)
Date: Sat, 13 Jun 2026 08:43:08 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <58913.126061304431000189@us-mta-303.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ASr8-q7iXB9aCTeXSxIZ7o5eIoOyGNLFtR9fffILmGI_1781340189
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'pci-v7.1-fixes-3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2598110070

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2598110070_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2598110070_x86_64_kernel_kcidb_tool_21459619_9
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

