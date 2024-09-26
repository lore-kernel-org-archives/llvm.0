Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A332AF1C
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727360990; cv=none; b=druGNwT8cQdoxhHt/s7HVZrc/WArRUzLesrr6JBaQiej0PIO89QVfUqA9Q8Fu4/UPTdDWlDm2ZEaC1Y/MjUYbwJlvUe/tZUWYBY7XWbjzM8tFJb1d41tSzjApWW6ynMKBmdcZPPRxSlyDGF4ChMnHuQUqOVeDaMCS5KmZN66tBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727360990; c=relaxed/simple;
	bh=awrTlANSj3eWh7gNdrBOlft1rvZNFGP0ELdEgibrXA0=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=gu6SAZOXvr8iHKE0YDtUKcIL7Gdg6AjgUKTG1SXxLBvSHYFRCWdXjIUCSIVhA6TNF1g0TM2cztY5DHjWLMHcnWZMA25bUZEWqilcyUpBl613t5pnl3IAO+1waeKJ+o0rgQicLBxK/v6QE5W9hkxhEN5vUShOwToM/R/dujvHBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OQ1OUUP9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OQ1OUUP9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727360987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kFz5BCXSoZH+MWHSqzctysJQXULpWIbg9IXgUenoGdw=;
	b=OQ1OUUP9l3xFpr4lOPI6ShEjMq+ME7BIkiUnHqzl67iUgZElnV/ri140HfFUsMISNAktCZ
	f/sm7ZnLV5Nx+lov/Gf8Co7QG8UYJU79wbNBDUrTrxH6p0ZfUONhYHLLhPb5heGNgbWaqO
	noP43QyCueCuLisY466+2PxFnx2rZbM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-656-fTySkQuyOSWHFSkNb936Ng-1; Thu,
 26 Sep 2024 10:29:46 -0400
X-MC-Unique: fTySkQuyOSWHFSkNb936Ng-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45D2819371E3
	for <llvm@lists.linux.dev>; Thu, 26 Sep 2024 14:29:45 +0000 (UTC)
Received: from [172.64.15.17] (unknown [10.30.34.46])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0CBAE195421D;
	Thu, 26 Sep 2024 14:29:44 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.11.0-rc6,
 mainline.kernel.org-clang, 88fac175)
Date: Thu, 26 Sep 2024 14:29:44 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <77269.124092610294601491@us-mta-656.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'fuse-fixes-6.11-rc7' of git://git.kernel.org=
/pub/scm/linux/kernel/git/mszeredi/fuse

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1438579092

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1438579092-ppc64le-kernel
           s390x - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1438579092-s390x-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1438579092-x86_64-kernel-debug


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

