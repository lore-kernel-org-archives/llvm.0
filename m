Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1778BFC
	for <llvm@lists.linux.dev>; Sun, 18 Aug 2024 22:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724019131; cv=none; b=GkuZ7tfVA6Y1mbMIYCg3GHiT4wKxBXgnwyosHL/TGNc3CHMzX8EdD8nrPcebbxOnWyeh+nRLOuSw0ceQC9v3m57SF4DvjyNSE7SutNJdEBCXmqFk2L2lfUlo60INURRgZTCkCWg6PZpfjzGAr8nV7bMMjOToGAQc4vC3T5jenxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724019131; c=relaxed/simple;
	bh=mfRLjgvOfss4qwx+bMfWeLWg8R3Mk4O1FmOycntvK9E=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=jZm53Jyr5xJAhMW6rsZjsU/eOseTjMVnKIUdQJ1OpQmqYdsqXmv5ekUsrTTwruoVz+LJc9Qseo6K/WW0+exZ3zyouTg0LWVQArcuHwRDG7GfwBrP9FVhu6Yd6L6Fm9zaMapJaNbCyBd1WZu2aSRReN2cGTPSbaqL51K/vwAmoYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AB/IDATC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AB/IDATC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724019128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JNlXYJdLKUrR8OAuoIH2nRfBcBqOXqBg85phnhc7nfI=;
	b=AB/IDATC/sy/RApf7UsOGhQzmi0uvkI4I88+NlRVTPG0cSqrkeaXdmK9bqx0QDySFr4UAC
	7m/08N55bCsUHAmJyUHnrkyu/mG8KaGhmhXalmQgFU2uGv2lq2/z2hAqEMCMLKhZr/YP8H
	QSvdfCd4qz34ozTMpnh+kezPOWkPJdQ=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-leEMVlN8NkygCujVJE9FyQ-1; Sun,
 18 Aug 2024 18:12:06 -0400
X-MC-Unique: leEMVlN8NkygCujVJE9FyQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6918E1955D4A
	for <llvm@lists.linux.dev>; Sun, 18 Aug 2024 22:12:05 +0000 (UTC)
Received: from [172.64.15.52] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9EA791953BAB;
	Sun, 18 Aug 2024 22:12:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc4,
 mainline.kernel.org-clang, 47ac09b9)
Date: Sun, 18 Aug 2024 22:12:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <49541.124081818120600119@us-mta-478.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Linux 6.11-rc4

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1417631765

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1417631765-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1417631765-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1417631765-x86_64-kernel-debug


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

