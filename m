Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1479CF
	for <llvm@lists.linux.dev>; Wed, 21 May 2025 05:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747806130; cv=none; b=eTxuaWlWtD7EoOxDqH4BCHK6qhAYoTQAF35BbVCrD+dzx3OGgY0QtAqv0jeGhpfxsAmnsUtA6zC8hUokkYFGyfecpCb5rbl32T03WUzV5rRplQ5YV/TEUZqc84WlTuZQRAkx+jBta9cHi6gbp3qaktHql3vA1wwFMVqSfdIjAmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747806130; c=relaxed/simple;
	bh=wr3V7mrHs10XCq0zMPEy9CpqdIgwdYzyEs7X4JS8GaU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bjacSQ9PT63YkDFD69Yw38oEgNI32tVlAxJCsRgPEJXLIFykYpIlzOAC9qXmNndyBQDYwWojVo7F5RaFUVKI1PZ/0mhDyZksf3OuSiX8VR90KC/G18iTNjfifkq50zbEVXbw8tXVGf8z6s+A0fNSZMmTkPEbLWXlhe4LSI2G6sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gImfbQD2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gImfbQD2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747806127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DSEhlFwCxotO09dHlS/HbNpcmQ/5OoVEBIwvGFTxUn8=;
	b=gImfbQD22UCIFUA49Dva7W8LPgm6bVvAFkj/sSFskD/7BLzLj25/BkcrrYr8CawJh2hoA8
	ZYUMg1zducnVYsPTh/MnltiHxCOT+sD0QuWBOOJQtFL/zrQn9/m5jwWnULDqDHr/T0+Cna
	XpYEFtjHP++xvSG89hP+aQKV6iMOYUc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-631-yzxiNgz1Os6yZSveBg0KxQ-1; Wed,
 21 May 2025 01:42:05 -0400
X-MC-Unique: yzxiNgz1Os6yZSveBg0KxQ-1
X-Mimecast-MFC-AGG-ID: yzxiNgz1Os6yZSveBg0KxQ_1747806125
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09AA11956095
	for <llvm@lists.linux.dev>; Wed, 21 May 2025 05:42:05 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 90DF518003FC;
	Wed, 21 May 2025 05:42:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc7,
 upstream-mainline, 4a95bc12)
Date: Wed, 21 May 2025 05:42:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <51273.125052101420502245@us-mta-631.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fX9V_S7UcEH3x4DJkz8PzErTTSvyPo8Az-vJVQvsF9Y_1747806125
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'rproc-v6.15-fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/remoteproc/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1828365953

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1828365953-x86_64-kernel-debug


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

