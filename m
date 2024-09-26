Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420E2142624
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360758; cv=none; b=vDXCkZ05JfBjoTAtrkSaSnrFfYgaRdJ588I06xgTWewk7H5YTwiWJ3KndTPd9SRXUuofyoYimJn1Yj86hEZTG0Nre3go769Z4gLjfKOcN6ChFOtmKFIyCTkFQvNSOB1/lttbGrYmI87NSqAuwcQtMMicbKw6JJKY/tmQgM4NzC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360758; c=relaxed/simple;
	bh=nmJGZaSdslkhbShU2sCBa4WLKmp/2QMp6NxOLD9WDLI=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=bRnvcvytcjy8xF2oE4sag0NvedgLrtKgYlXSB+BB2ixf44IbwqmaaMo4AWIJBfKSdt4ENOrcGimSQ1ZTigGS5gnDU4T43BJzyZ4DGsp/cdixJsNePA85xYKMzbDzmpIl9iNJRWX7ieZDRGkTvztg9YVtZVmTNHBsWN9JCSxHKyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CaP/k0jm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CaP/k0jm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=msw83Uo+zgvKn7ChO8cBQz6voPRmmg/qZxfFIPXLEgo=;
	b=CaP/k0jmrl3LRv8xcpnRdJmHOe8cJKx19jkOOuvCrDLCZ8zS7JdcmQdBKu/3xstbn86ag0
	gCxtgUP+4w0W9hf0y7zuuxm5OdCzQ2EF9jt4/IOse2o5+eaLXj/vCQxcym7VfYN7kJYXgT
	+vlV97uwizIzAjcN4nn3kJpIThsl8r0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-eRT9Ygu6MX-m-KsDCfRsWw-1; Thu,
 26 Sep 2024 10:25:55 -0400
X-MC-Unique: eRT9Ygu6MX-m-KsDCfRsWw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48FC7191379E
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:25:54 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 14C523003DF2;
	Thu, 26 Sep 2024 14:25:54 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc6,
 mainline.kernel.org-clang, b66f0b11)
Date: Thu, 26 Sep 2024 14:25:53 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <36102.124092610255500511@us-mta-679.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'block-6.11-20240906' of git://git.kernel.dk/=
linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1443636262

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1443636262-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1443636262-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1443636262-x86_64-kernel-debug


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

