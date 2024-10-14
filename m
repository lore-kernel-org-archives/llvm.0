Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1D62F34
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 01:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728868333; cv=none; b=JbgTxXhzvp0EZEbQU+XIo0uvTanp60eLOQUX7CyMZUzpaSuoH6mzkg1TrmNkBQaDA1CEcT7GNAmIWhHAYu9FZvBtsFIDV3ZAhDkU3fTd1ZuVIiB1Tth/5qN35IP5RJb9Ex8eRFU1v1dMuncHc7D+CNEMPrWjDuLrxZ5V5hTdWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728868333; c=relaxed/simple;
	bh=Cl2oqATRBgoSovZgjM99BREsCGLxE7j3j6XNi2z0JOE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gmGxE4lY+oyE3/AtYdlpKBfPtOhXcZkiEORbkvxUwe9tTOELCSe4+rIX9+mFEHLdjQUWZMCpl/Gn1KiRf3Cc37YQp1KOykWSnE3inSiRvOZWCDm1m8vtS8EjwCE1LEpN6X//QlPXDBarN90CJxb2187uEy3zi+zn7OgEjLB6ziM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i9EDcAvi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i9EDcAvi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728868330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TFfCSM3OgPfcXWo7w5RxhLqa4CL22Lpq1j1oakmtte0=;
	b=i9EDcAvi/PXpJYLs6IYu9CKIKbHvxDH5xSFgi4pUXTnkTqXNpVK+mqIYsapAhq8HqpWFFn
	g8K10wn9YPg7mQzkPJYVm6h+Fl3DtGjqmLoVnAs22Qebqc3g4LPrEPtWvfsr3Pkkx6xipP
	EcxiwO/HrVzoRLpf5AKjB5Nd/xsMVZo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-DtTt6_RYM1i6w1Hy242oOg-1; Sun,
 13 Oct 2024 21:12:08 -0400
X-MC-Unique: DtTt6_RYM1i6w1Hy242oOg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AC1441956089
	for <llvm@lists.linux.dev>; Mon, 14 Oct 2024 01:12:07 +0000 (UTC)
Received: from [172.64.0.80] (unknown [10.30.33.131])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 55F141956089;
	Mon, 14 Oct 2024 01:12:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc3,
 mainline.kernel.org-clang, 6485cf5e)
Date: Mon, 14 Oct 2024 01:12:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <39752.124101321120800341@us-mta-302.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'hid-for-linus-2024101301' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/hid/hid

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1494240552

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1494240552-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1494240552-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1494240552-x86_64-kernel-debug


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

