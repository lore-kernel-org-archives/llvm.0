Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35482E3380
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 02:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742697187; cv=none; b=gmtMEOnvCj3o6W+F2B0n+DWSnzdM2xTxt+6YLuxYqnqLS7yBdm0za1v+ikti+jRpyIvOodlDDFP52TJdIfHj7ctlA2q3nsVAVlga8BlY4bFUAeFOa5X92jPpGB1CMhLGTFFZ5jvTxt24vny5q56u7pjRLmziLaa3VNAihb8Wy4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742697187; c=relaxed/simple;
	bh=AMakGbSj+qF4vyZLTnwsdIZvc0HW562quTL6ThF11FM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NDBB1pnQfcFvNN6JavApZpRlPZNMfTrEASxZl37xTsFOq3rJ9kDeTbhaRddSYK8QXCQ61W8G1ydoyePuiviBNV/QC+ZDUSSRMjB4K++w1acb9ER7tM4cc/eA8ooWALLq54jN6pv5ttlNu1udFrFfHg5Iw4G9/f64Z0XlMtnYTRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LyrIbBZj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LyrIbBZj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742697184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QQ+Q28bgDa42D3sSBzEiA+gOvFrunFXthYuI+l3x1GY=;
	b=LyrIbBZj2x78KOITiyyN19RqbLi51N5mkspSu3GrK8XR3/lZv1lCSxwQltLISP4DDaEGSx
	2sc8uhCek7+eFjOrF3h+lKW54ZzDK+udn2Og8BTAW/rmoHYJVOpOQPmxwsi8vWje83znxI
	/3Vt/dHkhPYE3ltfS0YhK2T0Gl6ay+I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-hZ313-YOOP657haZ-FGh7w-1; Sat,
 22 Mar 2025 22:33:03 -0400
X-MC-Unique: hZ313-YOOP657haZ-FGh7w-1
X-Mimecast-MFC-AGG-ID: hZ313-YOOP657haZ-FGh7w_1742697182
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21BE81801A1A
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 02:33:02 +0000 (UTC)
Received: from [172.64.14.55] (unknown [10.30.33.138])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A24EB180175A;
	Sun, 23 Mar 2025 02:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc7,
 upstream-mainline, 586de923)
Date: Sun, 23 Mar 2025 02:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <21935.125032222330300236@us-mta-596.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B301XQyYPjX2VavdPMDgzN988XvQZC6NGn_mqKXpzHE_1742697182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'i2c-for-6.14-rc8' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1729967060

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1729967060-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1729967060-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

