Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269843016E0
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786305731; cv=none; b=VOUchGwZxm86adz/6etcbb2PyqD5YmB+zJ2W0eUBorH5P5XyD5Uf80R0s0ylNdk2PR/2vmF+45lXaAhnGOH1hYpDIyIsuG6Bwo1fgNoO64mYeZd7g1CSglmNlJAZaxMOo6uHSu9FBuZt4BkA+/RTgqABDBShaL9Vc/b+gB1kDZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786305731; c=relaxed/simple;
	bh=TM3navP62R8YYMtgS+d0go8pAJSxICT0uXZ7Glo5pQI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=sFtTxKLvj/2GB7V+MlVJQT7soKtrp3fEGNsKQaACToZhXf7i4AdK7qNb0XEgU+A6up+F2WFZBElmVbL9G30fdHlTY5VmhlyLwR4TH4iVl7/rfgSW63LNlUF7Ir4uugORfqg4w9IlmO8CbtTPK4HFfjqx0WM2xTBDhU/kn0a6IeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hh/LxEqs; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hh/LxEqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786305728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BJPZS9BB35SffIfhQTVnmZPYteCMscEtKdvRgVqV9eA=;
	b=hh/LxEqsajeK8+AQczwa4rOGI3rbEgvd42QkkASp+xX5dXoaVVkEuYk8Jcm0ryU74vgJeu
	HohGs36SdvrR+SwIJiwxAmmNKif62F8nERaDBrfv5M5r+jI0m6Od/YgOhO5xWoBvzm6H2L
	4Kw/jZQfEfO2eEkrh5Yuf8hCIhR3zjU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-1pM5D8BjPj6kLG36gZ3LtQ-1; Sun,
 09 Aug 2026 16:02:07 -0400
X-MC-Unique: 1pM5D8BjPj6kLG36gZ3LtQ-1
X-Mimecast-MFC-AGG-ID: 1pM5D8BjPj6kLG36gZ3LtQ_1786305726
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7343118002C8
	for <llvm@lists.linux.dev>; Sun,  9 Aug 2026 20:02:06 +0000 (UTC)
Received: from [172.20.35.218] (unknown [10.30.44.80])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C36B195608A;
	Sun,  9 Aug 2026 20:02:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 60 of 66): Test report for master
 (7.2.0-rc6, upstream-mainline, b9b3e33b)
Date: Sun, 09 Aug 2026 20:02:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <06613.126080916020700517@us-mta-92.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: APIcnSxB_ayLiDY3LN9k_93VHtBVag2jHr9xvo07BGE_1786305726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'trace-v7.2-rc6' of git://git.kernel.org/pub/=
scm/linux/kernel/git/trace/linux-trace

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2745432401

Tests that were not ran because of internal issues:
    /distribution/check-install [aarch64, x86_64]
    /distribution/command [aarch64, x86_64]
    /test/misc/machineinfo [aarch64, x86_64]
    Boot test [aarch64, x86_64]
    CKI/restraint [aarch64, x86_64]
    Reboot test [aarch64, x86_64]
    SELinux Custom Module Setup [aarch64, x86_64]
    selinux-policy: serge-testsuite [aarch64, x86_64]
    Storage - blktests - throtl [aarch64, x86_64]
    Storage - blktests - ublk [aarch64, x86_64]
    stress: stress-ng - cpu-cache [aarch64, x86_64]
    stress: stress-ng - memory [aarch64, x86_64]
    xfstests - btrfs [aarch64, x86_64]
    xfstests - cifsv3.11 [x86_64]
    xfstests - ext4 [aarch64, x86_64]
    xfstests - nfsv4.2 [x86_64]
    xfstests - xfs [aarch64, x86_64]


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

