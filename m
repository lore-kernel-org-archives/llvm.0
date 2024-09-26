Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8828A1CA81
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360084; cv=none; b=lVPabl3kYWPUkIrX+hrPDJqL+1+fHYqplUKyrYoFbVQxpDLfLKuqt0DW35glSo8r1EgZqeEENPuKwCJ021mc9sMzo3zOiAI9tCz3MWDy2ob208zsCM+4XBOm2q/eX1476+zlQ15xg26mDm/Yz3j8Xz8YpMXw/HzUmSC0Q9e33+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360084; c=relaxed/simple;
	bh=18WijGKau7yUZNaG/Mmq5yRrmAw0U4PGt3/ZfhopDrA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=ONYNRJqtXQKrqittLpMFaYBeLOMI+Az6Eivq66o8HVb6Ctd0TClQR2M/tmcLIrYT7ElcRzM6CwNNm1oi6fl1UNdEWjU+BrAKOCFHAGpFjE4b3lR5slmKPLZCrim8G/Me8tr09kkC+aipoyK1p8HD1pb+r0pmmSDXOL1BrrBgbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gLciYxKn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gLciYxKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BoaMnJhA8M9MVSYMHldiahCVM5WFKThXvmNUAy/MW5o=;
	b=gLciYxKn5YOEOc8spoy/C26OsK8U0EpeAwnK93PSaYXUBblh7oOC2p1R0FvP3zr4ysErgp
	+YtjqqVp/ccPu2Fi7MI1FwuQk4zGSnkLkiQ0OxAyKQnzAvh905K0Ig5g8N+g2h4bSFoVBy
	x12BstR4w9okldZYPJZ/4wCOa3u4EeU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-9-eVdS94LmPQeU-qgekmL8TA-1; Thu,
 26 Sep 2024 10:14:38 -0400
X-MC-Unique: eVdS94LmPQeU-qgekmL8TA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 634FD193723E
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:14:37 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2F2191954B0F;
	Thu, 26 Sep 2024 14:14:37 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 9f397579)
Date: Thu, 26 Sep 2024 14:14:37 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <30495.124092610143800571@us-mta-9.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'chrome-platform-for-6.12' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/chrome-platform/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1458564728

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1458564728-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1458564728-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1458564728-x86_64-kernel-debug


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

