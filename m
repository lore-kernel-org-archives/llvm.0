Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04F2EEDE
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 20:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731615187; cv=none; b=Rr4FL0UJQjwsJGNavhuroirv9gNPlzYaFKMO9z6bsHQITAqhFF+wsyQvkwfs6JFHH8pWq2lOU0ODPuMzR+IhQEgRVq7oHoZiLTWtz4ZSiCaXh0m8O/CQVYpERTzITtGcN3K2JljsIKrXJke5ioF4x+u0TZ5sbu4XJViIPUhLj6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731615187; c=relaxed/simple;
	bh=kEDdUiSQqoUWuiPijZoIKK1rRTRr36VhR8WF6yqUiFk=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HeUFPRIKquwmCojoqgUM2sJlPgq1FJ4DZIsCqA3fa/GZ/Pj10xxlC3gG0BJLdEX0A5lOqEJa5pogZIXvdx5iANKbu74VZZBHwT25IyYvMgQH6w8xl4m4n4H5UWKruUIw8J24WemiTJt8i8nv2w8dalPp3LhSvh1fb8qx2j4pw+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TT04o0F6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TT04o0F6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731615184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=C1TCtjszErRqzyR1+6U2s16axro53u1zzYlVF3UpW2o=;
	b=TT04o0F6ry3jTba5MKcdqC1/jH2MoRvUVwnwa/XDw7nWJx23mX4yDe4Csb8NbR7ZSAzuTU
	5Js9ubUakoeWr+eHPSvPbaqoVVChvRlCVxUAr0TxHYzVnp3O5wc/TMqYnjeEnAvZG+zQZu
	1ieLe+rQ4vqj6h4xtngIn5fQw7yX8fs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-xlTm_7BJOk25JPPJrPvV3A-1; Thu,
 14 Nov 2024 15:13:03 -0500
X-MC-Unique: xlTm_7BJOk25JPPJrPvV3A-1
X-Mimecast-MFC-AGG-ID: xlTm_7BJOk25JPPJrPvV3A
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2219719560AF
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 20:13:02 +0000 (UTC)
Received: from [172.64.11.46] (unknown [10.30.34.132])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BDB2E3003B71;
	Thu, 14 Nov 2024 20:13:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc7,
 upstream-mainline, cfaaa7d0)
Date: Thu, 14 Nov 2024 20:13:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <34599.124111415130300301@us-mta-114.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mX5yEor18CBW0XgjQGE011QBuohShiQA2mb_2cBFRqM_1731615182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'net-6.12-rc8' of git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1543464505

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1543464505-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1543464505-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1543464505-x86_64-kernel-debug


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

