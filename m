Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862EE944E
	for <llvm@lists.linux.dev>; Fri,  7 Feb 2025 00:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738887731; cv=none; b=fDKCtvXr6GYFB4Vcs7Y/NQ9cuTZvGoARrG/TxmeRPRUyTi8gqAEmshVrSp91GCpqZKtR9Hcb0vPVMOqDQ/6FvKAM2/um5qBgbPweBN7qu20Kv6XpC1T/d6BaGLFG68Xdyp0ECSobKI2EUiTPAfD8+uLPC1cxMfcrGYilyZUyYwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738887731; c=relaxed/simple;
	bh=cMDMsqEnSbFh47rG+Ctf/VI6F71eWnJQBh9luZDfNZM=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iDiE0rQ/hUWYhOufK04L6TfGlBUcjdpCcrw/G5vhOBjONBkG3UOAoY/rPkSWOm9FL1ZqVpVHPcrqQVO/ANjat/OlSKeLTu4w9UAPEstsnrWPzo0CyV9nStjyQTXBg3mlfXtyAPVWkU42vVz4/rzOL8HXg7EOHEaSu2oe3bJJTBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wo4ycfgb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wo4ycfgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738887728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZzHH2PWAxxNhkZ46VwCeLj7qM9qpu0vNHC05qyXzSNE=;
	b=Wo4ycfgb8aDD+lKDVZ9hJSDm0XCd+EzbrrfWMHo+m8tdsv5A8RQLvR/+3UB0PHzQ97oKfY
	gROg/FYcRsOxQijE7CcRod4gF5Ts6UsJ3ymIXaa6eqHMNAw7gSIxYC/+mRm98/TfsNaPJ2
	OJuDh6J6vjRvzwW+Mu5YT3a3Kp/NibQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-OP7pOFWQMz2o4b35MZHMnA-1; Thu,
 06 Feb 2025 19:22:07 -0500
X-MC-Unique: OP7pOFWQMz2o4b35MZHMnA-1
X-Mimecast-MFC-AGG-ID: OP7pOFWQMz2o4b35MZHMnA
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 476A01955D82
	for <llvm@lists.linux.dev>; Fri,  7 Feb 2025 00:22:06 +0000 (UTC)
Received: from [172.64.10.39] (unknown [10.30.34.106])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CBBDC195608D;
	Fri,  7 Feb 2025 00:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc1,
 upstream-mainline, bb066fe8)
Date: Fri, 07 Feb 2025 00:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <04944.125020619220702747@us-mta-588.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EaJvfBy26qd8LoGgeicTM4jFP-XqoJqNBz4C4cFHM3M_1738887726
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.14-fixes-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1659616286

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1659616286-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1659616286-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1659616286-x86_64-kernel
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

