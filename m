Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6538246778
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 00:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284536; cv=none; b=TYpltJ61nzIoBzvHp45MFik7AFAgMSmwNqlcA8Vs8uf6lLYVRHWdhHx/nbm8FByLrlFb4hpY3OAr9bZ80qOk3SHCvOI5JwRAe+SoH3yNp+HS1YGTmRUzdri5KM8n3L2lqyL1nXGD3PvEgp1i1ztUPnoWa3vFf/xLW2ZjlvNj44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284536; c=relaxed/simple;
	bh=KdMNOkcDjhS3VlnH58Xe4BLTAoXdjAgs95bPedNeSZI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sW5GJPtQYUFcefX2yy5HuaWSMEMv1NJEbLhRs6ABZINS0EAOh+M6J8SGV92N0hHjnUMtAyvBorMXwmIQGfk0jYii9ow3aA6h1UQ4u6Ql3/+p3kGOV3DnnRbWtIJLPxUaUQQZoI/77qaplLNYCS95o0S66j7gMM/hpNK95iVpuC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K1pHCUGY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K1pHCUGY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785284530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WXEUsYl1RxBks764jNt5t2mMaQGqYDI4WWh7oiMcFn8=;
	b=K1pHCUGYQdOptFmLvWJkVcp8X1TBaJgerLvK7jZ+kX8gEKC2wSiTAOLzSaWApg80iuXuPt
	5BD3ghecHEzh+HQgGGb8AFOhsNN8Fel4IwHN391l/eFJEuvLHAhl3tTlBMFIV0B/z7kgjT
	p1dSbTINwCTSLvj/YY3XpWCD2NSOEvw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-533-4S0KL1hhPnK6fs7jcewYFg-1; Tue,
 28 Jul 2026 20:22:08 -0400
X-MC-Unique: 4S0KL1hhPnK6fs7jcewYFg-1
X-Mimecast-MFC-AGG-ID: 4S0KL1hhPnK6fs7jcewYFg_1785284527
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 553A91956094
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 00:22:07 +0000 (UTC)
Received: from [172.20.176.224] (unknown [10.30.44.218])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id ABB0419560AB;
	Wed, 29 Jul 2026 00:22:06 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc5,
 upstream-mainline, fc02acf6)
Date: Wed, 29 Jul 2026 00:22:06 -0000
To: fs-test@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <06732.126072820220800179@us-mta-533.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BUzlynTXh2W1NoX3WBklu0fRpOah6AN9ASzy0t3Cf7E_1785284527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'platform-drivers-x86-v7.2-4' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2713428282

One or more kernel tests failed:
    Unrecognized or new issues:
        xfstests - btrfs
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2713428282_x86_64_kernel_kcidb_tool_21747963_9
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/301



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

