Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D8313A865
	for <llvm@lists.linux.dev>; Sun,  8 Dec 2024 21:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733692388; cv=none; b=jys5obKlHs9+VOXaUdUCSFfIHRSZG11OBVxyi11Ax3rCIE2+SrRuXmMDZukR+7x+WAMxU03agTI0aOg55I5TNMp2llmGUy2su2xh/cDlX1+rmEgczvQ6XNR1Agzh9jceVgRMr+b9VJSUgbI1GLt+OMNYLbvVgLT1Gy6KKyQC/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733692388; c=relaxed/simple;
	bh=YjtMH84U5YgBuPlYvhVnKO+xq+YQkXzNv2es6o884hE=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FYQlILb2Y3ZSZw1ivq2V/fiBdCl+WOhEyatSll9VJrsWwDcGlj9GhTVj+A5BoVbrfB/IgkQdpSAfOi3Ch8ta7xjkiE2zkYTFTDFH5oGSx5/U9fbm1ziFfAVY8xD8kegDUUd1uXM9HeXhHhUkgZDw1DET1sUQxsRopIYadukJgjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHY1Sk4f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHY1Sk4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733692385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=bA+hgGmRLVVB3dYy5ojiy6F1cA/Z7KcUanAN7aUSBcw=;
	b=UHY1Sk4fSkQ7a/gmDBlPpt8a9hy2oOtaytaQWl48k1PDBZ2uw2qFgpfUHOo2bRlMtBggjD
	HBJ3DTZac5W/sbPmss0j6kgq9pBV9XFgQw/ovUImW3Cf9coE38Q2gvlXX9nzUkwkMVeYDT
	UhdbH4S94e0CNWRkjCPBKmJb7Juyhvk=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-505-9xGbkVJPNsOmkzPJfDNSsQ-1; Sun,
 08 Dec 2024 16:13:03 -0500
X-MC-Unique: 9xGbkVJPNsOmkzPJfDNSsQ-1
X-Mimecast-MFC-AGG-ID: 9xGbkVJPNsOmkzPJfDNSsQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 925D1195608C
	for <llvm@lists.linux.dev>; Sun,  8 Dec 2024 21:13:02 +0000 (UTC)
Received: from [172.64.3.41] (unknown [10.30.32.189])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1C68D300018D;
	Sun,  8 Dec 2024 21:13:01 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0-rc1,
 upstream-mainline, eadaac4d)
Date: Sun, 08 Dec 2024 21:13:01 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <73902.124120816130301776@us-mta-505.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N-dyJu0sZxMzr-3z8MX44J2y3ZsJcVb4ABtEWXFYOKs_1733692382
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'irq_urgent_for_v6.13_rc2' of git://git.kerne=
l.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1579238244

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1579238244-ppc64le-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1579238244-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1579238244-x86_64-kernel-debug


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

