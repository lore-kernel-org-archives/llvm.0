Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E4139FCE
	for <llvm@lists.linux.dev>; Sun, 10 Nov 2024 23:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731281589; cv=none; b=lDfAJjYtfvlvJtIEDFj6ESiCBX5Tb+YBzuUQ1yc11MTQa7Ai19Vlz5DLc6BPBQx6mmnVZmLlUzicoa4BbIIoIxWTXqghxMFDI0M/cxBgMJJJvON2s7ZkAyywudZTY8sYn8U2sFaN23TFl/kYQlu8q5Pm/WsQ6jy/aB7OVVsXk4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731281589; c=relaxed/simple;
	bh=Ed8rzv+EiQmwiNwyYtY9xJt4QDSTJfHoMNuqdNPEQJA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=mW2Cr924RjwolJ9DUSjLdCwsGuIV+gYZ2QdOCP4oiwm3X1nB6CHyvJ4VnJLCpKlf4QvVJvD8axqc8R4Qx8WSALmjVYssJ9JCHlrYMaUG3bcPlywMnM0LVfrH4a4mXvkdKtM0NpO98CksCbBW+Q0P74DNuuny8S/vW7ExS3rCdLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFeDR8Td; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFeDR8Td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731281585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=058e1ue4QoFvBN5YSY/y55HtvniAMagVrabnPRUYyBg=;
	b=UFeDR8TdQD1dSPpoMEZYEONz26jWxX2XTdx/faTbb+4Ad+vUWZ+7d6muig7X2NhP2wViqk
	ple7H4uiss2HYnlrW/NsLWndXkDnu7Qyyl63kAc9an5eZYURHZ9IbQgngrPPXFeFkw79ZE
	WAeIHj143YqXm65KaYZjGI0gpljcvzg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-BVdzJuMkMpGKPi8eHtRR-A-1; Sun,
 10 Nov 2024 18:33:04 -0500
X-MC-Unique: BVdzJuMkMpGKPi8eHtRR-A-1
X-Mimecast-MFC-AGG-ID: BVdzJuMkMpGKPi8eHtRR-A
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 13DA91956096
	for <llvm@lists.linux.dev>; Sun, 10 Nov 2024 23:33:03 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2747F1956054;
	Sun, 10 Nov 2024 23:33:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, 541f3d87)
Date: Sun, 10 Nov 2024 23:33:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <05720.124111018330400161@us-mta-524.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ieaeoN9gU4feyx5FoBgt8DLJRQqLB0bzGa2KQzwA8lY_1731281583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1535556631

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1535556631-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1535556631-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1535556631-x86_64-kernel-debug


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

