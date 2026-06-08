Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE492E8B64
	for <llvm@lists.linux.dev>; Mon,  8 Jun 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780923810; cv=none; b=icBud16YoIR4HP3UhYoAtnz51knS0+3nFwhx9dGR1uah4MpvHNgeIbeTUSjRAcx5kdrTHka6Sj9TTMkqacIlbOvax9+V92yeVHg2dUms7KQFWATY+JHA8oFWoqKIUPllbdmU51PLVol8oXUL589Sh4oQ8wcmKB3S6gMIweQHas8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780923810; c=relaxed/simple;
	bh=jm7S1sHV2BvvMaHduZ58safp42ybkApFyNT2gDu0hEQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=i6ti8Zh3f9h65k4VERIkbecUUuL6CnXruMokWajDkk80j3ThCuqnTnKfh2dWyi2uniAxT9j+HxiHX+FnOZCG63TEb4bFXTgNTRvkJ3JVhCOJ5aGs4cVD7DGTTLW9LuZSkz+y5J/hN0agtwurd95Ufia8xG6q/6pIS36F+NvyYZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W9rSE0Dl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W9rSE0Dl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780923806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=glCU+FA5R4EOOa35G5Gl7lDug13WqTCXUSu59G/U9+0=;
	b=W9rSE0DlVQcsgJSqwJjo5o3IQUMhvmiwB0E9E3N5c4KbI1+FjIJGJVCmGnCRPdzVDcMtG/
	aEBLjQu5mNr+3LUjMDlsfxKZUEATHWHdgh/MIpeCjNlfpQwDymeu7RNHsuG1OrjlaZs/y2
	e6bE2XFhc5xMc3CvD9fZuPDMb5ClKIs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-572-geCUg2BSNg-W9DKS6RM3Ug-1; Mon,
 08 Jun 2026 09:03:16 -0400
X-MC-Unique: geCUg2BSNg-W9DKS6RM3Ug-1
X-Mimecast-MFC-AGG-ID: geCUg2BSNg-W9DKS6RM3Ug_1780923796
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBDCD180059D
	for <llvm@lists.linux.dev>; Mon,  8 Jun 2026 13:03:15 +0000 (UTC)
Received: from [172.20.183.50] (unknown [10.30.45.67])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 63E57765;
	Mon,  8 Jun 2026 13:03:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc7,
 upstream-mainline, 45498711)
Date: Mon, 08 Jun 2026 13:03:15 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <57982.126060809031601376@us-mta-572.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ea2P5gVS2O6CRQIrI7MkAISXSTfPD6hFEar1W4Nfius_1780923796
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Linux 7.1-rc7

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2583571514

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2583571514_ppc64le_kernel

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

