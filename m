Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D5254843
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891536; cv=none; b=sCEv2vrwJMBBPrb1sUsizguroACmzTJGM2+KqrD95/Ck5h6q4EoL2QdntPHHZ3Ia502r2WiPKjkot28rTIj970KePcqwftlN/xBDGvDJUgXV2VKIgdQc8RNjk/RhCB9huu95muf2IDMdjUFdE2pSYCduBIkREe4FuuTosVV2qMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891536; c=relaxed/simple;
	bh=AuOxVf8S1Uz6f+o9qJrwiV8u8DlYThMhZCv3g2Esl+A=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=JcxhcljfaCB3cDRCtt4YsJfaevEgxBEM8kWhy1BuTloyl+4nNUfsRm0xkTeFsewrflupnpArJpbj66w8W3s5/XEdyjM0tTUgo14f04VUVkKyNe5dkn2k+hro06VBmHnmjASTMh9fcm4bVj82P5uptr7i0PwZef0Esf8dFv03p9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vb8Chz/W; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vb8Chz/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742891533;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mmk7BnqTlaYZcj8gAsicKbLUthvOceBoBde/bmKofpQ=;
	b=Vb8Chz/WJj8xFYsHKmPqjRQYd9eo+2htx6cZqqnAgcD1Okqljhmh/+jqLNWwoYX0k5XOVR
	9/40EHuDC5gZverVsEikJdBypGyfx0cSMvtVPuWtsf4KGVqtpPKRD3IlIJj2rTehFSBI+3
	zbsr9uw6QIFYAMz85wHlsVcPOYugVQ4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-274-DgReJe8HM-qvy1ChIp4qTQ-1; Tue,
 25 Mar 2025 04:32:07 -0400
X-MC-Unique: DgReJe8HM-qvy1ChIp4qTQ-1
X-Mimecast-MFC-AGG-ID: DgReJe8HM-qvy1ChIp4qTQ_1742891526
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 365F0180AF6B
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 08:32:06 +0000 (UTC)
Received: from [172.20.55.199] (unknown [10.30.45.42])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 905F01956095;
	Tue, 25 Mar 2025 08:32:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 2df0c02d)
Date: Tue, 25 Mar 2025 08:32:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <74741.125032504320700135@us-mta-274.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RKH1wHUW9jRdjJ_DCLcHM54FzK-l3Ujgy838QZdabjA_1742891526
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: x86 boot build: make git ignore stale 'tools' directory

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1733634933

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1733634933-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1733634933-x86_64-kernel
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

