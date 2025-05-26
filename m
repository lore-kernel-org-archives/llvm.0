Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487042DCBF0
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 01:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748221994; cv=none; b=X9g5trlYgoUWRvgKHCSuADw5043maEc02IYNk0QLUN4W2MghAseKHPxqVnlEfc2SxvtXg+ulFtBhZNXhVdpz0L9nxJDjgDG3/XmGGOAcfQ+ceAPigtwhLwoZs/K60LQcJsRw1QKSRGSSG17hEK/E2hE0P+oRXOwScsTbMyBmwzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748221994; c=relaxed/simple;
	bh=oQJM7dZPhlcxzqFpU3OxeYTFw+ad2gMFi1uRw9YlVUU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=iRoByZ/SCSLUBPxZ1LVAYnAQP3e2YezpoTLegVnxpwPKtQK5TWIMHsejJYRYpnCcUFn+hNzDP0MkIg+h23d36t3EfeEw6hBfW3SSp9Kaq0niMvJhK6XqJPk/Wkvapsu77TBWAvDINSp0qC5UvABqCGkwp2qPD+VZwUUrcg9v7yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XPMu651N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XPMu651N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748221990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rl4wpF6KNdpFyClj7PQIHAE7hMx2wCg/+RucCaUc1ck=;
	b=XPMu651Nf8LGrB/qXjbn2rIA13dy+jac/knuxpXSiKsefOsTvhrR6oYkgmqrTEHUK/oqJh
	8aQHYxXG2V+tisnk5D92irLlgVkVf16s9Msk8iEtX0caueGMg1mwf/D3eM1UZ5noizQlSY
	FDDFHvnHMDB7wwpsQuEFHXwFzu3H4+w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-Tqn2_LrhNLC-akeRFrOaEQ-1; Sun,
 25 May 2025 21:13:07 -0400
X-MC-Unique: Tqn2_LrhNLC-akeRFrOaEQ-1
X-Mimecast-MFC-AGG-ID: Tqn2_LrhNLC-akeRFrOaEQ_1748221986
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D2121800447
	for <llvm@lists.linux.dev>; Mon, 26 May 2025 01:13:06 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C4F7318003FD;
	Mon, 26 May 2025 01:13:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0,
 upstream-mainline, 0ff41df1)
Date: Mon, 26 May 2025 01:13:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <73830.125052521130700535@us-mta-13.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zYew0oeoaQCeOfwM4UA0eHGJZozJgRYk9vpiN310l_A_1748221986
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.15

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1835967382

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1835967382-x86_64-kernel-debug


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

