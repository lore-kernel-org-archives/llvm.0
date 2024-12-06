Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD11213E7C
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733519589; cv=none; b=u8SknkvQgsavsCC4xzumtQA7MlJcddHxQCbQrCoWQxr2inWrDA4gSJ/LHlp7emQTbaKsEfh8hVCUwX50C4cmtrv72+6dP2g2mN5ZmHpfxu46GHRAmg4YKZOMgNem98zcTGS9BWZgaZlG3A3Ta8yAFNX7rvY/UMpvy6uF0YdzQec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733519589; c=relaxed/simple;
	bh=Q1zTeNdN2u/Iv8cNXMO5ATTtOkUNVeY+/E/LGhoSfqs=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=NuoO/zQD3kdoAtWlbl6uX5DAJ9PF+B0NBVs2VQ+8KAFKNh+g5largKKrB9tLxulEsqmNVz1wAQXDYnSrKG6zRi6y17k+yKqZPxU1LOXQxjEQ0r1aAJ4DjSBkC1flGjHmu9DicelWoVoxJjo/4a3AjKs6bA2Rt3JuBkrSPADmUfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NlEvlGi7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NlEvlGi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733519586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RfjriH/uPe5n+DT2kZUMYd95KRckJ33qa6Kzefqs/Nk=;
	b=NlEvlGi7xkIEW2EPAlLAxVIcqah+7cSPGzqJvb7KaxSlf7FUlkj0Ug9IUsUglkNqOkwJ1Z
	kohp0QHrXTOX8rYbO5OZvUufnXXTfy3yXKrKaxAN6URu77QdpU++s/wNSc1YDdrmE+cmoC
	qHuSIdMzDAZNhZ07XUD0yjOIW8jkgds=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-454-iBDNjKmsM5uIkyNA89elOA-1; Fri,
 06 Dec 2024 16:13:04 -0500
X-MC-Unique: iBDNjKmsM5uIkyNA89elOA-1
X-Mimecast-MFC-AGG-ID: iBDNjKmsM5uIkyNA89elOA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C0EFC1956054
	for <llvm@lists.linux.dev>; Fri,  6 Dec 2024 21:13:03 +0000 (UTC)
Received: from [172.64.3.41] (unknown [10.30.32.189])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B43B300019E;
	Fri,  6 Dec 2024 21:13:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc1,
 upstream-mainline, 9a6e8c7c)
Date: Fri, 06 Dec 2024 21:13:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <09107.124120616130500144@us-mta-454.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kxjN_bPNgPkcM7eBqIb9-m0luY9xaloLRsoS21F5U5k_1733519584
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'drm-fixes-2024-12-07' of https://gitlab.free=
desktop.org/drm/kernel

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1577438461

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1577438461-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1577438461-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1577438461-x86_64-kernel-debug


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

