Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E57D2111
	for <llvm@lists.linux.dev>; Sun, 20 Apr 2025 21:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745185330; cv=none; b=POF1rqTsSKpPihg5YEFnQTDr74HJCtZHFjbDN9xU9iUhAKdRkcYQEL2B29uvuvkF5vDqZiYjAmOrshne1/jB0d+8XZLInRfnku+TkIu2NSnL9jkqLOwdGcxbuTMVxnPA93nsUw2lpUIJp/LymLXO5JAC6UoGZvW0euxcCt+HmNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745185330; c=relaxed/simple;
	bh=306vySfW4PAV9cPhicpJg6L/GVhVDR+sswldKKuKJ2o=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=V/rtch4et+ejmvqrbvedJFndXr3AiS3Z60ZHGqfOEi3yt1G+jY0ENCDQaXh5Ss1kHD88pAiSV7Oo/DPUKHysCh6ckXcM3JRMkn9xA6miV4RBCbq2/jK32C8zEAhvjm8Brar7Gs/GOiWGmGw2tChSqLLSKfdjGKR26WKHiO6QYbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D7TmkOba; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D7TmkOba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745185327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PsdM2KOZV9pVgBCAx+h6Vzla5TSOOPNFlbg4VQg0T2U=;
	b=D7TmkObaIzYMnTWvJ9dEzlZHWAClI5fX1baIYUq31rRb8pBHDnxagm0CbnmtEaozwIi0G9
	LXL9dLhZzvj4ZDkBem++ssh39CpLFy+E4H7wOJqSXvktsJVOFpdvN99BC+B8Y9EVgG9GaI
	ig3wAFxoeER1qtB6S/tPP+h6b/4/0Kw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-PZMMzN4TNyWMu6kWNp8LxA-1; Sun,
 20 Apr 2025 17:42:05 -0400
X-MC-Unique: PZMMzN4TNyWMu6kWNp8LxA-1
X-Mimecast-MFC-AGG-ID: PZMMzN4TNyWMu6kWNp8LxA_1745185325
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C279B18001CA
	for <llvm@lists.linux.dev>; Sun, 20 Apr 2025 21:42:04 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4F232180045C;
	Sun, 20 Apr 2025 21:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc2,
 upstream-mainline, ac71fabf)
Date: Sun, 20 Apr 2025 21:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <31443.125042017420500515@us-mta-194.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _AbF_g4NiU4YGJ8d7Se2iEZvM2R986gEnsVM_NblW4Y_1745185325
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: gcc-15: work around sequence-point warning

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1777419694

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1777419694-x86_64-kernel-debug


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

