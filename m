Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D6933D8
	for <llvm@lists.linux.dev>; Mon, 27 Jan 2025 01:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737942790; cv=none; b=hDeMm+3GKhj1Vkx9G0XTUQIlMMPujQvp32i5QF0VLdcq8KsmD5PA7WWurNqLCnqPny6Qh7Il24aTkNNkUTgfbo2MvtZ0SNQGB4E2sKJhEVhjNKoO2eJmMFhq86nlON6OGLoBkCc9TiyS9jquae3m9rVDnEPfcvYbxdcSBD0ltEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737942790; c=relaxed/simple;
	bh=lVuptSuzPiFtk/BaMBt1Fe3yrPFLiEuFrlaVhuA5yEo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JD3VKsmqzqU8u/ZtSBet6FY0hI2RGE3ebRADRKmyva13ABrdduYBcqjlofXtAzs4CR9Wk6Qw3WfCrHKjop7Dry79CJRxGCDi062NouEcEyZ4oaesLbM1WvOsCtH926cCd8ic/z+FlQO/C6wg+0a0xHqrnoFmEpFT9pWPR6G76j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BqPxFdXw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BqPxFdXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737942787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aM3kHHThTxsTm9YV7F59HVovK8Qh6h98zJ7GhLfydHs=;
	b=BqPxFdXwH1wb6Bur9T/vNiUFsKrjRuRN7lECkLFvEBufSp6uvq9pOnDoRSwxSLiU1K27qU
	ezUopBzuHgivUJx5Uq56vbqlY96bFReOAGhry6s2EUh4mVDsOqlsy0u/ySFD/piFbvJM2j
	NYEai/YxkeyNOr+sSliLI2KJR9JR6lg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-s6CjGdHDPwOou_vKPFzYBw-1; Sun,
 26 Jan 2025 20:53:05 -0500
X-MC-Unique: s6CjGdHDPwOou_vKPFzYBw-1
X-Mimecast-MFC-AGG-ID: s6CjGdHDPwOou_vKPFzYBw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 96E5F1956080
	for <llvm@lists.linux.dev>; Mon, 27 Jan 2025 01:53:04 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4089E18008C8;
	Mon, 27 Jan 2025 01:53:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, baf29cc1)
Date: Mon, 27 Jan 2025 01:53:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <16758.125012620530500147@us-mta-512.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mPyhlC3K4s1z8J4Snw-Goi4rSv5WKconAKyAGCRPpiQ_1737942785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ata-6.14-rc1' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/libata/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1641747585

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1641747585-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1641747585-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1641747585-x86_64-kernel
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

