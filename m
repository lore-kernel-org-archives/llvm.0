Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B032A285C80
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 23:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764804190; cv=none; b=nSEg3eDvQltJZAXkq/Kx0lhw4t2O4TnyIFs2nY4HOWlHtkeOItd2CwlrlpCuGp4DA/BYLVQHSWYrpweIxU7S7vd8axtWOxSHmZWwxYVGdbUCbtJGfWOV982i5MTYB2ti+vmQRBlh+NB1/dVod8I6hJHHxdsUIyUj+AdM3cgaMS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764804190; c=relaxed/simple;
	bh=d57rm70cdrX/csmFHXg0ZVF4aK3pCdDQBcCAOvi78J8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=QR+qykUlGoTZKz/3eWAhmNDx9svpj1AsLK8qiZ8Vm1DEBN8LJXim1OKaSxxLzTsmxoy0lPSjnvR9EdxXUCnbgPb/viCDWJeowMiDSh2uRMy2smEP0gUtUj60XMBPJDGLGLzXpHVjFbXXgLd9cw5XsVcUjGHjwB9/vITW+n3eoJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SpUQRzuH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SpUQRzuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764804186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uPoar1P300DxuKyBnpCWtvm0kRrqfHdIQTOl95/zjmc=;
	b=SpUQRzuHu1A6ma6IP+QkKL/lWsRgO8v+0rztVB+C7vmwhLVQA2BraL6wdbX8rk1jY6JQLu
	pWXr60ATUcIoEyZyL988NqGD9ZxnXYsBlLMf/6mLjcQpirHluNXJ9nOHo4zp9W+fCOKslb
	RgKlKCnRb81/+WMVAecTnJYiB2d9TX8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-eCU3X_WsNMmMCjY00iiIbQ-1; Wed,
 03 Dec 2025 18:23:05 -0500
X-MC-Unique: eCU3X_WsNMmMCjY00iiIbQ-1
X-Mimecast-MFC-AGG-ID: eCU3X_WsNMmMCjY00iiIbQ_1764804184
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 697D41956088
	for <llvm@lists.linux.dev>; Wed,  3 Dec 2025 23:23:04 +0000 (UTC)
Received: from [172.20.50.79] (unknown [10.30.44.138])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D3338180035A;
	Wed,  3 Dec 2025 23:23:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0,
 upstream-mainline, 51ab33fc)
Date: Wed, 03 Dec 2025 23:23:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <50915.125120318230500245@us-mta-323.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -5yEhq7_pgXKaLEtXXPsz2sUcudED4eQdnGVnNFSFrM_1764804184
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'livepatching-for-6.19' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/livepatching/livepatching

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2194935672

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:2194935672_x86_64_kernel-debug


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

