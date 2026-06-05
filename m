Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CB3477E33
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 07:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644188; cv=none; b=NrLQRnbG04gqiaZZxOMX9zD5L70/78m8VbAU6f4xx/EH76TCk4mVCSSbKpcdaDdWnUOJ9G44y/er0RUiYPB0mL2t1WhtGoD4iTI6Nk9nauunpEp2/KznCUBi40Xqhvq4LGgApgqjowGUtP3HwyusSi77m9kN/VpEjwxCDYoD9V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644188; c=relaxed/simple;
	bh=eLEzUaLK7tsTLyglZ6vuRvvCMZ5//Yza3rBNSvDahKY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=L543a5VlrqZIowRcbEdDpJMu9gOokYmZ2+a6BoZmuLWj6yjvziDFmAZR2eDHShnQvxFi0pmBjvBqB9lrONIDkQv0CSI6843SkhoFCBDmfhkgLdGCzyQhjii/0iYorjaECHBd5oz64pXbJMuqynhx152duA0lziillouJHcObxLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GKPlDdWE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GKPlDdWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780644185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ji9rGwzb4kykHiUNUDjcHg8C8kyasWVU73z1/MGET4U=;
	b=GKPlDdWEQXWEGoAb2mS+txA8gPRFqvST1b9FwtrInmMSM0zeRXGSp1402pFFYIBdhNSNGI
	FVVi8Qi41Y06p4eZ1RuXv++b0fT/8EmOE79O6e1xn5SYFwh9ljQ0serG441Nxm63oQuj92
	fA7ojy8ezgOM/55u7++1ReGsfU3pdJw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-488-CrEvKuK6M2W5XAgs296yOw-1; Fri,
 05 Jun 2026 03:23:04 -0400
X-MC-Unique: CrEvKuK6M2W5XAgs296yOw-1
X-Mimecast-MFC-AGG-ID: CrEvKuK6M2W5XAgs296yOw_1780644183
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B2E31944B05
	for <llvm@lists.linux.dev>; Fri,  5 Jun 2026 07:23:03 +0000 (UTC)
Received: from [172.20.13.137] (unknown [10.30.44.139])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C1D41800361;
	Fri,  5 Jun 2026 07:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, 9154c4af)
Date: Fri, 05 Jun 2026 07:23:02 -0000
To: llvm@lists.linux.dev, yoyang@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <67016.126060503230400107@us-mta-488.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VzLqjMDDM9kC8KVtTKw4vUQpOFjKcpsRVvAe1CdPQvY_1780644183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'mmc-v7.1-rc3' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/ulfh/mmc

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2577626330

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2577626330_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2577626330_aarch64_kernel_kcidb_tool_21414970_9
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

