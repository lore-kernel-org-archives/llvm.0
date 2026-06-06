Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595AF481B1
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780751002; cv=none; b=ZJ0ARr4bONl4g68whCvwqg7q4rhJscgKXr511koc69YHzzJnv6Xihw2L2YXJY2XueWej/7Fyc8FjP4rrMNJKysHCpluE24iyVODVx+Tc+hjas4BUnDC8c+eYhIW8BR9KaOy3r1gcu9mttUbLE10vkHegdwz92Mm3rF42xTPiIjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780751002; c=relaxed/simple;
	bh=bBiolsJ56Tcb7RsthZ+UTLuHOBuethbVFoafcMLWCQk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=uwUIpoFggPsQ5FC5VSogBPD7ExkrF6QE/YLGvpPIVTdIIrlaKLl4PONkaGIWTNE3KD2iLeTeytyCqJnXhW5cKuLF+b3TwGOnIr7Ib6kGwbIHX7JBUBqRXTapqQUZv/zrNpgQk7ZAyEkfNPOSBa+rIVl/36Fro1A7FUQCeeNFOzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P8xb5pte; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P8xb5pte"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780751000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sLaHOY3AUw3Lah2y4Hy0ZHcS5KcauozNm8Y2cmRKVzk=;
	b=P8xb5pte2fy+HFRnH5B63P49dYQ7FvjaitYI06nlvJS8OF9XRqYMS+vr9mb2MYDAg4WEwF
	xZyf9PkDkRuhEMDxWLuLcGxDu1DI7u+cNqUfBQQk/s8NZNa1w8HCRBM6mr8ibO8VM9/CMQ
	qGVx8qWFmF3eqGMBaQGVJy1htCUcliU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-74-VHzeg-zGNRKXU8_-sg20EQ-1; Sat,
 06 Jun 2026 09:03:10 -0400
X-MC-Unique: VHzeg-zGNRKXU8_-sg20EQ-1
X-Mimecast-MFC-AGG-ID: VHzeg-zGNRKXU8_-sg20EQ_1780750990
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C03AA1956089
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 13:03:09 +0000 (UTC)
Received: from [172.20.58.252] (unknown [10.30.44.88])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6E3BA3000210;
	Sat,  6 Jun 2026 13:03:09 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc6,
 upstream-mainline, 8e65320d)
Date: Sat, 06 Jun 2026 13:03:09 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <38866.126060609031001675@us-mta-74.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: glV2kDTNcziTwhobv_NaUxSdEKA71ahFBcD9FKKXqdQ_1780750990
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'drm-fixes-2026-06-06' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2580813939

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2580813939_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2580813939_aarch64_kernel_kcidb_tool_21421760_9
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

