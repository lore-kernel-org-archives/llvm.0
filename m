Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1651C19412E
	for <llvm@lists.linux.dev>; Thu,  7 Nov 2024 18:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731004387; cv=none; b=t1EuYpv7nYljBH4FremQdENvwXjntFeSvwtXMuhD03u/cfRTNIwMsM0n/DeMp+jDH5iUak0nUWtV4uFoW1/lrAUFf8l7cHSqNUSYXjUP/wwTmETZtyc1sDIZc20iwKL6Fk4gczD2sre0VSJsb0VuQ/AWT044G88okz+L1VXf+Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731004387; c=relaxed/simple;
	bh=O70Q8ee5ICYO3Sv26ixdKS+1giKvrWNMxe+HRgvuveg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=tCGYPNb/FI705VLsJ5NWfLTobcu53+r1YIeNF3O4a7CpJ49DKHLoFRw64tiz4eaqzTkztL390dV0d6wBGFqjUNkE5YBlUpuBwIrxTsPOq9XYWyp/jJ2Cpm8Rbe3fDcpVilenmdd5H7Cawr6oSsLS309CwtD0K6sZBg5jxzierJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EensuEj7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EensuEj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731004385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pcLSROJqP5d3MCqGSDHqdKHAeh2SKejecNlIZlgGsUg=;
	b=EensuEj7RrvToWIhH/RS42+3283JuqguV/OBevUddg1IW3aSsO05k0MF22tDH4S2OX58Dw
	zzP2zxJ1lFFG1SytWsDKZWkT3OvviB0fmt3/4A6B0IZ/7Uk0P9LzS2uDdXfj9frjMPNnI9
	pMbuEXDZ5qWd/TXgk+GKg8aOmLjh31Y=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-QKj37n2PMfOBraMv3BN4rQ-1; Thu,
 07 Nov 2024 13:33:03 -0500
X-MC-Unique: QKj37n2PMfOBraMv3BN4rQ-1
X-Mimecast-MFC-AGG-ID: QKj37n2PMfOBraMv3BN4rQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D61D6194510D
	for <llvm@lists.linux.dev>; Thu,  7 Nov 2024 18:33:02 +0000 (UTC)
Received: from [172.64.13.23] (unknown [10.30.32.164])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6169C1955E93;
	Thu,  7 Nov 2024 18:33:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.12.0-rc6,
 upstream-mainline, 80fb2534)
Date: Thu, 07 Nov 2024 18:33:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <83135.124110713330300526@us-mta-529.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: opySz21M9xqAViqsrMBq8CAEg5a7U79xrFb79Vr26Co_1731004383
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'pwm/for-6.12-rc7-fixes' of git://git.kernel.=
org/pub/scm/linux/kernel/git/ukleinek/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1532011796

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1532011796-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1532011796-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1532011796-x86_64-kernel-debug


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

