Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B481CCED2
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 02:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737685333; cv=none; b=iPn4ewSGJZ9cNqYmFxClZvttLzoQ58wVFguxeTd3tQiGhle9I0yWA7nFVSYGmKmW6cM/YoJ2QazbN61XqRrTzHULbll1FgWctgFm0r6HG1M/8adNVxzRZRq3CfFx3NZPMvIaJ30cySBWhqZVBfnjE0glP30iDu9t/kd1fQ0zkok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737685333; c=relaxed/simple;
	bh=RicLwgWxcpW5ZTmpBpdcNLlk1Rk5CVIlGTRoa4CQLSs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=GeVCCplATC8FhO/AgtmQrdlxWEWlgjxKQmZyMBI0naw8Y1djXMx3mADitzumwiF5fBAkN39HVQCeg5jiEmPbn+4cOy/dwPJESAjGoCiqE0fg+SZR5uuZtrIDVp6nPJEYCsoYWt0DVoHZRQ0TRlGnvodePGYdGFeFRsmZXkBCp2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E/Cb+hXN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E/Cb+hXN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737685328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U8Iz7LidWNMarQI0T5Kyn6VQ/OPmZG2isWWhPAZevo4=;
	b=E/Cb+hXNESCCEcF+vmaes/YOIMnVGoMZUuEJaY02Q4TrLN2A9NDP+ctb/A0Q+W1CHXXTlA
	n0bzC73u52muyICc7HOJ7q23S698Vi7lme+JruDCYjFbqJMtuuBPlSDqSkeHKCMzh2xBpH
	cKksroMIsRmPCR//UvL5ZKcD36+T9lI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-ktBwGE5kPXG1W-SwUxA2KA-1; Thu,
 23 Jan 2025 21:22:07 -0500
X-MC-Unique: ktBwGE5kPXG1W-SwUxA2KA-1
X-Mimecast-MFC-AGG-ID: ktBwGE5kPXG1W-SwUxA2KA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EC251955DB9
	for <llvm@lists.linux.dev>; Fri, 24 Jan 2025 02:22:06 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B7D8A30001BE;
	Fri, 24 Jan 2025 02:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, e0b1f591)
Date: Fri, 24 Jan 2025 02:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <04445.125012321220700183@us-mta-471.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z-vg1pkfy1l27wCTFTh9Jo32qunp1g1jN-ptP2o-Dak_1737685326
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.14-rc-smb3-client-fixes-part' of git://gi=
t.samba.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1638900571

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1638900571-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1638900571-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1638900571-x86_64-kernel
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

