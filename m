Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0D3126D6
	for <llvm@lists.linux.dev>; Mon, 22 Jun 2026 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108190; cv=none; b=P/PDUrtTVegU/D98ZA3gmbEKMt0ua1Bku5V/5xJAsvT4zlWNwIuiLnPlLdSGGaIAOgt7lKYXjIDtMq9f1A482PSjVscS1JICe7HJhgWcfWsoY7gjI/EJT0YDHKYc5KwY0HZbbITEWaCnqL+HkqDQC6zOxFQXmwaVvrYti9c2TrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108190; c=relaxed/simple;
	bh=EjFYK1A/MJJfopw9acxLl8NEHTvNpPT81DxH2/nMqmw=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=P1MdLqSO2Bsis2eXq2mSZdzG7qIDM4KBhOl6NxzPgbuEuuxO9CsjrmnO0XjlsLVY4zApFYSAB8xnlcq6u9VVF1W+UczKoVRolEsi2k933W76OlUSLT59WMBoI/MgKSZD12IH7a5bE0/XiTydnapXCWeVKXIlhTuzvnCqWv+lQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VAL6U9CU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VAL6U9CU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782108188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mA5p+Kew7Kh2Cg726+DC8206RzPJvpteg66F9Muen3w=;
	b=VAL6U9CUEwRhBQ3gjOKdrUH22qd2bc3gQKvN9OwXNa4lrmTGmQNy7hMOQUkCdiRZ3fPm0c
	B0dgBUwoPTNZZ3KVyrs8xlAEXwi9DC9TlkDcT/Q0w2QM+DYuBV1+q3PmfjuMHyHAYIb+1d
	LQByFFiYm3GTCrRzZP6IZMPLtRKiniw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-425-sv3zXTXqOouzeX9Og6uupw-1; Mon,
 22 Jun 2026 02:03:06 -0400
X-MC-Unique: sv3zXTXqOouzeX9Og6uupw-1
X-Mimecast-MFC-AGG-ID: sv3zXTXqOouzeX9Og6uupw_1782108185
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3502C19541B0
	for <llvm@lists.linux.dev>; Mon, 22 Jun 2026 06:03:05 +0000 (UTC)
Received: from [172.20.118.166] (unknown [10.30.45.48])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9AD681956047;
	Mon, 22 Jun 2026 06:03:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 8cd8cf7a)
Date: Mon, 22 Jun 2026 06:03:04 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <95451.126062202030600520@us-mta-425.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I8ST_oZk-NPJR0l3dO4nr1ScK5BPxPtc5uh5JwhebL0_1782108185
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2617731867

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2617731867_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2617731867_x86_64_kernel_kcidb_tool_21500578_9
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

