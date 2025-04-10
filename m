Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02FE1EFF9F
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744303930; cv=none; b=dJ35nhKx2BkbhsiP22//apGKESLpS8lk2qkB/KVBBibBFBev19SmvKifjhwhaNapJsCbmOw2RV6wlYExWNbRaq23J5xdSZedSG6REazq3BGCpXIQAlcnTs1afrE5IUz8hG+w4ni22udKQcMXMY4OYUty/g/fmjq2TK3l5NGyVhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744303930; c=relaxed/simple;
	bh=wtAsRY1Eot2z5cj6jtmEvASBRTt4Wkx+RDaU+zfk8kI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=O+VMUNWmZFcZ8WAPSrpV1LQi0BLel4TtyvftNFCsxxz9tfq7efPML6ZEDPPmyCU6qpxd8S1Ib0bV3e+QYzs+NgNnyKoW3SJW3mK99TPNT0a4s3uuVxaEtex1Tpqo4cZ4hNhsVnm3XFSqXXdU1tGIA8WPgUNf0YF68JJCjdoGdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hXHjsTUT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hXHjsTUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744303927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zx7SSI4heg7bFydDNDcOiweplZCRvx3WGhnV1Png1/Q=;
	b=hXHjsTUT52eIlRqKBoCaZlvHyBMUZOhC9p4geK1qFxI9Kg9w2abbaU0XiLNSMuEaJI4W5i
	RHG+8SEsfBzvN/YzW5TOOLW3zAr6Hs7ULV9ovmIxk/3X9slmmCItSlFqZLNc4NtAoycVsA
	uNYddVVJ3/4FOVEpupWz8XdcyEO65yE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-77QA6QWjO1yiE_WDgzY4SA-1; Thu,
 10 Apr 2025 12:52:06 -0400
X-MC-Unique: 77QA6QWjO1yiE_WDgzY4SA-1
X-Mimecast-MFC-AGG-ID: 77QA6QWjO1yiE_WDgzY4SA_1744303925
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51F5E1800266
	for <llvm@lists.linux.dev>; Thu, 10 Apr 2025 16:52:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E6B713001D0E;
	Thu, 10 Apr 2025 16:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, 2eb959ee)
Date: Thu, 10 Apr 2025 16:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <59549.125041012520600550@us-mta-650.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6uwdqJixGLErx57XZdExVOtdVHIxwR9-ubMRIWJGLhs_1744303925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus-6.15a-rc2-tag' of git://git.kernel=
.org/pub/scm/linux/kernel/git/xen/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1762709322

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1762709322-x86_64-kernel-debug


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

