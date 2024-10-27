Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A901179C2
	for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730060531; cv=none; b=IbH4ISFXfxW+T/YogED8XHPFNQtaQQvAlrhjwwoT58Sa4V6U+uecrCwhbuRVgdfYkUPBkQ3pxnx/7QUScQKK9LKmB2InBgL9+Hvw7iM2LHXGSOQZ4EElvSGQS1tRRepJjpgBqF5zINzRwmZVYgLR2FTQHDmDltGbf5WsLNFoH4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730060531; c=relaxed/simple;
	bh=Q3Uc6B2Vj4KTqZo5Wnq+GwZoRwq8JUxANTOGApmFoOA=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=O02cVsCBF+0mlT3/BWazqVsdYsfPJcMX4WXCclf9CfKz7ZMy1rFiQfiVKjdGRtiEoIMpSapR4p1AQ/24KdNvy7H+fwRtzVMPBAd88AybijEAxjZsF9o6jH/w9qd7CO1thWCQv8uVZRhWLGNfa8GI6/YwriwPvwLuhZen9TxpnzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P+mVNCvX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P+mVNCvX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730060528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1G9aNgRNuBMUAIcONMPl8miv+6evDQu7ySCsoGouIxg=;
	b=P+mVNCvXBdD6mIRLUYt5IfTZZVibuuPHpx2XRy0cOyYmyhCqkVjnV7jXfZ2he9Sc1hFQK4
	6sRb18Ru0DUI6FbJR/cXgjt10fTVVXd4LIVjIiaVsiJQzPSLSw30JGexL3jtMuv190BAbt
	C3XpIJfqB6lsaLGc6npeP6r5Z3R94mo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-5-26DRPla1POiVUwFgTl2ZnQ-1; Sun,
 27 Oct 2024 16:22:07 -0400
X-MC-Unique: 26DRPla1POiVUwFgTl2ZnQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 397C71956083
	for <llvm@lists.linux.dev>; Sun, 27 Oct 2024 20:22:06 +0000 (UTC)
Received: from [172.64.2.86] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D4A3A19560AA;
	Sun, 27 Oct 2024 20:22:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc4,
 mainline.kernel.org-clang, 284a2f89)
Date: Sun, 27 Oct 2024 20:22:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <24356.124102716220700105@us-mta-5.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'platform-drivers-x86-v6.12-3' of git://git.k=
ernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1515445256

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1515445256-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1515445256-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1515445256-x86_64-kernel-debug


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

