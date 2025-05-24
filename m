Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877B27E1
	for <llvm@lists.linux.dev>; Sat, 24 May 2025 18:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748110932; cv=none; b=n8y6HWmAUaKqE3hYPy69VPARWMtPDYNbr6rqPrv2ds+xn5EzKgmjjSV6ivAJOsqqbGbkHDzHP5nGXQUS4jBl8IjAq10qHv4QEbhApfyCjRejLukpw7sM3zJXwDhnQAXYj9QlvjOx0g/4yORJq2TTIB2JhkwsfZnhnc49M27vae0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748110932; c=relaxed/simple;
	bh=wY2AG+exJHzpaCFHu3A47FadtaGEJyiBVCKPHX4WRRg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=J6/q2FAu9oEq20tQMlxF0eQe4/XtyekT2tlj2jBAlhsrb/erZ3GvtkzOA09b/Wrh2V1t46hDnxM2rKZ1vMgl0xq+CKXYG1oFRTJa+S4DrejyIMWZms33ACFgAoRGspYc9HeXgLHOHZwCaJN24UKSX/tcP0DOR6Maw+VDfB+5ffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UeFsW62k; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UeFsW62k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748110928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L62+ogXLpjTo63HgYPpxRaKa4vgHG+4SpO0SQlu3JhQ=;
	b=UeFsW62k7EoxJbuxLCHcYnKEeN0LJ+IAGrE8Huhi0cEY38E20/XkxyDzH0aIHTrJILewWf
	hqDBfpOVS5bjm9z5wn4Pmelm13vvsXC+9wwXFDoAHHAVmmmG2XWj6LWTYCXQl502HrJbkD
	3yD1f00ggfOZppAvJR03tuKhzj+AVLw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-ftFKrkSyMXi3DM3_0bGoqw-1; Sat,
 24 May 2025 14:22:06 -0400
X-MC-Unique: ftFKrkSyMXi3DM3_0bGoqw-1
X-Mimecast-MFC-AGG-ID: ftFKrkSyMXi3DM3_0bGoqw_1748110926
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB8CA195608E
	for <llvm@lists.linux.dev>; Sat, 24 May 2025 18:22:05 +0000 (UTC)
Received: from [172.20.77.114] (unknown [10.30.44.38])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D379195801F;
	Sat, 24 May 2025 18:22:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.15.0-rc7,
 upstream-mainline, b1427432)
Date: Sat, 24 May 2025 18:22:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <31500.125052414220600367@us-mta-352.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x5-TJ9Jw2lskh0EmcDaRf5dPPe-koHYPu3gkzg-nDqs_1748110926
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'iommu-fixes-v6.15-rc7' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/iommu/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1835019750

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1835019750-x86_64-kernel-debug


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

