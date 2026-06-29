Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA27017745
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782691331; cv=none; b=ochw93b0Y4uKO7+vKfAq3q4IiECnLnqc1cbr2375MVHpuY+0gHsyIoqkLs0VEjUEB3grnqhuarm6T20sQCnx/bV5xxpAdVUIo3g53TRx0fcypigzwIS+V+h5qlV1g1Y3ubcQILP+idmwW1jWmMVaXH5KLBhNlJOeh3aQXXSZALA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782691331; c=relaxed/simple;
	bh=UHA3t+hYUBdmbSfbdltMncXVknMbU/f8leDgm8hV4T4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=UjU5oEuLf6/TsGBuUP0bgZSuRggeQsn3BdVp/G7ssPl9LZVS/V1Sgnob7eWh4TNKoz7S6SImaZ5ip32w0M/2mKJ4272criAZdFzPNSR3Q9a31tq+kCSmh0n4YJHS9olncSbZ3pWrsAlcoNyPaVZ/W5P/2ah9/FML7TQPfsGbpiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MriOM+Vb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MriOM+Vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782691328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tyfvD0sonOvCJMumrbHeZ5WBSzya6h4Sp6f+zre6MwE=;
	b=MriOM+VbHOyEX4nMfdjz+7Y6yhlVIkcahwN94Wlxi0GdZrvp4fCVn5yHpH6GMh9AQaEJ4/
	mHKds2gEG3ateop4+SET2mnlUpeHEwEvTddhukEd7up3DYYHUvOZqTTZbjFei6LTU+moWu
	nH2iCila+Z08pMLn3oj2d9ygCRkl7f4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-NGds8-LHNaarxq-NqB7Nbw-1; Sun,
 28 Jun 2026 20:02:07 -0400
X-MC-Unique: NGds8-LHNaarxq-NqB7Nbw-1
X-Mimecast-MFC-AGG-ID: NGds8-LHNaarxq-NqB7Nbw_1782691326
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 084CE1956053
	for <llvm@lists.linux.dev>; Mon, 29 Jun 2026 00:02:06 +0000 (UTC)
Received: from [172.20.60.60] (unknown [10.30.44.61])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 393D71771;
	Mon, 29 Jun 2026 00:02:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-0,
 upstream-mainline, 8b69c047)
Date: Mon, 29 Jun 2026 00:02:04 -0000
To: omosnace@redhat.com, mmalik@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
Message-Id: <08664.126062820020701169@us-mta-76.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0JsNzhmuJwogZBwua1tK1JcBm87Wv5vfRgnpzN9CugE_1782691326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'input-for-v7.2-rc0-2' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/dtor/input

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2635018586

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2635018586_ppc64le_kernel

One or more kernel tests failed:
    Unrecognized or new issues:
        selinux-policy: serge-testsuite
               s390x
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2635018586_s390x_kernel_kcidb_tool_21539762_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2635018586_x86_64_kernel_kcidb_tool_21539759_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test
             aarch64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2635018586_aarch64_kernel_kcidb_tool_21539764_7
                   Non-passing ran subtests:
                       =E2=9A=A1 ERROR Setup
                       =E2=9D=8C FAIL Test



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

