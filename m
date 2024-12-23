Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41D1422AB
	for <llvm@lists.linux.dev>; Mon, 23 Dec 2024 21:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734990729; cv=none; b=VMl2ThS7I1ZicggYXnrXxcn5+hcwjLsLo4BCY8bDcNlOh6ud9asFqarmP1Jyi0izwwkuXienzbnMABA/ru5WKxEKChfkU42xgHe6y5pxiGqHZ+BS3BFzZHDb8fYdxIJn68IbNF/CT7sBo4eD/upOaxAxREqtBAhNEa0fQHrgQpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734990729; c=relaxed/simple;
	bh=5X7EAKMe4B1cYh9s9HdPSVX0PGn56Kgaq2z0k/4hQ1M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=J5BoO6a8Rz8fHkKVcwXz8XNciv6T7qRsqQmKzxDKBSLDKJSXFYNNRDZQRGgf+9l/dvXYawTtqeC6Wa0N9i0p4pReRItDvY7tGsCIQ/z4RK08y1ZWBfq9LWoFkj/LNrNcywPob5QLIPMnqPM/wfhTo9otI7jTwD2yVgW2HxU2o5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SO2h2xmg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SO2h2xmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734990725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y/jZ0Las/OJuD+God+Tq3ScmFemuSdC4RTs24FwoDng=;
	b=SO2h2xmgX47JU/oW20ktWW2lDSPtIcum0RJdCz1q9l8s2BEn3oOGHTp3p6cpfGuApAkAIA
	hXV1qekCxXDHGazqEW2ZmUYCYjgnqucLmUxlmqgX5+edQKEcUBpWfqkfWzmnlQ0Arn+SmB
	LcLe+BWb1bhOfxewtb1X4Yi3Defkk+c=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-AeMlhYe4NQS0ciWnOIdcbw-1; Mon,
 23 Dec 2024 16:52:04 -0500
X-MC-Unique: AeMlhYe4NQS0ciWnOIdcbw-1
X-Mimecast-MFC-AGG-ID: AeMlhYe4NQS0ciWnOIdcbw
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 268221956087
	for <llvm@lists.linux.dev>; Mon, 23 Dec 2024 21:52:03 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.32.189])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A820F3000197;
	Mon, 23 Dec 2024 21:52:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc4,
 upstream-mainline, f07044dd)
Date: Mon, 23 Dec 2024 21:52:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <96762.124122316520400335@us-mta-300.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bih6GfsSuiBGi8Jtv4nqrmkRN24gORkpaHKkISJ3P1I_1734990723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'nfsd-6.13-1' of git://git.kernel.org/pub/scm=
/linux/kernel/git/cel/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1600858183

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1600858183-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1600858183-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1600858183-x86_64-kernel
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

