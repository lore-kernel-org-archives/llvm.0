Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CD62D052
	for <llvm@lists.linux.dev>; Sat, 17 May 2025 18:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747506189; cv=none; b=sGMg9JX+h63n8ozjHx/w9Z4VbCEMZOLIUJ1lfRQM59H3AdHAr7fjdkqiqTwaGvy5JLJpZ8JSKAd+MXuT51kmCOsn4Ky7pVHbp/AZatdX1GUm+S1ardeQPG9n+4t+tymSF4ffLPR8DFvAl2y0Ck7zMoYzgY08+woZ9LJivPJ8G78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747506189; c=relaxed/simple;
	bh=+Qb8TBZOncOFHmJ5pI6sEOxZXHHZvti2roRlzB8CN8g=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eRw0l5LlQjdlM6dym1+gvjH4hoLk85pDWh5mAnro5A6LStxWaalpzpKCUdoYWpWKy5cJ1C4w9hbKFkdycyD/cJSZRfOw/VKz2ObnOdQH7Erq3NUNcZ483efuaLA28HMk5PSKHLQV6KJL1UZo9JAkgfUA9MFHRlwM463fgQJ+Q/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GF9oTz+A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GF9oTz+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747506185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oZg69pHyeL//UYQ+gHhJCj/VEYfp2jYeoK8CWurKfn8=;
	b=GF9oTz+ALzyN0wKhIDUU0yhLvxHGrBmu0U0T1K8xVIPMXCA0ItOJm6rPeKDRtpHWJWm9Kb
	bTY9qsqAfrNzWMclrBcnex4UAL5OHdXKUmmGK0kzJLGL/q2+ktasQXf09E8jUmpb4ZyWdk
	W12Zk1QdJPFvvxo1zIvHpAp2q8k0ei8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-53uIplSxPBujC7CKAKA6FA-1; Sat,
 17 May 2025 14:23:04 -0400
X-MC-Unique: 53uIplSxPBujC7CKAKA6FA-1
X-Mimecast-MFC-AGG-ID: 53uIplSxPBujC7CKAKA6FA_1747506183
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7F84718003FC
	for <llvm@lists.linux.dev>; Sat, 17 May 2025 18:23:03 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3291E19560AB;
	Sat, 17 May 2025 18:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc6,
 upstream-mainline, 205b2bd7)
Date: Sat, 17 May 2025 18:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <27210.125051714230400495@us-mta-339.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -1B3AuSixm_m0Jsaz82R-8Wxp3IDKqfYPrl7cZIM7sc_1747506183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'irq-urgent-2025-05-17' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1822956208

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1822956208-x86_64-kernel-debug


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

