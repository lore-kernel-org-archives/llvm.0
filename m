Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9087262C
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748673733; cv=none; b=g2v8kzk4QuPFtO/zLaeiO4I9NrwLevDS4q9P8p2ZVBpT2MFjryWr8kVI974JaiCiBLj5a85MIQrC4AG/DR0rHrYN6JP3hDdC/3labgzwMvay1z3lyBX9uoEZ4W9JeG2lsR0HhNLQ+GYK6J82WwCZ+SSpztrlrQeAixZPphmD1CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748673733; c=relaxed/simple;
	bh=WiLo7Q7YJB9uS/UIck4rcmc7LsCQFLC/8K04G5slRDc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=baFKaaw2bxms/wQj00GXnVSY0IKFVSfBcecRpzIAWNjNiX3mCa1cQKgLz7Ua1TYS4mSr+uAzQX53Hmr1w+jDsQ1lTVTuKswQcBqrSFDFx18Ye8imSWDCqg1+n2ya2L6cfq+6iXNiJIE4S7B8W8GBHzKm0Yi3fH/e5UnCHLGR3HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bIEbgekY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bIEbgekY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748673730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CprwUlkv/TQoat5U5d34bvVT9g5oVeoFqh0GOWtktG4=;
	b=bIEbgekY717Co3q2acDCvqINJXsd5wOYe8hDtrTfBoxMe5woEAUnliu5ntY2xrI8AoIkfr
	ib8gbfec5uTqNsSZCrd+BTKFvbLM5IMm2mY1yStLCDZSZXwYd0pAEuLfbeLDlvz0pK+fon
	P7Jp/v4ilw2ZocT3zlticJBo+yq9VNg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-399-C4xXLaUrOPq86ElxuCiPew-1; Sat,
 31 May 2025 02:42:08 -0400
X-MC-Unique: C4xXLaUrOPq86ElxuCiPew-1
X-Mimecast-MFC-AGG-ID: C4xXLaUrOPq86ElxuCiPew_1748673728
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C90B4180048E
	for <llvm@lists.linux.dev>; Sat, 31 May 2025 06:42:07 +0000 (UTC)
Received: from [172.20.48.73] (unknown [10.30.45.91])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE3FF1956066;
	Sat, 31 May 2025 06:42:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 1 of 79): Test report for master
 (6.15.0, upstream-mainline, dd91b5e1)
Date: Sat, 31 May 2025 06:42:06 -0000
To: mmalik@redhat.com, fmaurer@redhat.com, haliu@redhat.com,
 omosnace@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <05476.125053102420800821@us-mta-399.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 22OF3mAXKBiWKdO8--nYQiDzQe1kNUyZq16juV6cE-4_1748673728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/rdma/rdma

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1845144688

One or more kernel builds failed:
    Builds that are failing to boot:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1845144688-x86_64-kernel-debug

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1845144688-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Test

    We also see the following known issues which are not related to your ch=
anges:
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]


Tests that were not ran because of internal issues:
    kselftests upstream - bpf [x86_64]


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

