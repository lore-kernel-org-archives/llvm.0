Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA4526AE5
	for <llvm@lists.linux.dev>; Sun, 21 Jun 2026 18:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782067392; cv=none; b=Fa81YBFENchcYAXAOPLKmWaLPtjZtojXIRTJixA9K6iRH1LxfhIhozm5wYphhbXVUtumUX/NJKPCGI8PdrtaWEvnu/VwGe3GHBjgzqXtaMqx4omRU6HL8FE6pSU0GJ6ebLaOlfRI/dp0+Ci35j8BHNTmHMCJTLwBvlk0nYTcYTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782067392; c=relaxed/simple;
	bh=Kf5E+WWVuJq25eMQITDnNFsfrOPIsoKcWBlvIr85jD4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=o0Abg7AYUqh5nN8sw1KHwz2UpwJG72VrgwnG/s4y9RpZo9VckwyliBntqWI2EYQ0i8RBH65WbOgWF+h+7nNsWmNLUB6ZArviwZCDkiJRTJv758+W/VBe7g3A/4ckYIse1Ago/+gNVXhYcoQM0LKrsp3tXLB3FHXdm9nKTHAZQnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GEoxGaZl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GEoxGaZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782067389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rrE12pH7Kr7a11R8g6M2qIE1vptJeIP1Tn5vlPyZoC4=;
	b=GEoxGaZlRvIsHm5Y8JEEfGz6eGBn57nCHM3rt4z+4rkASitCJHYfnEaRXYTHIgqnS/kt54
	TS5C3S/CMklRd9Z+QfpJ6jici3La9TR385/Pf3KKRN5ABXUcay+QGHOX3JLpsjoKjuzIEN
	JIi45wkP0wIObRfec5lhI1km/BKck4I=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-5v7dmm2ZPkOTojL6L8oTGA-1; Sun,
 21 Jun 2026 14:43:08 -0400
X-MC-Unique: 5v7dmm2ZPkOTojL6L8oTGA-1
X-Mimecast-MFC-AGG-ID: 5v7dmm2ZPkOTojL6L8oTGA_1782067387
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 896E719560AF
	for <llvm@lists.linux.dev>; Sun, 21 Jun 2026 18:43:07 +0000 (UTC)
Received: from [172.20.118.166] (unknown [10.30.45.48])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8FCE130002D6;
	Sun, 21 Jun 2026 18:43:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 2 of 88): Test report for master
 (7.1.0-0, upstream-mainline, 322008f8)
Date: Sun, 21 Jun 2026 18:43:06 -0000
To: bgoncalv@redhat.com, fs-test@redhat.com, ftjahjad@redhat.com,
 llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <50936.126062114430800476@us-mta-622.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SWa083GJ2_Q1uZYITAE5d_eUJF5JZ662ZHXVuDVBkrA_1782067387
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'hwlock-v7.2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/remoteproc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2617023065

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2617023065_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2617023065_x86_64_kernel_kcidb_tool_21499836_8
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2617023065_aarch64_kernel_kcidb_tool_21499807_9
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


Tests that were not ran because of internal issues:
    /distribution/command [s390x]
    Reboot test [s390x]


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

