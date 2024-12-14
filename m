Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7141E3D96A
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734201132; cv=none; b=ks+pKN8r5rgTNxHAvUtOKg7jWQU/xM9wPs3BPXWnsmADkFXT87Z355bwlcaxnkmmwV3/Gt/+jaX+i5M5PccDGmCLmOV/vHNlpszTJMlMKQqAutDpYf6E+uSM1LZNaGdR3mf38kT54ChsexVuJV99sEqVHQUuNeM2WIeE6TqNh4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734201132; c=relaxed/simple;
	bh=ZMcK9dkgJqrE17L8PnTqPrBJu6zpkTlZzN7e8goJn+Y=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=njxHl1kNcRtK0PUctEg2AEZQLaI55gc9JCMPiJzxLPJNqjOzGLQMaSEEyQtWy2NRHprw6KpNTy2VMWuuMXxh+yP5szo7kQbhIuhmTMLlQn8jCMzykLexLTlKoK3Hl7rwYSrQmYmG+la63qZQE3LMHj4qj7P7Znf2wx4v7BJXl9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fh6rG8WN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fh6rG8WN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734201129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=emLnXK5qHXcV9tjx5/E/bT4bUu8Dm3ui296Y410OYRw=;
	b=Fh6rG8WNvHVMUyzXUDYwP4a7q+kMbPjrnfjpQYqfDALm1uYqYwOpxWA83ndBxrpHuy8t8F
	cXqmqUTwdBJ/a774zFCs5VIQZ7TUanguEgNrihs83VW7Yvhuz/faTL4+Yj0Q1z/wNyt2FE
	wdsIclPrBPLvAmBrnk444WOv57297Dg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-sPxw4vk9MzyjdvTmHC8-JQ-1; Sat,
 14 Dec 2024 13:32:07 -0500
X-MC-Unique: sPxw4vk9MzyjdvTmHC8-JQ-1
X-Mimecast-MFC-AGG-ID: sPxw4vk9MzyjdvTmHC8-JQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D5341956086
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 18:32:06 +0000 (UTC)
Received: from [172.64.12.26] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A517B1956086;
	Sat, 14 Dec 2024 18:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc2,
 upstream-mainline, ec209291)
Date: Sat, 14 Dec 2024 18:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <44842.124121413320700197@us-mta-196.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M-A3haG_VrBbBBSbpvcetkOKacKcdAqtrBWmXEOO31k_1734201126
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'v6.13-p2' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/herbert/crypto-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1589170039

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1589170039-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1589170039-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1589170039-x86_64-kernel
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

