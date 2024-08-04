Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DFF3C3C
	for <llvm@lists.linux.dev>; Sun,  4 Aug 2024 02:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722739331; cv=none; b=oaq4iaGjsIKZQXo/C19VJR9bGC1v1QdJq5mlklcgB8q2WEcKOHhJsQfeMuJSLD3P/ZobIPBtia1deQql09lm3WEjwt425xjg+4p+2KJNI/PCbDsKJdbol95mmDkWJJVqhyTnrZ1A7x2dfzSgjArtAQCuiF1+fVLCCuQkWvVyRBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722739331; c=relaxed/simple;
	bh=19VGXzd/mYqebQSLuufanMQNAdFiRWRoKDsc1DTFOk0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=AqG23qNyjfVzF8vI57jXoE2olDbGgAOucXOFNYermB11rv2CnrmMy2ELnJkhBm2zJutlhebnwO4Yp9/3ZtiaHXlgpq4TWTP7+Oc9lcQGyxOCHX6d+TnZFQfVSTIj/BnIRc2dkEhGok30VZ7XybAz/1COMWjje0JeODK78X3Q38I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXqAnSm9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXqAnSm9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722739327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xnOHXtmkgUesHeh4G8yKvtgS+zJmrskJ1kXtAxC8Sw0=;
	b=AXqAnSm9ld9mU0Z1qxBDu9Ci4pmCA38pxuRYOIZXwy/zVVl6xX8y8vNjNJrm1N89GU2hy7
	Rcpj9ihARa65VHTpW1+dRvLZ9IxoPJ6FzGsIWSeL7Y7SbXTlhNvOkfVMs9bxdlz5GWJiRj
	bAV5i76QlXH+d3waJBSQx8ubt+/PJhs=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-92-S4kCtuIdO0WPrBscuZqfBw-1; Sat,
 03 Aug 2024 22:42:05 -0400
X-MC-Unique: S4kCtuIdO0WPrBscuZqfBw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 960A41955F3D
	for <llvm@lists.linux.dev>; Sun,  4 Aug 2024 02:42:04 +0000 (UTC)
Received: from [172.64.4.38] (unknown [10.30.33.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 082D41955E7D;
	Sun,  4 Aug 2024 02:42:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc1,
 mainline.kernel.org-clang, defaf1a2)
Date: Sun, 04 Aug 2024 02:42:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Message-Id: <10620.124080322420500217@us-mta-92.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1399808145

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1399808145-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1399808145-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1399808145-x86_64-kernel-debug


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

