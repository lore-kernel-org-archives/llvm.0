Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58084F615
	for <llvm@lists.linux.dev>; Tue, 23 Jul 2024 23:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721778787; cv=none; b=CW5kA+BBtTf9Tp1Za5BwXOcuo242AG2X52TOnm8BTjG99q3ZMa+QFRlmz5BHmFNMgxw8e3t1oP+sCLcQ0IX+st0O7CKbP4bJPNbXxtCiJSneLDMlobcISiiOGnBlizOTm7idAqkJv9/WeQK4etXpjyzYcsNvbhzJQLk6bAGTyUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721778787; c=relaxed/simple;
	bh=L/K9w5ffC4kYR655y7pPClHYck0CzmuODDl9PQSsgcQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=R5FupRkumi3uGz++rfQr0erkAWxs6DSyS8To4vkS4BQCePNXHqvyoySFB1tE0HNAwLzcG92q+V38I15QTXPSD8QHcCug3nadW6Sj3ySYivxuqDk/bvu3nDiaVsj+kCgD7fObXnFo/V0TfJ+OdqndUaPluQ7kmc6dBjYqDr4CtrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WKVPEv/o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WKVPEv/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721778784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3bZlahKoKmtkFLgWADwNqOp7MandZT5cbt4UkmDnYqg=;
	b=WKVPEv/oo8Ff6kcsAwRaXGFuLdRjN6gSAk7vEVP6c+sDEkNLXnpKDMD9Vt9tpGN2ICCS6T
	rcgSHmvluqmATWWNGpfDn72eHorkPw+3WSFJqrqWJAymMo2Lm30SYeRQsqTjnIxeCwsxf8
	W0l8JieolHE8+6OgePkFy6Xi18BEwPQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-YayQ02kHMAKUhQTEqYFAkQ-1; Tue,
 23 Jul 2024 19:53:03 -0400
X-MC-Unique: YayQ02kHMAKUhQTEqYFAkQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1D6D219560BF
	for <llvm@lists.linux.dev>; Tue, 23 Jul 2024 23:53:02 +0000 (UTC)
Received: from [172.64.14.40] (unknown [10.30.32.10])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 49DF71955D44;
	Tue, 23 Jul 2024 23:53:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0,
 mainline.kernel.org-clang, 5ad7ff87)
Date: Tue, 23 Jul 2024 23:53:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <46837.124072319530300213@us-mta-484.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'f2fs-for-6.11-rc1' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/jaegeuk/f2fs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1385289944

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1385289944-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1385289944-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1385289944-x86_64-kernel-debug


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

