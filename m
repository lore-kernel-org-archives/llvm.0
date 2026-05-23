Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDADF63B9
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 01:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779499929; cv=none; b=jx+Nu4hjXm9xg74ds+7ZnsxRpANw4VazoDXlrh+hpNhf1R5LnJS+pXf9IHB2/9HBuRw6K89+RyCH/3fq5Uv3MsBcLJMaQHYSTNhs4QswM0vQfZMgjeywv9tRdElmm43NvMT3j8Xc6I2EjU4JBfz7zIo/CFgHJ/e+rdAcEDIf+OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779499929; c=relaxed/simple;
	bh=3FRznZxFkMVbwSufSIAn+qxZCMivThUvXfxTF0aPmNg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=rX6Z11SUawjSKV36B+e3vheeTQvdjx5a7w1zSSOGSqW34Fp//z7ljjblt0cAbBJ+Kp8XY85GEy9Vf3EIuHyyQMS3jUXkkBqXrFt/+H7KCpp/oadwFet+1QcTbLFtlOLWib+s4wf9Z9+3MqCjfRLVDDfaM/JHKfUr7grpbU0xmk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N3RzUm8x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N3RzUm8x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779499926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OlNLtvSKKq7Uuns0i6MgqfybFNVOnVwZoFd8Yc4Wxw0=;
	b=N3RzUm8xYqaRxzlBt6oFPt/Q4CWzC3UCHxEntNfL50eYQcCwG8jB7oxEK4WoM0dsgVx0Qg
	UR1CXey/r9kNqmbRhCD3hMiLysTHNEQLzIKtzRh9OLUMwOt5cVW3y0IlBjEJYd8Zvr3Yeq
	/TLx0J+Y6c8pZkv8C2Le6fM2X0MS9d8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-VtNoiVhgO16NnLtiY9-u8w-1; Fri,
 22 May 2026 21:32:05 -0400
X-MC-Unique: VtNoiVhgO16NnLtiY9-u8w-1
X-Mimecast-MFC-AGG-ID: VtNoiVhgO16NnLtiY9-u8w_1779499924
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 374871800344
	for <llvm@lists.linux.dev>; Sat, 23 May 2026 01:32:04 +0000 (UTC)
Received: from [172.20.212.222] (unknown [10.30.45.124])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C4C4619560B4;
	Sat, 23 May 2026 01:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.1.0-rc4,
 upstream-mainline, 79bd2dde)
Date: Sat, 23 May 2026 01:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <40204.126052221320500163@us-mta-78.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e-ShARWhkIiHYLoaFLR1B_6jLP8v16hB3p8gEGKIiu0_1779499924
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'sched_ext-for-7.1-rc4-fixes' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/tj/sched_ext

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2547520148

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2547520148_aarch64_kernel


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

