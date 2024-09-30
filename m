Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8AE1DA3D
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727703193; cv=none; b=T4/t/a4XGJXDiNrGp0LC1co2hN1qCbXrLvrBAVMW87fKlFZdxcsiQ5Sf3CYG3KZ263kHDYL3HT7iSKok2HbBuNpXGYMLfEsrF4w1u9+3ILOqqn/Q9T2qbLyQpeMISp1dxlUkjTxYN4wH+Ej6Shi+fo3NP7dsPSbyZYuAneNZoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727703193; c=relaxed/simple;
	bh=PPevq2Gk0uAyV4cQOSxb0s6vdzl2KIhPoF4ifQRGGb8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=b0uElZVNqWR+nNOrzPh0BToKiCveXiUYFIEX6lqow/pwqKvdY96zK1FtuEul38z5a/Mkl14j6+skWkTPSj/XAsgGPp+od3dBy81MXfS8oz4Fmqmd3x1gmtrEfocaVBppLnBDP+6FdDOvdfJ1w2jzuFzKoXQ+V4kDDNQIYjgpvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bnsIy5NN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bnsIy5NN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727703190;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kWa5/3+gxUuGKxS+H1sr9I478Fnq9Jx5Kds+2QJQmQ0=;
	b=bnsIy5NNiRJJIONOjMo0tiHDM+LKS0wVSG5GZ1VOln2mvmvSVyzFBX/RQeENFlBKYfwAoY
	9odWLnt1Ws1qpNJz9BouWCiWwfFQWIdWujzDJW4iJ2Jblevb1222jg+xG9ZAqy+zUKEFHS
	XOteNN0wtjvCydw25maMkcCY9zKO0rk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-433-z68nqHVpMKy6IyJNb3ey0A-1; Mon,
 30 Sep 2024 09:33:09 -0400
X-MC-Unique: z68nqHVpMKy6IyJNb3ey0A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C381618C0B0A
	for <llvm@lists.linux.dev>; Mon, 30 Sep 2024 13:33:08 +0000 (UTC)
Received: from [172.64.3.33] (unknown [10.30.33.101])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3DAC71961762;
	Mon, 30 Sep 2024 13:33:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, 3efc5736)
Date: Mon, 30 Sep 2024 13:33:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <51434.124093009330902615@us-mta-433.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-linus' of git://git.kernel.org/pub/scm/v=
irt/kvm/kvm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1473670915

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1473670915-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1473670915-s390x-kernel
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1473670915-x86_64-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1473670915-x86_64-kernel-debug


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

