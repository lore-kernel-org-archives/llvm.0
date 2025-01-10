Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89B6213E7D
	for <llvm@lists.linux.dev>; Fri, 10 Jan 2025 17:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736530987; cv=none; b=Pe2wNrnK93gg2b99UQYKXd8acnQ54+CpmspNWieOrraKDaoAy+mgnpIsEZLca+dpne6FwTtchko55GyFU5JN0V/+sq421p1DzpHfb2zuyeh57h7rUixLJLhfoYCU/9TeJhJY7BYQJtBtTJ36mbWmVJkdWvCoOZ9gt8TxmdMEV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736530987; c=relaxed/simple;
	bh=XlKKL5XWj1f4zeZ+Mj591rFVvOMIsHYFumErSkgm/cg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=t5jyFi9/W9t4kcbBiz8HW3VeZ4V6HjFJJ2CKu3SvdQ+D6DEcHZ9LcwlNcRWGrQ6aQxkWNzuBzuhL6qxX6AFT8MYwXNI7jpu0x4WB9DAMzD3iEuL6sSXHNQPkNJJ4c1W79Se/yJXOjD+L3YkS6kVj+nsDDfWEx7e5yOCz7i/Xprg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N2oXFSYq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N2oXFSYq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736530984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZdnttxAmxm4K3TCIqclWSjLQe3HHr9zkt/kmoVCawBI=;
	b=N2oXFSYq4tBDiFiaaNYiuTeQaNsNxsRR1ayeH1U0Bgv/d5K2xyDXMlCEa/7J+UJ5WSyKZL
	8TVkayaWKObARehJG30z+nPAIEkH8kFrvNWM+dLj9y05/ZQexXaWPgAP1h8Xh3guGXMvLz
	jSJGt3ueKGngv7T3k2JUVsO2V1OZ2Co=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-509-4ASvCp4TPPyHMKq3eDprDg-1; Fri,
 10 Jan 2025 12:43:03 -0500
X-MC-Unique: 4ASvCp4TPPyHMKq3eDprDg-1
X-Mimecast-MFC-AGG-ID: 4ASvCp4TPPyHMKq3eDprDg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD9F319560BB
	for <llvm@lists.linux.dev>; Fri, 10 Jan 2025 17:43:02 +0000 (UTC)
Received: from [172.64.12.18] (unknown [10.30.33.24])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E620195E3D9;
	Fri, 10 Jan 2025 17:43:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc6,
 upstream-mainline, 8c8d5411)
Date: Fri, 10 Jan 2025 17:43:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <33911.125011012430300270@us-mta-509.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ezQEEqIWe2q4qKEikl0sHfgSRNtSo2HR1AA8w90TxdA_1736530982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'platform-drivers-x86-v6.13-5' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1619938623

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1619938623-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1619938623-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1619938623-x86_64-kernel
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

