Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C54151991
	for <llvm@lists.linux.dev>; Sat, 12 Apr 2025 22:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744496531; cv=none; b=QcoFLps8aBaIUztWgX9MK/y4oHkDn4kDa7LMKFNrdoc/mBlh9quzgU9UWC878kM71M/r/e42PEXg9LlBFcUXmx2G+3Gy5PzdL88BzgadSRNhj5rd8cPMvejRHkb95g209JcYllRqbvnlPfykcDruHxgtP/x0koAQO5+bhVLks1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744496531; c=relaxed/simple;
	bh=RKI2Wpi8rUCHiE7RkoriB3zHcmg9avHbrlHAmwhgfdk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=cHCMbgOxxKJbg4rfnphEbb9rNGry4PdpTdmzMqd5lnLjIdgtqUx/0mDCkY8t5Ki1zXuIi+qlX9HaxyE+KTtZlyrNWVesTXYXF2BrlIiZpjaO5xnsjqOznqOKOsrQNzeZUQ9yx/nllBcyI1OCusu8weShmB+5YKSjBcZyZMuW+Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yj4itGqu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yj4itGqu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744496528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KoL0XcA+qDcbOf1z74m/pA7dKUZDohQgOkzkvKyzOUs=;
	b=Yj4itGquXFnd6E81wYjSYBK3bYw2r0Fcp27pOM4oI/G3CcConTYwKVmfUI1xthDunf9A4w
	pdZeeS1ZHaT0F7b1SLL66r4PTy1XBmqQ/18TrXJNxUgwfii6JM7b39O/OPtgKN3/kzopQD
	ii4BpzLOdGILM1/BN9BIp/O2BKJi46w=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-67-o2esO9j_MTmS7M5TEFr2aw-1; Sat,
 12 Apr 2025 18:22:06 -0400
X-MC-Unique: o2esO9j_MTmS7M5TEFr2aw-1
X-Mimecast-MFC-AGG-ID: o2esO9j_MTmS7M5TEFr2aw_1744496525
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11F031800349
	for <llvm@lists.linux.dev>; Sat, 12 Apr 2025 22:22:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F2209180B48C;
	Sat, 12 Apr 2025 22:22:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc1,
 upstream-mainline, b676ac48)
Date: Sat, 12 Apr 2025 22:22:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <69705.125041218220600203@us-mta-67.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9ASsdg6TY97nxsRxnoONnoN6LbOXuJFsZM7tfaj8GsQ_1744496525
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'bpf-fixes' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/bpf/bpf

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1765770331

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1765770331-x86_64-kernel-debug


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

