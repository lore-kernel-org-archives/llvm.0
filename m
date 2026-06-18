Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE00038D3F7
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781770995; cv=none; b=J/3VYgICEOFthDVZF8OAZSDyLj2dZs3HUl6NkP+P+EboPGLpeUHrB/ZBMsHIKsg5ZQvQi3DQy3lR5lKvKDHyDTprsnm/iu+QyifkoXQfizu2HyPM+iPC/ED9sLJoX5HexFUoE+dD8jpn40xS1qktByI6PX5h6oD8sYWA9eTq1Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781770995; c=relaxed/simple;
	bh=/KyRFEXyjnVEqEoN/wHKwUK6n+2TwFvCK0+hZjvnUpo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jJWbjtpKlZnn+OI2h0+F8XSal0yz7gkuVlxQCbokvRSFWYZ+dFFUvz/2+aKvp3YL+SOiaS67HHBsAAvx4fWsqaCTDJctYcUHKkmPd8TWf+HWIRWjrgLXFt4KJQOHOLjx1GWQN9LB/jZlDKjHCgk1KNhyhQyR/reyuU8vgvVmAjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ghqqToVJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ghqqToVJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781770988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HpDg9jAimKKctWBBUfiwfOgRT20VxFUSQmpBy41rlAs=;
	b=ghqqToVJ+zCIzyUZwk83OIjKH+/NFnlYGMqeuwyxZovbJ6r3+l+Na7j7827C7j+Eij4flk
	fGBhiJ7u7Y+2q6kT4z1d5TkDve7ODU8xQsiVEjdy+dhkYjE34r/BoC7Z7g39xFAhjxWtlN
	pruhetqA/9FBQcuKrNM42MlE9JJDvPQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-3OMbvaRbPEqTUBnbkTA7TA-1; Thu,
 18 Jun 2026 04:23:06 -0400
X-MC-Unique: 3OMbvaRbPEqTUBnbkTA7TA-1
X-Mimecast-MFC-AGG-ID: 3OMbvaRbPEqTUBnbkTA7TA_1781770985
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DF8E195608E
	for <llvm@lists.linux.dev>; Thu, 18 Jun 2026 08:23:05 +0000 (UTC)
Received: from [172.20.152.42] (unknown [10.30.45.46])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 55E82175F;
	Thu, 18 Jun 2026 08:23:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, e771677c)
Date: Thu, 18 Jun 2026 08:23:04 -0000
To: yoyang@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <54994.126061804230600247@us-mta-304.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aBQAFPuZVRsAiFY6w0WealyINIwPxhj3gg2igvgKoYU_1781770985
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'for-linus-iommufd' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/jgg/iommufd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2609610264

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2609610264_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2609610264_aarch64_kernel_kcidb_tool_21483760_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2609610264_x86_64_kernel_kcidb_tool_21483878_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301

    We also see the following known issues which are not related to your ch=
anges:
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

