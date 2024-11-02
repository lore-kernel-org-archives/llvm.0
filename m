Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD7242AA1
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 03:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730517133; cv=none; b=FL6THriVlvB+L341dQnLvKJGKZH5GokQRePwXiUHW1Xl4Ke6x+oVXN+sARMtFFdLGKiTKOQZab5wgT+QEQjk7mhINuvzOAsa7ES/aNxwsuwjD0FCLRV2uH5QvYTv4PelLk8deoVcd2zJVjBbtV/o/bRLlTAGFj6UmTwZ84ABRVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730517133; c=relaxed/simple;
	bh=EbdqaNdX0t6bImDmxiIUlPWdYYX1J3hPqQqzrYoYqic=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=afLR7GMtG4TxbA1wMAtbKuGo1d6BX/m4RYpEieAuQ2ZRXhdMFoN3/aXxXMmbUmcZ7dO3Fa6H8XjVPOIlAHnp3n/fya54NQZxFeNDVMHrcSfrkbx1dcvDp6e8KDGnYfKydFhX67dgA/hy9NowZ6pUteKoU0ttadKPc1wr88l1AjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TJjXwoYC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TJjXwoYC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730517128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0PgbwYV/TC/wTSLkQRbB0JojizKpZRgfOfMk4GeT7YA=;
	b=TJjXwoYCr8Z09iPQ1KytW1EfOLppIFOUIu5rdKsob8zQEm2p+4txICI0hnb4rKqZ0smSi3
	JBbplDJHrk4fHUvijc6GNv5j4L+0xKiu83IgIDcukqYTe1AHJaBJOPzFDrgDS8uu7Ajslt
	Sg+KKhy1xs/oBKplrUFeTGWFpjdSyjM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-190-p39j93bPPEaaA_rWci2x2g-1; Fri,
 01 Nov 2024 23:12:07 -0400
X-MC-Unique: p39j93bPPEaaA_rWci2x2g-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 636B21955EEA
	for <llvm@lists.linux.dev>; Sat,  2 Nov 2024 03:12:06 +0000 (UTC)
Received: from [172.64.2.75] (unknown [10.30.34.59])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E0944195605A;
	Sat,  2 Nov 2024 03:12:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc5,
 upstream-mainline, 05b92660)
Date: Sat, 02 Nov 2024 03:12:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <01201.124110123120700185@us-mta-190.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pci-v6.12-fixes-2' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/pci/pci

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1523969733

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1523969733-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1523969733-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1523969733-x86_64-kernel-debug


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

