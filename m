Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394F415250C
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717615928; cv=none; b=I/yYizSTMqTuxwHmZgyYo22Ovc/pSreXm/vSBmNb43qn1ntqpEVv9hI8lkKVoN1yi1D/HkZcpyncvjbv+xslo0Ccym7USdHYtQc1D74a7jmPTBQUPvx4+m6IPtj4zuIGjFJitzZQtb0g+Zk9izdbifOXsE1lLvif/txSskpFvB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717615928; c=relaxed/simple;
	bh=n2/BKY2rXYa7ij7WxgqTQjd2YS1X1nF3x9ylfF8PFWc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NOHbR3wp7WvngMS3poznS11suahYeGesJRQSP0RIg3hVsqI2vPOPfkWssIXEmDuLV5H9IYhjrHGUpOU9xQB1mJFUa1rNQlwAgS5mqWbFQt9+IqM8H66XskErXwzn181Y31fLEWWxgyzIN4NWx0OKCHisVka5wU3y3PobN6MXu/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d0ntCdIi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d0ntCdIi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717615926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9T36rEPQHLXJSDxUL+/o98NgUbTLB9UTDPqUS48v0a8=;
	b=d0ntCdIiNWFLAJDtAlNQnzf0IM6gU8KvSBJsVtiYs1tIqZ0+WihWPP/JpYl96Bq6vJsdXj
	8xyhlu91nBh5VoTtIDMuF54xZO4T0JDqzJN0U8r6JcIgrekZ+Ag2KlCOF/E+Vbi/PmP9QL
	YegotPUa1ba+EHwQ1hjYVrevWdgSNeA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-163-4-9WUYsUMPiukIhhFZPKcQ-1; Wed,
 05 Jun 2024 15:32:04 -0400
X-MC-Unique: 4-9WUYsUMPiukIhhFZPKcQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 26905197701C
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 19:32:04 +0000 (UTC)
Received: from [172.64.4.49] (unknown [10.30.33.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BD9CD1955DC1;
	Wed,  5 Jun 2024 19:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc2,
 mainline.kernel.org-clang, 558dc49a)
Date: Wed, 05 Jun 2024 19:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <80872.124060515320400707@us-mta-163.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'i2c-for-6.10-rc3' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/wsa/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1319992285

One or more kernel builds failed:
    Unrecognized or new issues:
         aarch64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319992285-aarch64-kernel
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319992285-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319992285-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1319992285-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1319992285-x86_64-kernel-debug


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

