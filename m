Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811241EB5C3
	for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 01:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745631791; cv=none; b=U9bmIz3qPu7i1tGtDIyuU86Al0OPjwsgASB9eoOm9BM6/yH9SRKUyS3XuQorBzy9Tu80YM+tEmrNSZZnLamDVPq6D5s4tVNsU9haTIGdQIA6BzeqTLyP7/qmtV97nIy2wAEYAeka0aSfGFM/WxuzUEfLbLBeF0tpDmYn4y95GvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745631791; c=relaxed/simple;
	bh=KpDDFE9vCNss3DtdWqRx6Y0+bR3L0JK2pc/CeyndbWs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=PUXEeIl47mXGTFbGSeTnMRdn5f6eA7XQl+cULVl0en0dKcFRITrLVO9gmJ8HI9AfAic0Gp066B7E+JvbyAvhsqd5uqh0LoUGoVI28rguVTZW5pBOngpcSkyLZIL8VZcUxCdJXfpj3t/izHYTH3Dg0YEb9FBQQ5Y2BZGXNBDF1EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bfxol/oX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bfxol/oX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745631788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WOczhyhomZqIFn8OWpi1NyYJ34vkoMhspMIU0HX1lag=;
	b=bfxol/oXSBQh+gBbDyOLqEAk0qiva0d8Arhs9oz5qfzta20c2GXy5ZPRLJCccr+mNrVlyV
	kEYPB9zi0ztgXgEW10dY3WNujmtfvym6gHHg/kpN2Vd0Cn4qXtSEvajWP1pX71qj5glHak
	43cleQUn8lAvwQ3lzeqtTeTnOMmxUNE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-168-lUaY0Yz3Oq6pmpuAE2qnVA-1; Fri,
 25 Apr 2025 21:43:06 -0400
X-MC-Unique: lUaY0Yz3Oq6pmpuAE2qnVA-1
X-Mimecast-MFC-AGG-ID: lUaY0Yz3Oq6pmpuAE2qnVA_1745631785
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABE1F195608C
	for <llvm@lists.linux.dev>; Sat, 26 Apr 2025 01:43:05 +0000 (UTC)
Received: from [172.20.251.156] (unknown [10.30.44.99])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3E1871800352;
	Sat, 26 Apr 2025 01:43:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc3,
 upstream-mainline, 1eb09e62)
Date: Sat, 26 Apr 2025 01:43:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <37230.125042521430600259@us-mta-168.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v3RIaC0ceeD50iKD39DPSFjOL-1-IYpxuYw-KI6ZUa4_1745631785
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'ata-6.15-rc4' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/libata/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1787256712

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1787256712-x86_64-kernel-debug


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

