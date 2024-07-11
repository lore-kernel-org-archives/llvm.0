Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C959882488
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 23:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720740732; cv=none; b=C+0I+mSCsQtT/1WH1I2crsgMMPUqWv9zNJMiBnrzlm8kZbitd6/UzH2T8rrdiw9XyNbIm1Tah0wQHhoXwYbFdFrwiv3QdWSek6ZWOyuDMazC75CmWKnrWxqnG7VyIJyll1P2jj40jwqR1WjyUivm+MwpM7ie//n5eJrO+Nvx1+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720740732; c=relaxed/simple;
	bh=sGKeSZlwgogNfU8rlJc/pxC/Zcz2m9kOvz1fNESnQBY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Fz17ieiichnSQSTAQ1xGwxZXivibPIr3Q2nm5GezFbBwT/0RYckGluwmNHBmAjPN/BqgB1Js5gMaD5ahJ8nfoY9N93gbPdXbIxn0/XMXn3sVQRS5hnm4P0p0lZIys6dv4ONiy6pGu7ULkLLZTMReZ62GPdFM5hfkf0Xs7aLSUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DuCesotH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DuCesotH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720740729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wl122DvdC5ivjqpkTMeIv/+2Q3XXDzXAK39kuxyonMc=;
	b=DuCesotH3fbMTEwO+YmCcbA2vuu7IxYAoRCJkGDOmeiApC0y93fTBfnNxVVl/WmJks0JbK
	q2d/Qba1suMfM4HzoQ0S9eYLtq3NvsAr5KhSsAEjeo0YUvWQ4TOehVtcjazNDCA8T17f+i
	IlliS0ogCKiW7hlX0vTYvs6NFjd7wr8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-svSz7nmlNvuboJuppdP9Yg-1; Thu,
 11 Jul 2024 19:32:05 -0400
X-MC-Unique: svSz7nmlNvuboJuppdP9Yg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7D6E81956080
	for <llvm@lists.linux.dev>; Thu, 11 Jul 2024 23:32:04 +0000 (UTC)
Received: from [172.64.15.30] (unknown [10.30.34.46])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E70C83000181;
	Thu, 11 Jul 2024 23:32:03 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.10.0-rc7,
 mainline.kernel.org-clang, 43db1e03)
Date: Thu, 11 Jul 2024 23:32:03 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <01231.124071119320501959@us-mta-308.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'for-6.10/dm-fixes-2' of git://git.kernel.org=
/pub/scm/linux/kernel/git/device-mapper/linux-dm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1370456773

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1370456773-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1370456773-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1370456773-x86_64-kernel-debug


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

