Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D9130A46
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720731132; cv=none; b=sFPycVaE7VDIj441OPHCQKpyKkbAB/QleVU/XepvUEOW9flNk2WpnhbW8OLm12I4OUBnRJOJIat9OYd8ZCCEDtsRCmOawFP9miGUasUc7Ku2nMh1CY8VFlreUveOEb3VVXJDIStho4EGC0IOfO4c48TD6+QWUfmFslTszhseQDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720731132; c=relaxed/simple;
	bh=+9hCdNqD2yU12krdbJRCgIskCOU0Lk7gFmBgHY2pk8M=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=kz7fOatL7XCSHKJIfd7n7zo9uPlincrx51hv0vFr8bJllVqZqQ1AmsSq2pBPGLYJqjqrJdBKPxPCaYqfmqpzbGg7FKmfi2FZHjqXJhCQ7c7HvPBkkBTttA8ST35cDPMQJyLbtClj5Wrkt5dar662ssQRP2xrWWTgsOpdJfBoB5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WKSzu9es; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WKSzu9es"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720731128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rgjwg99qXYAjHxbVawwLg0nCXYjSS0Y5BSyagYrUBa0=;
	b=WKSzu9esbr1q3GdKFxuPi7eLQHEsNt/FU1YJz5vxuFyFEWwOUMD1lN62GuemnHCXnL40Cn
	/ZJZsarvwbMTNbDdkmpSpXAbNHCE9oe61FbFNRRqbbTOUEiTHEVecMVSjSlBVIxfLXLirH
	vInPnfyX1XATIpPjnrniY3Gju10k/dw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-400-01vV0hhpO9GQ0glWBMG3pA-1; Thu,
 11 Jul 2024 16:52:07 -0400
X-MC-Unique: 01vV0hhpO9GQ0glWBMG3pA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AB061955F43
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 20:52:06 +0000 (UTC)
Received: from [172.64.15.30] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D18A13000181;
	Thu, 11 Jul 2024 20:52:05 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc7,
 mainline.kernel.org-clang, 8a18fda0)
Date: Thu, 11 Jul 2024 20:52:05 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <75482.124071116520701540@us-mta-400.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-fix-v6.10-rc7' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1370313095

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1370313095-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1370313095-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1370313095-x86_64-kernel-debug


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

