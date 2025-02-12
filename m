Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD36261579
	for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 23:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739403728; cv=none; b=PCrjsEcc5oB1Ua3sBTSmUc/TBTIITFIbRdCUQNLxolproNFs9UOUx9lNVRwm7C+QTT/bJCdsCBYLLz/A8/XHy8f1wsSKPgM0o8kVtSnOKj2t7kLtMVObtKzTeD9pK/bC5f/15JE/LhA9fRGrcxN/QjSue0Wz5iTl4j0AIBccvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739403728; c=relaxed/simple;
	bh=t9Za7n54SNZ81Y04ULy6daEhffKg4hXbH+oFBbTJbIA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=OqCNJq6J1Zv6HNEI4O53ziehrtsTRadL7QdcIYoe1KmtYkGISOoVIjQtibKu3juHv6x7pcv0y5dgWWOmfbTdXh3KjLr2C83CPPZbF2XeZ03tqhSNKkKVVadndqHMJyoUw7p+ZRxqTsC3LIyUygEhElAVzOqQWmw6b9s9ogClasA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W0r82UxL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W0r82UxL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739403725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zBJ99GIArSY94bm1zlWhQK/NgTdfDm9krJIqa9Qyl8M=;
	b=W0r82UxL3QWsyUs83YzCX5+OWDstYDVkQqLsJzyxOwh2XVPOZYnFUwTfDPJLbdrm9fMxpb
	xeUMh2vzkTMsglQ2xWcWCAlHNTeF14Yd4niJ3eWgjwkzGqWWVTn8lltLm2Jlp0GAFjBUbw
	vBobScXHl+7geB0im9Im8fyAWClCjU8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-vgZU58poNvutRpCI2vBUUg-1; Wed,
 12 Feb 2025 18:42:04 -0500
X-MC-Unique: vgZU58poNvutRpCI2vBUUg-1
X-Mimecast-MFC-AGG-ID: vgZU58poNvutRpCI2vBUUg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C6F6F1955D82
	for <llvm@lists.linux.dev>; Wed, 12 Feb 2025 23:42:03 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 542151956052;
	Wed, 12 Feb 2025 23:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, 4dc1d1be)
Date: Wed, 12 Feb 2025 23:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <00191.125021218420400568@us-mta-397.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gPoQnXmoysfTZb8hBr6I5mnPIeyuT3zDUR6OtCoTKU4_1739403724
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'mfd-fixes-6.14' of git://git.kernel.org/pub/=
scm/linux/kernel/git/lee/mfd

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1668575066

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1668575066-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1668575066-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1668575066-x86_64-kernel
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

