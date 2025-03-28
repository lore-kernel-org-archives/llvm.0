Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB5F18035
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 03:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743133990; cv=none; b=u71/j6WvqgEttLYCU9spQGQm6z5ENtkestYpvT/NC1gJz/XLgbDFmHLuORqd7cyijgTB92xmqjI8cQyEcPpUR7RxJouHdcVOk8TgNsGPNhoG0/w6wiQON4ThlD3FWbEk2FxRJldsE5Ml0LfmWyO2tB7i16HwVXmCbf/7jJj43vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743133990; c=relaxed/simple;
	bh=bagXpHcNeYrToUDYy7z+xD4WD2nrlQAiTdxFta0NkJc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=USHk2/PVtVOhTg0v/qE1TFVMNVxdGzhYbhD8b7fuMaIvXqYN1Xw3NV7UQtY/ex+OAxlv42IzAx6rzMMxMeRZfWclC8/XxXBwkBY63SDoImj3rQkGRI8zCfhToJQ8nndFa/ZM4Y7ynz75e4pHOF39a2BxwN7d5BpFuT0/7l7uTpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OL8eO8e6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OL8eO8e6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743133987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=v8ef1x42PJYPELE8CW3cWCp+7MMX6CrwD/nivCWvfMs=;
	b=OL8eO8e6ZtgXpNymjH2DqiGa6/HItuQbKhAPfzaGQhr7XnQYq29HhMngDsYmrTJ462yffc
	4/3T1OcVPGDnUmTzstTtSQG3CYWo+KLx0CGbbFdHBuxfMielApx4c3aGjGPiehIUs50JWg
	hlgvGTkSR2l0cs4UT+zYywGco1q4biE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-31-m77Rf3IEM8Si-5OKgO8pHA-1; Thu,
 27 Mar 2025 23:53:05 -0400
X-MC-Unique: m77Rf3IEM8Si-5OKgO8pHA-1
X-Mimecast-MFC-AGG-ID: m77Rf3IEM8Si-5OKgO8pHA_1743133984
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 92B51180AF4C
	for <llvm@lists.linux.dev>; Fri, 28 Mar 2025 03:53:04 +0000 (UTC)
Received: from [172.20.32.163] (unknown [10.30.44.171])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2318F180174E;
	Fri, 28 Mar 2025 03:53:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 68f090f0)
Date: Fri, 28 Mar 2025 03:53:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <85634.125032723530500595@us-mta-31.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cbenrJ6SntzwLc0M0PnkfRr0XmWBINlLx20AnhRWQO0_1743133984
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ktest-v6.15' of git://git.kernel.org/pub/scm=
/linux/kernel/git/rostedt/linux-ktest

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1739403845

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1739403845-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1739403845-x86_64-kernel
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

