Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CB4346E4A
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 04:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776399190; cv=none; b=YUyamsG4jlzUn/b9ab8atlKDOJaKtuw3+zN9h0aHD+bUS6IzxHHfaPzbZf6v2zzt05sDi8Qy0DubF9+GxtAJgeaRS9yisgqHEKurGH+J+ZKOJrOFOvd9pOH+GO5sn0GgCQBoJPOLntkBP6/iVGsQ8zlfqNaUJohJM7y6h6jNUQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776399190; c=relaxed/simple;
	bh=Y1DWFV5uYuQNeV3jXZNyvMJE4BOiTZYgQmfLjhD/fko=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=avNZkp9ksUgceK25cciO9Zg2ozE296/5mxgN3RGnGAsjn51r94AC5djbnSmBa5mQFVxVxRbmVM2WVmaETpeataoDR7rWGYq30nWfY46LaLAqmNNoUwrJrFEiAeWFq1/ej4F0M0CAjsb7scMW2V7k+DDr2MaXWy5iU2u/o77y5r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YNt/1VBR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YNt/1VBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776399188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bk1Y/oYRnKbWzrKM3Li2dWjGuCy1SrVtGlwgrUJKf3s=;
	b=YNt/1VBR+brU7rBwGT1edYO9xSo/nJel7qAbSu4On62+BtBIerz3SO/4WIuyfoO96jlq3N
	ZNVdjlLh4Yaxyz4UMz2a9UzMNJwFw6kUERGAMwbilsPF8J2FkCDUdT46ugeL1+Jz1NDaCD
	LWro5ssv2f/mdeCVAED06ItroJJAnx8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-vmSvnIXWPuqdGdm3dZ5Gdw-1; Fri,
 17 Apr 2026 00:13:06 -0400
X-MC-Unique: vmSvnIXWPuqdGdm3dZ5Gdw-1
X-Mimecast-MFC-AGG-ID: vmSvnIXWPuqdGdm3dZ5Gdw_1776399186
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0B8E91800454
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 04:13:06 +0000 (UTC)
Received: from [172.20.96.14] (unknown [10.30.44.37])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8B84A19560B1;
	Fri, 17 Apr 2026 04:13:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 17 of 97): Test report for master
 (7.0.0-0, upstream-mainline, 3cd8b194)
Date: Fri, 17 Apr 2026 04:13:05 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <26412.126041700130600527@us-mta-258.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ldjpjKwrz_qoO7ilRMfdi6jfV-8HY8sypjK4TAHJUvE_1776399186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'v7.1-rc-part1-smbdirect-fixes' of git://git.=
samba.org/ksmbd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2458418854

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2458418854_aarch64_kernel_kcidb_tool_21118805_9
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


Tests that were not ran because of internal issues:
    /distribution/check-install [ppc64le, x86_64]
    /distribution/command [ppc64le, x86_64]
    /test/misc/machineinfo [ppc64le, x86_64]
    Boot test [ppc64le, x86_64]
    CKI/restraint [ppc64le, x86_64]
    Reboot test [ppc64le, x86_64]
    SELinux Custom Module Setup [ppc64le, x86_64]
    selinux-policy: serge-testsuite [ppc64le, x86_64]


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

