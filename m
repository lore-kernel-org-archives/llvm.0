Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CCD2B9B5
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360129; cv=none; b=LC+ONgTWEljqnxH4hseQ5NQY3ICfGIOJJooBDf3mel6VxsrL892tkHg80WcpDygGm2LskHdM+3LwFNtO8XvyRZGGakH35DSS4pg7uuLe1ZXN+G9mcz6hB3fKN+mkO4irQ/Y5mByAyUNnr3Q4fR9iAQP/+pk/oksuFPzM0HtCRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360129; c=relaxed/simple;
	bh=EX5pBJv9zaID9WAvh6OShDJfAO8J/RbGM3fQMVRdnhQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=FeL4Jp9pQbifn9q/YX/e1PX9A3K1PkPWbYUMsc1tWUnIsU7YlmvDWNHV72ALPKPjBhpOoVxEW6OD0E7F2CuVIjDu6/Q86EjxwN1AwIVj270NFz2CSZYvHV8Jcke3n7KTxtuPtz2eoYl3fF3Bkav8JM/+tFlM4vI2iopfbS7hDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P291lwZa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P291lwZa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+XupCw3bBE32R8uctRaABCtrrA6ff+kWVnphPiW0zdI=;
	b=P291lwZaMkxfiPtBfqO+VhyLJK8q5wnSLyO7/4bekZG1omOuvDFvltEI0PKgojAaoy77hl
	eUYXnEVRarJlptZfcWunXQBAXHVNIFRnsdeQzlZiw4hAJ3PXeIyw9G05brKwHi2bsa42LR
	Q/xM2NWb28Ydkhda43tq4sKtFhc5/pM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-hmcr7c1-Pe6_qyPJvH_OMw-1; Thu,
 26 Sep 2024 10:15:24 -0400
X-MC-Unique: hmcr7c1-Pe6_qyPJvH_OMw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2157918B097F
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:15:24 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E17F41979061;
	Thu, 26 Sep 2024 14:15:23 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0,
 mainline.kernel.org-clang, d2230051)
Date: Thu, 26 Sep 2024 14:15:23 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Message-Id: <91261.124092610152401145@us-mta-323.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'thermal-6.12-rc1' of git://git.kernel.org/pu=
b/scm/linux/kernel/git/rafael/linux-pm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1454650024

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1454650024-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1454650024-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1454650024-x86_64-kernel-debug


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

